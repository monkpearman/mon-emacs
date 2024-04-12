;; -*- mode: EMACS-LISP; -*-
;;;
;;; this is mon-rename-images-supplemental.el
;;; ================================================================
;;; DESCRIPTION:
;;; mon-rename-images-supplemental provides functions and vars needed
;;; when using mon-rename-image-utils - mon-rename-image-utils.el
;;; (URL `http://www.emacswiki.org/emacs/mon-rename-image-utils.el')
;;; They are included here rather than requiring external packages.
;;; Functions herein have been pulled from: 
;;; mon-dir-utils.el - (URL `http://www.emacswiki.org/emacs/mon-dir-utils.el')
;;; mon-utils.el - (URL `http://www.emacswiki.org/emacs/mon-utils.el')
;;; mon-dir-locals-alist.el - currently _unavailable_ on emacs-wiki
;;; mon-replacement-utils.el - currently _unavailable_ on emacs-wiki
;;;
;;; Where possible it is recommended to use those packages first. 
;;; Most likely they are more current.
;;;
;;; USE:
;;; Basically, you set up your vars for an image directory tree, then assuming you
;;; are in a file within that tree you can call:
;;;
;;; (mon-build-rename-buffer ".bmp") 
;;; (mon-build-rename-buffer ".jpg")
;;; (mon-build-rename-buffer ".nef")
;;;
;;; And it will either prompt for a better directory in the tree, or snarf the image
;;; file names from the current directory and return them in a pretty buffer full of
;;; text properties for futher processing.
;;;
;;; Lets say you are in the file:
;;; "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2/EBAY/BMP-Scans/e1143/e1143.dbc"
;;; and you want to rename all of the ".jpg" files associated with the '.bmps" in
;;; the current directory e.g.  
;;;
;;; .bmp's are in => "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2/EBAY/BMP-Scans/e1143/ 
;;; .jpg's are in => "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2/EBAY/BIG-cropped-jpg/e1143"
;;;
;;; If you call: 
;;; (mon-build-rename-buffer ".jpg") 
;;; It will return a 'rename-buffer' of all the .jpgs in the 'matching' directory.
;;;
;;; If there aren't any .jpgs in that file it prompts for a new directory within that tree.
;;;
;;; If you call:
;;; (mon-build-rename-buffer ".bmp") 
;;; when there are .bmps in the current dir it will return a '*rename-images*' buffer 
;;; with all the .bmp's in the 'current' directory ready for marking.
;;;
;;; Currently `mon-build-rename-buffer' is only taking an IMAGE-TYPE arg.  The
;;; helper function `mon-rename-imgs-in-dir' takes an alternate path arg ALT-PATH
;;; that will soon allow you to do:
;;;
;;; (mon-build-rename-buffer ".bmp" (expand-file-name "../e1214/")
;;;
;;; i.e. build a *rename-images* buffer from files in some other dir.
;;;
;;; Assuming your var paths are set right the functions have fairly intelligent
;;; heuristics for how they navigate the paths and include completion facilities and
;;; nice prompts which attemtp to DWIM.
;;;
;;; I am particularly proud of the *rename-images* buffer generation code which is
;;; smart about presentation padding according to the filename length of
;;; images. Emacs lisp format is not nearly as extensive a format spec as CL's...
;;;
;;; Starting with `*mon-nef-scan-drive*' the vars below will need to be adjusted
;;; according to your local path and directory tree ideally it mirrors this one:
;;
;;; On MON local system these map out as follows:
;;; `*mon-nef-scan-drive*'        ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS"
;;; `*mon-nef-scan-path*'         ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS"
;;; `*mon-nef-scan-nefs-path*'    ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/NEFS"
;;; `*mon-nef-scan-nef2-path*'    ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2"
;;; `*mon-ebay-images-path*'      ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2/EBAY"
;;; `*mon-ebay-images-bmp-path*'  ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2/EBAY/BMP-Scans"
;;; `*mon-ebay-images-jpg-path*'  ;=> "<DRIVE-OR-ROOT:>/NEFS_PHOTOS/Nef_Drive2/EBAY/BIG-cropped-jpg"
;;;
;;; ==============================
;;; EXTERNAL-FUNCTIONS: 
;;; Following needed for use with mon-rename-image-utils.el
;;; `mon-toggle-read-only-point-motion' -> mon-utils.el
;;; `mon-line-bol-is-eol'               -> mon-utils.el
;;; `mon-get-buffer-parent-dir'        -> mon-dir-utils.el
;;; `mon-string-split-buffer-name'      -> mon-dir-utils.el
;;; `mon-truncate-path-for-prompt'      -> mon-dir-utils.el
;;; `mon-buffer-written-p'              -> mon-dir-utils.el
;;; `mon-dir-build-list'                -> mon-dir-utils.el
;;; `mon-delete-back-up-list'           -> mon-replacement-utils.el
;;; `mon-cln-trail-whitespace'          -> mon-replacement-utils.el
;;;
;;; CONSTANTS or VARIABLES:
;;;
;;; EXTERNAL-VARS: 
;;; Following needed for use with mon-rename-image-utils.el
;;; `*mon-ebay-images-lookup-path*'         -> mon-dir-locals-alist.el
;;; `*mon-nef-scan-path*'                   -> mon-dir-locals-alist.el
;;;
;;; MACROS:
;;;
;;; ALIASED/ADVISED/SUBST'D:
;;;
;;; DEPRECATED:
;;;
;;; RENAMED: 
;;;
;;; MOVED:
;;;
;;; REQUIRES:
;;;
;;; TODO:
;;;
;;; NOTES:
;;;
;;; SNIPPETS:
;;;
;;; THIRD PARTY CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;;; PUBLIC-LINK: 
;;; (URL `http://www.emacswiki.org/emacs/RenameImageUtils')
;;; FILE-PUBLISHED: <Timestamp: #{2009-09-28} - by MON KEY>
;;; (URL `http://www.emacswiki.org/emacs-en/mon-rename-image-utils-supplemental.el')
;;; FIRST-PUBLISHED: <Timestamp: #{2009-09-20}#{} - by MON KEY>
;;;
;;; FILE-CREATED:
;;; <Timestamp: Tuesday August 11, 2009 @ 02:29.14 PM - by MON KEY>
;;; ================================================================
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation; either version 3, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; see the file COPYING.  If not, write to
;;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;;; Floor, Boston, MA 02110-1301, USA.
;;; ================================================================
;;; Permission is granted to copy, distribute and/or modify this
;;; document under the terms of the GNU Free Documentation License,
;;; Version 1.3 or any later version published by the Free Software
;;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;;; and no Back-Cover Texts. A copy of the license is included in
;;; the section entitled "GNU Free Documentation License".
;;; A copy of the license is also available from the Free Software
;;; Foundation Web site at:
;;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;; Copyright © 2009-2024 MON KEY 
;;; ==============================
;;; CODE:

;;; ==============================
;;; :FROM :FILE mon-dir-utils.el
;;; ==============================
;;; :MODIFICATIONS <Timestamp: #{2009-10-27T16:24:19-04:00Z}#{09442} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: 2009-08-01-W31-6T11:26:49-0400Z - by MON>
;;; :ADDED optional insrtp, intrp args 
;;; :CREATED <Timestamp: Saturday May 23, 2009 @ 11:28.41 AM - by MON>
(defun mon-get-buffer-parent-dir (&optional full insrtp intrp)
  "Return buffers' parent directory as a string.
By default returns buffer's parent directory _only_.
When FULL is non-nil return full path of buffers parent directory as string.
If we are in a buffer which has been written to a file or _can be_ return files
parent, else return parent of buffers `default-directory'.\n
When called-intereactively or INSRTP is non-nil insert buffers parent directory.
:NOTE Could also accomplish with:\n
 \(car \(last \(split-string 
               \(directory-file-name (expand-file-name \"./\"\)\) \"/\" t\)\)\)\n
But, not without the checks or a facility for sanity checks in programmatic
situations where `default-directory' of a non-written buffer may not evaluate to
what is expected. This is esp. the case where a calling function(s) has or might
`cd' to some alien path to do some stuff. We don't neccesarily want to blindly
write a buffer assuming that it will wind up in 'the' current directory.
It might not.\n
:SEE-ALSO `mon-buffer-exists-p', `mon-buffer-written-p', `mon-with-file-buffer',
`mon-buffer-name->kill-ring', `mon-get-proc-buffers-directories',
`mon-get-buffers-directories', `mon-string-split-buffer-name',
`mon-string-split-buffer-parent-dir' `mon-string-split-buffer-parent-dir-quick',
`with-current-buffer', `with-temp-file', `with-temp-buffer'.\n▶▶▶"
  (interactive "i\ni\np")
  (let* ((is-written (mon-buffer-written-p))
	 (ret-buf-dir 
          (if is-written
              (if full
                  (directory-file-name 
                   (file-name-directory (buffer-file-name)))
                  (file-name-nondirectory 
                   (directory-file-name 
                    (file-name-directory (buffer-file-name)))))
              (if full
                  (directory-file-name default-directory)
                  (file-name-nondirectory 
                   (directory-file-name default-directory))))))
    (if is-written
	;; (progn 
        ;;   (when (or insrtp intrp)
        ;;     (message "buffer: `%s' parent dir is `%s'."  (buffer-name) ret-buf-dir))
          (if (or insrtp intrp)
              (prog1 
                  (when (or insrtp intrp)
                    (message "buffer: `%s' parent dir is `%s'."  (buffer-name) ret-buf-dir))
                (insert ret-buf-dir))
              ret-buf-dir)
        ;; (prog1
        ;;   (when (or insertp intrp)
        ;;     (message "Buffer: `%s' not written yet, parent of buffer's default-directory is `%s'." 
        ;;              (buffer-name) ret-buf-dir)
          (if (or insrtp intrp)
              (prog1
                  (message 
                   "Buffer: `%s' not written yet, parent of buffer's default-directory is `%s'." 
                   (buffer-name) ret-buf-dir)
                (insert ret-buf-dir))
              ret-buf-dir))))
;;
;;; :TEST-ME (mon-get-buffer-parent-dir)
;;; :TEST-ME (mon-get-buffer-parent-dir t)
;;; :TEST-ME (mon-get-buffer-parent-dir t t)
;;; :TEST-ME (mon-get-buffer-parent-dir nil t)
;;; :TEST-ME (call-interactively 'mon-get-buffer-parent-dir)
;;; :TEST-ME (mon-get-buffer-parent-dir t)

;;; ==============================
;;; :FROM :FILE mon-dir-utils.el
;;; ==============================
;;; :MODIFICATIONS <Timestamp: 2009-08-01-W31-6T11:48:58-0400Z - by MON>
;;; :ADDED optional args insrtp intrp
;;; :CREATED <Timestamp: Saturday May 23, 2009 @ 11:50.56 AM - by MON>
(defun mon-string-split-buffer-name (&optional insrtp intrp)
  "Return current `buffer-name' as a list with split-string.
When INSRTP is non-nil or called-interactively with prefix arg insert the list
of split strings at point.\n
:SEE-ALSO `mon-buffer-exists-p', `mon-buffer-written-p', `mon-with-file-buffer',
`mon-buffer-name->kill-ring', `mon-get-buffer-parent-dir',
`mon-get-proc-buffers-directories', `mon-get-buffers-directories',
`mon-string-split-buffer-name', `mon-string-split-buffer-parent-dir'
`mon-string-split-buffer-parent-dir-quick', `with-current-buffer',
`with-temp-file', `with-temp-buffer'.\n▶▶▶"
  (interactive "P\np")
(let ((buf-split
       (save-match-data
         (if (mon-buffer-written-p)
             (split-string (buffer-file-name) "/" t)
             (split-string default-directory "/" t)))))
    (when intrp (message "%S" buf-split))
    (when insrtp (insert (format "%S" buf-split)))
    buf-split))
;;
;;; :TEST-ME (mon-string-split-buffer-name)
;;; :TEST-ME (mon-string-split-buffer-name t)
;;; :TEST-ME (call-interactively 'mon-string-split-buffer-name)

;;; ==============================
;;; :FROM :FILE mon-dir-utils.el
;;; ==============================
;;; :CREATED <Timestamp: Friday May 29, 2009 @ 07:26.02 PM - by MON>
(defun mon-truncate-path-for-prompt (&optional intrp)
  "Return a truncated path string of current buffers path.\n
Useful for passing around to helper functions that prompt.\n
:EXAMPLE\n(mon-truncate-path-for-prompt)\n
:SEE-ALSO `mon-file-reduce-name'.\n▶▶▶"
(interactive "p")
  (let* ((trunc-pth (directory-file-name (expand-file-name "./")))
	 (trunc-s ;; :WAS (split-string trunc-pth "/"))
          (save-match-data (split-string trunc-pth "/")))
	 (trunc-l (length trunc-s))
	 (bld-lst))
    (setq bld-lst (cond ((>= trunc-l 3)(last trunc-s 3))
                        ((>= trunc-l 2)(last trunc-s 2))
                        ((>= trunc-l 1)(last trunc-s))))
    (setq bld-lst (mapconcat 'identity bld-lst "/"))
    (if intrp (message "Truncated path: %s" bld-lst) bld-lst)))
;;
;;; :TEST-ME (mon-truncate-path-for-prompt)

;;; ==============================
;;; :FROM :FILE mon-dir-utils.el
;;; ==============================
;;; :MODIFICATIONS <Timestamp: 2009-08-01-W31-6T11:38:50-0400Z - by MON>
;;; :REMOVED Best I can see the (and * t) is totally pointless; removed it.
;;; :CREATED <Timestamp: Saturday May 23, 2009 @ 11:38.18 AM - by MON>
(defun mon-buffer-written-p (&optional insrtp intrp)
  "Non-nil current buffer has been written to a file or created with `find-file'
  and _can_ be written in current directory - whether it has been or not).\n
:SEE-ALSO `mon-buffer-exists-p', `mon-buffer-written-p', `mon-with-file-buffer',
`mon-buffer-name->kill-ring', `mon-get-buffer-parent-dir',
`mon-get-proc-buffers-directories', `mon-get-buffers-directories',
`mon-string-split-buffer-name', `mon-string-split-buffer-parent-dir'
`with-current-buffer', `with-temp-file', `with-temp-buffer'.\n▶▶▶"
  (interactive "P\np")
  (let* ((written-p (buffer-file-name))
         ;; :WAS (and (buffer-file-name) t)) 
         ;; and w/ t is not needed! Why was this here?
	 (has-or-not (if written-p "has or can be"  "_hasn't or can't_ be")))
    (when intrp
      (message "buffer `%s' %s written to file." (buffer-name) has-or-not))
    (when insrtp 
      (insert (format "#Buffer `%s' %s written to file." (buffer-name) has-or-not)))
    written-p))
;;
;;; :TEST-ME (mon-buffer-written-p)
;;; :TEST-ME (mon-buffer-written-p)
;;; :TEST-ME (mon-buffer-written-p t)
;;; :TEST-ME (call-interactively 'mon-buffer-written-p) 

;;; ==============================
;;; :FROM :FILE mon-utils.el
;;; ==============================
;;; :CREATED <Timestamp: Monday June 15, 2009 @ 05:36.12 PM - by MON KEY>
(defun mon-toggle-read-only-point-motion ()
  "Toggle `inhibit-read-only' and `inhibit-point-motion-hooks'.\n
:SEE-ALSO `mon-inhibit-read-only', `mon-inhibit-point-motion-hooks',
`mon-inhibit-modification-hooks', `mon-naf-mode-toggle-restore-llm'.\n▶▶▶"
  (interactive)
  (if (or (bound-and-true-p inhibit-read-only)
          (bound-and-true-p inhibit-read-only))
      (progn
	(setq inhibit-read-only nil)
	(setq inhibit-point-motion-hooks nil))
      (progn
        (setq inhibit-read-only t)
        ;;; cursor-intangible-mode cursor-sensor-mode
        (setq inhibit-point-motion-hooks t))))
        
        

;;; ==============================
;;; :FROM :FILE mon-dir-utils.el
;;; ==============================
;;; :CREATED <Timestamp: Thursday May 21, 2009 @ 08:06.42 PM - by MON>
(defun mon-dir-build-list (dir &optional not-concat-path)
  "Return a _list_ of directories in DIR.\n
When non-nil NOT-CONCAT-PATH returns a list _without_ the leading path.\n
:SEE-ALSO `mon-dir-try-comp',`mon-dir-hashed-complete',`mon-dir-hash-images'.\n▶▶▶"
(save-excursion
    (save-window-excursion
      (let ((temp-string)
	    (curr-buff (get-buffer (current-buffer)))
	    (in-dir dir)
	    (rtn-dir))
	(setq temp-string    
	      (with-temp-buffer
		(let ((this-buff)
		      (that-buff)
		      (ss))
		  (setq this-buff (get-buffer (current-buffer)))
		  (list-directory dir t)
		  (setq that-buff (get-buffer "*Directory*"))
		  (set-buffer that-buff)
		  (setq ss (buffer-substring-no-properties (point-min) (point-max)))
		  (set-buffer this-buff)
		  (kill-buffer that-buff)
		  (insert ss)
		  (goto-char (point-min))
		  (keep-lines "^d.*[0-9][0-9]:[0-9][0-9] .*$")
		  (goto-char (point-min))
		  (while (search-forward-regexp 
                          "\\(\\(^d.*[0-9][0-9]:[0-9][0-9][[:space:]]\\)\\(.*$\\)\\)" nil t)
		    (replace-match "\\3" ))
		  (mon-cln-trail-whitespace)
		  (goto-char (point-min))
		  (while (search-forward-regexp "^\\(.*\\)$" nil t)
		    (if (and (mon-line-bol-is-eol) (not (eobp)))
			(delete-char 1)
		      (replace-match "\\1|")))
		  (while (search-backward-regexp "^\|$" nil t)
		    (if (= (char-after) 124)
		      (delete-char 1)))
		  (goto-char (point-min))
		  (mon-delete-back-up-list (point-min) (point-max))
		  (buffer-substring-no-properties (point-min) (point-max)))))
	(set-buffer curr-buff)
	(setq rtn-dir
	      ;; :WAS (split-string temp-string "| "))
              (save-match-data (split-string temp-string "| ")))
	(setq rtn-dir (delete "" rtn-dir))
	(if (not not-concat-path)
	    (setq rtn-dir
		  (let ((map-dir rtn-dir)
			(conc-dir (concat in-dir "/")))
		    (mapcar #'(lambda (x) (concat conc-dir x)) map-dir)))
	  rtn-dir)
	;; (prin1 rtn-dir (current-buffer))
	rtn-dir))))
;;
;;; :TEST-ME (mon-dir-build-list *mon-emacs-root*)
;;; :TEST-ME (mon-dir-build-list *mon-emacs-root* t)

;;; ==============================
;;; :FROM :FILE mon-utils.el
;;; ==============================
;;; :CREATED <Timestamp: Thursday May 07, 2009 @ 03:17.51 PM - by MON KEY>
(defun mon-line-bol-is-eol (&optional intrp)
  "Return t if postion at beginning of line is eq end of line.\n
:SEE-ALSO `mon-spacep-is-bol', `mon-spacep-not-bol',
`mon-spacep', `mon-line-bol-is-eol', `mon-line-next-bol-is-eol',
`mon-line-previous-bol-is-eol', `mon-spacep-is-after-eol',
`mon-spacep-is-after-eol-then-graphic', `mon-spacep-at-eol',
`mon-cln-spc-tab-eol'.\n▶▶▶"
(interactive "p")
  (let ((bol-eol(= (line-end-position) (line-beginning-position))))
     (cond (intrp
	 (if bol-eol
	     (message "Beginning of Line _IS_  End of Line.")
	   (message "Beginning of Line _NOT_ End of Line."))))
    bol-eol))
;;
;;; :TEST-ME (save-excursion (previous-line) (beginning-of-line) (mon-line-bol-is-eol))


;;; ==============================
;;; :FROM :FILE mon-replacement-utils.el
;;; ==============================
;;; ==============================
(defun mon-cln-trail-whitespace ()
    "Indiscriminately clean trailing whitespace in _ENTIRE_ buffer.\n
Delete any trailing whitespace, converting tabs to spaces.
Use `mon-kill-whitespace' to kill tabs to 1 (one) space.
Operate on entire *<BUFFER>* not region. For interactive whitespace
region adjustment use `mon-cln-BIG-whitespace', `mon-cln-blank-lines',
or `mon-cln-whitespace'.\n
:SEE-ALSO .\n:USED-IN `naf-mode'.\n▶▶▶"
    (interactive)
    (save-excursion
      (goto-char (buffer-end 0))
      (while (search-forward-regexp "[ \t]+$" nil t)
        (delete-region (match-beginning 0) (match-end 0)))
      (mon-g2be -1) ;; :WAS (goto-char (buffer-end 0))
      (if (search-forward "\t" nil t)
          (untabify (1- (point)) (mon-g2be 1 t) )))) ;; :WAS (buffer-end 1) ))))

;;; ==============================
;;; :FROM :FILE mon-replacement-utils.el
;;; ==============================
;;; :CREATED <Timestamp: Tuesday April 07, 2009 @ 11:35.38 AM - by MON KEY>
(defun mon-delete-back-up-list (start end &optional delim)
  "Given a text item-per-line list with no trailing whitespace, move backwards from
point to BOL and deletes 1 char. This effecively puts point on the next line up.
With each successive previous line deleting until point is no longer greater than point-min.
:NOTE Be careful, function can wreck data, evaluate using `with-temp-buffer'.\n
:SEE-ALSO `mon-line-pipe-lines', `mon-cln-piped-list', `naf-backup-the-list',
`mon-delete-back-up-list', `mon-line-strings-pipe-bol',
`mon-line-strings-pipe-to-col',  `mon-cln-mail-headers', `mon-cln-csv-fields',
`mon-cln-file-name-string', `mon-cln-up-colon', `mon-cln-whitespace',
`mon-cln-uniq-lines', `mon-cln-control-M'.\n:USED-IN `naf-mode'.\n▶▶▶"
  (interactive "r\np") 
  (let* (;; (is-on (mon-is-naf-mode-and-llm-p))
	 ;; (llm-off)
	 (the-delim (cond ((eq delim 1) " ")
                           ((not delim) " ")
                           ((or delim) delim))))
    ;;(when is-on (longlines-mode 0) (setq llm-off t))
    (mon-toggle-restore-llm nil  
    (let ((bak-start start)
	  (bak-end end)
	  (bak-pipe))
      (setq bak-pipe (buffer-substring-no-properties bak-start bak-end))
       (save-excursion
         (setq bak-pipe
               (with-temp-buffer
                 (insert bak-pipe)
                 (progn	    
                   (mon-cln-trail-whitespace)
                   (goto-char (buffer-end 1))
                   (while (> (point)(buffer-end 0))
                     (beginning-of-line)
                     (insert the-delim)
                     (beginning-of-line)
                     (delete-char -1)
                     (if (bolp)
                         () (beginning-of-line) ))
                   (goto-char (buffer-end 1))
                   (while (search-forward-regexp "\1" nil t)
                     (replace-match " " nil nil)))
                 (buffer-substring-no-properties (buffer-end 0) (buffer-end 1))))
         (delete-region bak-start bak-end)
         (insert bak-pipe)))
    ;; (when llm-off (longlines-mode 1) (setq llm-off nil))
    )))

;;; ==============================
;;; Call lonlines-mode at least once before calling `mon-delete-back-up-list'
(save-excursion
  (let (test)
    (setq test
	  (with-temp-buffer
	    (when (not (bound-and-true-p lonlines-mode))
	      (longlines-mode))))
    (when test (message "longlines-mode initialized at least once."))))

;;; ================================================================
;;; Following :FROM :FILE mon-dir-locals-alist.el
;;; ================================================================

;;; ==============================
;;; `*mon-nef-scan-path*' 
;;; ==============================

(defvar *mon-nef-scan-drive* nil
  "User conditional path to ebay nef photo drive.\n
:CALLED-BY `mon-get-buffers-directories'.\n
:SEE-ALSO `*mon-nef-scan-nefs-path*', `*mon-nef-scan-nef2-path*', `*mon-ebay-images-path*',
`*mon-ebay-images-bmp-path*', `*mon-ebay-images-jpg-path*',`*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-nef-scan-drive*))
  (setq *mon-nef-scan-drive* "<DRIVE-OR-ROOT:>/"))

(defvar *mon-nef-scan-path* nil
  "User conditional path to ebay nef photo drive.\n
:CALLED-BY `mon-get-buffers-directories'.\n
:SEE-ALSO `*mon-nef-scan-nefs-path*', `*mon-nef-scan-nef2-path*', `*mon-ebay-images-path*',
`*mon-ebay-images-bmp-path*', `*mon-ebay-images-jpg-path*',`*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-nef-scan-path*))
  (setq *mon-nef-scan-path* (concat *mon-nef-scan-drive* "NEFS_PHOTOS")))

;;; ==============================
;;; `*mon-nef-scan-nefs-path*' 
;;; ==============================
(defvar *mon-nef-scan-nefs-path* nil
  "User conditional path to ebay NEFS drive.\n
:SEE-ALSO `*mon-nef-scan-path*', `*mon-nef-scan-nef2-path*', `*mon-ebay-images-path*',
`*mon-ebay-images-bmp-path*', `*mon-ebay-images-jpg-path*', `*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-nef-scan-nefs-path*))
  (setq *mon-nef-scan-nefs-path* 
	(concat *mon-nef-scan-path* "/NEFS")))


;;; ==============================
;;; `*mon-nef-scan-nef2-path*'
;;; ==============================
(defvar *mon-nef-scan-nef2-path* nil
  "User conditional path to ebay nef photo drive.\n
:SEE-ALSO `*mon-nef-scan-path*', `*mon-nef-scan-nefs-path*', `*mon-ebay-images-path*',
`*mon-ebay-images-bmp-path*', `*mon-ebay-images-jpg-path*', `',
`*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-nef-scan-nef2-path*))
  (setq *mon-nef-scan-nef2-path* 
	(concat *mon-nef-scan-path* "/Nef_Drive2")))

;;; ==============================
;;; `*mon-ebay-images-path*' 
;;; ==============================
(defvar *mon-ebay-images-path* nil
  "User conditional path to ebay image scans.
:SEE-ALSO `*mon-nef-scan-path*', `*mon-nef-scan-nefs-path*', `*mon-nef-scan-nef2-path*',
`*mon-ebay-images-bmp-path*', `*mon-ebay-images-jpg-path*', `'
`*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-ebay-images-path*))
  (setq *mon-ebay-images-path*
	(concat *mon-nef-scan-nef2-path* "/EBAY")))

;;; ==============================
;;; `*mon-ebay-images-bmp-path*' 
;;; ==============================
(defvar *mon-ebay-images-bmp-path* nil
  "User conditional path to ebay .bmp scans.
:CALLED-BY `mon-dir-try-comp', `mon-dired-naf-image-dir'.
:SEE-ALSO `*mon-nef-scan-path*', `*mon-nef-scan-nefs-path*', `*mon-nef-scan-nef2-path*',
`*mon-ebay-images-path*', `*mon-ebay-images-jpg-path*', `*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-ebay-images-bmp-path*))
  (setq *mon-ebay-images-bmp-path*
	(concat *mon-ebay-images-path* "/BMP-Scans")))

;;; ==============================
;;; `*mon-ebay-images-jpg-path*'
;;; ==============================
(defvar *mon-ebay-images-jpg-path* nil
  "User conditional path to ebay scans converted to .jpg.\n
:SEE-ALSO `*mon-nef-scan-path*', `*mon-nef-scan-nefs-path*', `*mon-nef-scan-nef2-path*',
`*mon-ebay-images-path*', `*mon-ebay-images-bmp-path*', `*mon-ebay-images-lookup-path*'.")
;;
(when (not (bound-and-true-p *mon-ebay-images-jpg-path*)) 
  (setq *mon-ebay-images-jpg-path*
 	(concat *mon-ebay-images-path* "/BIG-cropped-jpg")))

;;; ==============================
(defvar *mon-ebay-images-lookup-path* nil
  "An alist of paths to examine when functions need to look for images.
The alist keys are of the image-type as a string: \".nef\", \".jpg\", or \".bmp\".
For these purposes we don't want to be in the NEFS folder and assume a .nef source image
is in the eBay-bmp path.\n
:SEE-ALSO `*mon-nef-scan-path*', `*mon-nef-scan-nefs-path*', `*mon-nef-scan-nef2-path*',
`*mon-ebay-images-path*', `*mon-ebay-images-bmp-path*', `*mon-ebay-images-jpg-path*'.")
;;
(when (not (bound-and-true-p *mon-ebay-images-lookup-path*)) 
  (setq *mon-ebay-images-lookup-path*
        '((".nef" *mon-ebay-images-bmp-path* "BMP-Scans")         ; *mon-nef-img-hash*)
          (".jpg" *mon-ebay-images-jpg-path* "BIG-cropped-jpg")   ; *mon-jpg-img-hash*)
          (".bmp" *mon-ebay-images-bmp-path* "BMP-Scans"))) ; *mon-bmp-img-hash*)))
  ;; :NOTE if these get hashed:
  ;; *mon-nef-img-hash* *mon-bmp-img-hash* *mon-jpg-img-hash*
  )

;;;(dired *mon-nef-scan-nefs-path*)
;;;(boundp '*mon-ebay-images-lookup-path*)
;;;(makunbound '*mon-ebay-images-lookup-path*)
;;;(unintern 'ebay-images-lookup-path*)


;;; ==============================
;;; :TEST-ME (dired *mon-nef-scan-nefs-path*)
;;; :TEST-ME (dired *mon-nef-scan-path*)
;;; :TEST-ME (dired *mon-nef-scan-nefs-path*)
;;; :TEST-ME (dired *mon-nef-scan-nef2-path*)
;;; :TEST-ME (dired *mon-ebay-images-path*)
;;; :TEST-ME (dired *mon-ebay-images-bmp-path*)
;;; :TEST-ME (dired *mon-ebay-images-jpg-path*)
;;; ==============================

;;; ==============================
;; :CLEANUP
;; (mapc '(
;;  (unintern '*mon-nef-scan-path*)
;;  (unintern '*mon-nef-scan-nefs-path*)
;;  (unintern '*mon-nef-scan-nef2-path*)
;;  (unintern '*mon-ebay-images-path*)
;;  (unintern '*mon-ebay-images-bmp-path*)
;;  (unintern '*mon-ebay-images-jpg-path*)))
;; ==============================

;;; ==============================
(provide 'mon-rename-images-supplemental)
;;; ==============================

;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"

;; coding: utf-8
;; mode: EMACS-LISP
;; End:

;;; ================================================================
;;; mon-rename-images-supplemental.el ends here
;;; EOF
