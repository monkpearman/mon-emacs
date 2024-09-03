;;; mon-alphabet-list-utils.el --- return alphabetic sequences in various formats
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2010-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-alphabet-list-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2010-11-05T14:50:52-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: lisp, tools, data, development, 

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-alphabet-list-utils.el provides functions that return alphabetic sequences
;; in variaous formats, plists, alists, lists of strings, conses, etc.
;;
;; FUNCTIONS:▶▶▶
;; `mon-alphabet-as-type', `mon-alphabet-as-bc', `mon-alphabet-as-map-bc',
;; `mon-alphabet-as-doc-loadtime', `mon-alphabet-as-map-fun-prop',
;; `mon-alphabet-as-unintern-fun', `mon-alphabet-as-cons-keyU->num',
;; `mon-alphabet-as-cons-keyD->num', `mon-alphabet-as-cons-symU->num',
;; `mon-alphabet-as-cons-symD->num', `mon-alphabet-as-cons-stringU->num',
;; `mon-alphabet-as-cons-stringD->num', `mon-alphabet-as-cons-keyU->stringU',
;; `mon-alphabet-as-cons-keyD->stringD', `mon-alphabet-as-plistU->stringU',
;; `mon-alphabet-as-plistD->stringD', `mon-alphabet-as-plistU->num',
;; `mon-alphabet-as-plistD->num', `mon-alphabet-as-list-stringU',
;; `mon-alphabet-as-list-stringD', `mon-alphabet-as-list-symbolU',
;; `mon-alphabet-as-list-symbolD', `mon-alphabet-as-stringU-w-nl',
;; `mon-alphabet-as-stringD-w-nl', `mon-alphabet-as-stringU-w-spc',
;; `mon-alphabet-as-stringD-w-spc', `mon-string-alpha-list'
;;
;; FUNCTIONS:◀◀◀
;;
;; MACROS:
;; `mon-alphabet-as-defun',
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
;; `*mon-alphabet-as-type-generate*',
;;
;; GROUPS:
;; `mon-alphabet-list'
;;
;; ALIASED/ADVISED/SUBST'D:
;; `mon-make-list-alphabet'          -> `mon-alphabet-as-type'
;;
;; DEPRECATED:
;;
;; RENAMED:
;;
;; MOVED:
;; `*mon-alphabet-as-type-generate*'    <- mon-utils.el
;; `mon-alphabet-as-type'               <- mon-utils.el
;; `mon-alphabet-as-defun'              <- mon-utils.el
;; `mon-alphabet-as-bc'                 <- mon-utils.el 
;; `mon-alphabet-as-map-bc'             <- mon-utils.el
;; `mon-alphabet-as-doc-loadtime'       <- mon-utils.el
;; `mon-alphabet-as-map-fun-prop'       <- mon-utils.el
;; `mon-alphabet-as-unintern-fun'       <- mon-utils.el
;; `mon-alphabet-as-cons-keyU->num'     <- mon-utils.el
;; `mon-alphabet-as-cons-keyD->num'     <- mon-utils.el
;; `mon-alphabet-as-cons-symU->num'     <- mon-utils.el
;; `mon-alphabet-as-cons-symD->num'     <- mon-utils.el
;; `mon-alphabet-as-cons-stringU->num'  <- mon-utils.el
;; `mon-alphabet-as-cons-stringD->num'  <- mon-utils.el
;; `mon-alphabet-as-cons-keyU->stringU' <- mon-utils.el
;; `mon-alphabet-as-cons-keyD->stringD' <- mon-utils.el
;; `mon-alphabet-as-plistU->stringU'    <- mon-utils.el
;; `mon-alphabet-as-plistD->stringD'    <- mon-utils.el
;; `mon-alphabet-as-plistU->num'        <- mon-utils.el
;; `mon-alphabet-as-plistD->num'        <- mon-utils.el
;; `mon-alphabet-as-list-stringU'       <- mon-utils.el 
;; `mon-alphabet-as-list-stringD'       <- mon-utils.el
;; `mon-alphabet-as-list-symbolU'       <- mon-utils.el
;; `mon-alphabet-as-list-symbolD'       <- mon-utils.el
;; `mon-alphabet-as-stringU-w-nl'       <- mon-utils.el  
;; `mon-alphabet-as-stringD-w-nl'       <- mon-utils.el
;; `mon-alphabet-as-stringU-w-spc'      <- mon-utils.el
;; `mon-alphabet-as-stringD-w-spc'      <- mon-utils.el
;; `mon-string-alpha-list'              <- mon-utils.el
;;
;; TODO:
;;
;; NOTES:
;; Most functions dynamically byte-compiled and loaded and documented at loadtime via 
;; `mon-alphabet-as-defun', `mon-alphabet-as-bc', `mon-alphabet-as-map-bc',
;; `mon-alphabet-as-doc-loadtime', and `mon-alphabet-as-map-fun-prop'.
;; They can be unloaded and uninterned with `mon-alphabet-as-unintern-fun'.
;;
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; THIRD-PARTY-CODE:
;;
;; URL: https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-alphabet-list-utils.el
;;
;; FIRST-PUBLISHED:
;;
;; FILE-CREATED:
;; <Timestamp: #{2010-11-05T14:50:52-04:00Z}#{10445} - by MON KEY>
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

(eval-when-compile (require 'cl-lib))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-11-05T15:36:19-04:00Z}#{10445} - by MON KEY>
;; (defgroup mon-alphabet-list nil
;;   "Configure which `mon-alphabet-as-*' functions are compiled and loaded.\n
;; :SEE-ALSO .\n▶▶▶"
;;   :prefix "mon-alphabet-as-"
;;   :link '(url-link 
;;           :tag ":EMACSWIKI-FILE" "http://www.emacswiki.org/emacs/mon-alphabet-utils.el")
;;   :link '(emacs-library-link "mon-alphabet-list-utils.el")
;;   :group 'mon-base)

