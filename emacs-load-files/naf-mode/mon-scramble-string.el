;;; mon-scramble-string.el --- { A one line description of: mon-scramble-string. }
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-scramble-string.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2024-09-04T12:16:10-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs29.*
;; KEYWORDS: 

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-scramble-string provides functions for scrambling string like thinkgs
;; region, buffer, word, etc.
;;
;; FUNCTIONS:▶▶▶
;; `mon-scramble-word'
;; `mon-scramble-region'
;; `mon-scramble-buffer'
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
;; URL: https://github.com/mon-key/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-scramble-string.el
;; EMACSWIKI-URL: http://www.emacswiki.org/emacs/mon-scramble-string.el
;; FIRST-PUBLISHED:
;;
;; EMACSWIKI: { URL of an EmacsWiki describing mon-scramble-string. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2024-09-04T12:16:10-04:00Z}#{24363} - by MON KEY>
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
;; Copyright © 2024 MON KEY 
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl-lib))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
  (setq *IS-MON-OBARRAY* (make-vector 17 nil)))


;;; ==============================
(defvar *mon-scramble-string-xrefs*
'(mon-scramble-word
  mon-scramble-region
  mon-scramble-buffer
  *mon-scramble-string-xrefs*)
"Xrefing list of `mon-scramble-<FOO>' symbols, functions constants, and variables.\n
:SEE-ALSO `*mon-default-loads-xrefs*', `*mon-default-start-loads-xrefs*',
`*mon-dir-locals-alist-xrefs*', `*mon-testme-utils-xrefs*',
`*mon-button-utils-xrefs*', `*mon-window-utils-xrefs*', `*naf-mode-xref-of-xrefs*',
`*naf-mode-faces-xrefs*', `*naf-mode-date-xrefs*', `*mon-ulan-utils-xrefs*',
`*mon-xrefs-xrefs'.\n▶▶▶")

;;; ==============================
(defun mon-scramble-word (word)
  "This duefn will slrabcme the word peassd in.
:EXAMPLE\n\n
:SEE-ALSO `mon-scramble-word', `mon-scramble-region',
`mon-scramble-buffer'.\n▶▶▶"
  (let* ((letters (save-match-data (split-string word "")))
         (first-letter (if (length letters) (pop letters)))
         (last-letter (last letters))
         order)
    (if last-letter
        (progn
          (setq letters (butlast letters))
          (mapc #'(lambda (letter)
                    (let ((rand (cl-random (* 2 (length letters))))) 
                      (setq order (append order (list (cons letter rand)))))) letters)))
    (mapc #'(lambda (letter)
              (setq first-letter (concat first-letter letter)))
          (sort letters #'(lambda (a b)
                            (< (cdr (assoc a order)) (cdr (assoc b order))))))
    (setq first-letter (concat first-letter (car last-letter)))))

;;; ==============================
(defun mon-scramble-region (start end)
  "Tihs wlil sbmralce and ertnie region, word by word.
:EXAMPLE\n\n
:SEE-ALSO `mon-scramble-word', `mon-scramble-region',
`mon-scramble-buffer'.\n▶▶▶"
  (interactive "r")
  (message "%d %d" start end)
  (goto-char start)
  (while (re-search-forward "\\(\\([^[:space:][:punct:]]+\\)\\)[[:space:][:punct:]]*" end t)
    (replace-match (mon-scramble-word (match-string-no-properties 1)) nil nil nil 1)))

;;; ==============================
 (defun mon-scramble-buffer ()
"Rncution wlil sracbmle the eitnre bffuer.\n
:EXAMPLE\n\n
:SEE-ALSO `mon-scramble-word', `mon-scramble-region',
`mon-scramble-buffer'.\n▶▶▶"
  (mon-scramble-region (point-min) (point-max)))

;;; ==============================
(provide 'mon-scramble-string)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; coding: utf-8
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ====================================================================
;;; mon-scramble-string.el ends here
;;; EOF
