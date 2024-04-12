;;; mon-doc-help-utils-supplemental.el --- functions to bootstrap mon-doc-help-utils
;; -*- mode: EMACS-LISP; no-byte-compile: t -*-

;;; ================================================================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-doc-help-utils-supplemental.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-12-21T13:15:00-05:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: environment, local, extensions, help, doc, 

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-doc-help-utils-supplemental provides functions to bootstrap
;; mon-doc-help-utils.el
;;
;; This package, mon-doc-help-utils-supplemental.el may or may not be required
;; at loadtime to initialize mon-doc-help-utils but it should be present in
;; Emacs' load-path whenever using mon-doc-help-utils. It provides the specific
;; subfeatures required to bootstrap mon-doc-help-utils.  In order to load and
;; byte-compile mon-doc-help-utils a few subfeatures need to be present. If you
;; do not wish to load the full feauture set of the following packages list
;; below this package mon-doc-help-utils-supplemental.el trys to load only the
;; neccesary functions and variables from these packages:
;;
;; :FILE mon-insertion-utils.el 
;;       | -> `mon-insert-lisp-testme'
;;       | -> `mon-comment-divider'
;;
;; :FILE mon-regexp-symbols.el 
;;       | -> `*regexp-symbol-defs*'          
;;
;; :FILE mon-utils.el
;;       | -> `mon-string-index'      
;;       | -> `mon-string-upto-index' 
;;       | -> `mon-string-after-index'
;;       | -> `mon-string-justify-left'
;;
;; :FILE mon-cl-compat.el
;;       | -> `cl::subseq'
;;
;; :NOTE While mon-doc-help-utils-supplemental.el will provide the necessary
;; features in order to get mon-doc-help-utils bootstrapped wherever possible
;; MON encourages you to also use the above required packages in addition to the
;; supplemental. As such, where those packages are present, the supplemental
;; will not shadow any additional functionality extensions which they provide.
;;
;; That said, while each of the above packages provides useful and nice
;; facilities which extend the standard Emacs distribution you may not wish to
;; load all of them into your Emacs esp. as MON does not generally use autoload
;; cookies. MON routinely runs the entire suite of mon-*.el and naf-mode-*.el
;; packages as interpreted code with little performance impact and generally
;; unless your embedding Emacs loading lots of third party packages rarely
;; poses much concern on modern systems IOW use the following with impunity:
;; (require 'mon-superbig-package) 
;;
;; FUNCTIONS:▶▶▶
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
;; ALIASED/ADVISED/SUBST'D:
;;
;; DEPRECATED:
;;
;; RENAMED:
;;
;; MOVED:
;;
;; TODO:
;; Hopefully sometime in the near future the Emacs-devels will begin using the
;; bzr and Launchpad features of distributed version control to build a better
;; Emacs Lisp 'packaging' tool that can aid in some of this minor dependency
;; issues and this type of stuff won't be quite as big a problem (and instead
;; we'll all move to grokking DAGs with recursive dependency cycles). In the
;; interim MON is still using Mercurial. Contact MON for access to a stripped
;; hg archive of all MON's current Elisp source.
;;
;; NOTES:
;; The contents of this file used to be inlined within mon-doc-help-utils.el
;; However, as this mon-doc-help-utils has grown conisderably in size and
;; scope, it no longer makes sense to maintain what is essentially duplicate
;; code inside that file and it was extracted to this file on:
;; <Timestamp: #{2009-12-21T12:25:58-05:00Z}#{09521} - by MON>
;;
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; THIRD-PARTY-CODE:
;;
;; FIRST-PUBLISHED: <Timestamp: #{2009-12-21T21:20:06-05:00Z}#{09522} - by MON>
;;
;; FIRST-PUBLISHED <Timestamp: #{2010-01-09T01:03:52-05:00Z}#{10016} - by MON>
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-12-21T13:15:00-05:00Z}#{09521} - by MON>
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
;;; :NOTE `*mon-default-comment-divider*' <- mon-time-utils.el
;;; :LOAD-SPECIFIC-PROCEDURES :IF-NOT-FEATURE-P `mon-insertion-utils.el'
;;; `mon-comment-divider', `mon-insert-lisp-testme'
(unless (featurep 'mon-insertion-utils)
  (unless (fboundp 'mon-comment-divider)
;;; :MODIFICATIONS <Timestamp: #{2009-08-25T14:09:37-04:00Z}#{09352} - by MON KEY>
(defun mon-comment-divider (&optional not-insert intrp)
  "Insert default comment divider at point.
When called-interactively insert the following at point:\n
;;; ==============================\n
When NOT-INSERT is non-nil return comment divider as string.\n
:EXAMPLE\n\(mon-comment-divider t\)\n
:ALIASED-BY `comment-divider'.\n
:SEE-ALSO `*mon-default-comment-divider*' `mon-comment-divide->col',
`mon-comment-lisp-to-col' `mon-insert-php-comment-divider',
`mon-insert-lisp-stamp'.\n▶▶▶"
  (interactive "i\np")
  (let ((*mon-default-comment-divider* ;; bound in :FILE mon-time-utils.el
         (or (bound-and-true-p *mon-default-comment-divider*)
             ";;; ==============================")))
  (if (or (not not-insert) intrp)
      (insert *mon-default-comment-divider*)
      *mon-default-comment-divider*)))
;;
(unless (and (intern-soft "comment-divider") 
             (fboundp 'comment-divider))
  (defalias 'comment-divider 'mon-comment-divider))
;;
) ;; :CLOSE fboundp mon-comment-divider
;;
;;; :TEST-ME (mon-comment-divider t)
;;; :TEST-ME (mon-comment-divider)
;;; :TEST-ME (call-interactively 'mon-comment-divider)
;;
(unless ;(and (featurep 'mon-insertion-utils) 
    (fboundp 'mon-insert-lisp-testme) ;))
(defun mon-insert-lisp-testme (&optional search-func test-me-count insertp intrp)
  "Insert at point a newline and commented test-me string.\n
When non-nil SEARCH-FUNC will search backward for a function name and include it
in the test-me string.\n
When non-nil TEST-ME-COUNT insert test-me string N times. Default is 1\(one\).
When prefix arg TEST-ME-COUNT is non-nil inerts N number of ';;; :TEST-ME ' strings
and prompts y-or-n-p if we want to include the function name in insertions.
When INSERTP is non-nil insert the test-me string(s) in current buffer at point.
Use at the end of newly created elisp functions to provide example test cases.
Regexp held by global var `*regexp-symbol-defs*'.\n
:SEE-ALSO `mon-insert-doc-help-tail', `mon-help-regexp-symbol-defs-TEST',
`mon-insert-doc-help-tail', `mon-insert-lisp-stamp', `mon-insert-copyright',
`mon-insert-lisp-CL-file-template', `mon-comment-divider',
`mon-comment-divider-to-col-four', `mon-insert-lisp-evald'.\n▶▶▶"
  (interactive "i\np\ni\np")
  (let* ((get-func)
         (tmc (cond ((and intrp (> test-me-count 1))
                      (if ((lambda () ;; (yes-or-no-p "Search-function-name?: ")))
			     (yes-or-no-p (concat ":FUNCTION `' "
						  "-- search function name?: "))))
			  (progn (setq get-func t)   test-me-count)
			(progn (setq get-func nil)   test-me-count)))
                    ((not test-me-count) 1)
                    (t  test-me-count)))
         (func (if (or search-func get-func)
                   (save-excursion
                     ;; <Timestamp: #{2010-07-28T11:37:06-04:00Z}#{10303} - by MON KEY>
                     ;; :WAS (search-backward-regexp  *regexp-symbol-defs*)
                     (search-backward-regexp  *regexp-symbol-defs-big*)
                     (buffer-substring-no-properties (match-beginning 3) (match-end 3)))))
         (test-me-string (if (or search-func get-func)
                             (format ";;; :TEST-ME (%s )" func)
                           ";;; :TEST-ME "))
         (cnt tmc)
         (return-tms))
    (while (>= cnt 1)
      (setq return-tms (concat test-me-string "\n" return-tms))
      (setq cnt (1- cnt)))
    (if (or intrp insertp)
	(save-excursion
	  (when insertp (newline))
	  (when (not (bolp))(beginning-of-line))
	  (princ return-tms (current-buffer)))
      ;; else
      return-tms)))
) ;; :CLOSE fboundp mon-insert-lisp-testme
) ;; :CLOSE featurep mon-insertion-utils
;;
;;; ,---- :UNCOMMENT-TO-TEST
;;; | (defun some-function (&optional optional)
;;; | (defun some-function-22 (&optional optional)
;;; | (defun *some/-symbol:->name<-2* (somevar
;;; | (defmacro some-macro ()
;;; | (defmacro some-macro*:22 (&rest)
;;; | (defun *some/-symbol:->name<-2* (somevar
;;; | (defvar *some-var* 'var
;;; | (defun *some/-symbol:->name<-2* 'somevar
;;; `----
;;
;;; :TEST-ME (let ((find-def* *regexp-symbol-defs*)) (search-backward-regexp find-def*))
;;; 
;;
;;; :TEST-ME `(,(match-beginning 3) ,(match-end 3))
;;; :TEST-ME (match-sring 1) ;grp 1=>"(defun* some-func:name* ("
;;; :TEST-ME (match-sring 2) ;grp 2=>"(defun* "
;;; :TEST-ME (match-string 3) ;grp 3=>"some-macro*:22"
;;; :TEST-ME (match-sring 4) ;grp 4=>" ("
;;
;;
;;; :TEST-ME (mon-insert-lisp-testme)
;;; :TEST-ME (mon-insert-lisp-testme t 3 )
;;; :TEST-ME (mon-insert-lisp-testme nil 3)
;;; :TEST-ME (mon-insert-lisp-testme nil 3 t)
;;; :TEST-ME (mon-insert-lisp-testme t 3 t)
;;; :TEST-ME (mon-insert-lisp-testme t nil t)
;;; :TEST-ME (mon-insert-lisp-testme nil nil t)
;;; :TEST-ME (mon-insert-lisp-testme nil nil nil)
;;; :TEST-ME (mon-insert-lisp-testme nil 2 nil t)

;;; ==============================
;;; :LOAD-SPECIFIC-PROCEDURES :IF-NOT-FEATURE-P `mon-regexp-symbols.el'
;;; `*regexp-symbol-defs*', `mon-help-regexp-symbol-defs-TEST'
;; 
(unless (featurep 'mon-regexp-symbols)
  (unless (bound-and-true-p *regexp-symbol-defs*)
;;; :NOTE make sure this reflects current state of var. Changes with some frequency.
;;; :CREATED <Timestamp: 2009-08-03-W32-1T11:04:11-0400Z - by MON KEY>
(defvar *regexp-symbol-defs* nil
  "*Regexp to match special-operators, and forms that define symbols.\n
Match values include following symbols occuring at BOL prefixed by `(' and
followed by the symbol they define:\n
 `defun' `defun*' `defmacro' `defmacro*' `defsubst' `defsubst*'
 `defconst' `defvar'
 `defcustom' `defface' `deftheme'\n
:NOTE Tests can be run on this regexp with `mon-help-regexp-symbol-defs-TEST'.\n
:CALLED-BY `mon-insert-lisp-testme',`mon-insert-doc-help-tail'.\n
:NOTE The regexps of this var do not contain the format string:\n
 \"%s\\\\\(\\\\s-\\\\|$\\\\\)\"\n
As such, their usage is unlike those of the regexps in:
:FILE lisp/emacs-lisp/find-func.el e.g. the those from following variables:\n
 `find-function-regexp', `find-variable-regexp', `find-face-regexp',
 `find-function-space-re', `find-function-regexp-alist',\n
:SEE-ALSO `*regexp-symbol-defs-big*', `lisp-font-lock-keywords',
`lisp-font-lock-keywords-1', `lisp-font-lock-keywords-2',
`documentation-property', `byte-compile-output-docform', `lambda-list-keywords',
`subr-arity', `help-function-arglist', `help-add-fundoc-usage'.\n▶▶▶")
;;
(unless (bound-and-true-p *regexp-symbol-defs*)
  (setq *regexp-symbol-defs*
        (concat 
         ;; :FIXME Doesn't match on cases where the lambda list is on the next line.
         ;;...1..         
         "^\\((" ;;opening paren
         ;;grp 2 -> 
         ;; `defun' `defun*' `defmacro' `defmacro*' `defsubst' `defsubst*'
         ;; `defconst' `defvar' 
         ;; `defcustom' `defface' `deftheme'
         ;;..2................................................
         ;; :WAS
         "\\(def\\(?:c\\(?:onst\\|ustom\\)\\|face\\|macro\\*?\\|subst\\*?\\|theme\\|un\\*?\\|var\\)\\)"  
         ;;^2^^^^^^^^^....................     ;; :NOTE There is leading whitepspace here.
         ;; :WAS 
         " \\([A-Za-z0-9/><:*-]+\\)" ;; grp 3 -> *some/-symbol:->name<-2*
         ;;..4.......................
         "\\(\\( (\\)\\|\\( '\\)\\|\\( `\\)\\)\\) " ;;grp 4 -> ` (' or ` ''
         ;; "\\(\\( ([^()&\"]\\)\\| \\('\\|t\\|nil\\|\"\\|((\\|()\\|(&\\|`(\\)\\)\\)" ;grp4 5,6
         )))
) ;; :CLOSE BATP *regexp-symbol-defs*
;;
;;; :TEST-ME  *regexp-symbol-defs*
;;; :SEE-BELOW for-additional-tests-with `mon-help-regexp-symbol-defs-TEST'
;;
;;;(progn (makunbound '*regexp-symbol-defs*) (unintern '*regexp-symbol-defs*))
) ;; :CLOSE featurep mon-regexp-symbols

;;; ==============================
;;; :LOAD-SPECIFIC-PROCEDURES :IF-NOT-FEATURE-P `mon-utils.el'
;;; `mon-string-index', `mon-string-upto-index', `mon-string-after-index'
(unless (and (featurep 'mon-utils)
             (fboundp 'mon-string-index))
;;; :COURTESY Pascal J. Bourguignon :HIS pjb-strings.el :WAS `string-index'
(defun mon-string-index (string-to-idx needle &optional frompos)
  "Return the position in STRING of the beginning of first occurence of NEEDLE.\n
Return nil if needle is not found. NEEDLE is a char, number, or string.
When FROMPOS is non-nil begin search for needle from position. 
Default is to search from start of string.\n
:EXAMPLE\n\(mon-string-index \"string before ### string after\" \"###\"\)\n
:SEE-ALSO `mon-string-upto-index', `mon-string-after-index',
`mon-alphabet-as-type', `mon-string-position', `mon-string-has-suffix',
`mon-string-chop-spaces', `mon-string-replace-char'.\n▶▶▶"
  (string-match 
   (regexp-quote 
    (cond ((or (characterp needle) (numberp needle)) (format "%c" needle))
          ((stringp needle) needle)
          (t (error (concat ":FUNCTION `mon-string-index' "
                            "-- arg NEEDLE expecting number or string")))))
   string-to-idx frompos))
) ;; :CLOSE 1st foundp  mon-string-index
;;
(unless (and (featurep 'mon-utils)
             (fboundp 'mon-string-upto-index))
;;; :CREATED <Timestamp: #{2009-10-01T15:16:26-04:00Z}#{09404} - by MON KEY>
(defun mon-string-upto-index (in-string upto-string)
  "Return substring of IN-STRING UPTO-STRING.\n
The arg UPTO-STRING is a simple string. No regexps, chars, numbers, lists, etc.\n
:EXAMPLE\n\(mon-string-upto-index \"string before ### string after\" \"###\"\)\n  
:SEE-ALSO `mon-string-index', `mon-string-after-index'
`mon-string-position', `mon-string-has-suffix', `mon-string-chop-spaces',
`mon-string-replace-char'.\n▶▶▶"
  (substring in-string 0 (mon-string-index in-string upto-string)))
;;
) ;; :CLOSE 2nd fboundp mon-string-upto-index
;;
(unless (and (featurep 'mon-utils)
             (fboundp 'mon-string-after-index))
;;; :CREATED <Timestamp: #{2009-10-01T15:16:29-04:00Z}#{09404} - by MON KEY>
(defun mon-string-after-index (in-str after-str)
  "Return substring of IN-STR AFTER-STR.\n
AFTER-STR is a simple string. No regexps, chars, numbers, lists, etc.\n
:EXAMPLE\n\(mon-string-after-index \"string before ### string after\" \"###\"\)\n
:SEE-ALSO `mon-string-index', `mon-string-upto-index', `mon-string-position',
`mon-string-has-suffix', `mon-string-chop-spaces',
`mon-string-replace-char'.\n▶▶▶"
  (substring in-str (+ (mon-string-index in-str after-str) (length after-str))))
;;
) ;; :CLOSE 3rd foundp mon-string-after-index
;;
(unless (and (featurep 'mon-utils)
             (fboundp 'mon-string-justify-left))
;;; :COURTESY Pascal Bourguignon :HIS pjb-strings.el :WAS `string-justify-left'
;;; :CHANGESET 1738 <Timestamp: #{2010-05-17T08:57:22-04:00Z}#{10201} - by MON KEY>
;;; :MODIFICATIONS <Timestamp: #{2010-02-03T18:08:59-05:00Z}#{10053} - by MON KEY>
;;; :ADDED `save-match-data' for `split-string'
;;; :RENAMED LEFT-MARGIN arg -> lft-margin. `left-margin' is a global var.
;;; :MODIFICATIONS <Timestamp: #{2010-02-20T14:55:40-05:00Z}#{10076} - by MON KEY>
;;; Added optional arg NO-RMV-TRAIL-WSPC. Relocated save-match-data and
;;; conditional type error checks. Rewrote docstring
(defun mon-string-justify-left (justify-string &optional justify-width 
                                               lft-margin no-rmv-trail-wspc)
  "Return a left-justified string built from JUSTIFY-STRING.\n
When optional arg JUSTIFY-WIDTH is non-nil it is a width JUSTIFY-STRING to
counting from column 0.  Default JUSTIFY-WIDTH is `current-column' or 72.\n
When optional arg LFT-MARGIN it is a column to JUSTIFY-STRING beginning from.
Default is `left-margin' or 0.\n
The word separators are those of `split-string':
      [ \\f\\t\\n\\r\\v]+
This means that JUSTIFY-STRING is justified as one paragraph.\n
When NO-RMV-TRAIL-WSPC is non-nil do not remove trailing whitespace.
Default is to remove any trailing whiespace at end of lines.\n
:EXAMPLE\n
\(let \(\(jnk-arg '\(\(68 4\) \(18 8 t\)\)\) ;;<- With and without arg NO-RMV-TRAIL-WSPC
      jnk jnk1\)
  \(dotimes \(j 2 
              \(with-current-buffer 
                  \(get-buffer-create \"*MON-STRING-JUSTIFY-LEFT-EG*\"\)
                \(erase-buffer\)
                \(insert \";; :FUNCTION `mon-string-justify-left'\\n;;\\n\"
                        \(mapconcat 'identity \(nreverse jnk1\) \"\\n\"\)\)
                \(display-buffer \(current-buffer\) t\)\)\)
    \(dotimes \(i 8 
                \(progn
                  \(push \(format \(if \(= j 0\) 
                                    \";; :FIRST-TIME-W-ARGS %S\\n\" 
                                  \"\\n;; :SECOND-TIME-W-ARGS %S\\n\"\)
                                \(car jnk-arg\)\) 
                        jnk1\)
                  \(push \(apply 'mon-string-justify-left jnk \(pop jnk-arg\)\) jnk1\)
                  \(setq jnk nil\)\)\)
                \(dolist \(i '\(64 94\)\)
                  \(setq jnk 
                        \(concat \" \" 
                                \(make-string \(elt \(mon-nshuffle-vector [7 5 3 9]\) 3\) i\) 
                      jnk\)\)\)\)\)\)\n
:CALLED-BY `google-define-parse-buffer'\n
:SEE-ALSO `mon-string-fill-to-col', `truncate-string-to-width', `mon-string-spread'.\n▶▶▶"
  (let* ((lft-margin (if (null lft-margin) (or left-margin 0) lft-margin)) 
         (msjl-width (if (null justify-width) (or fill-column 72) justify-width))
         (msjl-string (if (not (stringp justify-string)) 
                          (error  (concat ":FUNCTION `string-justify-left' "
                                          "-- arg JUSTIFY-STRING must be a string"))
                        justify-string))
         (msjl-col (if (not (and (integerp justify-width) (integerp lft-margin)))
                       (error (concat  ":FUNCTION `string-justify-left' "
                                       "-- arg LFT-MARGIN or JUSTIFY-WIDTH not an integer"))
                     lft-margin))
         (msjl-split (save-match-data (split-string msjl-string))) ;; :WAS splited
         (msjl-margin (make-string lft-margin 32)) ;; :WAS margin
         (msjl-jstfy (substring msjl-margin 0 msjl-col)) ;; :WAS justified
         (msjl-word)
         (msjl-word-len 0)
         (msjl-sep ""))
    (while msjl-split
      (setq msjl-word (car msjl-split))
      (setq msjl-split (cdr msjl-split))
      (setq msjl-word-len (length msjl-word))
      (if (> msjl-word-len 0)
          (if (>= (+ msjl-col (length msjl-word)) msjl-width)
              (progn
                (setq msjl-jstfy (concat msjl-jstfy "\n" msjl-margin msjl-word))
                (setq msjl-col (+ left-margin msjl-word-len)))
              (progn
                (setq msjl-jstfy (concat msjl-jstfy msjl-sep msjl-word))
                (setq msjl-col (+ msjl-col 1 msjl-word-len)))))
      (setq msjl-sep " "))
    (when (< msjl-col msjl-width) 
      (setq msjl-jstfy (concat msjl-jstfy (make-string (- msjl-width msjl-col) 32)))) ;;))
    (if no-rmv-trail-wspc
        msjl-jstfy
      (setq msjl-jstfy (replace-regexp-in-string "[[:space:]]+$" "" msjl-jstfy)))))
) ;; :CLOSE 4th foundp `mon-string-justify-left'
;;
;;; :TEST-ME (mon-string-upto-index "string before ### string after" "###")
;;; :TEST-ME (mon-string-after-index "string before ### string after" "###")
;;,---- :UNCOMMENT-BELOW-TO-TEST
;;| (let ((jnk-arg '((68 4) (18 8 t))) ;;<- With and without no-rmv-trail-wspc arg.
;;|       jnk jnk1)
;;|   (dotimes (j 2 
;;|               (with-current-buffer 
;;|                   (get-buffer-create "*MON-STRING-JUSTIFY-LEFT-EG*")
;;|                 (erase-buffer)
;;|                 (insert ";; :FUNCTION `mon-string-justify-left'\n;;\n"
;;|                         (mapconcat 'identity (nreverse jnk1) "\n"))
;;|                 (display-buffer (current-buffer) t)))
;;|     (dotimes (i 8 
;;|                 (progn
;;|                   (push (format (if (= j 0) 
;;|                                     ";; :FIRST-TIME-W-ARGS %S\n" 
;;|                                   "\n;; :SECOND-TIME-W-ARGS %S\n")
;;|                                 (car jnk-arg)) 
;;|                         jnk1)
;;|                   (push (apply 'mon-string-justify-left jnk (pop jnk-arg)) jnk1)
;;|                   (setq jnk nil)))
;;|                 (dolist (i '(64 94))
;;|                   (setq jnk 
;;|                         (concat " " 
;;|                                 (make-string (elt (mon-nshuffle-vector [7 5 3 9]) 3) i) 
;;|                       jnk))))))
;;`----


;;; ==============================
;;; <Timestamp: #{2010-09-06T12:59:25-04:00Z}#{10361} - by MON KEY>
;;; :LOAD-SPECIFIC-PROCEDURES :IF-NOT-FEATURE-P `mon-cl-compat.el'
;;; `cl::subseq'
;; (unless (and (featurep 'mon-cl-compat)
;;              (fboundp 'cl::subseq))
;; (defun cl::subseq (seq start &optional end)
;;   "Return the subsequence of SEQ from START to END.
;; If END is omitted, it defaults to the length of the sequence.
;; If START or END is negative, it counts from the end."
;;   (if (stringp seq) (substring seq start end)
;;     (let (len)
;;       (and end (< end 0) (setq end (+ end (setq len (length seq)))))
;;       (if (< start 0) (setq start (+ start (or len (setq len (length seq))))))
;;       (cond ((listp seq)
;; 	     (if (> start 0) (setq seq (nthcdr start seq)))
;; 	     (if end
;; 		 (let ((res nil))
;; 		   (while (>= (setq end (1- end)) start)
;; 		     (push (pop seq) res))
;; 		   (nreverse res))
;; 	       (copy-sequence seq)))
;; 	    (t
;; 	     (or end (setq end (or len (length seq))))
;; 	     (let ((res (make-vector (max (- end start) 0) nil))
;; 		   (i 0))
;; 	       (while (< start end)
;; 		 (aset res i (aref seq start))
;; 		 (setq i (1+ i) start (1+ start)))
;; 	       res))))))
;; )
;; :CLOSE foundp `cl::subseq'

;;; ==============================
(provide 'mon-doc-help-utils-supplemental)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; no-byte-compile: t
;; mode: EMACS-LISP
;; End:

;;; ================================================================
;;; mon-doc-help-utils-supplemental.el ends here
;;; EOF


