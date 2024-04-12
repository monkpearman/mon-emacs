;;; ebay-template-tools.el --- templating tools to generate auction listings
;; -*- mode: EMACS-LISP; no-byte-compile: t; -*-

;;; ================================================================
;; Copyright © 2009-2012 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: ebay-template-tools.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-05-05T18:38:57-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: external, files, tools

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; ebay-template-tools provides templating tools to generate auction listings.
;;
;; FUNCTIONS:▶▶▶
;; `mon-insert-ebay-template', `mon-choose-ebay-delims', `mon-choose-ebay-account',
;; `mon-make-html-tree', `mon-insert-ebay-html-tree', 
;; `mon-make-ebay-dir-list', `mon-make-ebay-dir-list-2',
;; `mon-insert-ebay-dirs', `mon-insert-ebay-dbc-file', 
;; `mon-check-ebay-template-path', `mon-insert-ebay-dbc-template',
;; `mon-ebay-field-trigger', `mon-insert-ebay-field-trigger-l',
;; `mon-insert-ebay-field-trigger-r', `mon-insert-ebay-field-trigger-l-and-r', 
;; `mon-insert-ebay-photo-per-scan-descr', 
;; `mon-ebay-image-linkify', `mon-ebay-image-linkify-lite',
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
;; `*mon-html-ebay-template*', `*mon-html-domain-for-ebay-template*',
;; `*mon-ebay-image-linkify-templates*',
;;
;; ALIASED/ADVISED/SUBST'D:
;;
;; DEPRECATED:
;;
;; RENAMED:
;; This file :RENAMED :FROM ebay-template.el :TO ebay-template-tools.el
;;
;; MOVED:
;; `mon-get-ebay-bmps-in-dir'           -> `mon-rename-image-utils.el'
;; `mon-get-nefs-in-dir'                -> `mon-rename-image-utils.el'
;; `mon-get-ebay-jpgs-list'             -> `mon-rename-image-utils.el'
;; `mon-insert-ebay-jpgs-in-file'       -> `mon-rename-image-utils.el'
;; `mon-get-ebay-jpgs-count'            -> `mon-rename-image-utils.el'
;; `mon-get-ebay-bmps-count'            -> `mon-rename-image-utils.el'
;; `mon-get-ebay-img-count-verify'      -> `mon-rename-image-utils.el'
;; `mon-cln-img-magic-hex'              -> `mon-rename-image-utils.el'
;; `mon-get-ebay-img-css'               -> `mon-rename-image-utils.el'
;; `mon-get-ebay-img-name-to-col'       -> `mon-rename-image-utils.el'
;; `mon-get-ebay-css-pp-region-to-file' -> `mon-rename-image-utils.el'	
;; `mon-get-ebay-css-pp'                -> `mon-rename-image-utils.el'
;; `mon-insert-css-colors'              -> `mon-rename-image-utils.el'
;; 
;; Following path-vars:
;; `*mon-nef-scan-path*'                -> mon-dir-locals-alist.el
;; `*mon-nef-scan-nefs-path*'           -> mon-dir-locals-alist.el
;; `*mon-nef-scan-nef2-path*'           -> mon-dir-locals-alist.el
;; `*mon-ebay-images-path*'             -> mon-dir-locals-alist.el
;; `*mon-ebay-images-bmp-path*'         -> mon-dir-locals-alist.el
;; `*mon-ebay-images-jpg-path*'         -> mon-dir-locals-alist.el
;; `*mon-ebay-images-temp-path*'        -> mon-dir-locals-alist.el
;;
;; TODO:
;;
;; NOTES:
;;
;; SNIPPETS:
;;
;; REQUIRES:
;; cl.el xml-gen.el
;; mon-insertion-utils.el
;; mon-dir-utils.el
;; mon-dir-locals-alist.el
;; naf-mode-replacements.el
;; naf-url-utils.el
;; mon-css-color.el
;; mon-time-utils.el
;;
;; THIRD-PARTY-CODE:
;;
;; URL: http://www.emacswiki.org/emacs/ebay-template-tools.el
;; FIRST-PUBLISHED: <Timestamp: #{2009-09-20} - by MON KEY>
;;
;; EMACSWIKI: { URL of an EmacsWiki describing ebay-template-tools. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-05-05T18:38:57-04:00Z} -  by MON KEY>
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

;;; ==============================
;;; :CHANGESET 2432
;;; :CREATED <Timestamp: #{2011-04-20T15:57:00-04:00Z}#{11163} - by MON>
(defvar *mon-html-ebay-template* nil
  "An html-light form to evaluate with `mon-insert-ebay-template'.\n
:EXAMPLE\n\n
 \(html-lite-write-tree \(eval *mon-html-ebay-template*\)\)
:SEE-ALSO .\n▶▶▶")


