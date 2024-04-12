;;; mon-dbc-xml-utils.el --- { A one line description of: mon-dbc-xml-utils. }
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2011-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-dbc-xml-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2011-01-07T16:02:29-05:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: 

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-dbc-xml-utils provides { some description here. }
;;
;; FUNCTIONS:▶▶▶
;; `mon-dbc-xml-parse-clean-fields',
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
;; FIRST-PUBLISHED:
;;
;; FILE-CREATED:
;; <Timestamp: #{2011-01-07T16:02:29-05:00Z}#{11015} - by MON KEY>
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
;; Copyright © 2011-2024 MON KEY
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

(defvar *mon-ampersand-sharp-diacritic-pairs* 
  ;; (setq *mon-ampersand-sharp-diacritic-pairs*
  ;; (let ((latin-withs ()))
  ;;   (dolist (un (ucs-names)) ;; ucs-names is now a hash-table (hash-table-count ucs-names)
  ;;     (when (string-match-p "LATIN \\(SMALL\\|CAPITAL\\) LETTER *" (car un))
  ;;       (push (cdr un) latin-withs)))
  ;;   (let ((decomps ())
  ;;         (formatted-pairs ()))
  ;;     (dolist (lw latin-withs)
  ;;       (let ((maybe-push-decomp (get-char-code-property lw 'decomposition)))
  ;;         (when maybe-push-decomp
  ;;           (push (list maybe-push-decomp lw) decomps))))
  ;;     (dolist (dc decomps (delete-dups formatted-pairs))
  ;;                                       ; caar =>  121
  ;;                                       ; cadar => 771
  ;;                                       ; cadr => 7929
  ;;       (when (and (= (length (car dc)) 2)




  ;;                  (mon-every #'integerp (car dc)))
  ;;         (push (cons (format "%c&#%d;" (caar dc) (cadar dc))
  ;;                     (format "%c" (cadr dc)))
  ;;               formatted-pairs)))))

;; :NOTE the var `ucs-namse' has changed from an alist with elements of form
;; (CHARNAME . CHAR-CODE)  ("VARIATION-SELECTOR" . 917999)
  ;; We need to do something here to make sure the pairs get consd up the way we need.
  ;; end result shold be that value of global var `*mon-ampersand-sharp-diacritic-pairs*' is an alist with elements that have the form: ("S&#807" . "Ş")

  (let  ((tbl (ucs-names))
         (latin-withs ()))
    (loop 
     for unk being the hash-keys of tbl
     when (string-match-p "LATIN \\(SMALL\\|CAPITAL\\) LETTER *" unk)
     do (push (gethash unk ucs-names) latin-withs))
         
    (let ((decomps ())
          (formatted-pairs ()))
      (dolist (lw latin-withs)
        (let ((maybe-push-decomp (get-char-code-property lw 'decomposition)))
          (when maybe-push-decomp
            (push (list maybe-push-decomp lw) decomps))))
      (dolist (dc decomps (delete-dups formatted-pairs))
                                        ; caar =>  121
                                        ; cadar => 771
                                        ; cadr => 7929
        (when (and (= (length (car dc)) 2)
                   (mon-every #'integerp (car dc)))
          (push (cons (format "%c&#%d;" (caar dc) (cadar dc))
                      (format "%c" (cadr dc)))
                formatted-pairs))))))

(defun mon-replace-ampersand-sharp-chars-in-buffer ()
  (interactive)
  (with-current-buffer (current-buffer)
    (save-excursion
      (let ((case-fold-search nil)
            (cnt 0))
        (dolist (i *mon-ampersand-sharp-diacritic-pairs* 
                   (message "replaced %d characters in buffer" cnt))
          (mon-g2be -1)
          (while (search-forward-regexp (car i) nil t) 
            (setf cnt (1+ cnt))
            (replace-match (cdr i) t)))))))

;; (progn (search-forward-regexp "^\\( (\\)\\(\".*\"\\)\\( +\\)\\(.*\\)\\()\\)" nil t)
;;        (replace-match "(\\4\n:initarg :\\4\n:accessor \\4\n:documentation \":ORIGINAL-FIELD \\2\")"))
(defun mon-dbc-replace-consed-pairs-region-with-parsed-defclass-slots (start end)
  "Replace each consed pair in region insert a defclass template.\n
Elements of CONSED-PAIRS are as per the consed pairs of FIELD-TO-ACCESSOR-ALIST
arg to CL function `dbc::make-parsed-class-field-slot-accessor-mapping' and
should have the form:\n
 \(<MATCH-STRING> . <TRANSFORM-SYMBOL>\)\n
Inserted template has the format:\n
 \(<SLOT>
  :initarg :<INITARG>
  :accessor <ACCESSOR>
  :documentation \":ORIGINAL-FIELD \\\"<FIELD>\\\"\"\)\n
:EXAMPLE\n\n
:SEE-ALSO `mon-dbc-xml-parse-clean-fields', `mon-dbc-xml-insert-parsed-defclass-slots'.\n▶▶▶"
  (interactive "r")  
  (save-excursion
    (narrow-to-region start end)
    (mon-g2be -1)
    (while (search-forward-regexp "\\([\\[:blank:]]?(\\)\\(\".*\"\\)\\([\\[:blank:]]+\\.[\\[:blank:]]+\\)\\(.*\\)\\()\\)" nil t)
      (let* ((match-4 (match-string-no-properties 4))
             ;;(match-2 (princ (match-string-no-properties 2)))
             (match-2 (read-from-string (match-string-no-properties 2)))
             (replacement 
              (format 
               ;; "%s\n:initarg :%s\n:accessor %s\n:documentation \":ORIGINAL-FIELD %s\"
               "(%s\n:initarg :%s\n:accessor %s\n:documentation \":ORIGINAL-FIELD \\\"%s\\\"\")\n"
               match-4
               match-4
               match-4
               (car match-2))))
        (replace-match replacement t t)))
    (widen)))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-10-03T20:05:44-04:00Z}#{11401} - by MON KEY>
