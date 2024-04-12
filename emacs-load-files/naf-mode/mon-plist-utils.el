;;; mon-plist-utils.el --- functions for working plist-like lists
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================

;; FILENAME: mon-plist-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2010-11-08T11:07:39-05:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: lisp

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-plist-utils provides { some description here. }
;;
;; FUNCTIONS:▶▶▶
;; `mon-plist-keys', `mon-plist-values', `mon-plist-remove-consing',
;; `mon-plist-remove-if',
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
;; `*mon-plist-utils-xrefs*'
;;
;; GROUPS:
;; `mon-plist-utils'
;;
;; ALIASED/ADVISED/SUBST'D:
;;
;; DEPRECATED:
;;
;; RENAMED:
;;
;; MOVED:
;; `mon-plist-keys'           <- mon-utils.el 
;; `mon-plist-remove!'        <- mon-utils.el
;; `mon-plist-remove-if'      <- mon-utils.el
;; `mon-plist-remove-consing' <- mon-utils.el
;; 
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
;; <Timestamp: #{2010-11-08T11:07:39-05:00Z}#{10451} - by MON KEY>
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
;; Copyright © 2010-2024 MON KEY 
;;; ==============================


;;; CODE:

(eval-when-compile (require 'cl))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))


;;; ==============================
;;; :CHANGESET 2387
;;; :CREATED <Timestamp: #{2011-01-11T18:57:02-05:00Z}#{11022} - by MON KEY>
(defgroup mon-plist-utils nil
  "Customization group for variables and functions of :FILE mon-plist-utils.el\n
:SEE-ALSO `mon-base', `mon-xrefs', `mon-macs', `mon-dir-locals', `mon-error-warn',
`mon-regexp-symbols', `mon-dir-utils', `mon-line-utils', `mon-seq-utils',
`mon-plist-utils', `mon-string-utils', `mon-insertion-utils',
`mon-replacement-utils', `mon-buffer-utils', `mon-window-utils',
`mon-button-utils', `mon-type-utils', `mon-type-utils-vars', `mon-image-utils',
`mon-bzr-utils', `mon-env-proc-utils', `mon-testme-utils', `mon-error-utils',
`mon-url-utils', `mon-boxcutter'.\n▶▶▶"
  :link '(emacs-library-link "mon-plist-utils.el")
  :group 'mon-base)

;;; ==============================
;;; :CHANGESET 2387
;;; :CREATED <Timestamp: #{2011-01-11T18:58:01-05:00Z}#{11022} - by MON KEY>
(defcustom *mon-plist-utils-xrefs* 
  '(mon-insert-w-text-properties
    %mon-set-buffer-substring
    %mon-set-buffer-substring-no-properties
    mon-remove-text-property
    mon-remove-single-text-property
    mon-nuke-text-properties-region
    mon-get-face-at-point
    mon-get-text-properties-region-prop
    mon-get-text-properties-region-prop-list
    mon-search-text-properties-prop
    mon-get-text-properties-region-to-kill-ring
    mon-get-text-properties-category
    mon-list-all-properties-in-buffer
    mon-nuke-text-properties-buffer
    mon-get-next-face-property-change
    mon-get-next-face-property-change-if
    mon-get-text-properties-region
    mon-get-text-properties-print
    mon-get-text-properties-read-temp
    mon-get-text-properties-elisp-string-pp
    mon-get-text-properties-elisp-string
    mon-get-text-properties-parse-prop-val-type-chk
    mon-get-text-properties-parse-buffer
    mon-get-text-properties-parse-sym
    mon-get-text-properties-parse-buffer-or-sym
    mon-get-text-properties-map-ranges
    mon-get-text-properties-map-ranges-string
    mon-get-text-property-bounds
    mon-get-text-property-remove-all
    mon-overlay-flash-region
    mon-get-overlays-region
    mon-get-overlays-region-map-props
    mon-get-overlays-map-props
    mon-get-overlays-buffer
    mon-set-overlay-range
    mon-nuke-overlay-buffer
    *mon-plist-utils-xrefs*)
  "Xrefing list of mon plist relatd symbols, functions constants, and variables.\n