;;; ==============================
;;; :CHANGESET 2432
;;; :CREATED <Timestamp: #{2011-04-20T16:21:02-04:00Z}#{11163} - by MON>
(defvar *mon-html-domain-for-ebay-template*
  (replace-regexp-in-string  "www\." ""
                             (or (replace-regexp-in-string "\.com" "" (cadr (assoc 2 (bound-and-true-p *MON-ORG-NAME*))))
                                 "<YOUR-DOMAIN-HERE>")) 
  "Default domain for templates Ebay HTML templates.\n
Domain should be formated without a \"www.\" prefix nor suffixed with \".com\" \(or equivalent\).\n
:EXAMPLE\n\n
:SEE-ALSO `*mon-html-ebay-template*'.\n▶▶▶")


;;; ==============================
;;; :CHANGESET 2432
;;; :CREATED <Timestamp: #{2011-04-20T16:37:43-04:00Z}#{11163} - by MON>
(defvar *mon-ebay-image-linkify-templates*
  `((1 . ,(concat "eßay↔ωwω."
                  (or (caadr (assoc 10 *MON-ORG-NAME*)) *mon-html-domain-for-ebay-template*)
                  "·©ΟΜ"))
    (2 . ,(concat "→WωW·" 
                  (or (cdadr (assoc 10 *MON-ORG-NAME*)) *mon-html-domain-for-ebay-template*)
                  ".CΘΜ…")))
  "Alist for `mon-ebay-image-linkify-lite' and `mon-ebay-image-linkify'.\n
:EXAMPLE\n\n\(cdr \(assoc 1 *mon-ebay-image-linkify-templates*\)\)\n
\(cdr \(assoc 2 *mon-ebay-image-linkify-templates*\)\)\n
:SEE-ALSO .\n▶▶▶")


;;; ==============================
(defun mon-insert-ebay-template ()
  "Evaluate the html-light Ebay template in *mon-html-ebay-template* and insert at point.\n
HTML generated with the functions from the html-lite.el and xml-gen.el packages.\n
The follwing features are used from those two packages:
`xmlgen', `xmlgen-attr-to-string', `xmlgen-extract-plist', `html-lite-doctype',
`html-lite-doctype-alist', `html-lite-define-elements',
`html-lite-make-element', `with-html-lite-header', `with-html-lite-header',
`html-doctype', `html-lite-make-name', `html-lite-write-tree',
`html-lite-browse-tree'\n
:SEE-ALSO `mon-insert-ebay-html-tree', `mon-make-html-tree',
`mon-insert-ebay-dbc-file',`mon-insert-ebay-dbc-template',
`mon-choose-ebay-account', `mon-choose-ebay-delims',
`mon-make-ebay-dir-list', `mon-make-ebay-dir-list-2', `mon-insert-ebay-dirs',
`mon-check-ebay-template-path', `mon-insert-ebay-photo-per-scan-descr',
`mon-ebay-image-linkify', `mon-ebay-image-linkify-lite',
`mon-ebay-field-trigger', `mon-insert-ebay-field-trigger-l',
`mon-insert-ebay-field-trigger-r', `mon-insert-ebay-field-trigger-l-and-r',
`*mon-ebay-comment-prefix*', `*mon-ebay-field-delims*',
`*mon-ebay-field-entry*', `*mon-ebay-images-bmp-path*',
`*mon-ebay-images-jpg-path*', `*mon-ebay-images-lookup-path*',
`*mon-ebay-images-temp-path*'.\n▶▶▶"
  (if (bound-and-true-p *mon-html-ebay-template*)
      (let ((make-html (html-lite-write-tree (eval *mon-html-ebay-template*))))
         make-html)
    (mon-message  :msg-spec
                  '(":FUNCTION `mon-insert-ebay-template' -- "
                   "variable `*mon-html-ebay-template*' not `bound-and-true-p'"))))



;;; ==============================
;;; :TODO take an optional STARTING-DIR arg to default-dir
;;; (file-relative-name buffer-file-name *mon-nef-scan-path*)
;;; (expand-file-name "Nef_Drive2/EBAY/BMP-Scans/e1193/e1193.dbc" *mon-nef-scan-path*)
;;; :CREATED <Timestamp: Monday April 20, 2009 @ 04:31.54 PM - by MON KEY>
;;; ==============================
(defvar *mon-ebay-template* 'nil
":CALLED-BY `mon-insert-ebay-dirs', `mon-insert-ebay-bmps-in-file'.
:SEE-ALSO :SEE-ALSO `mon-insert-ebay-template', `mon-insert-ebay-html-tree',
`mon-make-html-tree', `mon-insert-ebay-dbc-file',
`mon-insert-ebay-dbc-template', `mon-insert-ebay-photo-per-scan-descr',
`*mon-ebay-template*', `*mon-ebay-images-bmp-path*',
`*mon-ebay-images-jpg-path*' `*mon-ebay-images-lookup-path*'.\n▶▶▶")
;;
(unless (bound-and-true-p *mon-ebay-template*)
  (let ((ebay-template
(format ";; -*- mode: EBAY-TEMPLATE; -*-
;;; =====================================
;;; Copyright ©2010 - %s
;;; =====================================
;;; this file is:
;;; %%s
;;; ==============================
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¦
ebay-item-title:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~¦
ebay-item-number:
ebay-item-start-date:
ebay-item-end-date:
ebay-item-listing-duration:
ebay-item-start-price:
ebay-item-reserve:
ebay-item-listing-fee:
ebay-item-buy-it-now-fee:
ebay-item-paypal-fee:
ebay-item-shipping-charged:
ebay-item-shipping-weight:
ebay-item-ship-to:
ebay-item-high-bidder-id:
ebay-item-times-listed:
ebay-item-page-views:
ebay-item-watchlist-count:
ebay-item-offers:
ebay-item-listed-in-category:
ebay-item-notes:
;;; ==============================\n
<!-- html-template-starts-here -->\n\n%%s\n\n<!-- html-template-ends-here -->\n
;;; URLs inserted below for photo:
;;; %%s-N\n;;; thru;\n;;; %%s-N\n
;;; To get ebay photo paths evaluate-me with either:
;;; M-x mon-insert-ebay-bmps-in-file
;;; (mon-insert-ebay-bmps-in-file) <-- C-x C-e\n
;;; M-x mon-insert-ebay-jpgs-in-file
;;; (mon-insert-ebay-jpgs-in-file) <-- C-x C-e\n
;;; To get an eBay photo description inserted:
;;; M-x mon-insert-ebay-photo-per-scan-descr
;;; (mon-insert-ebay-photo-per-scan-descr COUNT ITEM-NUMBER\) <-- C-x C-e\n
;;; e.g.(mon-insert-ebay-photo-per-scan-descr 3 '1143) <-- C-x C-e\n
;;; ==============================
;;; %%s.dbc ends here
;;; ==============================
;;; EOF"

(or (cadr (assoc 2 (bound-and-true-p *MON-ORG-NAME*))) "<COPYRIGHT-OF>"))))
    (setq *mon-ebay-template* ebay-template)))

;;
;;; :TEST-ME (symbol-value '*mon-ebay-template*)
;;; (progn (makunbound '*mon-ebay-template*) 
;;         (unintern '*mon-ebay-template*) )

;;;;;;;
;(format *mon-ebay-template* put-file make-html file-no-ext file-no-ext file-no-ext)))
;; (format *mon-ebay-template* 
;;         put-file ;this file is:\n%s 
;;         make-html ;<!-- html-template-starts-here
;;         file-no-ext ;URLs inserted below for photo:
;;         file-no-ext ;URLs inserted below for photo:
;;         file-no-d ;%s.dbc ends here
;;         )


;;; ==============================
;;; :TODO both `mon-choose-ebay-delims' and `mon-choose-ebay-accounts'
;;; should do completion ala ido, auto-complete, imenu etc.
;;; :CREATED <Timestamp: Thursday May 14, 2009 @ 12:57.52 PM - by MON KEY>
;;; ==============================
(defun mon-choose-ebay-delims ()
  "Choose from a list of delims to use for the ebay template.\n
Choices include:
 ◊◊◊◊◊ ♦♦♦♦♦ ΠΠΠΠΠΠ ΦΦΦΦΦ πππππ §§§§§ ≡≡≡≡≡ ˆˆˆˆˆ ΞΞΞΞΞ ººººº
 °°°°° ΔΔΔΔΔ ±±±±± ••••• ····· …………… ∞∞∞∞∞ ¤¤¤¤¤ ‹‹‹››› ««»»»
 ←———→ ××××× ˜˜˜˜˜ -----\n
:SEE-ALSO `mon-choose-ebay-account'.\n▶▶▶"
  (let* ((delim-choice '("◊◊◊◊◊" "♦♦♦♦♦" "ΠΠΠΠΠΠ" "ΦΦΦΦΦ" "πππππ" "§§§§§"
                         "≡≡≡≡≡" "ˆˆˆˆˆ" "ΞΞΞΞΞ" "ººººº" "°°°°°" "ΔΔΔΔΔ"
                         "±±±±±" "•••••" "·····" "……………" "∞∞∞∞∞" "¤¤¤¤¤"
                         "‹‹‹›››" "««»»»" "←———→" "×××××" "˜˜˜˜˜" "-----"))
	 (chosen (completing-read "Which delim shall we use: " 
                                  delim-choice nil t "◊◊◊◊◊")))
    chosen))
;;
;;; :TEST-ME (mon-choose-ebay-delims)

;;; ==============================
;;; :TODO This should do completion ala ido, auto-complete, imenu etc.
;;; :CHANGESET 2180 <Timestamp: #{2010-10-04T16:04:31-04:00Z}#{10401} - by MON>
(defun mon-choose-ebay-account ()
  "Choose from a list of ebay-accounts to insert for the ebay template.\n
Account choices returned according to variable `*mon-ebay-account-ids*'.\n
:EXAMPLE\n\n\(mon-choose-ebay-account\)\n
:SEE-ALSO `mon-choose-ebay-delims'.\n▶▶▶"
  (let* ((accnt-choice ;; WAS (cadr (assoc 10 *MON-ORG-NAME*)))
          (or (assq 1 *mon-ebay-account-ids*)))
	 (chosen (completing-read 
                  (concat ":FUNCTION `mon-choose-ebay-account' "
                          "-- which ebay account are we using (tab completes): ")
                  accnt-choice nil t))) ;;(nth 1 accnt-choice))))
    chosen))