(defun mon-insert-parsed-defclass-slots (consed-pairs)
  "For each consed pair in CONSED-PAIRS insert a defclass template.\n
Elements of CONSED-PAIRS are as per the consed pairs of FIELD-TO-ACCESSOR-ALIST
arg to CL function `dbc::make-parsed-class-field-slot-accessor-mapping' and
should have the form:\n
 \(<MATCH-STRING> . <TRANSFORM-SYMBOL>\)\n
Inserted template has the format:\n
 \(<SLOT>
  :initarg :<INITARG>
  :accessor <ACCESSOR>
  :documentation \":ORIGINAL-FIELD \\\"<FIELD>\\\"\"\)\n
:SEE-ALSO `mon-dbc-replace-consed-pairs-region-with-parsed-defclass-slots', `mon-dbc-xml-parse-clean-fields'.\n▶▶▶"
  (dolist (p consed-pairs)
    (let ((sym   (car p))
          (field (cdr p)))
      (princ
       (format "(%s\n :initarg :%s\n :accessor %s\n :documentation \":ORIGINAL-FIELD \\\"%s\\\"\")\n"
               ;;'control-id-doc-num-artist 'control-id-doc-num-artist 'control-id-doc-num-artist "bio")
               field field field sym)
       (current-buffer)))))

(defalias 'mon-dbc-xml-insert-parsed-defclass-slots 'mon-insert-parsed-defclass-slots)

;;; ==============================
;;; :CHANGESET 2383
;;; :CREATED <Timestamp: #{2011-01-07T16:05:15-05:00Z}#{11015} - by MON KEY>
(defun mon-dbc-xml-parse-clean-fields (start end)
  "Transform XML schema from START to END into an intermediate format.\n
Used for annotating schemas prior converting to Common Lisp `defclass' forms.\n
Return value has the format:\n
 ;; :FIELD \"<FILEDNAME>\"
 ;;
 ;;         :TYPE \"<TYPE>\"
 ;;         :NULL-P \"<YES/NO>\"
 ;;         :KEY \"\"
 ;;         :DEFAULT \"\"
 ;;         :EXTRA \"\"
 ;;
 ;; :EXAMPLE-VALUES 
 ;;\n
:EXAMPLE\n\n
:SEE-ALSO `mon-dbc-replace-consed-pairs-region-with-parsed-defclass-slots' `mon-insert-parsed-defclass-slots'.\n▶▶▶"
  (interactive "r")
  (unwind-protect
      (progn 
        (narrow-to-region start end)
        (dolist (r `(("^\\([[:blank:]]+\\)?<field Field=" . 
                      ,(concat "\n" (mon-comment-divider t) "\n;; :FIELD "))
                     ;; :NOTE (make-string (+ (length ":FIELD ") 2) 32) =>  "         "
                     ;; :WAS (" Type="    . "\n;;\n;;         :TYPE ")
                     (" Type="    . " :TRANSFORM\n;;\n;;         :TYPE ")
                     (" Null="    . "\n;;         :NULL-P ")
                     (" Key="     . "\n;;         :KEY ")
                     (" Default=" . "\n;;         :DEFAULT ")
                     (" Extra="   . "\n;;         :EXTRA ")
                     (" />$"      . "\n;;\n;; :EXAMPLE-VALUES \n;;\n;;\n;; -\n;;")))
          (mon-g2be -1)
          (while (search-forward-regexp (car r) nil t)
            (replace-match (cdr r)))))
    (widen)))

;; (let ((latin-withs ()))
;;    (dolist (un (ucs-names))
;;      (when (string-match-p "LATIN \\(SMALL\\|CAPITAL\\) LETTER *" (car un))
;;        (push (cdr un) latin-withs)))
;;    (let ((decomps ())
;;          (formatted-pairs ()))
;;      (dolist (lw latin-withs)
;;        (let ((maybe-push-decomp (get-char-code-property lw 'decomposition)))
;;          (when maybe-push-decomp
;;            (push (list maybe-push-decomp lw)decomps))))
;;      (dolist (dc decomps (princ formatted-pairs))
;;                                         ; caar =>  121
;;                                         ; cadar => 771
;;                                         ; cadr => 7929
;;        (when (and (= (length (car dc)) 2)
;;                   (mon-every #'integerp (car dc)))
;;          (push (format "(\"%c&#%d;\" . \"%c\")" (caar dc) (cadar dc) (cadr dc))
;;                formatted-pairs)))))

;;; ==============================
(provide 'mon-dbc-xml-utils)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; coding: utf-8
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ====================================================================
;;; mon-dbc-xml-utils.el ends here
;;; EOF