;;; ==============================
;;; (defcustom *mon-alphabet-as-type-generate*  
;; '("plistU->stringU" "plistD->stringD" "plistU->num" "plistD->num"
;;   "cons-keyU->stringU" "cons-keyD->stringD" "cons-keyU->num"
;;   "cons-keyD->num" "cons-symU->num" "cons-symD->num" "cons-stringU->num"
;;   "cons-stringD->num" "list-stringD" "list-stringU" "list-symbolU"
;;   "list-symbolD" "stringU-w-spc" "stringU-w-nl" "stringD-w-spc"
;;   "stringD-w-nl")
;; ""
;; :type '(repeat (choice {...} )
;; :group mon-alphabet-list)


;;; ==============================
;;; :TODO Convert this to a defcustom so users can select which of the functions
;;; they wish to have generated at loadtime. But, this would mean they can't be used
;;; in calling functions...
;;; :CREATED <Timestamp: #{2010-09-09T17:01:53-04:00Z}#{10364} - by MON>
(defvar *mon-alphabet-as-type-generate* nil
  "*List of strings each an arg to `mon-alphabet-as-type'.\n
Used to genrate `mon-alphabet-as-*' functions at loadtime.\n
When elements of list have an associated byte-compiled funtion generated at
loadtime with `mon-alphabet-as-bc' and `mon-alphabet-as-doc-loadtime' the
functions symbol-name will appear on the plist property `is-bytcomp`.\n
:EXAMPLE\n\n\(apropos-describe-plist '*mon-alphabet-as-type-generate*\)\n
\(get '*mon-alphabet-as-type-generate* 'is-bytcomp\)\n
:NOTE Elements of the plist value may be `unintern' and `fmakunbound'd
by evaluating `mon-alphabet-as-unintern-fun'\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶")
;;
(unless (and (intern-soft "*mon-alphabet-as-type-generate*" obarray)
             (bound-and-true-p *mon-alphabet-as-type-generate*))
  (setq *mon-alphabet-as-type-generate*
        '("plistU->stringU" "plistD->stringD" "plistU->num" "plistD->num"
          "cons-keyU->stringU" "cons-keyD->stringD" "cons-keyU->num"
          "cons-keyD->num" "cons-symU->num" "cons-symD->num" "cons-stringU->num"
          "cons-stringD->num" "list-stringD" "list-stringU" "list-symbolU"
          "list-symbolD" "stringU-w-spc" "stringU-w-nl" "stringD-w-spc"
          "stringD-w-nl")))

;;; ==============================
;;; :PREFIX "maat-"
;;; :TODO Add accessors/defaliases for some of these. To
;;; :CREATED <Timestamp: #{2010-01-12T17:06:34-05:00Z}#{10022} - by MON>
(defun mon-alphabet-as-type (type)      ; up down)
  "Reutrn an alpabetized sequence of TYPE.\n
Possible args for TYPE are:\n
 :UPCASE-VERSION       :DOWNCASE-VERSION
 `cons-keyU->num'      `cons-keyD->num'
 `cons-keyU->stringU'  `cons-keyD->stringD'
 `cons-symU->num'      `cons-symD->num'
 `cons-stringU->num'   `cons-stringD->num'
 `plistU->stringU'     `plistD->stringD'
 `plistU->num'         `plistD->num'
 `list-stringU'        `list-stringD'
 `list-symbolU'        `list-symbolD'
 `stringU-w-spc'       `stringD-w-spc'
 `stringU-w-nl'        `stringD-w-nl'\n
:EXAMPLE\n
\(mon-alphabet-as-type 'cons-keyU->num\)\n\(mon-alphabet-as-type 'cons-keyD->num\)
\(mon-alphabet-as-type 'cons-keyU->stringU\)\n\(mon-alphabet-as-type 'cons-keyD->stringD\)
\(mon-alphabet-as-type 'cons-symU->num\)\n\(mon-alphabet-as-type 'cons-symD->num\)
\(mon-alphabet-as-type 'cons-stringU->num\)\n\(mon-alphabet-as-type 'cons-stringD->num\)
\(mon-alphabet-as-type 'plistU->stringU\)\n\(mon-alphabet-as-type 'plistD->stringD\)
\(mon-alphabet-as-type 'plistU->num\)\n\(mon-alphabet-as-type 'plistD->num\)
\(mon-alphabet-as-type 'list-stringU\)\n\(mon-alphabet-as-type 'list-stringD\)
\(mon-alphabet-as-type 'list-symbolU\)\n\(mon-alphabet-as-type 'list-symbolD\)
\(mon-alphabet-as-type 'stringU-w-nl\)\n\(mon-alphabet-as-type 'stringD-w-nl\)
\(mon-alphabet-as-type 'stringU-w-spc\)\n\(mon-alphabet-as-type 'stringD-w-spc\)\n
:NOTE This procedure isn't necessarily efficient but it does have the benefit
of being entirely self contained, and therefor does not rely on external calls.\n
:ALIASED-BY `mon-make-list-alphabet'\n
:SEE-ALSO `mon-alphabet-as-cons-keyU->num', `mon-alphabet-as-cons-keyD->num',
`mon-alphabet-as-cons-symU->num', `mon-alphabet-as-cons-symD->num',
`mon-alphabet-as-cons-stringU->num', `mon-alphabet-as-cons-stringD->num',
`mon-alphabet-as-cons-keyU->stringU', `mon-alphabet-as-cons-keyD->stringD',
`mon-alphabet-as-plistU->stringU', `mon-alphabet-as-plistD->stringD',
`mon-alphabet-as-plistU->num', `mon-alphabet-as-plistD->num',
`mon-alphabet-as-list-stringU', `mon-alphabet-as-list-stringD',
`mon-alphabet-as-list-symbolU', `mon-alphabet-as-list-symbolD',
`mon-alphabet-as-stringU-w-nl', `mon-alphabet-as-stringD-w-nl',
`mon-alphabet-as-stringU-w-spc', `mon-alphabet-as-stringD-w-spc',
`mon-alphabet-as-bc', `mon-alphabet-as-defun', `mon-alphabet-as-doc-loadtime',
`mon-alphabet-as-unintern-fun', `mon-alphabet-as-map-fun-prop',
`*mon-alphabet-as-type-generate*', `mon-string-to-symbol',
`mon-symbol-to-string', `mon-string-alpha-list', `mon-is-alphanum',
`mon-is-letter', `mon-is-digit', `mon-is-alphanum-simp', `mon-is-letter-simp',
`mon-is-digit-simp', `mon-string-ify-list', `mon-string-chop-spaces',
`mon-string-replace-char', `mon-string-from-sequence',
`mon-string-to-sequence'.\n▶▶▶"
  (let ((maat-alph '(?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L 
                        ?M ?N ?O ?P ?Q ?R ?S ?T ?U ?V ?W ?X ?Y ?Z))
        (maat-tycon #'(lambda (maat-L-0)
                   (mon-alphabet-as-type maat-L-0)))
        (maat-ns26 (number-sequence 1 26))
        (maat-abet))
    (cl-case type 
      (plistU->stringU 
       (while maat-alph 
         (funcall #'(lambda (maat-L-1)
                      (let ((maat-L-1-s (funcall 'string maat-L-1)))
                        (push (read (upcase (concat ":" maat-L-1-s))) maat-abet)
                        (push (upcase maat-L-1-s) maat-abet)))
                  (pop maat-alph)))
       (setq maat-abet  (nreverse maat-abet)))
      (plistD->stringD 
       (let ((maat-psd (mapcar #'(lambda (maat-L-2) 
                                   (+ maat-L-2 32)) maat-alph)))
         (while maat-psd 
           (funcall #'(lambda (maat-L-3)                                    
                        (let ((maat-L-3-s (funcall 'string maat-L-3)))
                          (push (read (concat ":" maat-L-3-s)) maat-abet)
                          (push maat-L-3-s maat-abet)))
                    (pop maat-psd)))
         (setq maat-abet (nreverse maat-abet))))
      (plistU->num 
       (let ((maat-pln (funcall maat-tycon 'plistU->stringU)))
         (dotimes (maat-D-0 (length maat-pln) 
                            (setq maat-abet maat-pln))
           (when (eq (logand maat-D-0 1) 0)
             (plist-put maat-pln (elt maat-pln maat-D-0) 
                        (if (> maat-D-0 0) 
                            (1+ (/ maat-D-0 2)) 
                          (1+ maat-D-0)))))))
      (plistD->num
       (let ((maat-plnD (funcall maat-tycon 'plistD->stringD)))
         (dotimes (maat-D-1 (length maat-plnD) 
                            (setq maat-abet maat-plnD))
           (when (eq (logand maat-D-1 1) 0)
             (plist-put maat-plnD (elt maat-plnD maat-D-1)
                        (if (> maat-D-1 0)
                            (1+ (/ maat-D-1 2)) 
                          (1+ maat-D-1)))))))
      (cons-keyU->stringU 
       (let ((maat-plc (funcall maat-tycon 'plistU->stringU)))
         (while maat-plc
           (funcall #'(lambda (maat-L-4)
                        (push `(,maat-L-4 . ,(pop maat-plc)) maat-abet))
                    (pop maat-plc))))
       (setq maat-abet (nreverse maat-abet)))
      (cons-keyD->stringD 
       (let ((maat-kdsd (funcall maat-tycon 'cons-keyU->stringU)))
         (mapc #'(lambda (maat-L-5)
                   (let ((maat-mk-sml 
                          (char-to-string (+ (string-to-char (cdr maat-L-5)) 32))))
                     (setcar maat-L-5 (read (concat ":" maat-mk-sml)))
                     (setcdr maat-L-5 maat-mk-sml)))
               maat-kdsd)
         (setq maat-abet maat-kdsd)))
      (cons-keyU->num 
       (let ((maat-plc-1 (funcall maat-tycon 'plistU->num)))
         (while maat-plc-1
           (funcall #'(lambda (maat-L-6)
                        (push `(,maat-L-6 . ,(pop maat-plc-1)) maat-abet))
                    (pop maat-plc-1))))
       (setq maat-abet (nreverse maat-abet)))
      (cons-keyD->num 
       (let ((maat-plcD-1 (funcall maat-tycon 'plistD->num)))
         (while maat-plcD-1
           (funcall #'(lambda (maat-L-7)
                        (push `(,maat-L-7 . ,(pop maat-plcD-1)) maat-abet))
                    (pop maat-plcD-1))))
       (setq maat-abet (nreverse maat-abet)))
      (cons-symU->num 
       (let (maat-cc-0)
         (cl-do ((maat-i-0 (funcall maat-tycon 'list-symbolU) (setq maat-i-0 (cdr maat-i-0)))
              (maat-j-0 maat-ns26 (setq maat-j-0 (cdr maat-j-0))))
             ((null maat-i-0) (setq maat-cc-0 (nreverse maat-cc-0)))
           (push `(,(car maat-i-0) . ,(car maat-j-0)) maat-cc-0))))
      (cons-symD->num 
       (let (maat-cc-1)      
         (cl-do ((maat-i-1 (funcall maat-tycon 'list-symbolD) (setq maat-i-1 (cdr maat-i-1)))
              (maat-j-1 maat-ns26 (setq maat-j-1 (cdr maat-j-1))))
             ((null maat-i-1) (setq maat-cc-1 (nreverse maat-cc-1)))
           (push `(,(car maat-i-1) . ,(car maat-j-1)) maat-cc-1))))
      (cons-stringU->num
       (let (maat-cc-2)
         (cl-do ((maat-i-2 (funcall maat-tycon 'list-stringU) (setq maat-i-2 (cdr maat-i-2)))
              (maat-j-2 maat-ns26 (setq maat-j-2 (cdr maat-j-2))))
             ((null maat-i-2) (setq maat-cc-2 (nreverse maat-cc-2)))
           (push `(,(car maat-i-2) . ,(car maat-j-2)) maat-cc-2))))
      (cons-stringD->num
       (let (maat-cc-3)
         (cl-do ((maat-i-3 (funcall maat-tycon 'list-stringD) (setq maat-i-3 (cdr maat-i-3)))
              (maat-j-3 maat-ns26 (setq maat-j-3 (cdr maat-j-3))))
             ((null maat-i-3) (setq maat-cc-3 (nreverse maat-cc-3)))
           (push `(,(car maat-i-3) . ,(car maat-j-3)) maat-cc-3))))
      (list-stringD 
       (setq maat-abet (mapcar #'cdr (funcall maat-tycon 'cons-keyD->stringD))))
      (list-stringU 
       (setq maat-abet (mapcar #'cdr (funcall maat-tycon 'cons-keyU->stringU))))
      (list-symbolU 
       (let ((maat-obu (make-vector 26 nil))
             (maat-lsu (funcall maat-tycon 'list-stringU)))
         (while maat-lsu 
           (push (intern (pop maat-lsu) maat-obu) maat-abet))
         (setq maat-abet (nreverse maat-abet))))
      (list-symbolD 
       (let ((maat-obd (make-vector 26 nil))
             (poplsd (funcall maat-tycon 'list-stringD)))
         (while poplsd 
           (push (intern (pop poplsd) maat-obd) maat-abet))
         (setq maat-abet (nreverse maat-abet))))
      (stringU-w-spc 
       (mapconcat #'identity (funcall maat-tycon 'list-stringU) " "))
      (stringU-w-nl 
       (mapconcat #'identity (funcall maat-tycon 'list-stringU) "\n"))
      (stringD-w-spc 
       (mapconcat #'identity (funcall maat-tycon 'list-stringD) " "))
      (stringD-w-nl
       (mapconcat #'identity (funcall maat-tycon 'list-stringD) "\n")))))
;;
;;; :TEST-ME (mon-alphabet-as-type 'cons-keyU->num)
;;; :TEST-ME (mon-alphabet-as-type 'cons-keyD->num)
;;; :TEST-ME (mon-alphabet-as-type 'cons-symU->num)
;;; :TEST-ME (mon-alphabet-as-type 'cons-symD->num)
;;; :TEST-ME (mon-alphabet-as-type 'cons-stringU->num)
;;; :TEST-ME (mon-alphabet-as-type 'cons-stringD->num)
;;; :TEST-ME (mon-alphabet-as-type 'cons-keyU->stringU)
;;; :TEST-ME (mon-alphabet-as-type 'cons-keyD->stringD)
;;; :TEST-ME (mon-alphabet-as-type 'plistU->stringU)
;;; :TEST-ME (mon-alphabet-as-type 'plistD->stringD)
;;; :TEST-ME (mon-alphabet-as-type 'plistU->num)
;;; :TEST-ME (mon-alphabet-as-type 'plistD->num)
;;; :TEST-ME (mon-alphabet-as-type 'list-stringU)
;;; :TEST-ME (mon-alphabet-as-type 'list-stringD)
;;; :TEST-ME (mon-alphabet-as-type 'list-symbolU)
;;; :TEST-ME (mon-alphabet-as-type 'list-symbolD)
;;; :TEST-ME (mon-alphabet-as-type 'stringU-w-nl)
;;; :TEST-ME (mon-alphabet-as-type 'stringD-w-nl)
;;; :TEST-ME (mon-alphabet-as-type 'stringU-w-spc)
;;; :TEST-ME (mon-alphabet-as-type 'stringD-w-spc)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-09T15:13:12-04:00Z}#{10364} - by MON>
(defmacro mon-alphabet-as-defun (as-fun-type)
  "Return a defun form with AS-FUN-TYPE as arg to `mon-alphabet-as-type'.\n
:EXAMPLE\n\n\(pp-macroexpand-expression 
               '\(mon-alphabet-as-defun \"cons-keyU->num\"\)\)\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-unintern-fun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶"
  (let ((as-fun (make-symbol "as-fun")) 
        (as-typ (make-symbol "as-typ")))
    `(let ((,as-fun  (intern (symbol-name 
                              (make-symbol 
                               (concat "mon-alphabet-as-" ,as-fun-type)))))
           (,as-typ  (intern ,as-fun-type)))
       (list ,as-fun
             `(defalias ',,as-fun #'(lambda () () 
                                      (mon-alphabet-as-type ',,as-typ)))))))
;;
;;; (put 'mon-alphabet-as-defun 'lisp-indent-function <INT>) 

;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-09T16:03:01-04:00Z}#{10364} - by MON>
(defun mon-alphabet-as-bc (fun-name)
  "Byte compile FUN-NAME defun form returned by `mon-alphabet-as-defun'.\n
FUN-NAME \(a string\) is an arg to `mon-alphabet-as-type'.\n
Return a cons with the format:\n
 \( <SYMBOL> . FUN-NAME \)\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-unintern-fun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶"
  (let ((maac (mon-alphabet-as-defun fun-name)))
    (eval (cadr maac))
    (byte-compile (car maac))
    (when (byte-code-function-p (indirect-function (car maac)))
      `(,(car maac) .  ,fun-name))))
;;
;;: :TEST-ME (mon-alphabet-as-bc "cons-keyU->num")
;;; :TEST-ME (indirect-function 'mon-alphabet-as-cons-keyU->num)
;;; :TEST-ME (byte-code-function-p (indirect-function 'mon-alphabet-as-cons-keyU->num))
;;
;; (progn (fmakunbound 'mon-alphabet-as-cons-keyU->num)
;;        (unintern 'mon-alphabet-as-cons-keyU->num) )

;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-11T13:33:28-04:00Z}#{10366} - by MON KEY>
(defun mon-alphabet-as-map-bc (fun-name-lst)
  "Map mon-alphabet-as-* args to generate byte-code-function's.\n
FUN-NAME-LST is list of strings, each an arg to `mon-alphabet-as-type'.\n
Elements of FUN-NAME-LST are passed as args to `mon-alphabet-as-bc' which
returns a cons on success.\n
Elements of return value have the form:\n
 \( <FUN-SYM-NAME> . <ARG-STR> \)\n
Where car is a symbol satisfisying the predicate `byte-code-function-p' and cdr
is the string arg element of FUN-NAME-LST evaluated to produce the byte-code
function.\n
:EXAMPLE\n\(mon-alphabet-as-map-bc '\(\"cons-keyD->num\" \"cons-keyU->num\"\)\)\n
;=> \(\(mon-alphabet-as-cons-keyD->num . \"cons-keyD->num\"\) 
      \(mon-alphabet-as-cons-keyU->num . \"cons-keyU->num\"\)\)\n
\(mon-alphabet-as-cons-keyD->num\)\n
\(indirect-function 'mon-alphabet-as-cons-keyD->num\)\n
\(mon-alphabet-as-cons-keyD->num\)\n
\(byte-code-function-p 
 \(indirect-function 'mon-alphabet-as-cons-keyD->num\)\)\n
\(progn 
  \(fmakunbound 'mon-alphabet-as-cons-keyD->num\)
  \(fmakunbound 'mon-alphabet-as-cons-keyU->num\)
  \(unintern 'mon-alphabet-as-cons-keyD->num\)
  \(unintern 'mon-alphabet-as-cons-keyU->num\)\)\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-unintern-fun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶"
  (let ((rtn-if-bcd (mapcar #'(lambda (fnl)
                                (mon-alphabet-as-bc fnl))
                            fun-name-lst)))
    rtn-if-bcd))
;;
;; ,---- :UNCOMMENT-BELOW-TO-TEST
;; |
;; | (mon-alphabet-as-map-bc '("cons-keyD->num" "cons-keyU->num"))
;; | 
;; | (mon-alphabet-as-cons-keyD->num)
;; | 
;; | (indirect-function 'mon-alphabet-as-cons-keyD->num)
;; | 
;; | (mon-alphabet-as-cons-keyD->num)
;; | 
;; | (byte-code-function-p 
;; |  (indirect-function 'mon-alphabet-as-cons-keyD->num))
;; | 
;; | (progn 
;; |   (fmakunbound 'mon-alphabet-as-cons-keyD->num)
;; |   (fmakunbound 'mon-alphabet-as-cons-keyU->num)
;; |   (unintern 'mon-alphabet-as-cons-keyD->num)
;; |   (unintern 'mon-alphabet-as-cons-keyU->num))
;; |
;; `----

;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-11T13:33:34-04:00Z}#{10366} - by MON KEY>
(defun mon-alphabet-as-doc-loadtime (sym-arg-cons &optional w-args-cons-rtn)
  "Put docstrings on mon-alphabet-as-type convenience functions at loadtime.\n
Message that function symbol is now byte-compiled and contains the property
`function-documentation`.\n
Arg SYM-ARG-CONS is a list of cons pairs as per return value of
`mon-alphabet-as-map-bc'.\n
When optionsl W-ARGS-CONS-RTN is non-nil return the SYM-ARG-CONS list.\n
Add function-documentation property to functions plist for following functions:
 `mon-alphabet-as-cons-keyU->num', `mon-alphabet-as-cons-keyD->num',
 `mon-alphabet-as-cons-symU->num', `mon-alphabet-as-cons-symD->num',
 `mon-alphabet-as-cons-stringU->num', `mon-alphabet-as-cons-stringD->num',
 `mon-alphabet-as-cons-keyU->stringU', `mon-alphabet-as-cons-keyD->stringD',
 `mon-alphabet-as-plistU->stringU', `mon-alphabet-as-plistD->stringD',
 `mon-alphabet-as-plistU->num', `mon-alphabet-as-plistD->num',
 `mon-alphabet-as-list-stringU', `mon-alphabet-as-list-stringD',
 `mon-alphabet-as-list-symbolU', `mon-alphabet-as-list-symbolD',
 `mon-alphabet-as-stringU-w-nl', `mon-alphabet-as-stringD-w-nl',
 `mon-alphabet-as-stringU-w-spc', `mon-alphabet-as-stringD-w-spc',\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-unintern-fun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶"
  (let* ((map-xrfs (mon-string-justify-left
                    (mapconcat #'identity
                               `(,":SEE-ALSO "
                                 ,@(mapcar #'(lambda (sac)
                                               (format "`%s'," (car sac)))
                                           sym-arg-cons))
                               " ") 
                    80))
         (maat-doc-tmplt 
          (mapconcat #'identity 
                     `("Convenience function for `mon-alphabet-as-type' with arg '%s.\n"
                       ":EXAMPLE\n\n\(%S\)\n"
                       ,map-xrfs
                       "`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-bc', `mon-alphabet-as-defun',"
                       "`mon-alphabet-as-unintern-fun', `mon-alphabet-as-map-fun-prop',"
                       "`*mon-alphabet-as-type-generate*', `mon-string-to-symbol',"
                       "`mon-symbol-to-string', `mon-string-alpha-list', `mon-is-alphanum',"
                       "`mon-is-letter', `mon-is-digit', `mon-is-alphanum-simp', `mon-is-letter-simp',"
                       "`mon-is-digit-simp', `mon-string-ify-list', `mon-string-chop-spaces',"
                       "`mon-string-replace-char', `mon-string-from-sequence',"
                       "`mon-string-to-sequence'.\n▶▶▶") "\n"))
         (ldtm-msg (concat ":FUNCTION `mon-set-mon-alphabet-as-doc-loadtime' "
                           "-- byte-compiled and documented `%s' at loadtime")))
    ;; :DEBUGGING    ;; map-xrfs))  ;; maat-doc-tmplt)) 
    (dolist (maat sym-arg-cons 
                  (progn (mon-alphabet-as-map-fun-prop sym-arg-cons)
                         (if w-args-cons-rtn sym-arg-cons
                           (mon-message :msg-spec'(":FUNCTION `mon-alphabet-as-doc-loadtime' "
                                                   "-- evaluated arg SYM-ARG-CONS list at loadtime")))))
      (unless (documentation-property (car maat) 'function-documentation)
        (message (format ldtm-msg (car maat)))
        (put (car maat) 'function-documentation 
             (format maat-doc-tmplt (upcase (cdr maat)) (car maat)))))))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-11T13:33:38-04:00Z}#{10366} - by MON KEY>
(defun mon-alphabet-as-map-fun-prop (prop-fun-lst)
  "Plist of functions generated with `*mon-alphabet-as-type-generate*'.\n
Put a list of functions on the property 'is-bytcomp. Property value is a list of
each function that was byte-compiled at loadtime using the arg strings on the
variable `*mon-alphabet-as-type-generate*' plist.\n
Used for symbol-> string lookup via intern-soft  if/when we want to unintern.\n
:EXAMPLE\n\n\(symbol-plist '*mon-alphabet-as-type-generate*\)\n
\(get '*mon-alphabet-as-type-generate* 'is-bytcomp\)\n
\(mapcar #'\(lambda \(intrd-p\)
            \(intern-soft intrd-p\)\)
        \(get '*mon-alphabet-as-type-generate* 'is-bytcomp\)\)\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-unintern-fun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶"
  (put '*mon-alphabet-as-type-generate* 'is-bytcomp 
       (mapcar #'(lambda (pfl) (symbol-name (car pfl)))
               prop-fun-lst)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-11T13:33:41-04:00Z}#{10366} - by MON KEY>
(defun mon-alphabet-as-unintern-fun (&optional funintern-lst)
  "Unintern `mon-alphabet-as-type' convenience functions.\n
Functions on the `*mon-alphabet-as-type-generate*'s plist property `is-bytcomp`
are `fmakunbound'd and `unintern'd.\n
FUNINTERN-LST is a list of strings and/or symbols naming functions present 
interned in the current Emacs environment. It has one of the form:\n
 \( <STR>* \) | \( <STR>+ <SYM>+ \) | \( <SYM>* \)\n
Where the first most form \(a list of strings\) is the preferred format.\n
:NOTE Elements of FUNINTERN-LST should name functions which satisfy
`byte-code-function-p', and should be present in the list returned as value of
`is-bytcomp` property, e.g.:\n
 \(get '*mon-alphabet-as-type-generate* 'is-bytcomp\)\n
:SEE-ALSO `mon-alphabet-as-bc', `mon-alphabet-as-defun',
`mon-alphabet-as-doc-loadtime', `mon-alphabet-as-unintern-fun',
`mon-alphabet-as-map-fun-prop', `*mon-alphabet-as-type-generate*'.\n▶▶▶"
  (let ((maatg (get '*mon-alphabet-as-type-generate* 'is-bytcomp)))
    (when (or (null maatg) (not (consp maatg)))
      (mon-format :w-fun #'error 
                  :w-spec '(":FUNCTION `mon-alphabet-as-unintern-fun' "
                            "-- `*mon-alphabet-as-type-generate*' plist property "
                            "`is-bytcomp` null or missing")))
    (when funintern-lst 
      (if (not (consp funintern-lst))
          (mon-format :w-fun #'error 
                      :w-spec '(":FUNCTION `mon-alphabet-as-unintern-fun' "
                                "-- arg FUNINTERN-LST does not satisfy `consp'"))
        (setq maatg (mapcar #'(lambda (fu-l) 
                                ;; `format' is so FUNINTERN-LST can contain symbols
                                ;; and/or strings e.g.:
                                ;; '(mon-alphabet-as-cons-keyD->num 
                                ;;   "mon-alphabet-as-cons-keyU->num")
                                (let ((fu-l-str (or (and (stringp fu-l) fu-l)
                                                    (format "%s" fu-l))))
                                  (when (member fu-l-str maatg)
                                    fu-l-str)))
                            funintern-lst))))
    (let (w-msg-fu-l)
      (dolist (un-maatg maatg
                        (when w-msg-fu-l
                          (let ((orig-pl (get '*mon-alphabet-as-type-generate* 'is-bytcomp)))
                            ;; Set a new property list `*mon-alphabet-as-type-generate*':
                            (dolist (pl-prp w-msg-fu-l
                                            (plist-put (symbol-plist '*mon-alphabet-as-type-generate*)
                                                       'is-bytcomp orig-pl))
                              (setq orig-pl (delete pl-prp orig-pl))))
                          (message (substring (concat ":FUNCTION `mon-alphabet-as-unintern-fun' "
                                              "-- uninterned functions: "
                                              (mapconcat #'(lambda (wmfl) (format "`%s'," wmfl))
                                                         (nreverse w-msg-fu-l) " ")) 0 -1))))
        (let ((is-um (intern-soft un-maatg obarray)))
          (when is-um
            (push  un-maatg  w-msg-fu-l)
            (fmakunbound is-um)
            ;(unintern is-um obarray)
            (unintern un-maatg obarray)))))))
;;
;; ,---- :UNCOMMENT-BELOW-TO-TEST
;; |
;; | (mon-alphabet-as-doc-loadtime (mon-alphabet-as-map-bc *mon-alphabet-as-type-generate*))
;; | 
;; | (mon-alphabet-as-unintern-fun
;; |   '("mon-alphabet-as-cons-keyD->num" "mon-alphabet-as-cons-keyU->num")) 
;; | 
;; | (mon-alphabet-as-unintern-fun
;; |  '(mon-alphabet-as-cons-keyD->num "mon-alphabet-as-cons-keyU->num")) 
;; | 
;; | (mon-alphabet-as-unintern-fun
;; |  '(mon-alphabet-as-cons-keyD->num mon-alphabet-as-cons-keyU->num))
;; | 
;; | (mon-alphabet-as-unintern-fun)
;; |
;; | (mon-alphabet-as-doc-loadtime (mon-alphabet-as-map-bc *mon-alphabet-as-type-generate*))
;; |
;; `----

;;; ==============================
;;; :PREFIX "msal-"
;;; :CREATED <Timestamp: Thursday June 25, 2009 @ 11:17.43 AM - by MON KEY>
(defun mon-string-alpha-list (from-letter to-letter &optional as-symb)
  "Return alphabetized list of ASCII character strings FROM-LETTER TO-LETTER.\n
If either FROM-LETTER or TO-LETTER is upper-cased return value will be uppercased.\n
When TO-LETTER comes before FROM-LETTER in a lexicographic sort the two args are
swapped; this check is exclusive of case check.\n
:EXAMPLE\n\n\(mon-string-alpha-list \"a\" \"f\"\)\n\n\(mon-string-alpha-list \"A\" \"F\"\)\n
\(mon-string-alpha-list \"l\" \"G\"\)\n\n\(mon-string-alpha-list \"g\" \"l\"\)\n
:NOTE Use this to get a list of symbols instead:\n
\(princ \(mon-string-alpha-list \"m\" \"r\"\)\)\n
:SEE-ALSO `mon-alphabet-as-type', `number-sequence', `mon-string-to-sequence', 
`mon-string-from-sequence',  `mon-is-alphanum', `mon-is-digit',
`mon-is-letter'.\n▶▶▶"
  (let ((msal-frm (string-to-char from-letter))
        (msal-to (string-to-char to-letter))
        msal-swp
        msal-rtn ;; doesn't appear to be used.
        )
    (cond ((and (and (>= msal-frm 65) (<= msal-frm 90))
                (and (>= msal-to 97) (<= msal-to 127)))
           (setq msal-to (- msal-to 32)))
          ((and (and (>= msal-to 65) (<= msal-to 90))
                (and (>= msal-frm 97) (<= msal-frm 127)))
           (setq msal-frm (- msal-frm 32))))
    (when (< msal-to msal-frm)
      (setq msal-swp msal-frm)
      (setq msal-frm msal-to)
      (setq msal-to msal-swp))
    (split-string (mon-string-from-sequence (number-sequence msal-frm msal-to)) "" t)))
;;
;; ,---- :UNCOMMENT-BELOW-TO-TEST
;; | (equal 
;; |  (mon-string-alpha-list "a" "z")
;; |  '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" 
;; |    "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))
;; | (equal 
;; |  (mon-string-alpha-list "A" "Z")
;; |  '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" 
;; |    "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"))
;; | (equal 
;; |  (mon-string-alpha-list "Z" "A")
;; |  '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" 
;; |    "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"))
;; | (equal 
;; |  (mon-string-alpha-list "z" "a")
;; |  '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" 
;; |    "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))
;; | (equal 
;; |  (mon-string-alpha-list "Z" "a")
;; |  '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" 
;; |    "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"))
;; | (equal 
;; |  (mon-string-alpha-list "a" "Z")
;; |  '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" 
;; |    "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"))
;; | (equal (mon-string-alpha-list "z" "Z") '("Z"))
;; | (equal (mon-string-alpha-list "A" "a") '("A"))
;; `----

;;; ==============================
(provide 'mon-alphabet-list-utils)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ====================================================================
;;; mon-alphabet-list-utils.el ends here
;;; EOF