;;	     
;;; :TEST-ME (mon-choose-ebay-account)

;;; ==============================
;;; :CREATED <Timestamp: Wednesday April 29, 2009 @ 03:14.59 PM - by MON KEY>
(defun mon-make-html-tree ()
  "Make an html tree for insertion but don't write to buffer.\n
:SEE-ALSO `mon-insert-ebay-template', `mon-insert-ebay-html-tree',
`xmlgen', `xmlgen-attr-to-string', `xmlgen-extract-plist', `html-lite-doctype',
`html-lite-doctype-alist', `html-lite-define-elements',
`html-lite-make-element', `with-html-lite-header', `with-html-lite-header',
`html-doctype', `html-lite-make-name', `html-lite-write-tree',
`html-lite-browse-tree'.\n▶▶▶"
  (interactive)
  (let ((html-temp)
	(html-string))
    (setq html-string
	  (with-temp-buffer 
	    (mon-insert-ebay-template)
	    (setq html-temp (buffer-string))))
    html-string))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday April 29, 2009 @ 03:15.08 PM - by MON KEY>
(defun mon-insert-ebay-html-tree ()
  "Inserts _only_ the ebay-html-tree in `current-buffer' at point.\n
Use: `mon-insert-ebay-dbc-template' for the full ebay template insertion utility.
This may be deprecated once the additional templating call-outs are incorporated.\n
:SEE-ALSO `mon-make-html-tree', `mon-insert-ebay-template',
`mon-make-html-tree', `mon-insert-ebay-dbc-file',
`mon-insert-ebay-dbc-template'.\n▶▶▶"
  (interactive)
  (format "%s" (mon-insert-ebay-template)))

;;; ==============================
;;; :CREATED <Timestamp: Saturday May 09, 2009 @ 05:03.17 PM - by MON KEY>
(defun mon-make-ebay-dir-list (start-from end-at &optional ff-prefix)
  "Build a numeric list of dir names to use for inserting in a directory.\n
START-FROM \(an integer\) to END-AT \(an integer\).\n
Optional arg FF-PREFIX \(a string\) prefixes list with string default prfx is `e'.\n
Helper function for `mon-insert-ebay-dirs'.\n
:SEE-ALSO `mon-insert-ebay-template', `mon-insert-ebay-html-tree',
`mon-make-html-tree', `mon-insert-ebay-dbc-file',
`mon-insert-ebay-dbc-template',`*mon-ebay-images-bmp-path*',
`*mon-ebay-images-jpg-path*', `*mon-ebay-images-lookup-path*',
`*mon-ebay-images-temp-path*'.\n▶▶▶"
  (let ((put-dirs)
	(starting)
	(prfx (cond ((stringp ff-prefix) ff-prefix)
		    ((or (not ff-prefix) (not (stringp ff-prefix)))
			  "e"))))
    (setq starting start-from)
    (setq put-dirs ())
    (while (not (= starting (1+ end-at)))
      (setq put-dirs (cons (format "%s%d" prfx starting) put-dirs))
      (setq starting (1+ starting)))
    (setq put-dirs  (nreverse  put-dirs))
   put-dirs))

;;; ==============================
(defun mon-make-ebay-dir-list-2 (start-from end-at &optional 
                                            ff-prefix ff-suffix ff-incr)
  "Build a numeric list of dir names to use for inserting in a directory.\n
START-FROM (a number) to END-AT (a number).\n
Optional arg FF-PREFIX (a string) prefixes list with string default prfx is `e'.\n
Helper function for `mon-insert-ebay-dirs'.\n
:SEE-ALSO `*mon-ebay-images-temp-path*'.\n▶▶▶"
  (let* ((put-dirs)
	 (starting)
	 (prfx (cond ((stringp ff-prefix) 
		      (let ((fix-pre ff-prefix))
			(setq fix-pre (replace-regexp-in-string "\\([[:space:]_]\\)" "-" fix-pre))
			(setq fix-pre (replace-regexp-in-string "\\(--\\)" "-" fix-pre))
			(setq fix-pre (replace-regexp-in-string 
				       "\\(\\([[:alnum:]]\\)\\([^-]$\\)\\)" "\\2\\3-" fix-pre nil nil))
			fix-pre))
		     ((or (not ff-prefix) (not (stringp ff-prefix)))"e")))
	 (sffx (cond ((stringp ff-suffix) 
		      (let ((fix-sfx ff-suffix))
			(setq fix-sfx (replace-regexp-in-string "\\([[:space:]_]\\)" "-" fix-sfx))
			(setq fix-sfx (replace-regexp-in-string "\\(--\\)" "-" fix-sfx))
			(setq fix-sfx (replace-regexp-in-string 
			       "\\(\\([[:alnum:]]\\)\\([^-]$\\)\\)" "\\2\\3-" fix-sfx nil nil))
			fix-sfx))
		     ((numberp ff-suffix) (format "-%d-" ff-suffix)))))
    (setq starting start-from)
    (setq put-dirs ())
    (while (not (= starting (1+ end-at)))
      (setq put-dirs (cons (format "%s%d" prfx starting) put-dirs))
      (setq starting (1+ starting)))
    (setq put-dirs  (nreverse  put-dirs))
    put-dirs))

