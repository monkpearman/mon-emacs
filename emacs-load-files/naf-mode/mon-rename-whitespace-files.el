;;; mon-rename-whitespace-files.el --- { A one line description of: mon-rename-whitespace-files. }
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2011 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-rename-whitespace-files.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2011-06-28T17:44:19-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: 

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-rename-whitespace-files provides { some description here. }
;;
;; FUNCTIONS:▶▶▶
;; `mon-rename-whitespace-files', `mon-rename-whitespace-files',
;; `mon-rename-whitespace-make-file-conses', 
;; `mon-file-convert-find-fprint-to-fprint0',
;; 
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
;;
;; GROUPS:
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
;;
;; NOTES:
;;
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; THIRD-PARTY-CODE:
;;
;; URL: https://github.com/mon-key/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-rename-whitespace-files.el
;; EMACSWIKI-URL: http://www.emacswiki.org/emacs/mon-rename-whitespace-files.el
;; FIRST-PUBLISHED:
;;
;; EMACSWIKI: { URL of an EmacsWiki describing mon-rename-whitespace-files. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2011-06-28T17:44:19-04:00Z}#{11262} - by MON KEY>
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
;; Copyright © 2011 MON KEY 
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-06-28T17:38:45-04:00Z}#{11262} - by MON KEY>
(defun mon-rename-whitespace-files (file-conses)
  "Rename every file in FILE-CONSES.\n
Elements of file-conses have the form:\n
 \(\"/from/file/file name with whitespace .ext\" . \"/from/file/file_name-with-whitespace .ext\"\)\n
These can be produced automagically by passing a list of strings to
`mon-rename-whitespace-make-file-conses'.\n
:NOTE This function will only work if _every_ directory above the file to be renamed
exists and does not contain any whitespace. It can otherwise fuckup your filesystem if not!\n
:EXAMPLE\n\n\(mon-rename-whitespace-files
 \(mon-rename-whitespace-make-file-conses
  '\(\"/<PATH-TO>/Some-Descriptiv-DIR-name/File name whiteyA.xls\"
    \"/<PATH-TO>/Some-Descriptiv-DIR-name/File name whiteyB.doc\"
    \"/<PATH-TO>/Some-Descriptiv-DIR-name/File name whiteyC.xml\"
    \"/<PATH-TO>/Some-Descriptiv-DIR-name/File name whiteyD.txt\"\)\)\)\n
:SEE-ALSO `mon-rename-whitespace-files', `mon-rename-whitespace-files',
`mon-rename-whitespace-make-file-conses', `mon-file-convert-find-fprint-to-fprint0'.\n▶▶▶"
  (dolist (pairs file-conses)
    (unless (file-exists-p (cdr pairs))
      (when (file-exists-p (car pairs))
        (rename-file (car pairs) (cdr pairs))))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-06-28T17:38:48-04:00Z}#{11262} - by MON KEY>
(defun mon-rename-whitespace-clean-whitespace (file-conses)
"Replace all occurences of whitespace in cdr of each elt of FILE-CONSES with an underscore.\n
FILE-CONSES is destructively modified such that where a space character \(char
32\) occurs in the car the cdr will contain the converted string replaced with
an underscore \(char 95\).\n
:EXAMPLE\n\n
 \(mon-rename-whitespace-clean-whitespace 
  '\(\(\"string string string\" . \"string string string\"\)
    \(\"stringy stringy stringy\" . \"string string string\"\)\)\)\n
:SEE-ALSO `mon-rename-whitespace-files', `mon-rename-whitespace-files',
`mon-rename-whitespace-make-file-conses', `mon-file-convert-find-fprint-to-fprint0'.\n▶▶▶"
  (mapc #'(lambda (fc) (setcdr fc (subst-char-in-string 32 95 (cdr fc) )))
        file-conses)
  file-conses)


;;; ==============================
;;; :CREATED <Timestamp: #{2011-06-28T17:38:51-04:00Z}#{11262} - by MON KEY>
(defun mon-rename-whitespace-make-file-conses (filename-string-list)
  "Return FILENAME-STRING-LIST with each string converted to a pair of consed strings.\n
The car of each cons is an unmodified copy of the original string.\n
The cdr is passed through `mon-rename-whitespace-clean-whitespace' such that
each space character \(char 32\) in string is replaced with an underscore \(char
95\).\n
:EXAMPLE\n\n
 \(mon-rename-whitespace-make-file-conses
  '\(\(\"string string string\" . \"string string string\"\)
    \(\"stringy stringy stringy\" . \"string string string\"\)\)\)\n
:SEE-ALSO `mon-rename-whitespace-files', `mon-rename-whitespace-files',
`mon-rename-whitespace-make-file-conses', `mon-file-convert-find-fprint-to-fprint0'.\n▶▶▶"
  (loop for fname in filename-string-list
        collect (cons fname fname) into gthrd-conses
        finally (return (mon-rename-whitespace-clean-whitespace gthrd-conses))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-07-02T18:36:32-04:00Z}#{11266} - by MON KEY>
(defun mon-file-convert-find-fprint-to-fprint0 (find-fprint-file)
  "Convert the output of the `find` command with flag -fprint to the equvialent -fprint0.\n
Put a null character at each `line-end-position' in file and then turn the
entire contents into one giant null delimeted list of filenames.\n
Converted contents are written to FIND-FPRINT-FILE and its filename is return.\n
:EXAMPLE\n\n\(let* \(\(find-path \(file-name-as-directory \(car load-path\)\)\)
       \(find-fprint \"/tmp/example-fprint\"\)
       \(find-command \(format \"find %S -type f -name \\\"*.el\\\" -fprint %S\"
                             find-path find-fprint\)\)\)
  \(call-process-shell-command find-command\)   
  \(find-file \(mon-file-convert-find-fprint-to-fprint0 find-fprint\)\)\)\n
:NOTE The intent of this function is to aid conversion of `find` when invoked with:\n
 shell> find /some/path/ -type f -name \"*.el\" -fprint <FIND-FPRINT-FILE>\n
by converting the fprint'd file into the equivalent of having invoked `find` with:\n
 shell> find /some/path/ -type f -name \"*.el\" -fprint0 <FIND-FPRINT-FILE>\n
This allows a two step verification of `find`s output without having to try to
\"see through\" a bunch of null chars.\n
:SEE-ALSO `mon-rename-whitespace-files', `mon-rename-whitespace-files',
`mon-rename-whitespace-make-file-conses', `mon-file-convert-find-fprint-to-fprint0'.\n▶▶▶"
  (let ( ;; lets not worry about whether some other buffer is already visiting FIND-FPRINT-FILE
        ;; (find-buffer-visiting find-fprint-file 
        ;;                       #'(lambda (mfcfftf-L-0) 
        ;;                           (not (buffer-local-value 'buffer-read-only mfcfftf-L-0))))
        (mfcfftf-livep (get-file-buffer find-fprint-file))
        (mfcfftf-bfr '()))
    (when mfcfftf-livep 
      (unless (buffer-local-value 'buffer-read-only mfcfftf-livep)
        (mon-format
         :w-fun #'error
         :w-spec '(":FUNCTION `mon-file-conver-find-fprint-to-fprint0' "
                   "-- arg FIND-FPRINT-FILE has non-nil `buffer-read-only' value\n"
                   "in visiting buffer: %S")
         :w-args (current-buffer))
        mfcfftf-livep))
    (unless (or mfcfftf-livep (file-readable-p find-fprint-file))
      (mon-file-non-existent-ERROR 
       :fun-name "mon-file-conver-find-fprint-to-fprint0"
       :locus "find-fprint-file"
       :got-val find-fprint-file
       :w-error t))
    (setq mfcfftf-bfr (get-buffer-create (find-file-noselect find-fprint-file)))
    (with-current-buffer mfcfftf-bfr
      ;; in case we'ere already visiting FIND-FPRINT-FILE
      (save-excursion
        (save-restriction 
          (widen)
          (mon-g2be -1)
          (save-excursion 
            (when (search-forward-regexp "\000$" nil t)
              (mon-format :w-fun #'error
                          :w-spec '(":FUNCTION `mon-file-conver-find-fprint-to-fprint0' "
                                    "-- arg FIND-FPRINT-FILE contains pre-existing EOL null character at line %d")
                          :w-args  (line-number-at-pos (point)))))
          (while (search-forward-regexp "^.*[^\000]$" nil t)
            (insert "\000")
            (if (eobp) 
                (delete-char -1) 
              (progn 
                (delete-char 1)
                (mon-g2be -1)))))
        ;; when mfcfftf-livep is non-nil prompt for confirmation before writing
        (unwind-protect
            (prog1 find-fprint-file
              (write-file (buffer-file-name mfcfftf-bfr) mfcfftf-livep))
          find-fprint-file))))) 

;;; ==============================
(provide 'mon-rename-whitespace-files)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; coding: utf-8
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ==============================
;;; EOF
