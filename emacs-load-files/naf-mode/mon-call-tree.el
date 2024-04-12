;; -*- mode: EMACS-LISP; no-byte-compile: t -*-

;;; ==============================
;;; CREATED: <Timestamp: #{2009-08-21T17:59:14-04:00Z}#{09345} - by MON KEY>
;;; THIS is buggy but why?
;;; 
;;; FUNCTIONS:▶▶▶
;;; `mon-call-tree-analyze', `mon-call-tree-add', `mon-call-tree-update-header',
;;; FUNCTIONS:◀◀◀
;;; 
;;; NOTES:
;;; These routines probably need to be reconstructed.
;;; We need to find any region with the variable or function name face.
;;; push it onto a list reduce that list it and drop it back ino the file header.
;;; (eq (get-text-property pos 'face) 'font-lock-function-name-face)
;;; (eq (get-text-property pos 'face) 'font-lock-variable-name-face)
;;; (next-single-property-change pos 'face)
;;;
;;; (font-lock-value-in-major-mode 'Emacs-Lisp)
;;;
;;; This could prob. also be done with a fully up-to-date tags table!
;;;
;;; These cookies may not work when file has unibyte(???) text: 
;;; ``FUNCTIONS:▶▶▶'', ``FUNCTIONS:◀◀◀'', consider changing to something eles esp.
;;; as the other doc-cookie funcs may also falseley trigger on this.
;;;
;;; ==============================
;;; The routines in this file were influeced by:
;;; Author: Alex Schroeder <alex@gnu.org>
;;; Maintainer: Alex Schroeder <alex@gnu.org>
;;; Version: 1.0.0
;;; (URL `http://www.emacswiki.org/cgi-bin/wiki.pl?CallTree')
;;; Copyright (C) 2003  Alex Schroeder
;;; analyze source code based on font-lock text-properties
;;; This code analyses a buffer and uses text properties to find
;;; function names (these have the face font-lock-function-name-face).
;;; Therefor, it should work for any source language, as long as it is
;;; fontified correctly.
;;; See also; `*mon-call-tree-alist*', `mon-call-tree-add', `mon-call-tree-analyze'
;;; ==============================
;;; CODE:

;;; ==============================
;;; COURTESY Alex Schroeder <alex@gnu.org> HIS: simple-call-tree.el VERSION: 1.0.0
;;; WAS: simple-call-tree-alist -> *mon-call-tree-alist*
;;; MODIFICATIONS: <Timestamp: #{2009-08-21T14:34:57-04:00Z}#{09345} - by MON>
(defvar *mon-call-tree-alist* nil
  "Alist of functions and the functions they call.
CALLED-BY: `mon-call-tree-analyze', `mon-call-tree-add'.\n
See also; `mon-call-tree-update-header'.")

;;;test-me; *mon-call-tree-alist*
;;;(progn (makunbound '*mon-call-tree-alist*) (unintern '*mon-call-tree-alist*))

;;; ==============================
;;; COURTESY: Alex Schroeder <alex@gnu.org> HIS: simple-call-tree.el VERSION: 1.0.0
;;; WAS: simple-call-tree-analyze -> mon-call-tree-analyze
;;; MODIFICATIONS: <Timestamp: #{2009-08-21T14:34:57-04:00Z}#{09345} - by MON>
(defun mon-call-tree-analyze (&optional test)
  "Analyze the current buffer locating functions based on their fontlock face.
Sets value of `*mon-call-tree-alist*' to an an alist of buffers' 
functions. If optional function TEST is given, it must return non-nil when
called with one parameter, the starting position of the function name.\n
See also; `mon-call-tree-add', `mon-call-tree-update-header'."
  (interactive)
  (setq *mon-call-tree-alist* nil)
  (let ((pos (point-min))
	(count 0))
    (while pos
      (when (and (eq (get-text-property pos 'face)
		     'font-lock-function-name-face)
		 (or (not (functionp test))
		     (funcall test pos)))
	(setq count (1+ count))
	(message "Identifying functions...%d" count)
	(let ((start pos))
	  (setq pos (next-single-property-change pos 'face))
	  (setq *mon-call-tree-alist* 
                (cons (list (buffer-substring-no-properties start pos))
                      *mon-call-tree-alist*))))
      (setq pos (next-single-property-change pos 'face)))
    (setq pos (point-min)
	  max count
	  count 0)
    (save-excursion
      (let ((old (point-min))
	    (old-defun '("*Start*"))
	    defun)
	(while pos
	  (when (and (eq (get-text-property pos 'face)
			 'font-lock-function-name-face)
		     (or (not (functionp test))
			 (funcall test pos)))
	    (setq end (next-single-property-change pos 'face)
		  defun (assoc (buffer-substring-no-properties pos end)
			       *mon-call-tree-alist*))
	    (setq count (1+ count))
	    (message "Identifying functions called...%d/%d" count max)
	    (mon-call-tree-add old pos old-defun)
	    (setq old end
		  pos end
		  old-defun defun))
	  (setq pos (next-single-property-change pos 'face))))))
;;  (message "simple-call-tree done"))
*mon-call-tree-alist*)


;;;test-me;(mon-call-tree-analyze)
;;;test-me; *mon-call-tree-alist*
;;;(progn (makunbound 'mon-call-tree-analyze) (unintern 'mon-call-tree-analyze))

;;; ==============================
;;; COURTESY: Alex Schroeder <alex@gnu.org> HIS: simple-call-tree.el VERSION: 1.0.0
;;; WAS: simple-call-tree-add -> `mon-call-tree-add'
;;; MODIFICATIONS: <Timestamp: #{2009-08-21T14:34:57-04:00Z}#{09345} - by MON>
(defun mon-call-tree-add (start end alist)
  "Add tokens between START and END to ALIST.
ALIST is a list with a string identifying the function in its car,
and the list of functions it calls in the cdr.\n
See also; `*mon-call-tree-alist*', `mon-call-tree-analyze', 
`mon-call-tree-update-header'."
  (dolist (entry *mon-call-tree-alist*)
    (goto-char start)
    (catch 'done
      (while (search-forward (car entry) end t)
	(let ((faces (get-text-property (point) 'face)))
	  (unless (listp faces)
	    (setq faces (list faces)))
	  (unless (or (memq 'font-lock-comment-face faces)
		      (memq 'font-lock-string-face faces))
	    (setcdr alist (cons (car entry)
				(cdr alist)))
	    (throw 'done t)))))))

;;;(progn (makunbound 'mon-call-tree-add) (unintern 'mon-call-tree-add))

;;; ==============================
;;; NOTE: Extends procedures from Alex Schroeder's simple-call-tree. 
;;; CREATED: <Timestamp: #{2009-08-21T16:31:56-04:00Z}#{09345} - by MON KEY>
(defun mon-call-tree-update-header ()
  "Replace all elisp functions in buffe with existing functions in file header.
This function relies on the presence of the ▶▶▶ and ◀◀◀ cookies immediately following
\";;; FUNCTIONS:\" at BOL. e.g as follows:
;;; FUNCTIONS:▶▶▶
;;; `*mon-call-tree-alist*', `mon-call-tree-add', `mon-call-tree-analyze',
;;; FUNCTIONS:◀◀◀\n
See also; `*mon-call-tree-alist*', `mon-call-tree-add', `mon-call-tree-analyze'."
  (interactive)
  (mon-call-tree-analyze)
  (let ((get-tree *mon-call-tree-alist*)
        (the-tree)
        (func-mark-s (make-marker))
        (func-mark-e (make-marker)))
    (setq the-tree get-tree)
   ; (setq the-tree (mon-flatten the-tree))
   ; (setq the-tree (remove-duplicates  the-tree))
    (setq the-tree (mapcar (lambda (x) (format "`%s', " x)) the-tree))
    (goto-char (point-min))
    (search-forward-regexp "^;;; FUNCTIONS:▶▶▶" nil t)
    (unless (eq (point) (point-min))
      (set-marker func-mark-s (point)))
    (search-forward-regexp "^;;; FUNCTIONS:◀◀◀" nil t)
    (unless (eq (point) func-mark-s)
      (progn 
        (line-move -1) 
        (set-marker func-mark-e (line-end-position))))
    (delete-region func-mark-s func-mark-e)
    (goto-char func-mark-s)
    (save-excursion 
      (setq the-tree
            (with-temp-buffer
              (set (make-local-variable 'fill-prefix) ";;; ")
              (insert ";;; ")
              (mapc (lambda (x) (princ x (current-buffer))) the-tree)
              (fill-region (point-min) (point-max))
              (buffer-string))))
    (newline)
    (insert the-tree)))

;;; :TESTME mon-call-tree-update-header 
;;;(progn (makunbound 'mon-call-tree-update-header) (unintern 'mon-call-tree-update-header))

;;; ==============================
;;; (provide 'mon-call-tree)
;;; ==============================



;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; no-byte-compile: t
;; coding: utf-8
;; mode: EMACS-LISP
;; End:

;;; ==============================
;;; mon-call-tree.el ends here
;;; EOF