;;;(mon-make-ebay-dir-list 1 3 "Big Bubba " 3)

;;; ==============================
;; (interactive
;;   (list (let ((starting (read-number "Ebay Item no. to start from :"))
;; 	       (ending (read-number "Ebay Item no. to start from :"))
;; 	       (alt-prfx (cond ((yes-or-no-p "Use an alt dir prefix (default is 'e') : ")
;; 			       (let (str)
;; 				 (setq str (read-string "Prefix files and folders with: "))
;; 				 (setq str (replace-regexp-in-string "\\([[:space:]_]\\)" "-" str))
;; 				 (setq str (replace-regexp-in-string "\\(--\\)" "-" str))
;; 				 (setq str (replace-regexp-in-string 
;;                                          "\\(\\([[:alnum:]]\\)\\([^-]$\\)\\)" "\\2\\3-" str nil nil))
;; 				 str)))))
;; 	   (mon-make-ebay-dir-list starting ending alt-prfx))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday April 29, 2009 @ 03:16.06 PM - by MON KEY>
(defun mon-insert-ebay-dirs (dir-list)
  "Insert ebay photo dirs in path `*mon-ebay-images-temp-path*'.\n
Builds dirs from elts in DIR-LIST in ../BMP-Scans/ and ../BIG-cropped-jpg.
DIR-LIST should be a list of strings e.g. incrementing from last #.
\(setq my-make-dir-list '(\"eNNNN\" \"eNNNN\" \"eNNNN\" \"eNNNN\" \"eNNNN\"))\n
Each newly created dir in ../BMP-Scans/ has a file temlate eNNNN.dbc inserted
to aid in tracking listing developments.\n
Used with: `mon-make-ebay-dir-list' interactive list builder.\n
And,  `mon-insert-ebay-dbc-template' to insert a buffer local template.
Path determined according to globar var `*mon-ebay-images-temp-path*'.\n
:SEE-ALSO `*mon-ebay-template*', `mon-insert-ebay-bmps-in-file',
`mon-insert-ebay-photo-per-scan-descr'.\n▶▶▶"
  (interactive
   (list (let ((starting (read-number "Ebay Item no. to start from: "))
	       (ending (read-number "Ebay Item no. to end with: "))
	       (alt-prfx 
		(cond ((yes-or-no-p "Use an alt dir prefix (default is 'e'): ")
		       (let (str)
			 (setq str (read-string "Prefix files and folders with: "))
			 (setq str (replace-regexp-in-string "\\([[:space:]_]\\)" "-" str))
			 (setq str (replace-regexp-in-string "\\(--\\)" "-" str))
			 (setq str (replace-regexp-in-string 
				    "\\(\\([[:alnum:]]\\)\\([^-]$\\)\\)" "\\2\\3-" str nil nil))
			 str)))))
	   (mon-make-ebay-dir-list starting ending alt-prfx))))
  (let* ((make-list dir-list)
	 (into-path *mon-ebay-images-temp-path*))
    (while make-list
      (let ((put-list (car make-list)))
	(make-directory (concat into-path "/BMP-Scans/" put-list) t)
	(let ((put-file (concat into-path "/BMP-Scans/" put-list "/" put-list ".dbc"))
              (make-html "(insert (mon-make-html-tree))" ))
	  (with-temp-file put-file 
	    (set (make-local-variable 'buffer-file-coding-system) 'utf-8-unix)	    
	    (insert (format *mon-ebay-template* put-file make-html put-list put-list put-list ))))
	(make-directory (concat into-path "/BIG-cropped-jpg/" put-list) t))
      (setq make-list (cdr make-list))))
  (message "ok finished - NOTE! files are in the temp path."))

;;; :TEST-ME (setq my-make-dir-list '("eNNNq" "eNNNw" "eNNNz" "eNNNy"))
;;; :TEST-ME (mon-insert-ebay-dirs my-make-dir-list)
;;;(concat "../" (directory-file-name (file-name-directory *ebay-scan-path*))
;;;(directory-file-name (file-name-directory dirname))

;;; ==============================
;;; :CREATED <Timestamp: Wednesday April 29, 2009 @ 03:15.57 PM - by MON KEY>
(defun mon-insert-ebay-dbc-file (dir-list)
  "Abriged file only (no-dir) version of `mon-insert-ebay-dirs'.\n
Don't call this after evaluating it to create the file - it will clobber your files.
Use `mon-insert-ebay-dbc-template' to insert a buffer local template.
:SEE-ALSO `mon-insert-ebay-html-tree', `mon-make-html-tree',
`mon-insert-ebay-dbc-file', `mon-insert-ebay-dbc-template',
`mon-check-ebay-template-path', `*mon-ebay-images-path*'.\n▶▶▶"
  (let* ((make-list dir-list)
	 (into-path (file-name-as-directory *mon-ebay-images-path*)))
    (while make-list
      (let ((put-list (car make-list)))
	(let ((put-file (concat into-path "BMP-Scans/" put-list "/" put-list ".dbc"))
              (make-html "(insert (mon-make-html-tree))" ))
	  (with-temp-file put-file 
	    (insert  (format *mon-ebay-template* put-file make-html put-list put-list put-list)))))
      (setq make-list (cdr make-list)))))

;;; ==============================
;;; :NOTE Subroutine for curr-dir above.
;;; :CREATED <Timestamp: Wednesday July 22, 2009 @ 08:35.33 PM - by MON KEY>
(defun mon-check-ebay-template-path ()
  "Helper function for `mon-insert-ebay-dbc-template'.\n
:SEE-ALSO `*mon-ebay-images-path*', `mon-insert-ebay-dbc-file'.\n▶▶▶"
  (let (check-the-check)
    (while (not check-the-check) 
      (let ((check-path 
             (cond ((and (not (mon-buffer-written-p))
                         (or (string-match (concat *mon-ebay-images-temp-path* "/BMP-Scans/*") default-directory)
                             (string-match (concat *mon-ebay-images-bmp-path* "/*") default-directory)))
                    (if (yes-or-no-p (format 
                                      "Buffer not writen use filename: %s: "
                                      (concat (file-name-nondirectory (directory-file-name default-directory)) ".dbc")))
                        (concat default-directory (file-name-nondirectory (directory-file-name default-directory))".dbc")
                      default-directory))
                   ((and (mon-buffer-written-p)
                         (or (string-match (concat *mon-ebay-images-temp-path* "/BMP-Scans/*") default-directory)
                             (string-match  (concat *mon-ebay-images-bmp-path* "/*") default-directory)))
                    (concat default-directory 
                            (file-name-nondirectory (directory-file-name default-directory)) ".dbc"))
                   (t (let ((start-from (cond ((string-match (concat *mon-ebay-images-temp-path*) default-directory)
                                               default-directory)
                                              ((string-match  (concat *mon-ebay-images-bmp-path*) default-directory)
                                               default-directory)
                                              ((string-match  *mon-ebay-images-path* default-directory)
                                               default-directory)
                                              (t (concat *mon-ebay-images-temp-path* "/BMP-Scans/"))))
                            (new-dir))
                        (setq new-dir (read-directory-name 
                                       (concat "Not a good directory name to use w/ template insertion. "
                                               "You can either:\n"
                                               "a) Choose a better path (tab completes);\n"
                                               "b) Enter new path udner this (or other EBAY directory) to create.\n :")
                                       start-from))
                        (if (file-exists-p new-dir)
                            new-dir
                          (let* ((dir-file-str (concat (directory-file-name new-dir) "/"))
                                 (file-str (concat (or (when (buffer-file-name)
                                                         (file-name-nondirectory 
                                                          (file-name-sans-extension (buffer-file-name))))
                                                       (buffer-name))
                                                   ".dbc"))
                                 (chz-123 
                                  (completing-read
                                   (concat "The directory-chosen doesn't exist. Should we create the "
                                           "directory and write this buffer to a file there?\n"
                                           "Choice (3) prompts a new choice of directory/file pair.\n"   
                                           "Choice (2) creates the new directory and prompts alternate file name.\n"
                                           "Choice (1) creates the new directory and the auto provided filename.\n"
                                           "->" ;dir-file-str file-str "  :")
                                           "DIR-FILE-STR FILE-STR" "  :")
                                   '("1" "2" "3") nil t nil nil "1"))
                                 (made-a-new))
                            (cond ((string-equal chz-123 "3")
                                   nil)
                                  ((string-equal chz-123 "2")
                                   (progn 
                                     (setq made-a-new
                                           (concat dir-file-str
                                                   (file-name-sans-extension 
                                                    (read-string 
                                                     (concat "Provide an alternate filename \n" dir-file-str " :")
                                                     file-str nil file-str)) ".dbc"))
                                     made-a-new))
                                  ((string-equal chz-123 "1")
                                   (progn
                                     (setq made-a-new(concat dir-file-str file-str))
                                     made-a-new)))
                            (when made-a-new
                              (unwind-protect 
                                  (if (and (not (mon-buffer-written-p))
                                           (not (file-exists-p made-a-new)))
                                      (progn
                                        (make-directory (file-name-directory made-a-new) t)
                                        (write-file (concat dir-file-str file-str) t))
                                    (error (concat ":FUNCTION `mon-check-ebay-template-path' "
                                                   "-- something went wrong writing %s") made-a-new))
                                made-a-new))  )))))))
        (when check-path (setq check-the-check check-path))))
    check-the-check))

; :TEST-ME (mon-check-ebay-template-path)

;;; ==============================
;;; :NOTE Right now we're doing a query replace to catch the temp path.
;;; It might be easier to simply make the path relative e.g.
;;; (concat *mon-nef-scan-path* "/" (file-relative-name buffer-file-name *mon-nef-scan-path*))
;;; (file-relative-name buffer-file-name *mon-nef-scan-path*)
;;;
;;; :MODIFICATIONS <Timestamp: Wednesday July 22, 2009 @ 08:34.55 PM - by MON KEY>
;;; :CREATED <Timestamp: Wednesday April 29, 2009 @ 03:15.48 PM - by MON KEY>
(defun mon-insert-ebay-dbc-template (&optional insertp intrp) ;vars bound below may take &optional
  "Buffer local version of ebay template insertion utility.\n
Evaluate the global var `*mon-ebay-template*' and insert ebay html with
`mon-make-html-tree'.\n
:NOTE Use `mon-insert-ebay-html-tree' to insert _only_ the ebay-html-tree in
`current-buffer' at point.\n
:SEE-ALSO `mon-insert-ebay-dirs', `mon-insert-ebay-dbc-file',
`mon-insert-ebay-template', `mon-insert-ebay-html-tree', `mon-make-html-tree',
`mon-insert-ebay-dbc-file', `mon-insert-ebay-dbc-template',
`mon-check-ebay-template-path'.\n▶▶▶"
  (interactive "i\np")
  (let* ((curr-dir (mon-check-ebay-template-path))
         (catch-path 
          (concat "\\(\\(" *mon-ebay-images-temp-path* "/BMP-Scans\\)" "\\(/.*\\)\\)"))
         (fix-catch *mon-ebay-images-bmp-path*)
         (put-file-or-dir (if (mon-buffer-written-p)
                              (buffer-file-name)
                            curr-dir))
         ;; convert: *mon-ebay-images-temp-path* -> *mon-ebay-images-bmp-path* 
         (put-file 
          (cond ((not (string-match catch-path put-file-or-dir))
                 put-file-or-dir)
                ((= (string-match catch-path put-file-or-dir) 0)
                 (replace-regexp-in-string catch-path fix-catch put-file-or-dir nil nil 2))))
	 (put-dir (file-name-directory put-file)) ;; save for later - will prob. need
	 (file-no-d (file-name-nondirectory put-file)) ;; save for later - will prob. need
	 (file-no-ext (file-name-sans-extension put-file))
	 (make-html "(insert (mon-make-html-tree))"))
    (let ((put-temp (format 
                     *mon-ebay-template* 
                     put-file           ;; this file is:\n%s 
                     make-html          ;; <!-- html-template-starts-here
                     put-dir            ;; file-no-ext ;URLs inserted below for photo:
                     put-dir            ;; file-no-ext ;URLs inserted below for photo:
                     (file-name-sans-extension file-no-d)          ;; %s.dbc ends here
                    )))
           (if (or insertp intrp)
               (insert put-temp)
             put-temp))))
;;
;;; :TEST-ME (mon-insert-ebay-dbc-template)

;;; ==============================
;;; :TODO function to capture region between `▶▶▶' `◀◀◀'
;;; (skip-chars-forward "^▶▶▶" (1- (point-max))) 
;;; (skip-chars-forward "▶▶▶" (1- (point-max)))
;;; (skip-chars-forward "^◀◀◀" (1- (point-max)))
;;; (skip-chars-forward "◀◀◀" (1- (point-max)))
;;; <Timestamp: Friday May 22, 2009 @ 06:39.18 PM - by MON KEY>
;;; ==============================

;;; ==============================
;;; :CREATED <Timestamp: Friday May 22, 2009 @ 06:39.18 PM - by MON KEY>
;;; :MODIFICATIONS <Timestamp: Monday July 27, 2009 @ 01:53.42 PM - by MON KEY>
(defun mon-ebay-field-trigger (&optional insertp right-only left-only intrp)
  "Return ebay temmplate field delimiter. one of `▶▶▶', `◀◀◀', `▶▶▶'<nwln>`◀◀◀'.\n
Callled interactively inserts `▶▶▶'<nwln>`◀◀◀' at point.
When INSERTP is non-nil insert delimiter\(s\) according to args.
When LEFT-AND-RIGHT is non-nil insert as per interactive
When RIGHT-ONLY is non-nil insert `▶▶▶' - starting field trigger.
When LEFT-ONLY is non-nil insert optional `◀◀◀' - ending field trigger.\n
Following are the default values:\n
 ▶▶▶
 :NAME BLACK RIGHT-POINTING POINTER
 :CODE-POINT 0x25BA
 :CHARACTER ▶ (9658, #o22672, #x25ba) 
 \(mon-insert-unicode \"25BA\")\n
 ◀◀◀
 :NAME BLACK LEFT-POINTING POINTER
 :CODE-POINT 0x25C4
 :CHARACTER ◀ (9668, #o22704, #x25c4)
 \(mon-insert-unicode \"25C4\")\n
:EXAMPLE\n\n\(mon-ebay-field-trigger\)\n\(mon-ebay-field-trigger nil t\)\n
\(mon-ebay-field-trigger nil nil t\)\n
:SEE-ALSO Convienence functions `mon-insert-ebay-field-trigger-r',
`mon-insert-ebay-field-trigger-l', `mon-insert-ebay-field-trigger-l-and-r'
`mon-insert-doc-help-cookie'.\n▶▶▶"
  (interactive "i\ni\ni\np")
  (let ((field-trigger-r "▶▶▶")
	(field-trigger-l "◀◀◀"))
    (cond (intrp  (insert (format "%s\n%s" field-trigger-r field-trigger-l)))
          (insertp (cond (right-only (insert (format "%s" field-trigger-r)))
                         (left-only (insert (format "%s" field-trigger-l)))
                         (t (insert (format "%s\n%s" field-trigger-r field-trigger-l)))))
          (t (cond (right-only (format "%s" field-trigger-r))
                   (left-only (format "%s" field-trigger-l))
                   (t (format "%s\n%s" field-trigger-r field-trigger-l)))))))
;;
;;; :TEST-ME (mon-ebay-field-trigger)
;;; :TEST-ME (mon-ebay-field-trigger t)
;;; :TEST-ME (mon-ebay-field-trigger t nil t)
;;; :TEST-ME (mon-ebay-field-trigger nil t)
;;; :TEST-ME (mon-ebay-field-trigger nil nil t)
;;; :TEST-ME (call-interactively 'mon-ebay-field-trigger)

;;; ==============================
(defun mon-insert-ebay-field-trigger-r (&optional insrtp)
  "Insert the right point ebay field delim `▶▶▶'.\n
Delim defaults to:\n
 Name: BLACK RIGHT-POINTING POINTER
 ▶▶▶ | code point: 0x25BA
 character: ▶ (9658, #o22672, #x25ba) 
 \(mon-insert-unicode \"25BA\")\n
:EXAMPLE\n\n\(mon-insert-ebay-field-trigger-r\)\n
:NOTE Convienence function for `mon-ebay-field-trigger'.\n
:SEE-ALSO`mon-insert-ebay-field-trigger-r',
`mon-insert-ebay-field-trigger-l-and-r', `mon-insert-doc-help-cookie'.\n▶▶▶"
  (interactive "p")
  (if insrtp
      (mon-ebay-field-trigger t t)
    (mon-ebay-field-trigger nil t)))
;;
(defun mon-insert-ebay-field-trigger-l (&optional insrtp)
  "Insert the right point ebay field delim. `◀◀◀'\n
Delim defaults to:\n
 Name: BLACK LEFT-POINTING POINTER
 ◀◀◀ | code point: 0x25C4
 character: ◀ (9668, #o22704, #x25c4)
 \(mon-insert-unicode \"25C4\")\n
:EXAMPLE\n(mon-insert-ebay-field-trigger-l\)\n
:NOTE Convienence function for `mon-ebay-field-trigger'
:SEE-ALSO`mon-insert-ebay-field-trigger-r',
`mon-insert-ebay-field-trigger-l-and-r', `mon-insert-doc-help-cookie'.\n▶▶▶"
  (interactive "p")
  (if insrtp
      (mon-ebay-field-trigger t nil t)
    (mon-ebay-field-trigger nil nil t)))
;;
(defun mon-insert-ebay-field-trigger-l-and-r (&optional insrtp)
  "Insert at point the right and left ebay field delim.\n
:EXAMPLE\n\(mon-insert-ebay-field-trigger-l-and-r\)\n
Convienence function for `mon-ebay-field-trigger'.
:SEE-ALSO `mon-insert-ebay-field-trigger-r', 
`mon-insert-ebay-field-trigger-l', `mon-insert-doc-help-cookie'.\n▶▶▶"
  (interactive "p")
  (if insrtp
      (mon-ebay-field-trigger t)
    (mon-ebay-field-trigger)))

;;; ==============================
;;; :TODO incorporate: 
;;; mon-insert-ebay-bmps-in-file
;;; (mon-get-ebay-bmps-list)
;;; (mon-get-ebay-bmps-in-dir t)
;;; mon-insert-ebay-jpgs-in-file
;;; mon-get-ebay-jpgs-list
;;; mon-get-ebay-bmps-count mon-get-ebay-jpgs-count
;;; mon-get-ebay-img-count-verify
;;;
;;; :CREATED <Timestamp: Wednesday April 29, 2009 @ 03:14.49 PM - by MON KEY>
(defun mon-insert-ebay-photo-per-scan-descr (times-to-put item-number)
  "Inserts template to describe items according to their eBay scan number.
Interactively Minibuffer prompts for TIMES-TO-PUT arg:\n
    \'Number of image descriptions needed :\'\n
and ITEM-NUMBER arg;\n
    \'Item number being described :\'\n
Each item description inserted step item number count eNNNN-N by 1 from 0 e.g.:\n
 ---\n e1018-0.bmp\n Image-title: \n Image-Description: 
:SEE-ALSO `mon-insert-ebay-bmps-in-file', `mon-insert-ebay-dirs',
`mon-get-ebay-jpgs-list', `mon-get-ebay-bmps-in-dir'.\n▶▶▶"
  (interactive "nNumber of image descriptions needed :\nnItem number being described :")
  (let ((times times-to-put)
        (item-num item-number)
        (count 0))
    (while (>= times count)
      (insert (format (concat "\n▶▶▶\nebay-scan: e%d-%d.bmp\n"
			      "Image-title:\nImage-description:\n◀◀◀\n") item-num  count))
      (setq count (1+ count)))))

;;; :TEST-ME (mon-insert-ebay-photo-per-scan-descr 3 1143)
;;; :TEST-ME (call-interactively 'mon-insert-ebay-photo-per-scan-descr)

;;; ==============================
;;; Courtesy: Xah Lee (URL `http://xahlee.org/emacs/elisp_image_tag.html')
;;; :MODIFICATIONS <Timestamp: Saturday April 25, 2009 @ 05:35.54 PM - by MON KEY>
;;; Regexp for `image-name' var, subst for `myResult'
(defun mon-ebay-image-linkify ()
  "Replace the path to image file with an HTML <img> tag.\n
:EXAMPLE\nIf cursor is on the word \"emacs_logo.png\", becomes:\n
 \"<img src=\"emacs_logo.png\" alt=\"emacs logo\" width=\"123\" height=\"456\">\".
This function requires ImageMagicks \"identify\" command.\n
:SEE (URL `www.ImageMagick.com')\n
:SEE-ALSO `mon-ebay-image-linkify-lite',`mon-insert-ebay-template',
`mon-insert-ebay-html-tree', `mon-make-html-tree', `mon-insert-ebay-dbc-file',
`mon-insert-ebay-dbc-template'.\n▶▶▶"
(interactive)
  (let (img-file-path 
	bounds 
	image-name 
	image-name-no-ext 
	image-no
	img-dim 
	img-md5
	width 
	height 
	altText 
	myResult)
    (setq img-file-path (thing-at-point 'filename))
    (setq bounds (bounds-of-thing-at-point 'filename))
    (setq image-name  (replace-regexp-in-string 
                       (concat (file-name-as-directory *mon-ebay-images-path*)
                               ".*\\(/e[0-9]\\{4,4\\}/\\)") "" img-file-path))
    (setq image-name-no-ext (replace-regexp-in-string "\\-[0-9]\\.jpg" "" image-name))
    (setq image-no (replace-regexp-in-string "\\e[0-9]\\{4,4\\}-" "" image-name))
    (setq image-no (replace-regexp-in-string "\\.jpg" "" image-no))
    (setq altText  (replace-regexp-in-string "\\.[A-Za-z]\\{3,4\\}$" "" image-name t t)) 
    (setq altText  (replace-regexp-in-string "_" " " altText t t))
    (setq altText  (concat  "Photo: " image-no
                            " this " *mon-html-domain-for-ebay-template*
                            " ebay-item-no: " (replace-regexp-in-string "\\-[0-9]\\.jpg" "" image-name)))
    (setq img-dim (mon-get-image-dimensions img-file-path))
    (setq img-md5 (car (mon-get-image-md5 img-file-path)))
    (setq width (number-to-string (car img-dim)))
    (setq height (number-to-string (car (last img-dim))))
    (setq myResult  
	  (concat 
           "<img src=\"http://www." *mon-html-domain-for-ebay-template* ".com/photos/ebay/" image-name "\""
           "\n     class=\"int_" image-name-no-ext "_" image-no "_" *mon-html-domain-for-ebay-template* ".com\""
           "\n     id=\"ΡΗ0T0-no-" image-no "¦"  image-name-no-ext  (cdr (assoc 1 *mon-ebay-image-linkify-templates*))"\""
           "\n     MD=\"Δ_md5¦" img-md5 "¦_" *mon-html-domain-for-ebay-template* "_checksum_Δ\""
           "\n     longdesc=\"item→" image-name-no-ext "_eßay_ΡΗΟτΟ_No_" (cdr (assoc 2 *mon-ebay-image-linkify-templates*)) "\""
           "\n     width=\"" width "\" "
           "\n     height=\"" height "\""			    
           "\n     alt=\"" altText "\""			  
           "\n     title=\"◊" *mon-html-domain-for-ebay-template* "·com◊_item_" 
           image-name-no-ext "_photo_" image-no "_of_ebay-listing""\"/>"))
    (save-excursion
      (delete-region (car bounds) (cdr bounds))
      (insert myResult))))

;;; ==============================
(defun mon-ebay-image-linkify-lite ()
  "Replace the path to image file with an HTML <img> tag.\n
This function requires ImageMagicks \"identify\" command.\n
:SEE (URL `www.ImageMagick.com')\n
:SEE-ALSO `mon-ebay-image-linkify'`mon-insert-ebay-template',
`mon-insert-ebay-html-tree', `mon-make-html-tree', `mon-insert-ebay-dbc-file',
`mon-insert-ebay-dbc-template'.\n▶▶▶"
  (interactive)
  (let (img-file-path 
	bounds 
	image-name 
	image-name-no-ext 
	image-no
	img-dim 
	img-md5
	width 
	height 
	altText 
	myResult)
    (setq img-file-path (thing-at-point 'filename))
    (setq bounds (bounds-of-thing-at-point 'filename))
    (setq image-name (replace-regexp-in-string 
                      (concat (file-name-as-directory *mon-ebay-images-path*)
                              ".*\\(/e[0-9]\\{4,4\\}/\\)") "" img-file-path))
    (setq image-name-no-ext (replace-regexp-in-string "\\-[0-9]\\.jpg" "" image-name))
    (setq image-no (replace-regexp-in-string "\\e[0-9]\\{4,4\\}-" "" image-name))
    (setq image-no (replace-regexp-in-string "\\.jpg" "" image-no))
    (setq altText (replace-regexp-in-string "\\.[A-Za-z]\\{3,4\\}$" "" image-name t t)) 
    (setq altText (replace-regexp-in-string "_" " " altText t t))
    (setq altText (concat 
		   "Photo: " image-no
		   " this " *mon-html-domain-for-ebay-template* ".com ebay-item-no: " 
		   (replace-regexp-in-string "\\-[0-9]\\.jpg" "" image-name)))
    (setq img-dim (mon-get-image-dimensions img-file-path))
    (setq img-md5 (car (mon-get-image-md5 img-file-path)))
    (setq width (number-to-string (car img-dim)))
    (setq height (number-to-string (car (last img-dim))))
    (setq myResult  
          (concat 
           "(html-img :src \"http://www." *mon-html-domain-for-ebay-template* ".com/photos/ebay/" image-name "\""
           "\n     :class \"int_" image-name-no-ext "_" image-no "_" *mon-html-domain-for-ebay-template* ".com\""
           "\n     :id \"ΡΗ0T0-no-" image-no "¦"  image-name-no-ext (cdr (assoc 1 *mon-ebay-image-linkify-templates*))"\""
           "\n     :MD \"Δ_md5¦" img-md5 "¦_" *mon-html-domain-for-ebay-template* "_checksum_Δ\""
           "\n     :longdesc \"item→" image-name-no-ext "_eßay_ΡΗΟτΟ_No_" image-no (cdr (assoc 2 *mon-ebay-image-linkify-templates*)) "\""
           "\n     :width \"" width "\" "
           "\n     :height \"" height "\""
           "\n     :alt \"" altText "\""
           "\n     :title \"◊" *mon-html-domain-for-ebay-template* "·com◊_item_" 
           image-name-no-ext "_photo_" image-no "_of_ebay-listing\")"
           ))
    (save-excursion
      (delete-region (car bounds) (cdr bounds))
      (insert myResult))))

;; (assoc 1 *mon-ebay-image-linkify-templates*)

;;; ==============================
(provide 'ebay-template-tools)
;;; ==============================

;;; ====================================================================
;;; ebay-template-tools.el ends here
;;; EOF



