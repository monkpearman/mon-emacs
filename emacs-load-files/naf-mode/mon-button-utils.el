;;; mon-button-utils.el --- utilities for examining button properties
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2010-2012 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-button-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2010-09-14T17:56:12-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: button, emacs, lisp

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-button-utils provides { some description here. }
;;
;; FUNCTIONS:▶▶▶
;; `mon-button-get-plist', `mon-button-get-plist-props',
;; `mon-button-at-point-p', `mon-button-at-point-describe-button-plist',
;; `mon-follow-button', 
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
;; `*mon-button-utils-xrefs*',
;;
;; GROUPS:
;; `mon-button-utils',
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
;; URL: https://github.com/mon-key/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-button-utils.el
;; EMACSWIKI-URL:  http://www.emacswiki.org/emacs/mon-button-utils.el
;; FIRST-PUBLISHED:<Timestamp: #{2010-09-14T20:58:02-04:00Z}#{10372} - by MON>
;;
;; EMACSWIKI: { URL of an EmacsWiki describing mon-button-utils. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2010-09-14T17:56:12-04:00Z}#{10372} - by MON KEY>
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
;; Copyright © 2010-2012 MON KEY 
;;; ==============================

;;; CODE:


(eval-when-compile (require 'cl))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

(require 'button)


;;; ==============================
;;; :CHANGESET 2387
;;; :CREATED <Timestamp: #{2011-01-11T14:21:04-05:00Z}#{11022} - by MON KEY>
(defgroup mon-button-utils nil
  "Customization group for variables and functions of :FILE mon-button-utils.el.\n
:SEE-ALSO .\n▶▶▶"
  :link '(url-link 
          :tag ":EMACSWIKI-FILE" "http://www.emacswiki.org/emacs/mon-button-utils.el")
  :link '(url-link 
          :tag ":GITHUB-FILE" 
          "https://github.com/mon-key/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-button-utils.el")
  :link '(emacs-library-link "mon-button-utils.el")
  :group 'mon-base)

;;; ==============================
;;; :CHANGESET 2142
;;; :CREATED <Timestamp: #{2010-09-20T13:36:20-04:00Z}#{10381} - by MON KEY>
(defcustom *mon-button-utils-xrefs* 
  '(*mon-button-utils-xrefs*
    mon-button-get-plist
    mon-button-get-plist-props
    mon-button-at-point-p
    mon-button-at-point-describe-button-plist
    *mon-default-button-map*)
  "Xrefing list mon button related functions and variables.\n
Symbols  defined in :FILE mon-button-utils.el\n
:EXAMPLE\n\n(memq 'mon-button-get-plist *mon-button-utils-xrefs*)
:SEE-ALSO `*mon-regexp-symbols-xrefs*', `*mon-button-utils-xrefs*',
`*mon-default-loads-xrefs*', `*mon-default-start-loads-xrefs*',
`*mon-dir-locals-alist-xrefs*', `*naf-mode-xref-of-xrefs*',
`*mon-testme-utils-xrefs*', `*mon-xrefs-xrefs*'.\n▶▶▶"
  :type '(repeat symbol)
  :group 'mon-button-utils
  :group 'mon-xrefs)

