;;; naf-mode-abbrevs.el --- 
;; -*- mode: EMACS-LISP; ;; -*-no-byte-compile: t; -*-
;;; ================================================================
;;; DESCRIPTION:
;;; naf-mode-abbrevs provides abbrevs for use with `naf-mode'
;;; 
;;;
;;; FUNCTIONS:▶▶▶
;;;
;;; FUNCTIONS:◀◀◀
;;;
;;; CONSTANTS or VARIABLES:
;;;
;;; MACROS:
;;;
;;; SUBST or ALIASES:
;;;
;;; DEPRECATED, RENAMED, OR MOVED:
;;;
;;; REQUIRES:
;;;
;;; TODO:
;;;
;;; NOTES:
;;; Following is now evaluated in naf-mode.el
;;; (add-hook 'naf-mode-hook (function (lambda () (setq local-abbrev-table naf-mode-abbrev-table))))
;;;
;;; SNIPPETS:
;;;
;;; THIRD PARTY CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;;; FILE-CREATED:
;;; <Timestamp: Thursday August 13, 2009 @ 04:53.11 PM - by MON KEY>
;;; ================================================================
;;; ;;; This file is not part of GNU Emacs.
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
;; Copyright (C) 2009-2024 MON KEY
;;; ==========================
;;; CODE:

(define-abbrev-table 'naf-mode-abbrev-table
  '(("LHJ" "Ladies Home Journal" nil 0)
    ("SATEP" "Saturday Evening Post" nil 0)
    ("GDHK" "Good Housekeeping" nil 0)
    ("WHC" "Woman's Home Companion" nil 0)
    ("NYT" "New York Times" nil 0)
    ("NYER" "The New Yorker" nil 0)
    ))

;;;(abbrev-expansion "LHJ")

;; sources
;;    "BIOF" " - Bio en Français"
;;    "BYARS"    "-Byars, Mel. Design Encyclopedia. London: Laurence King Publ., 1994."
;;; =====================================================================
;;;  (setq abbrev-mode t)
;; (defun with abbrev

;; (defun define-abbrev-function (table abbrev func)
;;   (put func 'no-self-insert t)
;;   (define-abbrev table abbrev "" `(lambda () (call-interactively ',func)))
;; )

;; (defmacro defun-abbrev (funcname abbrev &rest body)
;;   "Defun a function and define an abbrev.
;; Note that `table' is abbrev table to use."
;;   `(progn
;;      (defun ,funcname ,@body)
;;      (define-abbrev-function table ,abbrev ',funcname)))

;; (if 1
;; 	  (progn
;; 		(make-local-variable 'naf-mode-abbrev-hook)
;; 		(add-hook 'naf-mode-abbrev-hook 'naf-mode-abbrevs)
;; 		(abbrev-mode 1)))



;;; ==============================
(provide 'naf-mode-abbrevs)
;;; ==============================

;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; naf-mode-abbrevs.el.el ends here
;;; EOF