The symbols contained of this list are defined in :FILE mon-plist-utils.el\n
:SEE-ALSO `*mon-default-loads-xrefs*', `*mon-default-start-loads-xrefs*',
`*mon-dir-locals-alist-xrefs*', `*mon-testme-utils-xrefs*',
`*mon-button-utils-xrefs*', `*mon-buffer-utils-xrefs*',
`*mon-window-utils-xrefs*', `*naf-mode-xref-of-xrefs*',
`*naf-mode-faces-xrefs*', `*naf-mode-date-xrefs*', `*mon-ulan-utils-xrefs*',
`*mon-xrefs-xrefs'.\n▶▶▶"
  :type '(repeat symbol)
  :group 'mon-plist-utils
  :group 'mon-xrefs)


;;; ==============================
;;; :COURTESY Pascal J. Bourguignon :HIS pjb-emacs.el :WAS `plist-keys'
(defun mon-plist-keys (in-plist)
  "Return a list of keys in IN-PLIST \(conses\).\n
W-PLIST is any proper-list for which satisfies the test:\n
 \(zerop \(% \(length IN-PLIST\) 2\)\)\n
:EXAMPLE\n\n\(let \(\(w-plist \(mon-alphabet-as-type 'plistD->num\)\)
      gthr\)
  \(push `\(#::plist-orig ,w-plist\) gthr\)
  \(push `\(#::plist-keys ,\(mon-plist-keys w-plist\)\) gthr\)\)\n
\(let \(gthr\)
  \(mon-mapc #'\(lambda \(&rest x\) \(setq gthr \(append gthr x\)\)\)
            \(mon-alphabet-as-list-symbolD\)
            \(number-sequence 1 26\)\)
  \(setq gthr `\(#::list-keys ,\(mon-plist-keys gthr\) #::w-list ,gthr\)\)\)\n
\(mon-plist-keys-TEST\)\n
:SEE-ALSO `mon-plist-values', `mon-help-plist-functions',
`mon-map-obarray-symbol-plist-props', `mon-plist-remove-if',
`mon-plist-remove-consing', `mon-plist-remove', `remf', `remprop',
`mon-plist-keys-TEST'.\n▶▶▶"
  (if (null in-plist)
      in-plist
    (cons (car in-plist) (mon-plist-keys (cddr in-plist)))))
;;
;;; :TEST-ME (mon-plist-keys-TEST)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-11-08T12:07:36-05:00Z}#{10451} - by MON KEY>
(defun mon-plist-values (in-plist)
  "Return a list of property values in IN-PLIST.\n
IN-PLIST is any proper-list satisfying `mon-list-proper-p' and the test:\n
 \(zerop \(% \(length IN-PLIST\) 2\)\)\n
When IN-PLIST is not null and above constraints are not met, signal an error.\n
:EXAMPLE\n\n\(mon-plist-keys \(mon-alphabet-as-type 'plistD->num\)\)\n
\(let \(\(chk-rtn \(mon-alphabet-as-plistD->num\)\)
      rtn\)
  \(push `\(#::plist-orig ,chk-rtn\) rtn\)
  \(push `\(#::plist-keys ,\(mon-plist-keys chk-rtn\)\) rtn\)
  \(push `\(#::plist-values ,\(mon-plist-values chk-rtn\)\) rtn\)\)\n
\(mon-plist-values-TEST\)\n
;; Follwing fail successfully:\n
\(mon-plist-values \(nconc \(mon-alphabet-as-plistD->num\) '\(a\)\)\)\n
\(mon-plist-values \(nconc \(mon-alphabet-as-plistD->num\) 'a\)\)\n
:SEE-ALSO `mon-plist-keys', `mon-plist-remove', `mon-help-plist-functions',
`mon-map-obarray-symbol-plist-props', `mon-plist-remove-if',
`mon-plist-remove-consing', `remf', `remprop', `mon-plist-values-TEST'.\n▶▶▶"
  (if (and (or (mon-list-proper-p in-plist)
               (error (concat ":FUNCTION `mon-plist-values' "
                              "-- arg IN-PLIST not `mon-list-proper-p', got: %S type-of: %S")
                      in-plist (type-of in-plist)))
           (or (zerop (% (length in-plist) 2))
               (error (concat ":FUNCTION `mon-plist-values' "
                              "-- arg IN-PLIST length not `evenp', got-length: %d ")
                      (length in-plist)))
           (null in-plist))
      in-plist
    (let ((cpy-w-pl (copy-sequence in-plist))
          gthr-keys)
      (while cpy-w-pl
        (push (pop (cdr cpy-w-pl)) gthr-keys)
        (setq cpy-w-pl (cdr cpy-w-pl)))
      (setq gthr-keys (nreverse gthr-keys)))))
;;
;;; :TEST-ME (mon-plist-values-TEST)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-01-16T17:19:31-05:00Z}#{10026} - by MON KEY>
(defun mon-plist-remove! (pl-sym property-indicator)
  "Remove from PL-SYM's plist the PROPERTY-INDICATOR and its value.\n
Like CL's `cl-remprop' and Common Lisp's `remprop' but without the latter's
`remf'.\n
:EXAMPLE\n\n\(let \(the-pl\) 
  \(setplist the-pl \(mon-alphabet-as-type 'plistD->num\)\)
  \(dolist \(p-rmv 
            \(subseq 
             \(mapcar 'car \(mon-alphabet-as-type 'cons-keyD->num\)\)
             0 8\)
           \(pl-sym-plist the-pl\)\)
    \(mon-plist-remove! the-pl p-rmv\)\)\)\n
:SEE-ALSO `mon-plist-remove-if',`mon-plist-keys', `mon-plist-remove-consing',
`remf', `remprop', `mon-remove-if-not', `mon-delete-if', `mon-member-if'
`mon-help-plist-functions'.\n▶▶▶"
  (let* ((CLDOREMF #'(lambda  (mpr-L1-plst mpr-L1-tag)
                       (let ((mpr-L1-lcl-plst (cdr mpr-L1-plst)))
                         (while (and (cdr mpr-L1-lcl-plst) (not (eq (car (cdr mpr-L1-lcl-plst)) mpr-L1-tag))) 
                           (setq mpr-L1-lcl-plst (cdr (cdr mpr-L1-lcl-plst))))
                         (and (cdr mpr-L1-lcl-plst)
                              (progn 
                                (setcdr mpr-L1-lcl-plst (cdr (cdr (cdr mpr-L1-lcl-plst))))
                                t)))))
         (CLREMPROP #'(lambda (mpr-L2-sym mpr-L2-tag)
                        (let ((mpr-L2-lcl-plst (symbol-plist mpr-L2-sym)))
                          (if (and mpr-L2-lcl-plst (eq mpr-L2-tag (car mpr-L2-lcl-plst)))
                              (progn (setplist mpr-L2-sym (cdr (cdr mpr-L2-lcl-plst))) t)
                            (funcall CLDOREMF mpr-L2-lcl-plst mpr-L2-tag))))))
    (funcall CLREMPROP pl-sym property-indicator)))
;;    
;;;
;;; (let ((tt (make-symbol "tt")))
;;;   (setplist tt (mon-alphabet-as-type 'plistD->num))
;;;   (mon-plist-remove! tt :l)  
;;;   (symbol-plist tt))
;;
;;; :TEST-ME 
;;; (let (the-pl) 
;;;   (setplist the-pl (mon-alphabet-as-type 'plistD->num))
;;;   (dolist (p-rmv 
;;;             (subseq 
;;;              (mapcar 'car (mon-alphabet-as-type 'cons-keyD->num))
;;;              0 8)
;;;            (symbol-plist the-pl))
;;;     (mon-plist-remove! the-pl p-rmv)))


;;; ==============================
;;; :COURTESY Pascal J. Bourguignon :HIS pjb-utilities.el :WAS `plist-remove'
;;; :CREATED <Timestamp: #{2010-01-16T16:55:29-05:00Z}#{10026} - by MON KEY>
(defun mon-plist-remove-consing (rmv-in-plist but-key)
  "Return a new rmv-in-plist with the each element of RMV-IN-PLIST but BUT-KEY.
:NOTE A suffix in result may be a suffix of RMV-IN-PLIST too.\n
:EXAMPLE\n\n(mon-plist-remove-consing (mon-alphabet-as-type 'plistD->num) :l)\n
:SEE-ALSO `mon-plist-remove!', `mon-plist-remove-if',
`mon-plist-remove-consing', `remf', `remprop', `mon-plist-keys',
`mon-remove-if-not', `mon-delete-if', `mon-member-if',
`mon-help-plist-functions', `mon-help-plist-properties'.\n▶▶▶"
  (if (eq (car rmv-in-plist) but-key)
      (cdr (cdr rmv-in-plist))
    (cons (car rmv-in-plist) 
          (cons (cadr rmv-in-plist) 
                (mon-plist-remove-consing (cddr rmv-in-plist) but-key)))))
;;
;;; :TEST-ME (mon-plist-remove-consing (mon-alphabet-as-type 'plistD->num) :l)


;;; ==============================
;;; :PREFIX "mpri-"
;;; :NOTE Inspired by Pascal Bourguignon's Common Lisp implementation of 
;;; `PLIST-REMOVE' above. Following doesn't call `remf' and handles predicates.
;;; :CREATED <Timestamp: #{2010-01-13T15:41:30-05:00Z}#{10023} - by MON KEY>
(defun mon-plist-remove-if (plist prop &optional plist-pred with-debug)
  "Return PLIST with PROP removed.\n
By default comparison for PROP is made `eq' as it is with CL's `remprop'.\n
When optional arg PLIST-PRED is either `eql' or `equal' the plist property
comparison is made with that predicate and `memql' or `member' counterparts.\n
If optional arg WITH-DEBUG is non-nil output as with `message' when 
return value is `equal' the initial arg given for PLIST.\n
:EXAMPLE\n\n\(mon-plist-remove-if  
 \(mon-plist-remove-if 
  \(mon-plist-remove-if \(mon-alphabet-as-type 'plistD->num\) :f\)
  :a 'eql\)
 :c 'equal\)\n
\(mon-plist-remove-if '\(this list-a that listb\) 'that\)\n
\(mon-plist-remove-if '\(this list-a that listb\) 'this 'eql\)\n
\(mon-plist-remove-if '\(this list-a that listb\) 'nope\)\n
\(mon-plist-remove-if '\(this list-a that listb\) 'nope 'eql t\)\n
\(mon-plist-remove-if '\(this list-a that listb\) \"this\"\)\n
\(mon-plist-remove-if '\(\"this\" list-a \"that\" list-b\) \"this\"\)\n
\(mon-plist-remove-if '\(\"this\" list-a \"that\" list-b\) \"this\" nil t\)\n
\(mon-plist-remove-if '\(\"this\" list-a \"that\" list-b\) \"this\" 'equal\)\n
\(mon-plist-remove-if '\(\"this\" list-a \"that\" list-b\) \"this\" 'eql t\)\n
:SEE-ALSO `mon-plist-remove!', `mon-plist-remove-consing', `mon-plist-keys',
`remf', `remprop', `mon-remove-if-not', `mon-delete-if', `mon-member-if',
`mon-help-plist-functions', `mon-help-plist-properties'.\n▶▶▶"
   (let* ((pl plist)
          (pred
           (if plist-pred 
               (cond ((eq plist-pred 'eql) `((memql prop pl)  (eql pl prop)))
                     ((eq plist-pred 'equal) `((member prop pl)  (equal pl prop)))
                     (t `((memq prop pl)  (eq pl prop))))
               `((memq prop pl)  (eq pl prop))))
          (idx  (eval (car pred)))
          nw)
     (if (and idx (funcall (caadr pred) (car idx) (car pl))) ;;(eval `(,(caadr pred) (car idx) (car pl))))
         (if (> (length pl) 2)
             (progn
               (dotimes (l 2 pl) (pop pl))
               (setq nw pl))
             nw)
         (if idx
             (progn
               (dotimes (i 2) (pop idx))
               (while pl 
                 (funcall #'(lambda (p)
                              (if (eval (cadr pred))
                                  ;;(funcall (caadr pred) (cadadr pred) (car (cddadr pred)))
                                  ;;(eval `(,(caadr pred) ,(cadadr pred) ,(car (cddadr pred))))
                                  (setq pl nil)
                                (push p nw))) 
                          (pop pl)))
               ;;(setq nw (nconc (nreverse nw) idx)))
               (setq nw (nconc idx nw))) ;;(nreverse nw))))
           (setq nw pl))) ;;(error "%S is not a property in %S" prop plist)
     (if (equal pl nw)
         (progn
           ;; (when (or with-debug (eq (caadr pred) 'eq))
           (when with-debug ;;(eq (caadr pred) 'eq))
             (message "%S `equal' original PLIST when using PLIST-PRED predicates `%s' and `%s'" 
                      plist (caadr pred) (caar pred)))
           nw)
         nw)))
;;
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) "this")
;;; :TEST-ME (mon-plist-remove-if '("this" list-a "that" list-b) "this")
;;; :TEST-ME (mon-plist-remove-if '("this" list-a "that" list-b) "this" nil t)
;;; :TEST-ME (mon-plist-remove-if '("this" list-a "that" list-b) "this" 'equal)
;;; :TEST-ME (mon-plist-remove-if '("this" list-a "that" list-b) "this" 'eql t)
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) 'this)
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) 'this 'eql)
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) 'nope 'eql t)
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) 'this 'eql)
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) 'nope)
;;; :TEST-ME (mon-plist-remove-if '(this list-a that listb) 'that)
;;; :TEST-ME (mon-plist-remove-if (mon-alphabet-as-type 'plistD->num) :l)
;;; :TEST-ME (mon-plist-remove-if 
;;;           (mon-plist-remove-if 
;;;            (mon-plist-remove-if (mon-alphabet-as-type 'plistD->num) :l 'equal) 
;;;            :a 'eql)
;;;           :t 'equal)


;;; ==============================
;;; :COURTESY Pascal J. Bourguignon 
;;; :HIS common-lisp/list.lisp :VERSION 2008-06-24 :WAS `PLIST-REMOVE'
;;; :NOTE I lifted this one from a Common Lisp file without realizing it would
;;; cause problems w/ Emacs lisp b/c `remf' is a macro intended for plists as
;;; generalized variable. Emacs compiler nags b/c `remf' calls `cl-do-remf' at
;;; runtime. As such, we have commented this one out, however, we leave it here
;;; as a reminder to be on the watch for the demons of hubris... Who in their
;;; right mind is shadowing the symbol `cl-do-remf'?  Come on, enough already,
;;; these types of compiler 'Warnings' don't protect the user's namespace!!!!
;;; :CREATED <Timestamp: #{2009-09-28T17:32:55-04:00Z}#{09401} - by MON>
;;
;; (defun mon-plist-remf (plist prop)
;;   "Return PLIST with PROP removed using `remf'.\n
;; :EXAMPLE (mon-plist-remf \(mon-alphabet-as-type 'plistD->num\) :l)
;; :SEE-ALSO `mon-plist-remove', `mon-plist-keys'.\n▶▶▶"
;;   (remf plist prop) plist)
;;
;;; :TEST-ME (mon-plist-remf (mon-alphabet-as-type 'plistD->num) :l)

;;; ==============================
(provide 'mon-plist-utils)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; coding: utf-8
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ====================================================================
;;; mon-plist-utils.el ends here
;;; EOF

