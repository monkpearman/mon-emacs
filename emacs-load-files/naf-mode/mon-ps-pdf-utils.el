;;; mon-ps-pdf-utils.el --- convert .ps and .pdf files to plain text
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-ps-pdf-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-10-27T15:54:10-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: external, execute, unix,

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-ps-pdf-utils provides utilities to help convert .ps and .pdf files to
;; plain text.
;;
;; FUNCTIONS:▶▶▶
;; `mon-get-pdftotext', `mon-get-ps2ascii', `mon-get-pdfinfo',
;; `mon-get-ps-pdf',
;; FUNCTIONS:◀◀◀
;;
;; MACROS:
;;
;; METHODS:
;;
;; CLASSES:
;;
;; CONSTANTS:
;;
;; FACES:
;;
;; VARIABLES:
;; `*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
;;
;; ALIASED/ADVISED/SUBST'D:
;;
;; DEPRECATED:
;;
;; RENAMED:
;;
;; MOVED:
;;
;; TODO:
;; Finish the function `mon-get-ps-pdf'.
;;
;; Integrate `Antiword', `catdoc', `strings', `odt2txt'
;;
;; `Antiword'
;; :SEE (URL `http://www.winfield.demon.nl/')
;; shell> antiword file.doc
;; shell> antiword file.doc | less
;;
;; `catdoc'
;; :SEE (URL `http://site.n.ml.org/info/catdoc/')
;; :SEE (URL `http://site.n.ml.org/download/20050502084842/catdoc/catdoc-0.94.tar.gz')
;; shell> catdoc <output_format> filename.doc
;; shell> catdoc -a whitepaper.doc ;; plain-text
;; shell> catdoc -t whitepaper.doc ;; LaTeX
;;
;; `strings'
;; If you just need to see the text in a file, something like this does it:
;; shell> strings foobar.doc | less 
;;
;; Except that Word uses Unicode so strip out the NULLs first:
;; shell> tr -d \\0 < word.doc | strings | less
;;
;; `odt2txt'
;; :SEE (URL `http://stosberg.net/odt2txt/')
;; :SEE (URL `git://repo.or.cz/odt2txt.git')
;;
;;
;; NOTES:
;; lisp/ps-print.el
;;
;; `mailcap-mime-data' 
;; (assoc-string "pdf" (cdar mailcap-mime-data))
;; (assoc-string "postscript" (cdar mailcap-mime-data))
;; 
;; 
;; `doc-view-ghostscript-program' -> (executable-find "gs")
;; `doc-view-pdftotext-program'   -> (executable-find "pdftotext") 
;;                                   (executable-find "pdftotext.exe")
;;                                   (executable-find "pstotxt")
;;                                   (executable-find "ps2ascii")
;; `doc-view-dvipdfm-program'     -> (executable-find "dvipdfm")
;; `doc-view-dvipdf-program'      -> (executable-find "dvipdf")
;; `doc-view-ps2pdf-program'      -> (executable-find "ps2pdf")
;;
;; (executable-find "pdfinfo")
;;
;; :W32
;; pst2pdf.bat
;; pstat.exe
;; pstopdf.bat
;; pstops.exe
;; pstotext.exe
;; ps2pdf13.cmd
;;
;; (concat (getenv "MON_BIN") "\\gs\\gs8.64\\bin")
;; (concat (getenv "MON_BIN") "\\gs\\gs8.64\\lib\\ps2ascii.bat")
;; (concat (getenv "MON_BIN") "\\gs\\gs8.64\\lib\\pdf2ps.bat")
;; (concat (getenv "MON_BIN") "\\gs\\gs8.64\\lib\\pdf2ps.cmd")
;;
;; ps         pdf2dsc
;; ps2pdf     pdffonts
;; ps2pdf14   pdfinfo
;; ps2ps2     pdfroff
;; ps2ascii   pdftoabw
;; pstotext   pdftoppm
;; ps2pdf12   pdftotext
;; ps2pdfwr   pdf2ps
;; ps2epsi    pdfimages
;; ps2pdf13   pdfopt
;; ps2ps      pdftexi2dvi
;;            pdftohtml
;;            pdftops
;;
;; SNIPPETS:
;;
;; REQUIRES:
;; `mon-get-dir-name-absolute' <- mon-dir-utils.el
;;
;; THIRD-PARTY-CODE:
;;
;; FIRST-PUBLISHED:
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-10-27T15:54:10-04:00Z}#{09442} - by MON KEY>
;;
;; =================================================================

;;; LICENSE:

;; =================================================================
;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;; =================================================================
;; Permission is granted to copy, distribute and/or modify this
;; document under the terms of the GNU Free Documentation License,
;; Version 1.3 or any later version published by the Free Software
;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;; and no Back-Cover Texts. A copy of the license is included in
;; the section entitled ``GNU Free Documentation License''.
;; 
;; A copy of the license is also available from the Free Software
;; Foundation Web site at:
;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ==============================
;; Copyright © 2009-2024 MON KEY
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl))


