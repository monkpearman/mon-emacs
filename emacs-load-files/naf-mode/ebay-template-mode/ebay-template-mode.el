;;; ebay-template-mode.el --- utilities and templates for editing auction listings
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2010-2012 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: ebay-template-mode.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-08-19T15:11:11-04:00Z
;; VERSION: 1.0.1
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: external, files, tools

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; ebay-template-mode provides a handy template for editing auction listings.
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
;; `*mon-ebay-template-mode-version*'
;;
;; FACES:
;;
;; VARIABLES:
;; `*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-entry*',
;; `*mon-ebay-field-delims*', `*mon-ebay-line-delims*',
;; `*mon-ebay-template-mode-map*', `*mon-ebay-template-mode-hook*',
;; `*mon-ebay-template-mode-syntax-table*', `*mon-ebay-account-ids*',
;;
;; GROUPS: 
;; `ebay-template-mode', `ebay-template-mode-faces'
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
;; Incorporate button code per Jared D.'s discussion of file-editor @:
;; (URL `http://curiousprogrammer.wordpress.com/2009/06/21/enabling-your-users/')
;; (require 'button)
;; (define-button-type 'open-dir
;;   'action 'file-editor-open-dir
;;   'follow-link t
;;   'help-echo "Open Directory")
;;
;; (define-button-type 'open-file
;;   'action 'file-editor-open-file
;;   'follow-link t
;;   'help-echo "Open Configuration File")
;;   {... FUNCS FOR FILES ...}
;;
;; NOTES:
;;
;; SNIPPETS:
;;
;; REQUIRES:
;; `ebay-template-tools', 
;; If `ebay-template-html-utils' isn't installed then you will need:
;; `html-lite', and eventually `xmlgen' (we are transitioning from html-lite)
;;
;; THIRD-PARTY-CODE:
;;; `xml-gen' 
;;; (URL `http://www.shellarchive.co.uk/content/emacs.html')
;;; `html-lite'
;;; (URL `http://www.emacswiki.org/cgi-bin/wiki/download/html-lite.el')
;;
;; URL: http://www.emacswiki.org/emacs/ebay-template-mode.el
;; FIRST-PUBLISHED: <Timestamp: #{2009-09-20} - by MON>
;;
;; EMACSWIKI: { URL of an EmacsWiki describing ebay-template-mode. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-08-19T15:11:11-04:00Z}#{09343} - by MON>
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
;; Copyright © 2009-2012 MON KEY 
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl))
;;
(require 'ebay-template-tools)
;;
(if (or (and (intern-soft "IS-MON-P" obarray) (bound-and-true-p IS-MON-P))
        (and (intern-soft "IS-BUG-P" obarray) (bound-and-true-p IS-BUG-P)))
    (progn (require 'ebay-template-html-utils)
           (require 'smith-poster-utils))
  ;; EMACS-WIKI:
  ;; If `ebay-template-html-utils' isn't installed then you will need:
  ;; `html-lite', `xml-gen'
  (unless (featurep 'ebay-template-html-utils) 
    (unless (featurep 'xmlgen) (require 'xmlgen))
    ;;(URL `http://www.shellarchive.co.uk/content/emacs.html')
    ;;(URL `http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=xmlgen.el')
    (unless (featurep 'html-lite) 
      (require 'html-lite))))
;; :SEE (URL `http://www.emacswiki.org/cgi-bin/wiki/download/html-lite.el')
	

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T12:46:00-04:00Z}#{09325} - by MON>
(defconst *mon-ebay-template-mode-version* "2010-10"
  "Return current version of `ebay-template-mode'.\n
:SEE-ALSO `ebay-template-mode-faces'.\n▶▶▶")

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T12:46:08-04:00Z}#{09325} - by MON>
(defgroup ebay-template-mode nil
  "Customization of `ebay-template-mode'.\n
:SEE-ALSO `ebay-template-mode-faces'.\n▶▶▶"
  ;; :link (url-link URL)
  ;; :link (file-link FILE)
  :group 'mon-base
  :group 'local)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T12:46:05-04:00Z}#{09325} - by MON>
(defgroup ebay-template-mode-faces nil
  "Customization of `ebay-template-mode' font-locking faces.\n
:SEE-ALSO .\n▶▶▶"
  ;; :link (file-link FILE)
  :group 'faces
  ;; :group naf-mode-faces
  :group 'ebay-template-mode)

;;; ==============================
;;; :CHANGESET 2180
;;; :CREATED <Timestamp: #{2010-10-04T15:38:16-04:00Z}#{10401} - by MON>
(defcustom *mon-ebay-account-ids* nil
  "A list conses maping ebay account ids.\n
Each list element is a key value pair. KEY is an integer, VALUE is a string
naming an ebay account id.  Elements have the format:\n
 \( <INTEGER> . <ACCOUNT-ID> \).\n
:EXAMPLE\n\n\(let \(\(*mon-ebay-account-ids* '\(\(0 . \"account-id1\"\)
                                \(1 . \"account-id2\"\)
                                \(2 . \"account-id3\"\)\)\)\)
  \(assq 1  *mon-ebay-account-ids*\)\)\n
:CALLED-BY `mon-choose-ebay-account'\n
:SEE-ALSO `*mon-ebay-template*'.\n▶▶▶"
  :type '(alist :key-type integer :value-type string)
  :group 'ebay-template-mode)


;;; ==============================
(defcustom *mon-ebay-comment-prefix* ";;; "
  "*String used by `comment-region' to comment out region in a NAF buffer.\n
:SEE-ALSO .\n
:USED-IN `ebay-template-mode'.\n▶▶▶"
  :type 'string
  :group 'ebay-template-mode)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T11:03:21-04:00Z}#{09325} - by MON>
(defvar *mon-ebay-field-entry* nil
  "List of ebay fields which are fontlocked in `ebay-template-mode'.
'ebay-item-title:'; \n'ebay-item-number:'; \n'ebay-item-start-date:'; 
'ebay-item-end-date:'; \n 'ebay-item-listing-duration:'; 
'ebay-item-start-price:'; \n'ebay-item-reserve:'; \n'ebay-item-listing-fee:';
\n 'ebay-item-buy-it-now-fee:'; \n'ebay-item-paypal-fee:'; 
'ebay-item-shipping-charged:'; \n'ebay-item-shipping-weight:'; 
'ebay-item-ship-to:'; \n'ebay-item-high-bidder-id:'; 
'ebay-item-times-listed:'; \n'ebay-item-page-views:'; 
'ebay-item-watchlist-count:'; \n'ebay-item-offers:'; 
'ebay-item-listed-in-category:'; \n'ebay-item-notes:'; \n
:SEE-ALSO `*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-delims*',
`*mon-ebay-line-delims*'.\n▶▶▶")
;;
(unless (bound-and-true-p *mon-ebay-field-entry*)
  (setq *mon-ebay-field-entry*
        (let ((ebay-field-entry-list
               '("ebay-item-title:"
                 "ebay-item-number:"
                 "ebay-item-start-date:"
                 "ebay-item-end-date:"
                 "ebay-item-listing-duration:"
                 "ebay-item-start-price:"
                 "ebay-item-reserve:"
                 "ebay-item-listing-fee:"
                 "ebay-item-buy-it-now-fee:"
                 "ebay-item-paypal-fee:"
                 "ebay-item-shipping-charged:" ;ebay-item-shipping-cost:
                 "ebay-item-shipping-weight:"
                 "ebay-item-ship-to:"
                 "ebay-item-high-bidder-id:"
                 "ebay-item-times-listed:"
                 "ebay-item-page-views:"
                 "ebay-item-watchlist-count:"
                 "ebay-item-offers:"
                 "ebay-item-listed-in-category:"
                 "ebay-item-notes:"
                 )))
          (concat "^" (regexp-opt ebay-field-entry-list 'paren)))))

;;; :TEST-ME  *mon-ebay-field-entry*
;;;(progn (makunbound '*mon-ebay-field-entry*) (unintern "*mon-ebay-field-entry*" obarray) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T11:12:21-04:00Z}#{09325} - by MON>
(defvar *mon-ebay-field-delims* nil
  "Regexp for fontlocking delims `◀◀◀' `▶▶▶' in ebay-dbc-files.\n
These delims are are fontlocked in `ebay-template-mode'.\n
:SEE-ALSO`mon-ebay-field-trigger', `mon-insert-ebay-field-trigger-l',
`mon-insert-ebay-field-trigger-r', `mon-insert-ebay-field-trigger-l-and-r',
`*doc-cookie*', `mon-insert-doc-help-cookie',
`*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-entry*',
`*mon-ebay-line-delims*'.\n▶▶▶")
;;
(unless (bound-and-true-p *mon-ebay-field-delims*)
  (setq *mon-ebay-field-delims* "^\\(◀◀◀\\|▶▶▶\\)"))
;;
;;; :TEST-ME  *mon-ebay-field-delims*
;;;(progn (makunbound '*mon-ebay-field-delims*) (unintern "*mon-ebay-field-delims*" obarray) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T11:55:31-04:00Z}#{09325} - by MON>
(defvar *mon-ebay-line-delims* nil
  "Regexp for fontlocking line delims in ebay-dbc-files.
These delims are are fontlocked in `ebay-template-mode' with:
:REGEXP
....1..2.........................3.............4...................
\"^\\\\\(\\\\\(;;; =\\\\\\=\{30,37\\\\\}$\\\\\)\\\\|\\\\\(;;; $\\\\\)\\\\|\\\\\(~\\\\\\=\{71,71\\\\}¦$\\\\\)\\\\\)\"
:MATCH=GROUPS
\";;; \" ;-> grp3
\";;; ==============================\"        ;-> grp2  ;'count of `=' chars -> 30
\";;; =====================================\" ;-> grp2 ;'count of `=' chars -> 37
\"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¦\";-> grp4\n
:SEE-ALSO `*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-entry*', 
`*mon-ebay-line-delims*'.\n▶▶▶")
;;
(unless (bound-and-true-p *mon-ebay-line-delims*)
  (setq *mon-ebay-line-delims* 
        "^\\(\\(;;; =\\{30,37\\}$\\)\\|\\(;;; $\\)\\|\\(~\\{71,71\\}¦$\\)\\)"))
;;
;;; :TEST-ME  *mon-ebay-line-delims*
;;; :TEST-ME 
;;;(search-forward-regexp *mon-ebay-line-delims*)
;;;;..1..2.........................3............4...................
;;;"^\\(\\(;;; =\\{30,37\\}$\\)\\|\\(;;; $\\)\\|\\(~\\{71,71\\}¦$\\)\\)")
;;; Not at end of line
;;;"^\\(\\(;;; =\\{30,37\\}\\)\\|\\(;;; \\)\\|\\(~\\{71,71\\}¦\\)\\)")
;;;
;;; <uncomment below from `;;; ' e.g. column 4
;;; (match-beginning 1)
;;; (match-beginning 2)
;;; ;;; ==============================
;;; ;;; =====================================
;;; (match-beginning 3)
;;; ;;; 
;;; (match-beginning 4)
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¦
;; (defvar *mon-ebay-line-delims* nil
;; ":SEE-ALSO `*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-entry*', 
;; `*mon-ebay-line-delims*'.")
;;
;; (unless (bound-and-true-p *mon-ebay-line-delims*)
;;   (setq *mon-ebay-line-delims* 
;;         (concat
;;          "^\\(" ";;; =============================="  "\\|" ";;; ====================================="
;;          "\\|" "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¦"
;;          "//)")))
;;
;;;(progn (makunbound '*mon-ebay-line-delims*) (unintern "*mon-ebay-line-delims*" obarray) )

;;; ==============================
(defvar *mon-ebay-template-font-lock-keywords* nil
  "Fontlock keywords for ebay-dbc-file templates using `ebay-template-mode'.\n
:SEE-ALSO `ebay-template-mode-faces', `*mon-ebay-field-entry*',
`*mon-ebay-field-delims*', `*mon-ebay-line-delims*'.\n▶▶▶")
;;
(unless (bound-and-true-p *mon-ebay-template-font-lock-keywords*)
  (setq *mon-ebay-template-font-lock-keywords*
        `((,*mon-ebay-field-delims* 0 font-lock-keyword-face t)
          (,*mon-ebay-field-entry* 0 naf-mode-field-fface t)
          (,*mon-ebay-line-delims* 0 font-lock-function-name-face t)
          (,(concat "\\(" naf-mode-timestamp-flag "\\)") 0 naf-mode-timestamp-fface t))))
;;
;;; :TEST-ME  *mon-ebay-field-entry*
;;; :TEST-ME  *mon-ebay-field-delims*
;;; :TEST-ME  *mon-ebay-line-delims*
;;; :TEST-ME  naf-mode-timestamp-flag (concat "\\(" naf-mode-timestamp-flag "\\)")
;;; :TEST-ME  *mon-ebay-template-font-lock-keywords*
;;
;;;(progn (makunbound '*mon-ebay-template-font-lock-keywords*)
;;;       (unintern "*mon-ebay-template-font-lock-keywords*" obarray) )

;;; ==============================
;;; :NOTE Copy the map then modify it with:
;;;       (let ebay-template-map (copy-keymap naf-mode-map)) 
;;;       (let ((ebay-template-map (make-sparse-keymap)))
;;;       (set-keymap-parent ebay-template-map naf-mode-map)
;;;       (keymap-parent *mon-ebay-template-mode-map*)
;;; :CREATED <Timestamp: #{2009-08-07T12:40:59-04:00Z}#{09325} - by MON>
(defvar *mon-ebay-template-mode-map*
  (let ((ebay-template-map 
         (if (bound-and-true-p naf-mode-map) ;;EMACS-WIKI
             (copy-keymap naf-mode-map))))
    ;; :ADD-KEYBINDING
    (define-key ebay-template-map "\C-c\M-cet" 'mon-cln-ebay-time-string)
    (define-key ebay-template-map "\C-c\M-lr"  'mon-insert-ebay-field-trigger-l-and-r)
    (define-key ebay-template-map "\C-c\M-lf"  'mon-insert-ebay-field-trigger-l)
    (define-key ebay-template-map "\C-c\M-rt"  'mon-insert-ebay-field-trigger-r)
    (define-key ebay-template-map "\C-c\M-sre" 'mon-set-smith-poster-register-e)
    ebay-template-map)
  "Keymap for `ebay-template-mode'.\n
Some keys bound also global in `mon-keybindings'.
Globals are included here in order that `describe-mode' in `*Help*'
buffers can show the global-bindings too as they are still used most by naf-mode.
Typically `naf-mode' binds ``\C-c\\M-##\''.\n
:SEE-ALSO `ebay-template-mode-map'.\n▶▶▶")
;;
;;;(progn (makunbound '*mon-ebay-template-mode-map*) 
;;        (unintern "*mon-ebay-template-mode-map*" obarray) )

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-27T12:30:53-04:00Z}#{09354} - by MON>
;;                ;; SYMBOL                ;; MAPS
(easy-menu-define ebay-template-mode-menu *mon-ebay-template-mode-map* ;; naf-mode-map
  "Menu for working with ebay template files."  ;;DOC
  ;; MENU:
  '("Ebay-Template-mode"
    ["Ebay clean time string" mon-cln-ebay-time-string :help "eBay timestring -> local fromat"]
    ["Ebay insert ▶▶▶ ◀◀◀" mon-insert-ebay-field-trigger-l-and-r :help "Insert ▶▶▶ ◀◀◀ delimters"]
    ["Ebay insert ▶▶▶"  mon-insert-ebay-field-trigger-r :help "insert ▶▶▶ delimiter"]
    ["Ebay insert ◀◀◀"  mon-insert-ebay-field-trigger-l :help "Insert ◀◀◀ delimiter"]
    ["Ebay Smith sale template" mon-set-smith-poster-register-e :help "Insert Smith Poster Sales template"]
    "---"))

;;; :TEST-ME  ebay-template-mode-menu
;;;(progn (makunbound 'ebay-template-mode-menu) (unintern "ebay-template-mode-menu" obarray))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-08-07T12:42:25-04:00Z}#{09325} - by MON>
;;; :NOTE `define-derived-mode' automatically creates the hook `*mon-ebay-template-mode-hook*'
;;;        e.g. (derived-mode-hook-name 'ebay-template-mode)
;;
(defvar *mon-ebay-template-mode-hook* nil
 ;; :type 'hook ;; when we make the defvar a (defcustom
  "The `ebay-template-mode' hook.\n
:CALLED-BY `ebay-template-mode'\n
:SEE-ALSO .\n▶▶▶")

;;; ==============================
;;; (defvar ebay-template-mode-imenu-generic-expression
;;;   ...)

;;; ==============================
(defvar *mon-ebay-template-mode-syntax-table*
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\" ".   " st)
    (modify-syntax-entry ?\\ ".   " st)
    ;; Add `p' so M-c on `hello' leads to `Hello', not `hello'.
    (modify-syntax-entry ?' "W p" st)
    st)
  "Syntax table used while in `ebay-template-mode'.\n
:SEE-ALSO `*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-entry*',
`*mon-ebay-field-delims*', `*mon-ebay-line-delims*',
`*mon-ebay-template-mode-map*', `*mon-ebay-template-mode-hook*',
`*mon-ebay-template-mode-syntax-table*',
`ebay-template-mode-menu'.\n▶▶▶")

;;; ==============================

;;; ==============================
;;; :CREATED <Timestamp: Tuesday June 02, 2009 @ 11:35.25 AM - by MON>
(define-derived-mode ebay-template-mode fundamental-mode "eBay-Template"
  "Major mode to edit eBay templates.\n
:SEE-ALSO `*mon-ebay-template-mode-version*'
`*mon-ebay-template-font-lock-keywords*', `*mon-ebay-field-entry*',
`*mon-ebay-field-delims*', `*mon-ebay-line-delims*',
`*mon-ebay-template-mode-map*', `*mon-ebay-template-mode-hook*',
`*mon-ebay-template-mode-syntax-table*', `ebay-template-mode-menu'.\n▶▶▶"
  ;;from Sample-mode.el -> Stephan Monnier   
   :group 'ebay-template-mode
   ;; :link
   ;; :syntax-table TABLE  
   ;; :NOTE Automatically generated as `*mon-ebay-template-mode-syntax-table*'  
   ;; :abbrev-table TABLE
   ;; :NOTE Automatically generated as `ebay-template-mode-abbrev-table'   
   ;; (set (make-local-variable 'imenu-generic-expression)
   ;;      sample-imenu-generic-expression)
   (set (make-local-variable 'font-lock-defaults) 
        '(*mon-ebay-template-font-lock-keywords*))
   (set (make-local-variable 'font-lock-keywords)
        '(*mon-ebay-template-font-lock-keywords*))
   (message "Loading eBay-Tamplate mode")
  (run-mode-hooks '*mon-ebay-template-mode-hook*))
;;
;;;(progn (makunbound 'ebay-template-mode) (unintern "ebay-template-mode" obarray) )

;;; ==============================
;; (add-hook '*mon-ebay-template-mode-hook*
;;           (function (lambda () (message "Load eBay-Tamplate mode"))))

;;; ==============================
(provide 'ebay-template-mode)
;;; ==============================

;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; ebay-template-mode.el ends here
;;; EOF