;;; ==============================
;;; :CHANGESET 2142
;;; :CREATED <Timestamp: #{2010-09-20T13:40:28-04:00Z}#{10381} - by MON KEY>
(defvar *mon-default-button-map*
  (let ((map (make-sparse-keymap "MON default button map")))
    ;;(define-key map "\C-cdb"  'push-button)
    (define-key map "\C-cdb"   'mon-follow-button)
    (define-key map [mouse-2] 'push-button)
    map)
  "*Keymap for buttons inheriting from button-type `naf-dir`.\n
:EXAMPLE\n
:SEE-ALSO .\n▶▶▶")

;;; ==============================
(define-button-type 'mon-default-button ;:supertype 'default-button
  )
  ;; 'help-echo "Click for NAF directory"
  ;; 'keymap *mon-default-button-map*
  ;; :mon-button-label 
  ;; :naf-path-label  "naf dirctory path"
  ;; :naf-dir-label "naf name"
  ;; ;;'action #'naf-btn-activate
  ;; :button-doc #'(lambda () (apropos-describe-plist (button-category-symbol 'naf-dir)))
  ;; )

;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-14T12:09:11-04:00Z}#{10372} - by MON KEY>
(defun mon-button-at-point-p (&optional putative-button-at)
  "Return non-nil when ther is a `button` property on char at point.\n
Arg PUTATIVE-BUTTON-AT is a buffer-position to check.
:EXAMPLE\n\n\(progn
  \(goto-char \(buffer-end 0\)\)
  \(while \(not \(get-char-property \(point\) 'button\)\) \(forward-char\)\)
  \(point\)\)\n
:SEE-ALSO `mon-button-get-plist', `mon-button-get-plist-props',
`mon-button-at-point-p', `mon-button-at-point-describe-button-plist'
`mon-get-overlays-map-props', `mon-get-overlays-region',
`mon-get-overlays-buffer', `mon-help-find-result-for-overlay',
`mon-help-overlay-for-example', `mon-help-overlay-on-region',
`mon-help-overlay-result', `mon-get-overlays-buffer',
`mon-help-overlay-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties'.\n▶▶▶"
  (let ((gcp-btn (get-char-property (or putative-button-at (point)) 'button))
        hld-prps)
    (when gcp-btn
      (setplist hld-prps 
                (cond ((car-safe gcp-btn)
                       `(:BUTTON-CATEGORY-SYMBOL ,(get-char-property (or putative-button-at (point)) 'category) 
                         :BUTTON-TXTPROP t :BUTTON-OVERLAY nil))
                      ((overlayp gcp-btn)
                       `(:BUTTON-CATEGORY-SYMBOL ,(overlay-get gcp-btn 'category) 
                         :BUTTON-OVERLAY t :BUTTON-IS-TEXT nil))))
      (setq gcp-btn (symbol-plist (plist-get (symbol-plist hld-prps) :BUTTON-CATEGORY-SYMBOL)))
      ;;(setq hld-prps 
      (plist-put (symbol-plist hld-prps) :BUTTON-PLIST gcp-btn)
      (let ((btn-pl-prps (plist-get (symbol-plist hld-prps) :BUTTON-PLIST))
            invrt-bpp)
        (when (plist-get btn-pl-prps 'type)
          (plist-put (symbol-plist hld-prps) :BUTTON-TYPE (plist-get btn-pl-prps 'type)))
        (when (plist-get btn-pl-prps 'supertype)
          (plist-put (symbol-plist hld-prps) :BUTTON-SUPER (plist-get btn-pl-prps 'supertype))))
      (symbol-plist hld-prps))))

;;; ==============================
;;; This works except for the ugly symbol name handling:
;;; :CHANGESET 2133
;;; :CREATED <Timestamp: #{2010-09-14T20:17:15-04:00Z}#{10372} - by MON KEY>
(defun mon-button-at-point-describe-button-plist (&optional button-at-psn)
  "Return pp'd display of buttons current props as if by `apropos-describe-plist'.
:EXAMPLE\n\n
:SEE-ALSO `apropos-describe-plist' `mon-button-get-plist', `mon-button-get-plist-props',
`mon-button-at-point-p', `mon-button-at-point-describe-button-plist',
`mon-get-overlays-map-props', `mon-get-overlays-region',
`mon-get-overlays-buffer', `mon-help-find-result-for-overlay',
`mon-help-overlay-for-example', `mon-help-overlay-on-region',
`mon-help-overlay-result', `mon-get-overlays-buffer',
`mon-help-overlay-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties'.\n▶▶▶"
  (interactive)
  (let ((mbapp (make-symbol "--temp-adp--"))) 
    (setplist mbapp 
              (mon-button-at-point-p (or button-at-psn (point))))
    (apropos-describe-plist mbapp)))

;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-14T11:41:00-04:00Z}#{10372} - by MON KEY>
(defun mon-button-get-plist (type-button)
  "Return a plist of enumerating properites for a button-type.\n
TYPE-BUTTON is a button constructed with `define-button-type'
Properties returned are those from the plist of symbol returned from
`button-category-symbol' with TYPE-BUTTON as arg.
:NOTE Directly accessing the button properties associated with the TYPE-BUTTON
symbol is not possible as that symbol does not actually hold the button
properties associated with it.\n
When `define-button-type' constructs a button it generates a separate uninterned
symbol having the form:\n
 <SYMBOL>-button|n
As such, accessors of button properties are indirected through this separate
uninterned symbol via its `category` property. Because the `category` property
is implemented by both overlays and text-properties this indirection allows: 
- flexible creation of buttons with `make-text-button', `make-button' or
  directly with `make-overlay', `overlay-put', `add-text-properties', etc.;\n
- guarding against inadverdent name clashes; 
- provision of a lightweight subertype <-> subtype inheritance hierarchy which
  can be shared/extended/modified across the entire regime of Eacs
  \"text-property\" frobbing facilites i.e. text-properties, overlays, widgets,
  faces, char-properties, keymaps. etc.
:EXAMPLE\n\n
:SEE-ALSO `mon-button-get-plist', `mon-button-get-plist-props',
`mon-button-at-point-p', `mon-button-at-point-describe-button-plist',
`mon-get-overlays-map-props', `mon-get-overlays-region',
`mon-get-overlays-buffer', `mon-help-find-result-for-overlay',
`mon-help-overlay-for-example', `mon-help-overlay-on-region',
`mon-help-overlay-result', `mon-get-overlays-buffer',
`mon-help-overlay-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties'.\n▶▶▶"
  (let ((get-bcs (and (bound-and-true-p type-button)
                      (get type-button 'button-category-symbol))))
    (unless (null get-bcs)
      `(:BUTTON-TYPE ,type-button
        :BUTTON-CATEGORY-SYMBOL ,get-bcs
        :BUTTON-PLIST ,(symbol-plist get-bcs)))))

;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-14T10:50:10-04:00Z}#{10372} - by MON KEY>
(defun mon-button-get-plist-props (type-of-button)
  "Return a plist properties for TYPE-OF-BUTTON.\n
TYPE-OF-BUTTON is a button constructed with `define-button-type'.\n
:EXAMPLE\n\n\(mon-button-get-plist-props 'button\)\n
:ALIASED-BY `mon-get-button-plist-props'\nn
:SEE-ALSO `mon-button-get-plist', `mon-button-at-point-p',
`mon-button-at-point-describe-button-plist', `mon-get-overlays-map-props',
`mon-get-overlays-region', `mon-get-overlays-buffer',
`mon-help-find-result-for-overlay', `mon-help-overlay-for-example',
`mon-help-overlay-on-region', `mon-help-overlay-result',
`mon-get-overlays-buffer', `mon-help-overlay-functions',
`mon-help-text-property-functions', `mon-help-text-property-properties'.\n▶▶▶"
  (let* ((cp-sypl (mon-button-get-plist type-of-button))
         (cp-pl   (unless (null cp-sypl) 
                    (plist-get cp-sypl :BUTTON-PLIST)))
        hds)
    (unless (null cp-pl)
      (while cp-pl
        (push (car cp-pl) hds)
        (setq cp-pl (cddr cp-pl)))
        (nreverse hds))))
;; 
(defalias 'mon-get-button-plist-props 'mon-button-get-plist-props)
;;
;;; :TEST-ME (mon-button-get-plist-props 'naf-button)


;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:13:16-04:00Z}#{10371} - by MON KEY>
(defun mon-follow-button ()
  "
:EXAMPLE\n\n
:SEE-ALSO .\n▶▶▶"
  (interactive)
  (button-activate (button-at (point))))


;;;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;;; :NOTE  STOPPED ON THIS WORKING HERE
;;;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

;;; ==============================
;;; :NOTE The idea here is to use the `help-echo` function property to do so
;;; extra work for us e.g.:
;;; (funcall (plist-get (symbol-plist (button-category-symbol 'naf-dir)) :button-doc))
;;; => (:button-doc "bubba?" :naf-path "~/" :naf-label "bubba" category naf-artist-button button (t) fontified t)
;;; 
;;;
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:19:08-04:00Z}#{10371} - by MON KEY>
;; (defun mon-button-describe ()
;;   "Return a nice pp'd display of buttons current props and echo them with `help-echo' <FUNCTION>
;; :EXAMPLE\n\n
;; :SEE-ALSO .\n▶▶▶"
;;   (if (not bap )
;;       (minibuffer-message (concat ":FUNCTION `mon-button-describe'"
;;                                   "-- no button at point %d:") (point))
;;     ))


;;; ==============================
;; slime-range-button, slime-part-number, slime-action-number
;;; :WAS `slime-inspector-insert-more-button'
;; (defun mon-inspector-insert-more-button (index previous)
;;   (mon-insert-w-text-properties
;;    (list 'slime-range-button (list index previous)
;;          'mouse-face 'highlight
;;          'face '<FACE>)
;;    (if previous " [--more--]\n" " [--more--]")))
;;
;; `slime-inspector-insert-ispec'
;; (defun mon-inspector-insert-ispec (ispec)
;;   (if (stringp ispec)
;;       (insert ispec)
;;     (destructure-case  ;; macro in slime.el
;;         ispec
;;       ((:value string id)
;;        (mon-set-text-properies-region 
;;         (list 'slime-part-number id 
;;               'mouse-face 'highlight
;;               'face '<FACE>)
;;         (insert string)))
;;       ((:action string id)
;;        (mon-insert-w-text-properties 
;;         (list 'slime-action-number id
;;               'mouse-face 'highlight
;;               'face '<FACE>)
;;         string)))))

;; sldb-default-action
;; sldb-default-action/mouse

;;; ==============================
;;; :CHANGESET 2133
;;; :CREATED <Timestamp: #{2010-09-14T20:39:44-04:00Z}#{10372} - by MON KEY>
(defun tt--make-test-button ()
  "
:EXAMPLE\n\n
:SEE-ALSO .\n▶▶▶"
  (interactive)
  (save-excursion 
    (print ':TEXT-PROP-SYTLE-BUTTON (current-buffer))
    (apply #'make-text-button
           (prog1 (point) (insert name))
           (point)
           `(:naf-label "t-prop-stylee" :naf-path "~/" :button-doc "tp doc test" :type naf-artist)))
  (print ':OVERLAY-SYTLE-BUTTON (current-buffer))
  (save-excursion (insert "overlay-stylee\n\n"))
  (make-button (point) (+ 14 (point)) :naf-label "overlay-stylee" :naf-path "~/" :type 'naf-artist))

;; (let ((mbapp (mon-button-at-point-p))
;;       (pp-bfr (get-buffer-create "*MON-BUTTON-PROPS*")))
;;   (with-current-buffer pp-bfr
;;     (erase-buffer)
;;     (let ((standard-output (current-buffer)))
;;       (pp mbapp))
;;     (display-buffer pp-bfr t)))

;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:12:37-04:00Z}#{10371} - by MON KEY>
(defvar *naf-button-map* 
  (let ((map (make-sparse-keymap "naf button map")))
    ;;(define-key map "\C-cdb"  'push-button)
    (define-key map "\C-cdb"   'naf-follow-button)
    (define-key map [mouse-2] 'push-button)
    map)
  "*Keymap for buttons inheriting from button-type `naf-dir`.
:EXAMPLE
:SEE-ALSO .\n▶▶▶")


;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:13:44-04:00Z}#{10371} - by MON KEY>
(defface naf-mode-artist-face-inverted
  '((((class color))
     :foreground "yellow"
     :background "grey75"
     :box (:line-width 1 :color "yellow" :style "pressed-button")
     :inherit button))
  ""
  :group 'naf-mode)
;;
;; (describe-face 'naf-mode-artist-face-inverted)
;; (unintern 'naf-mode-artist-face-inverted)


;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:12:44-04:00Z}#{10371} - by MON KEY>
(define-button-type 'naf-dir
  'help-echo "Click for NAF directory"
  'keymap *naf-button-map* 
  :naf-path-label  "naf dirctory path"
  :naf-dir-label "naf name"
  ;;'action #'naf-btn-activate
  :button-doc #'(lambda () (apropos-describe-plist (button-category-symbol 'naf-dir)))
  )
;; (symbol-plist 'naf-dir)
;; (funcall (plist-get (symbol-plist (button-category-symbol 'naf-dir)) :button-doc))
;;
;; (progn (unintern 'naf-dir) (unintern 'naf-dir-button))

;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:12:48-04:00Z}#{10371} - by MON KEY>
(define-button-type 'naf-artist :supertype 'naf-dir
  'face 'naf-mode-artist-face
  'mouse-face 'naf-mode-artist-face-inverted
  'follow-link t
  ;; 'help-echo 'echo-has-naf
  'action (lambda (button)
            (dired  (button-get button :naf-path)))
  'mouse-action (lambda (button)
                  (dired  (button-get button :naf-path)))
  :button-doc #'(lambda () (apropos-describe-plist (button-category-symbol 'naf-artist)))
  )
;;
;; (symbol-plist 'naf-artist)
;; (funcall (plist-get (symbol-plist (button-category-symbol 'naf-artist)) :button-doc))
;;
;; (save-excursion (newline)
;; (apply #'make-text-button
;;        (prog1 (point) (insert name))
;;        (point)
;;        `(:type naf-artist :naf-label "naf artist test" :naf-path "~/" :button-doc "naf artist test doc")))
;;
;; (progn (unintern 'naf-artist) (unintern 'naf-artist-button))


;;; ==============================
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-13T23:12:52-04:00Z}#{10371} - by MON KEY>
(defun insert-naf-artist-button (name path)
  "Insert a button to the an artist NAF directory PATH for NAME.\n
NAME is an NAF artist name.
PATH is a path to the artist naf directory.\n
:EXAMPLE\(let \(\(inhibit-read-only t\)\)
   \(insert-naf-artist-button \"bubba the grand\" default-directory\))

:SEE-ALSO .\n▶▶▶"
  (let ((name-l (length name)))
    (apply #'make-text-button
           (prog1 (point) (insert name))
           (point)
           `(:type naf-artist :naf-label ,name :naf-path ,path))))
;;
;;; (insert-naf-artist-button "bubba the grand" default-directory)


;;; ==============================
;;; :COURTESY :FILE button.el
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-14T11:43:04-04:00Z}#{10372} - by MON KEY>
(defun naf-btn-activate (button)
  "
:EXAMPLE\n\n
:SEE-ALSO .\n▶▶▶"
  (button-activate 
   (or (naf-next-label-button (button-start button))
       (minibuffer-message (concat ":FUNCTION `naf-btn-activate' "
                                   "-- no path for button: %s")
                           button))))


;;; ==============================
;;; :COURTESY :FILE button.el
;;; :CHANGESET 2128
;;; :CREATED <Timestamp: #{2010-09-14T11:43:10-04:00Z}#{10372} - by MON KEY>
(defun naf-next-label-button (bttn-psn)
  "
:EXAMPLE\n\n
:SEE-ALSO .\n▶▶▶"
  (let* ((button (next-button bttn-psn t))
	 (already-hit-symbol nil)
	 (label (and button (button-get button :naf-label)))
	 (type (and button (button-get button 'type))))
    (while (and button
		(not label)
		(or (not (eq type :naf-dir))
		    (not already-hit-symbol)))
      (when (eq type 'naf-dir)
	(setq already-hit-symbol t))
      (setq button (next-button (button-start button)))
      (when button
	(setq label (button-get button :naf-label))
	(setq type (button-get button 'type))))
    (and label button)))


;;; ==============================
(provide 'mon-button-utils)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ====================================================================
;;; mon-button-utils.el ends here
;;; EOF