;;; ==============================
;;; (executable-find "pdftotext.exe")
;;; :CREATED <Timestamp: #{2009-10-26T18:18:26-04:00Z}#{09441} - by MON KEY>
(defvar *mon-pdftotext-exec-path* nil
  "*Path to local pdftotext executable.\n
We use a variable rather than letting the system's path muck it up.\n
:NOTE On w32 systems MON is using the version distributed with xpdf version
under GPLv2 June 1991.\n
:SEE (URL `http://www.foolabs.com/xpdf/')
:SEE-ALSO `mon-get-pdfinfo', `mon-get-pdftotext', `mon-get-ps2ascii',
`*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
`doc-view-ghostscript-program', `doc-view-pdftotext-program',
`doc-view-dvipdfm-program', `doc-view-dvipdf-program',
`doc-view-ps2pdf-program', `mon-set-doc-view-programs-init'.\n▶▶▶")
;;
(when (and (intern-soft "IS-MON-SYSTEM-P")
           (bound-and-true-p IS-MON-SYSTEM-P))
  (unless (bound-and-true-p *mon-pdftotext-exec-path*)
    (setq *mon-pdftotext-exec-path*
          (cond ((and (eq system-type 'windows-nt)
                      (getenv "MON_BIN"))
                 (concat  
                  (replace-regexp-in-string  "\\\\" "/" (getenv "MON_BIN"))
                  "/xpdf/pdftotext.exe"))
                (t (if (bound-and-true-p doc-view-pdftotext-program)
                       doc-view-pdftotext-program
                     (executable-find "pdftotext")))))))
;;
;;; :TEST-ME *mon-pdftotext-exec-path*
;;
;;;(progn (makunbound '*mon-pdftotext-exec-path*)
;;;       (unintern '*mon-pdftotext-exec-path*) )


;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-26T22:06:58-04:00Z}#{09442} - by MON KEY>
(defvar *mon-pdfinfo-exec-path* nil
  "*Path to local pdfinfo executable.\n
We use a variable rather than letting the system's path muck it up.\n
:NOTE on w32 MON is using the version distributed with xpdf version under GPLv2
June 1991.\n
:SEE (URL `http://www.foolabs.com/xpdf/')
:SEE-ALSO `mon-get-pdfinfo', `mon-get-pdftotext', `mon-get-ps2ascii',
`*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
`doc-view-ghostscript-program', `doc-view-pdftotext-program',
`doc-view-dvipdfm-program', `doc-view-dvipdf-program',
`doc-view-ps2pdf-program', `mon-set-doc-view-programs-init'.\n▶▶▶")
;;
(when (and (intern-soft "IS-MON-SYSTEM-P")
           (bound-and-true-p IS-MON-SYSTEM-P))
  (unless (bound-and-true-p *mon-pdfinfo-exec-path*)
    (setq *mon-pdfinfo-exec-path*
          (cond ((and (eq system-type 'windows-nt)
                      (getenv "MON_BIN"))
                 (concat  
                  (replace-regexp-in-string  "\\\\" "/" (getenv "MON_BIN"))
                  "/xpdf/pdfinfo.exe"))
                (t (executable-find "pdfinfo"))))))
;;
;;; :TEST-ME *mon-pdfinfo-exec-path*
;;
;;;(progn (makunbound '*mon-pdfinfo-exec-path*)
;;;       (unintern '*mon-pdfinfo-exec-path*) )


;;; (defvar *mon-ps2ascii-exec-path* nil "")
;;; "ps2ascii "
;; (executable-find "ps2ascii")

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-26T17:37:37-04:00Z}#{09441} - by MON KEY>
(defun* mon-get-pdftotext (frm-pdf &key to-fname this-buffer in-buffer
                                   w-layout w-nopgbrk w-htmlmeta)
  "Convert FRM-PDF a .pdf file to a text file.\n
When keyword W-LAYOUT is non-nil pas the \"-layout\" flag.\n
When keyword W-NOPGBRK is non-nil  \"-nopgbrk\"\n
When keyword W-HTMLMETA is non-nil \"-htmlmeta\"\n
When keyword TO-FNAME is a filename to write output to. 
If this is not an absolute path to-fname is writtent to current calling
environment's default-directory.\n
When keyword THIS-BUFFER is non-nil output to current-buffer.\n
When keyword IN-BUFFER is an existing buffer output to that buffer.\n
:EXAMPLE\n(mon-get-pdftotext <FNAME-PATH-PDF|PS> 
              :in-buffer (buffer-name (current-buffer)))
:SEE-ALSO `mon-get-pdfinfo', `mon-get-pdftotext', `mon-get-ps2ascii',
`*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
`doc-view-ghostscript-program', `doc-view-pdftotext-program',
`doc-view-dvipdfm-program', `doc-view-dvipdf-program',
`doc-view-ps2pdf-program', `mon-set-doc-view-programs-init'.\n▶▶▶"
  (let ((mgp-rgs 
         ;; cpsc-args <- :w-layout :w-nopgbrk :w-htmlmeta
         ;; OPTIONS for `*mon-pdftotext-exec-path*' 
         ;; &rest ARGS for `call-process-shell-command'         
         ;; If forms are to make sure `combine-and-quote-strings' gets strings.
         (list (if (eq system-type 'windows-nt) 
                   (concat *mon-pdftotext-exec-path*  " -eol unix") "")
               (if w-layout   "-layout" "")
               (if w-nopgbrk  "-nopgbrk" "")
               (if w-htmlmeta "-htmlmeta" "")))
        in-buffer-p stdout-or-buff )
    ;; COMMAND needs a place to write its outpu to regardless of whether we're
    ;; displaying in a buffer.
    ;; stdout-or-buff <- TEXT-FILE | STDOUT | [ :in-buffer | :this-buffer ]    
    (setq stdout-or-buff
          (cond (to-fname to-fname)
                (in-buffer
                 (let ((ibp (mon-buffer-exists-p in-buffer)))
                   (cond ((not ibp) "-")
                         (ibp (setq in-buffer-p in-buffer) "-"))))
                (this-buffer  "-")))
    ;; If we're displaying in a buffer get it else nil
    (setq in-buffer-p
          (cond ((and (not this-buffer) in-buffer in-buffer-p)
                 (mon-buffer-exists-p in-buffer-p))
                ;; :NOTE It is _possible_ that this-buffer could take any of
                ;; these forms so easier to just expliclitly test for them:
                (this-buffer 
                 (case (type-of this-buffer) 
                   (integer (mon-buffer-exists-p (current-buffer)))
                   (symbol  (mon-buffer-exists-p (current-buffer)))
                   (buffer  (mon-buffer-exists-p this-buffer))
                   (string  (mon-buffer-exists-p this-buffer))))))
    ;; COMMAND    
    (call-process-shell-command  
     *mon-pdftotext-exec-path* ;; COMMAND 
     nil                       ;; INFILE 
     in-buffer-p               ;; BUFFER :NOTE Not currently accomodating cpsc's
                               ;;              provision for STDERR-FILE
     t                         ;; DISPLAY
     (combine-and-quote-strings 
      `(,@mgp-rgs 
        ,frm-pdf ;; PDF-file for COMMAND
        ,stdout-or-buff)))))
;;;           
;;; :ARGS FRM-PDF &key W-LAYOUT W-NOPGBRK W-HTMLMETA TO-FNAME IN-BUFFER
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/file.pdf" :this-buffer t)
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/file.pdf" :in-buffer 9)
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/file.pdf" :in-buffer t)
;;; :TEST-ME (progn (get-buffer-create "bubba")
;;;                    (mon-get-pdftotext "<PATH/TO/A/>file.pdf" 
;;;                                       :in-buffer "bubba"))
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/>file.pdf" :in-buffer "not a bubba")
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/>file.pdf" :w-nopgbrk t)
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/>file.pdf" :w-layout t
;;; :TEST-ME (mon-get-pdftotext "<PATH/TO/A/>file.pdf" 
;;;                             :to-fname "<PATH/TO/A/>file.txt>")

;;; ==============================
;;; Unfinished-untested w32
;;; CREATED: <Timestamp: #{2009-10-22T16:29:10-04:00Z}#{09434} - by MON>
(defun* mon-get-ps2ascii (pdf-fname &key out-fname in-buffer)
  "PDF-FNAME is a pdf filename.\n
OUT-FNAME a filename to write the conversion to.\n
Keyword IN-BUFFER spits conversion out to current-buffer.\n
When OUT-FNAME and IN-BUFFER are nil conversion is output to
\"*Shell Command Output*\" buffer.\n
:SEE-ALSO `mon-get-pdfinfo', `mon-get-pdftotext', `mon-get-ps2ascii',
`*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
`doc-view-ghostscript-program', `doc-view-pdftotext-program',
`doc-view-dvipdfm-program', `doc-view-dvipdf-program',
`doc-view-ps2pdf-program', `mon-set-doc-view-programs-init'.\n▶▶▶"
  (cond (out-fname 
         (shell-command (concat "ps2ascii " pdf-fname " " out-fname)))
        (in-buffer
         (shell-command (concat "ps2ascii " pdf-fname " ") t))
        (t (shell-command (concat "ps2ascii " pdf-fname " ")))))

;;; ==============================
;;; CREATED: <Timestamp: #{2009-10-21T15:00:41-04:00Z}#{09433} - by MON>
(defun* mon-get-pdfinfo (fname &key w-meta)
  "Get pdfinfo for filename with FNAME.\n
When keyword W-META is non-nil get fname's metadata info as well.\n
:SEE-ALSO `mon-get-pdfinfo', `mon-get-pdftotext', `mon-get-ps2ascii',
`*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
`doc-view-ghostscript-program', `doc-view-pdftotext-program',
`doc-view-dvipdfm-program', `doc-view-dvipdf-program',
`doc-view-ps2pdf-program', `mon-set-doc-view-programs-init'.\n▶▶▶"
  ;; (princ (format "\n;;; Output of \"pdfinfo%s%s\"\n" 
  ;;                (if w-meta " -meta " " ")
  ;;                fname)
  ;;         (current-buffer))
  (call-process-shell-command 
   ;; (shell-command 
   (concat 
    (if (eq system-type 'windows-nt)
        (concat *mon-pdfinfo-exec-path*) ; " -eol unix "); -enc ")
      "pdfinfo ")
    (if w-meta " -meta " "")
    fname ) nil t))
;;
;;; :TEST-ME (mon-get-pdfinfo "<SOME-PDF>.pdf")
;;; :TEST-ME (mon-get-pdfinfo "<SOME-PDF>.pdf" :w-meta t)

;;; :TODO FINISH
;;; ==============================
;;; CREATED: <Timestamp: #{2009-10-21T15:00:36-04:00Z}#{09433} - by MON>
;; (defun mon-get-ps-pdf (&optional w-directory as-kill insrtp intrp)
;;   "Return a list of postscript or pdf files of buffers' default-directory `pwd'.
;; When W-DIRECTORY is non-nil
;; When AS-KILL is non-nil 
;; When INSERTP is non-nil or called-interactively
;; :SEE-ALSO `mon-get-pdfinfo', `mon-get-pdftotext', `mon-get-ps2ascii',
;; `*mon-pdftotext-exec-path*', `*mon-pdfinfo-exec-path*',
;; `doc-view-ghostscript-program', `doc-view-pdftotext-program',
;; `doc-view-dvipdfm-program', `doc-view-dvipdf-program',
;; `doc-view-ps2pdf-program', `mon-set-doc-view-programs-init'.\n▶▶▶"
;;   (interactive "P\ni\ni\np")
;;   (let (psdf  
;;         (mapconcat #'identity 
;;           (directory-files 
;;                     ;;(if w-directory
;;                     ;;   (if intrp (read-directory-name "Read .ps and .pdf files in directory :" nil nil t)
;;                     ;; (file-
;;                     ;; (and (file-directory-p
;;                     ;;      (file-exists-p
;;            (directory-files 
;;             (directory-file-name 
;;              (file-name-directory
;;               ;;   (file-name-absolute-p
;;            (directory-files 
;;             (directory-file-name 
;;              (file-name-directory (file-name-as-directory *mon-naf-mode-root*))))
;;            default-directory 
;;            t ;; full
;;            ".*\.ps\\|.*\.pdf" ; Only .ps and .pdf.
;;            t) ;; sort-em
;;           "\n")
;;         (if (and (or insrtp intrp)
;;                  (not buffer-read-only))
;;             (save-excursion (newline)
;;                             (prin1 psdf (current-buffer))
;;                             (if (or intrp as-kill)
;;                                 (kill-new psdf)))
;;             (progn
;;               (when as-kill (kill-new psdf))
;;               psdf)))))
;;; ==============================
;;; Need to un relativize filenames `*mon-emacs-root*' `*mon-naf-mode-root*'
;;; (mon-get-dir-name-absolute "../")
;;; 
;;;  (w32-long-file-name filename)
;;;
;;; (w32-long-file-name (getenv "HOME"))
;;; (w32-long-file-name "")
;;; (file-exists-p "")
;;; (string-match "[[*?]" "[my-file")
;;; (match-data)
;;; (w32-get-codepage-charset 437)
;;; (w32-get-console-codepage)
;;; w32-wh-keyboard-ll
;;; (inhibit-changing-match-data t) 
;;; ==============================


;;; ==============================
(provide 'mon-ps-pdf-utils)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ====================================================================
;;; mon-ps-pdf-utils.el ends here
;;; EOF
