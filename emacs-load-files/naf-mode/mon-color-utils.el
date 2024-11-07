;;; mon-color-utils.el --- fncns for manipulating/examinaning color values
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-color-utils.el
;; AUTHOR: 
;; MAINTAINER: MON KEY
;; CREATED: 2009-09-04T16:06:46-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: color, lisp, display, tools

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-color-utils provides an assembled set of routines pertinent to
;; manipulations/examinations of color. There is nothing new in here. 
;; Everything presented herein has been made available separately
;; elsewhere, including:
;;
;; Juri Linkov's list-colors,rgb->hsv routines, etc. 
;;
;; An implementation of ``colorcomp'' from info node:
;; `(elisp) Abstract Display Example'; 
;; 
;; A snippet of commented out code from faces.el;
;;
;; `*mon-list-colors-sort*' (&etc.) WAS: Juri Linkov's `list-colors-sort' etc.
;; See inline for addtional comments/sources.
;;
;; `mon-defined-colors-without-duplicates' <- faces.el
;;
;; The code of `mon-colorcomp' (&etc.) was lifted verbatim from: 
;; (info "(elisp)Abstract Display Example") w/ minor modification to the
;; completely (IMHO) nonsensical key-bindings of the original example.
;; 
;; !!!The MON KEY does not claim authorship of _any_ of the individual 
;; components included of this file. The only act of authorship on MON's part
;; is their assembly in the aggregate.!!!
;;
;; FUNCTIONS:▶▶▶
;; `mon-color-random-rgb', `mon-color-random-html',
;; `mon-rgb-to-hsv', `mon-colorcomp-pp',`mon-colorcomp', `mon-colorcomp-mod',
;; `mon-colorcomp-R-more', `mon-colorcomp-G-more', `mon-colorcomp-B-more',
;; `mon-colorcomp-R-less', `mon-colorcomp-G-less', `mon-colorcomp-B-less',
;; `mon-colorcomp-copy-as-kill-and-exit', `mon-color-mix', `mon-color-mix-display',
;;  `mon-color-list-display', `mon-color-read', `mon-colorcomp-get-data',
;; `mon-colorcomp-get-buffer', `mon-colorcomp-get-data-rgb-hex',
;; `mon-colorcomp-get-saturion-rgb',
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
;; `*mon-colorcomp-ewoc*', `*mon-colorcomp-data*',
;; `*mon-colorcomp-mode-map*',`*mon-colorcomp-labels*',
;; `*mon-colorcomp-buffer-name*', `*mon-colorcomp-adjust-alist*'
;;
;; ALIASED/ADVISED/SUBST'D:
;; `list-colors-defined'       -> `defined-colors'
;; `mon-color-list-defined'    -> `defined-colors'
;; `mon-color-list-duplicates' -> `list-colors-duplicates'
;; `mon-color-read'            -> `read-color' 
;; `mon-color-adjust'          -> `mon-colorcomp'
;; `mon-color-read'            -> `mon-read-color'
;;
;; DEPRECATED:
;; `mon-list-colors-key', `*mon-list-colors-sort*',
;;
;; RENAMED:
;;
;; MOVED:
;;
;; TODO:
;;
;; NOTES:
;; An archived version of the ``Color space FAQ'' circa 1994:
;; :SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2000-11/msg00118.html')
;;
;; SNIPPETS:
;;
;; REQUIRES:
;; `ewoc' ; mon-color-comp functions
;; mon-utils.el ;; `mon-color-mix' uses `mon-mapcar'
;;
;; THIRD-PARTY-CODE:
;; :FOLLOWING `list-colors-display', `list-colors-key', `list-colors-sort', `rgb-to-hsv'
;; :FROM :SOURCE (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00188.html')
;;
;; FOLLOWING: `list-colors-display', `list-colors-key', `list-colors-sort', `rgb-to-hsv'
;; FROM: SOURCE: (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00188.html')
;;
;; FIRST-PUBLISHED: <Timestamp: #{2009-09-22} - by MON KEY>
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-09-04T16:06:46-04:00Z}#{09365} - by MON KEY>
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

(eval-when-compile (require 'cl-lib))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

 ;; `mon-mapcar' <- `mon-color-mix'
(declare-function mon-mapcar "mon-seq-utils" (mapcar-fun mapcar-lst &rest more-lsts))


;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T13:58:18-04:00Z}#{24375} - by MON KEY>
(defgroup mon-color-utils  nil
  "Customization group for variables and functions of :FILE mon-color-utils.el\n
:SEE-ALSO `mon-base', `mon-xrefs', `mon-macs', `mon-dir-locals', `mon-error-warn',
`mon-regexp-symbols', `mon-dir-utils', `mon-line-utils', `mon-seq-utils',
`mon-plist-utils', `mon-string-utils', `mon-insertion-utils',
`mon-replacement-utils', `mon-buffer-utils', `mon-window-utils',
`mon-button-utils', `mon-type-utils', `mon-type-utils-vars', `mon-image-utils',
`mon-bzr-utils', `mon-env-proc-utils', `mon-testme-utils', `mon-error-utils',
`mon-url-utils', `mon-boxcutter'.\n▶▶▶"
  :link '(emacs-library-link "mon-color-utils.el")
  :group 'mon-base)

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T14:04:45-04:00Z}#{24375} - by MON KEY>
(defcustom *mon-color-utils-xrefs* 
  '(mon-color-list-display
    mon-color-random-rgb
    mon-color-random-html
    mon-color-mix
    mon-color-mix-display
    mon-defined-colors-without-duplicates
    mon-rgb-to-hsv
    mon-color-read
    mon-colorcomp-get-data
    mon-colorcomp
    mon-colorcomp-pp
    mon-colorcomp-mod
    mon-colorcomp-R-more
    mon-colorcomp-R-less
    mon-colorcomp-G-more
    mon-colorcomp-G-less
    mon-colorcomp-B-more
    mon-colorcomp-B-less
    mon-colorcomp-copy-as-kill-and-exit
    mon-colorcomp-get-buffer
    mon-colorcomp-get-data-rgb-hex
    mon-colorcomp-get-saturion-rgb
    ;; :VARIABLES
    *mon-colorcomp-mode-map*
    *mon-colorcomp-ewoc*
    *mon-colorcomp-data*
    *mon-colorcomp-mode-map*
    *mon-colorcomp-labels*
    *mon-colorcomp-buffer-name*
    *mon-colorcomp-adjust-alist*
    )
  "Xrefing list of mon string related symbols, functions constants, and variables.\n
The symbols contained of this list are defined in :FILE mon-color-utils.el\n
:SEE-ALSO `*mon-default-loads-xrefs*', `*mon-default-start-loads-xrefs*',
`*mon-dir-locals-alist-xrefs*', `*mon-testme-utils-xrefs*',
`*mon-button-utils-xrefs*', `*mon-buffer-utils-xrefs*',
`*mon-line-utils-xrefs*', `*mon-plist-utils-xrefs*'
`*mon-seq-utils-xrefs*', `*mon-window-utils-xrefs*', `*naf-mode-xref-of-xrefs*',
`*naf-mode-faces-xrefs*', `*naf-mode-date-xrefs*', `*mon-ulan-utils-xrefs*',
`*mon-xrefs-xrefs'.\n▶▶▶"
  :type '(repeat symbol)
  :group 'mon-string-utils 
  :group 'mon-xrefs)

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T16:23:36-04:00Z}#{24375} - by MON KEY>
(defun mon-color-list-display ()
  "Return a list of colors defined in the `color-name-rgb-alist' in buffer \"*MON-COLORS*\".\n
:EXAMPLE\n\n\(mon-color-list-display\)\n
:SEE-ALSO `mon-colorcomp', `mon-color-mix-display'.\n▶▶▶"
  (list-colors-display
   (mapcar #'car color-name-rgb-alist)
   "*MON-COLORS*"))

;;; ==============================
;;; :COURTESY (URL `https://www.reddit.com/r/emacs/comments/1bxw4n2/elisp_snippets_random_color/')
;;; :CREATED <Timestamp: #{2024-09-13T13:56:20-04:00Z}#{24375} - by MON KEY>
(defun mon-color-random-rgb ()
  "Return a list of randomized RGB color values.\n
:EXAMPLE\n\n\(mon-color-random-rgb\)
:SEE-ALSO `mon-color-random-html'.\n▶▶▶"
  (cl-loop repeat 3 collect (random 256)))

;;; ==============================
;;; :COURTESY (URL `https://www.reddit.com/r/emacs/comments/1bxw4n2/elisp_snippets_random_color/')
;;; :CREATED <Timestamp: #{2024-09-13T13:56:17-04:00Z}#{24375} - by MON KEY>
(defun mon-color-random-html ()
"Return a list of randomized HTML color values.\n
:EXAMPLE\n\n\(mon-color-random-html\)\n
:SEE-ALSO `mon-color-random-rgb'.\n▶▶▶"
  (apply #'format "#%02x%02x%02x" ;"#%x%x%x"
         (mon-color-random-rgb)))

;;; ==============================
;;; :PREFIX "mcm-"
;;; :COURTESY PJB HIS: pjb-utilities.el WAS: `color-mix'
;;; :CREATED <Timestamp: #{2009-09-28T17:11:25-04:00Z}#{09401} - by MON>
(defun mon-color-mix  (color-a color-b &optional factor)
  "PRE:  FACTOR is a float in the range [0.0 1.0]. Default is 0.5.\n
RETURN:  A triplet \(red green blue\)\n
         = COLOR-A + \( COLOR-B - COLOR-A \) * FACTOR\n
 \(mon-color-mix \\='\(61166 57311 52428\) \\='\(61166 41634 44461\) 0.6\)
:SEE-ALSO `mon-color-list-display', `mon-color-mix-display', `color-distance',
`mon-defined-colors-without-duplicates', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (or (and (null factor) (setq factor 0.5))
      (and factor 
           (or (and (numberp factor) 
                    (setq factor (float factor))
                    (not (and (or (<= factor 0.0) (<= 1.0 factor))
                              (mon-format :w-fun  #'error 
                                          :w-spec '(":FUNCTION `mon-color-mix' "
                                                    "-- arg FACTOR is out of range [0.0,1.0], got: %S")
                                          :w-args factor)))
                    factor)
               (mon-format :w-fun  #'error 
                           :w-spec '(":FUNCTION `mon-color-mix' "
                                     "-- arg FACTOR not `numberp', got: %S")
                           :w-args  factor))))
  (mon-mapcar #'(lambda (mcm-L-1 mcm-L-2) 
                  (truncate (+ mcm-L-1 (* (- mcm-L-2 mcm-L-1)  factor))))
              color-a color-b))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-11-12T15:16:25-05:00Z}#{10455} - by MON KEY>
(defun mon-color-mix-display (&optional mix-factor)                       
  "Read two color names and return a mixed color value.\n
Return value displaye in buffer \"*COLOR-MIX-RESULTS*\".\n
:EXAMPLE\n\n\(mon-color-mix-interactive\)=n
:SEE-ALSO `mon-color-mix', `mon-color-list-display', `mon-colorcomp'.\n▶▶▶"
  (interactive)
  (let* ((color1 (color-values (read-color "Color1: ")))
         (color2 (color-values (read-color "Color2: ")))
         (color3 (mon-color-mix color1 color2 (or mix-factor 0.7))))
    (with-current-buffer (get-buffer-create "*COLOR-MIX-RESULTS*")
      (erase-buffer)
      (save-excursion
        (dolist (mcm-D-1 `(("color1" ,(concat "#" (apply #'css-color:rgb-to-hex color1)))
                           ("color2" ,(concat "#" (apply #'css-color:rgb-to-hex color2)))
                           ("MIXED"  ,(concat "#" (apply #'css-color:rgb-to-hex color3)))))
        ;;; (color-rgb-to-hex (color-values (read-color "color: ")))
        ;; (apply #'color-rgb-to-hex  (color-values (read-color "color: ")))
        ;; (dolist (mcm-D-1 `(("color1" ,(concat "#" (apply #'color-rgb-to-hex color1)))
        ;;                    ("color2" ,(concat "#" (apply #'color-rgb-to-hex color2)))
        ;;                    ("MIXED"  ,(concat "#" (apply #'color-rgb-to-hex color3)))))
        
          (insert (propertize (car mcm-D-1) 'face `(:foreground ,(cadr mcm-D-1)))
                  "\n")))
      (princ (format (concat ";;; color mix results\n"
                             ";;; :MIX-FACTOR %.1f\n"
                             ";;; :COLOR1-VAL %S\n"
                             ";;; :COLOR2-VAL %S\n"
                             ";;; :COLOR3-VAL %S\n")
                     (or mix-factor 0.7) color1 color2 color3)
             (current-buffer))
      (display-buffer (current-buffer) t))))

;;; ==============================
;;; :PREFIX "mdcwd-"
;;; :COURTESY :FILE lisp/faces.el
;;; :NOTE Was commented out b/c it was decided that it was better to include the
;;; duplicates in read-color's completion list.
(defun mon-defined-colors-without-duplicates ()
  "Return the list of `defined-colors', without the no-space versions.\n
For each color name, we keep the variant that DOES have spaces.\n
:ALIASED-BY mon-colors-without-
:SEE-ALSO `list-colors-duplicates', `list-colors-display', `list-colors-print',
`defined-colors', `mon-color-mix', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (let ((mdcwd-rslt (copy-sequence (defined-colors)))
        mdcwd-reject)
    ;; (save-match-data ;; :NOTE Prob. not needed now that using `string-match-p'
    (dolist (mdcwd-D-1 mdcwd-rslt)
      (when (string-match-p " " mdcwd-D-1)
        (push (replace-regexp-in-string " " "" mdcwd-D-1) mdcwd-reject)))
    (dolist (mdcwd-D-2 mdcwd-reject)
      (let ((as-found (car (member-ignore-case mdcwd-D-2 mdcwd-rslt))))
        (setq mdcwd-rslt (delete as-found mdcwd-rslt))))
    ;; ) ;; :CLOSE save-match-data
    mdcwd-rslt))
;;
;;; (progn (replace-regexp-in-string "bub" "xxx" "bubba") (match-data))
;; (unless (and (intern-soft "")
;;              (fboundp '))
;; (mon-defined-colors-without-duplicates)

;;; ==============================
;;; :NOTE This fncn returns different HSV value than `css-color:rgb-to-hsv'
;;; :COURTESY Juri Linkov :WAS `rgb-to-hsv'
;;; :CREATED <Timestamp: #{2009-09-04T16:08:42-04:00Z}#{09365} - by MON KEY>
(defun mon-rgb-to-hsv (red-val green-val blue-val)
  "Return RED-VAL, GREEN-VAL, BLUE-VAL colors as hue, saturation, value list.\n
RED-VAL, GREEN-VAL, BLUE-VAL input values should be in [0..65535] range.\n
Output values for hue are in [0..360] range.\n
Output values for saturation and value are in [0..1] range.\n
:EXAMPLE\n\n\(xw-color-values \"NavajoWhite\"\)\n
\(apply \\='mon-rgb-to-hsv \(xw-color-values \"NavajoWhite\"\)\)\n
:NOTE This fncn returns different hsv value than `css-color:rgb-to-hsv'.\n
:SEE-ALSO `mon-defined-colors-without-duplicates', `mon-color-mix',
`htmlfontify-load-rgb-file', `mon-help-color-functions', `mon-help-color-chart',
`mon-help-css-color'.\n▶▶▶"
  (let* ((red-val (/ red-val 65535.0))
         (green-val (/ green-val 65535.0))
         (blue-val (/ blue-val 65535.0))
         (max (max red-val green-val blue-val))
         (min (min red-val green-val blue-val))
         (hue-val (cond ((= max min) 0)
                        ((= max red-val) (mod (+ (* 60 (/ (- green-val blue-val) (- max min))) 360) 360))
                        ((= max green-val) (+ (* 60 (/ (- blue-val red-val) (- max min))) 120))
                        ((= max blue-val) (+ (* 60 (/ (- red-val green-val) (- max min))) 240))))
         (sat-val (cond ((= max 0) 0)
                  (t (- 1 (/ min max)))))
         (value-val max))
    (list hue-val sat-val value-val)))

;;; ==============================
;;; :COLORCOMP 
;;;
;;; Here is a simple example using functions of the ewoc package to
;;; implement a "color components display," an area in a buffer that
;;; represents a vector of three integers (itself representing a 24-bit RGB
;;; value) in various ways.
;;;
;;; This example can be extended to be a "color selection widget" (in
;;; other words, the controller part of the "model/view/controller" design
;;; paradigm) by defining commands to modify `*mon-colorcomp-data*' and to
;;; "finish" the selection process, and a keymap to tie it all together
;;; conveniently.
;;;
;;; Note that we never modify the data in each node, which is fixed when
;;; the ewoc is created to be either `nil' or an index into the vector
;;; `*mon-colorcomp-data*', the actual color components.
;;;
;;; :SEE (info "(elisp)Abstract Display Example")
;;; ==============================
;;;
;;; (setq rep-mon-cc
;;;   '(("colorcomp-ewoc"    "*mon-colorcomp-ewoc*")
;;; 	("colorcomp-data"     "*mon-colorcomp-data*")
;;; 	("colorcomp-mode-map" "*mon-colorcomp-mode-map*")
;;; 	("colorcomp-labels"   "*mon-colorcomp-labels*")))
;;; (mon-replace-region-regexp-lists 'rep-mon-cc)
;;; ==============================

(require 'ewoc)

;;; ==============================
;;; :WAS `colorcomp-ewoc' `colorcomp-data' 
;;;      `colorcomp-mode-map' `colorcomp-labels'
(defvar *mon-colorcomp-ewoc* nil
  "An ewoc object created as per `ewoc-create'.\n
It is buffer-local to buffer `*mon-colorcomp-buffer-name*' and is bound on entry
to that buffer by `mon-colorcomp'.\n
:EXAMPLE\n\n
 \(buffer-local-value '*mon-colorcomp-ewoc* \(get-buffer *mon-colorcomp-buffer-name*\)\)\n
:SEE-ALSO `*mon-colorcomp-data*', `*mon-colorcomp-labels*',
`*mon-colorcomp-buffer-name*', `*mon-colorcomp-mode-map*'.\n▶▶▶")
;;
(defvar *mon-colorcomp-data* nil
"An array of three 8bit R G B color values.\n
It is buffer-local to buffer `*mon-colorcomp-buffer-name*' and is bound on entry
to that buffer by `mon-colorcomp'.\n
:EXAMPLE\n\n
 \(buffer-local-value '*mon-colorcomp-data* \(get-buffer *mon-colorcomp-buffer-name*\)\)\n
:SEE-ALSO `*mon-colorcomp-ewoc*', `*mon-colorcomp-labels*',
`*mon-colorcomp-buffer-name*', `*mon-colorcomp-mode-map*'.\n▶▶▶")
;;
(defvar *mon-colorcomp-mode-map* nil
  "A keymap for buffers created with `mon-colorcomp'.\n
:EXAMPLE\n\n
:SEE-ALSO `*mon-colorcomp-data*',`*mon-colorcomp-labels*',
`*mon-colorcomp-buffer-name*', `*mon-colorcomp-ewoc*'.\n▶▶▶")
;;
(defvar *mon-colorcomp-labels* ["Red" "Green" "Blue"]
"An array of names for R G B labels for us in buffer `*mon-colorcomp-buffer-name*'.
:EXAMPLE\n\n\(equal \(aref *mon-colorcomp-labels* 0\) \"Red\"\)\n
:SEE-ALSO `*mon-colorcomp-data*',`*mon-colorcomp-labels*',
`*mon-colorcomp-ewoc*'.\n▶▶▶")
;;
(defvar *mon-colorcomp-buffer-name* "*MON-COLOR-COMPONENTS*"
  "A string denoting a buffer-name for `mon-colorcomp'.\n
:EXAMPLE\n\n
 \(get-buffer *mon-colorcomp-buffer-name*\)\n
:SEE-ALSO `*mon-colorcomp-data*',`*mon-colorcomp-labels*',
`*mon-colorcomp-ewoc*'.\n▶▶▶")

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T20:46:34-04:00Z}#{24375} - by MON KEY>
(defvar *mon-colorcomp-adjust-alist* '((:lighten      .  color-lighten-name)
                                        (:darken      .  color-darken-name)
                                        (:saturate    .  color-saturate-name)
                                        (:desaturate  . color-desaturate-name))
  "An alist mapping color adjustment keywords to their function names for use with 
`mon-colorcomp-get-color-adjust-rgb'.\n
Elements of alist map as follows:\n
  :ligten     -> `color-lighten-name'
  :darken     -> `color-darken-name'
  :saturate   -> `color-saturate-name'
  :desaturate -> `color-desaturate-name'\n
:EXAMPLE\n\n \(assoc :lighten *mon-colorcomp-adjust-alist*\)\n
:SEE-ALSO `*mon-colorcomp-data*',`*mon-colorcomp-labels*',
`*mon-colorcomp-buffer-name*', `*mon-colorcomp-ewoc*', `mon-colorcomp'.\n▶▶▶")

;;; ==============================
;;; :WAS `colorcomp-pp'
(defun mon-colorcomp-pp (data)
  "Pretty print propertized color DATA.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (if data
      (let* ((comp (aref *mon-colorcomp-data* data))
             (comp-base-color 
              (cl-case data
                (0 (format "#%02X%02X%02X" comp 0 0 ))
                (1 (format "#%02X%02X%02X"  0 comp 0 ))
                (2 (format "#%02X%02X%02X"  0  0 comp ))))
             (rgb-string 
              (concat
               (aref *mon-colorcomp-labels* data) 
               "\t: "
	       (format "%d | #x%02X" comp comp)
               " "
	       (make-string (ash comp -2) ?#) "\n")))
	(insert (propertize rgb-string 'face `(foreground-color . ,comp-base-color))))
    (let* ((red (aref *mon-colorcomp-data* 0))
           (green (aref *mon-colorcomp-data* 1))
           (blue (aref *mon-colorcomp-data* 2))
           ;; (rgb-list (list red green blue))
           (rgb-list-string (format "%S" (list red green blue)))
           (rgb-hex (format "#x%02X%02X%02X" red green blue))
           (cstr (format "#%02X%02X%02X" red green blue))
           (samp "(sample text) "))
      (insert 
       "Color\t: "
       (propertize samp 'face `(foreground-color . ,cstr))
       (propertize samp 'face `(background-color . ,cstr))
       "\n\n"
       "RGB\t: " (propertize rgb-list-string 'face `(foreground-color . ,cstr))
       "\n\n"       
       "RGB HEX\t: " (propertize rgb-hex 'face `(foreground-color . ,cstr))))))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T19:48:52-04:00Z}#{24375} - by MON KEY>
(defun mon-color-read ()
  "A `completing-read' function for `mon-colorcomp' related functions.\n
Defaults do \"green\" if user bails or no input is recieved.\n
:ALIASED-BY `mon-read-color'
:EXAMPLE\n\n \(mon-color-read\)\n
:SEE-ALSO `mon-colorcomp-read-percentage', `mon-colorcomp-get-data'.\n▶▶▶"
  (completing-read "Color: " (mapcar #'car color-name-rgb-alist) nil t nil nil '("green")))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T19:10:03-04:00Z}#{24375} - by MON KEY>
(defun mon-colorcomp-read-percentage ()
  "Read a number as if by `read-number' and return it.\n
NUMBER must be less than or equal to 100.\n
:EXAMPLE\n\n\(call-interactively \\='mon-colorcomp-read-percentage\)
\(mon-colorcomp-read-percentage\)\n
:SEE-ALSO `mon-color-read'.\n▶▶▶"
  (interactive)
  (let ((read-num (read-number "NUMBER less than 100: " 0)))
    (if (<= read-num 100)
        read-num
      (mon-colorcomp-read-percentage))))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T22:54:30-04:00Z}#{24375} - by MON KEY>
(defun mon-colorcomp-get-buffer ()
  "Return buffer named `*mon-colorcomp-buffer-name*' if it exists.\n
:EXAMPLE\n\n \(mon-colorcomp-get-buffer\)\n
:SEE-ALSO `mon-colorcomp-get-data'.\n▶▶▶"
  (get-buffer *mon-colorcomp-buffer-name*))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T20:02:00-04:00Z}#{24375} - by MON KEY>
(defun mon-colorcomp-get-data ()
  "Return current `buffer-local-value' of `*mon-colorcomp-data*' in buffer
named by `*mon-colorcomp-buffer-name*' if that buffer exists, else return nil.\n
:EXAMPLE\n\n \(mon-colorcomp-get-data\)\n
:SEE-ALSO `mon-colorcomp-get-buffer', `mon-colorcomp-get-color-adjust-rgb',
`mon-colorcomp-get-data-rgb-hex', `mon-colorcomp'.\n▶▶▶"
  (let ((comp-buffer (mon-colorcomp-get-buffer)))
    (when comp-buffer
      (buffer-local-value '*mon-colorcomp-data* comp-buffer))))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T20:09:27-04:00Z}#{24375} - by MON KEY>
(defun mon-colorcomp-get-data-rgb-hex ()
  "Return a hex string for current RGB data in buffer named by
`*mon-colorcomp-buffer-name*' as if that buffer existsif by
`mon-colorcomp-get-data', esle return nil.\n
The hex string returned is suitable for use with functions which read color
names in that format, eg `color-saturate-name'.\n
:EXAMPLE\n\n \(mon-colorcomp-get-data-rgb-hex\)\n
:SEE-ALSO `mon-colorcomp-get-color-adjust-rgb', `mon-colorcomp'.\n▶▶▶"
  (let* ((cur-rgb (mon-colorcomp-get-data))
          (red     (and cur-rgb (aref cur-rgb 0)))
          (green   (and cur-rgb (aref cur-rgb 1)))
          (blue    (and cur-rgb (aref cur-rgb 2))))
     (and cur-rgb
          (format "#%02X%02X%02X" red green blue))))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T20:19:51-04:00Z}#{24375} - by MON KEY>  
(defun mon-colorcomp-get-color-adjust-rgb (color-adjust-key percent)
  "Return an alist of 8 bit R G B values.
 returned by `color-saturate-name'.\n
COLOR-ADJUST-KEY is keyword denoting how to adjust color it should be one
an elemnts of `*mon-colorcomp-adjust-alist*' which maps as follows:\n
 :lighten    -> `color-lighten-name'
 :darken     -> `color-darken-name'
 :saturate   -> `color-saturate-name'
 :desaturate -> `color-desaturate-name'\n
PERCENT is a percentage to saturate current color in in buffer
`*mon-colorcomp-buffer-name*'.\n
PERCENTAGE should satisfy `natnump' and be less `<=' 100. an error is signaled
if not.\n
Return value, when non-nil has the form:\n
 \(\(:NEW <RED> <GREEN> <BLUE>\)
  \(:OLD <RED> <GREEN> <BLUE>\)\)\n
Key :NEW is list of rgb values returned by functioin associated with COLOR-ADJUST-KEY.
key :OLD is list of rgb values currently active in buffer
:NOTE This funcion returns nil if `mon-colorcomp-get-data' does not find an 
active `mon-colorcomp' buffer.\n
:EXAMPLE\n\n \(mon-colorcomp-get-color-adjust-rgb :lighten 25\)\n
 \(mon-colorcomp-get-color-adjust-rgb :darken 25\)\n
 \(mon-colorcomp-get-color-adjust-rgb :saturate 25\)\n
 \(mon-colorcomp-get-color-adjust-rgb :desaturate 25\)\n
 \(cdr \(assoc :new \(mon-colorcomp-get-color-adjust-rgb :lighten    25\)\)\)\n
 \(cdr \(assoc :old \(mon-colorcomp-get-color-adjust-rgb :lighten    25\)\)\)\n
:SEE-ALSO `mon-colorcomp-get-data-rgb-hex'.\n▶▶▶"
  (unless (and (natnump percent)
               (<=  percent 100))
    (error ":FUNCTION `mon-colorcomp-get-saturion-rgb' -- arg PERCENT not `natnump' and `<=' 100. got: %S" percent))
  (unless (assoc color-adjust-key   *mon-colorcomp-adjust-alist*)
    (error ":FUNCTION `mon-colorcomp-get-saturion-rgb' -- arg COLOR-ADJUST-KEY not a key to alist `*mon-colorcomp-adjust-alist*'. got: %S" color-adjust-key))
  (let* ((sat-fun   (cdr (assoc color-adjust-key   *mon-colorcomp-adjust-alist*)))
         (maybe-sat (mon-colorcomp-get-data-rgb-hex))
         (sat-vals (and maybe-sat
                        (color-name-to-rgb (funcall sat-fun maybe-sat percent))))
         (red 
          (and sat-vals
               (truncate (* (nth 0 sat-vals) 255))))
         (green
          (and sat-vals
               (truncate (* (nth 1 sat-vals) 255))))
         (blue
          (and sat-vals
               (truncate (* (nth 2 sat-vals) 255))))
         (change-val
          (and red green blue
               (list red green blue)))
         (maybe-old-val 
          (and change-val (mon-colorcomp-get-data)))
         (old-val
          (and maybe-old-val
               (list (aref maybe-old-val  0)
                     (aref maybe-old-val  1)
                     (aref maybe-old-val 2)))))
    (when change-val
      `((:new . ,change-val)
        (:old . ,old-val)))))

;;; ==============================
;;; :WAS `colorcomp'
(defun mon-colorcomp (color)
  "Allow fiddling with COLOR in a new buffer.\n
The buffer is in MON Color Components mode.\n
:EXAMPLE\n\n\(mon-colorcomp \"systemMintColor\"\)\n
\(mon-colorcomp \(mon-color-random-html\)\)\n
:ALIASED-BY `mon-color-adjust'\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-help-color-functions',
`*mon-colorcomp-mode-map*', `mon-help-color-chart', `mon-help-css-color',
`read-color', `color-name-to-rgb', `color-name-rgb-alist'.\n▶▶▶"
  ;; :WAS (interactive "sColor (name or #RGB or #RRGGBB): ")  
  ;; :WAS (list (read-color "Color (name or #RGB or #RRGGBB): " t nil))
  (interactive (list (mon-color-read)))
  (when (string= "" color)    ;this shouldn't happen now that using `read-color'
    ;; (setq color (mon-colorcomp (mon-color-random-html)))
    ;; :NOTE Green is a good defaul as it's in the middle of the color space.
    (setq color "green"))
  (unless (color-values color)
    (mon-format :w-fun  #'error 
                :w-spec '(":FUNCTION `mon-colorcomp' "
                          "-- no such color: %S")
                :w-args color))
  (switch-to-buffer
   ;; (generate-new-buffer (format "*MON COLOR COMPONENTS originally: %s*" color)))
   (if (mon-colorcomp-get-buffer)
       (progn (kill-buffer (mon-colorcomp-get-buffer))
              (get-buffer-create *mon-colorcomp-buffer-name*))
     (get-buffer-create *mon-colorcomp-buffer-name*)))
  (with-current-buffer (mon-colorcomp-get-buffer)
    (kill-all-local-variables)
    (setq major-mode 'mon-colorcomp-mode
	  mode-name "MON Color Components")
    (use-local-map *mon-colorcomp-mode-map*)
    (erase-buffer)
    (buffer-disable-undo)
    (let* ((mclrcmp-data (apply 'vector (mapcar #'(lambda (mclrcmp-L-1) (ash mclrcmp-L-1 -8))
                                                (color-values color))))
           (mclrcmp-header 
            (concat "\nMON Color Components - original color: "
                    (propertize color 'face `(foreground-color . ,color))
                    "\n\n"))
	   (mclrcmp-ewoc (ewoc-create 'mon-colorcomp-pp
			              mclrcmp-header
			              (substitute-command-keys
			               "\n\\{*mon-colorcomp-mode-map*}"))))
      (set (make-local-variable '*mon-colorcomp-data*) mclrcmp-data)
      (set (make-local-variable '*mon-colorcomp-ewoc*) mclrcmp-ewoc)
      (ewoc-enter-last mclrcmp-ewoc 0)
      (ewoc-enter-last mclrcmp-ewoc 1)
      (ewoc-enter-last mclrcmp-ewoc 2)
      (ewoc-enter-last mclrcmp-ewoc nil))))

;; (ewoc-enter-last *mon-colorcomp-ewoc* 0)

;;; ==============================
;;; :WAS `colorcomp-mod'
(defun mon-colorcomp-mod (index limit delta)
  "Modify the color INDEX by LIMIT according to DELTA.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (with-current-buffer (mon-colorcomp-get-buffer)
  (let ((cur (aref *mon-colorcomp-data* index)))
    (unless (= limit cur)
      (aset *mon-colorcomp-data* index (+ cur delta)))
    (ewoc-invalidate
     *mon-colorcomp-ewoc*
     (ewoc-nth *mon-colorcomp-ewoc* index)
     (ewoc-nth *mon-colorcomp-ewoc* -1)))))

;; (ewoc-data (ewoc-nth *mon-colorcomp-ewoc* 0))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-09-13T21:42:23-04:00Z}#{24375} - by MON KEY>
(defun mon-colorcomp-get-color-adjust-if (comp-data)
"BORKEN, oversteps the boundds of limit with `mon-colorcomp-mod' doesn't "
  (unless (null comp-data)
    (let* ((maybe-new  (assoc :new comp-data))
           (new (and maybe-new
                     (cdr maybe-new)))
           (maybe-old (assoc :old comp-data))
           (old (and maybe-old
                     (cdr maybe-old)))
           (red-pair (and old new
                          (cons (nth 0 new) (nth 0 old))))
           (green-pair (and old new
                            (cons (nth 1 new) (nth 1 old))))
           (blue-pair (and old new
                           (cons (nth 2 new) (nth 2 old))))
           (list-pairs (and red-pair green-pair blue-pair
                           (list red-pair green-pair blue-pair))))
      ;;list-pairs)))
      (when list-pairs
        (cl-loop
         for idx from 0 to 2
         for pairs in list-pairs ; ((249 . 238) (243 . 221) (210 . 130))
         for new = (car pairs)
         for old = (cdr pairs)
         do 
         (with-current-buffer (mon-colorcomp-get-buffer)
           (cond 
             ;; new is greater than old, , we want to substract DELTA
             ((> new old)
              (mon-colorcomp-mod idx 255 (-  new old)))
             ;; New is less than old, we want to add  DELTA
             ((< new old)
              (mon-colorcomp-mod idx 0   (-  new old))))))))))

;;; ==============================
;;; :WAS `colorcomp-R-more', `colorcomp-G-more', `colorcomp-B-more'
;;;      `colorcomp-R-less', `colorcomp-G-less', `colorcomp-B-less'
(defun mon-colorcomp-R-more () 
  "Increase Red value.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-colorcomp-R-more',
`mon-colorcomp-G-more', `mon-colorcomp-B-more', `mon-colorcomp-R-less',
`mon-colorcomp-G-less', `mon-colorcomp-B-less', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (interactive) 
  (mon-colorcomp-mod 0 255 1))
;;
(defun mon-colorcomp-G-more () 
  "Increase Green value.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-colorcomp-R-more',
`mon-colorcomp-G-more', `mon-colorcomp-B-more', `mon-colorcomp-R-less',
`mon-colorcomp-G-less', `mon-colorcomp-B-less', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (interactive)
  (mon-colorcomp-mod 1 255 1))
;;
(defun mon-colorcomp-B-more () 
  "Increase Blue value.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-colorcomp-R-more',
`mon-colorcomp-G-more', `mon-colorcomp-B-more', `mon-colorcomp-R-less',
`mon-colorcomp-G-less', `mon-colorcomp-B-less', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (interactive)
  (mon-colorcomp-mod 2 255 1))
;;
(defun mon-colorcomp-R-less () 
  "Decrease Red value.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-colorcomp-R-more',
`mon-colorcomp-G-more', `mon-colorcomp-B-more', `mon-colorcomp-R-less',
`mon-colorcomp-G-less', `mon-colorcomp-B-less', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (interactive)
  (mon-colorcomp-mod 0 0 -1))
;;
(defun mon-colorcomp-G-less () 
   "Decrease Green value.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-colorcomp-R-more',
`mon-colorcomp-G-more', `mon-colorcomp-B-more', `mon-colorcomp-R-less',
`mon-colorcomp-G-less', `mon-colorcomp-B-less',`mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
   (interactive)
   (mon-colorcomp-mod 1 0 -1))
;;
(defun mon-colorcomp-B-less () 
   "Decrease Blue value.\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-colorcomp-copy-as-kill-and-exit', `mon-colorcomp-R-more',
`mon-colorcomp-G-more', `mon-colorcomp-B-more', `mon-colorcomp-R-less',
`mon-colorcomp-G-less', `mon-colorcomp-B-less', `mon-help-color-functions',
`mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
   (interactive)
   (mon-colorcomp-mod 2 0 -1))

;;; ==============================
;;; :WAS `colorcomp-copy-as-kill-and-exit'
(defun mon-colorcomp-copy-as-kill-and-exit ()
  "Copy the color components into the kill ring and kill the buffer.\n
The string is formatted #RRGGBB (hash followed by six hex digits).\n
:SEE-ALSO `mon-colorcomp-mod', `mon-colorcomp', `mon-colorcomp-pp',
`mon-help-color-functions', `mon-help-color-chart', `mon-help-css-color'.\n▶▶▶"
  (interactive)
  (kill-new (format "#%02X%02X%02X"
		    (aref *mon-colorcomp-data* 0)
		    (aref *mon-colorcomp-data* 1)
		    (aref *mon-colorcomp-data* 2)))
  (kill-buffer nil))


;; color-desaturate-name
;; color-saturate-name
;; color-darken-name
;; color-lighten-name

;;; ==============================
;;; :PREFIX "mcm-"
;;; :WAS `colorcomp-mode-map'
;;; :NOTE Changed default bindings. 
;;; :CREATED <Timestamp: #{2009-09-04T16:32:08-04:00Z}#{09365} - by MON KEY>
(unless (and (intern-soft "*mon-colorcomp-mode-map*" obarray)
             (bound-and-true-p  *mon-colorcomp-mode-map*))
  (setq *mon-colorcomp-mode-map*
        (let ((mcm-map (make-sparse-keymap)))
          (suppress-keymap mcm-map)
          (define-key mcm-map "r" 'mon-colorcomp-R-less)
          (define-key mcm-map "R" 'mon-colorcomp-R-more)
          (define-key mcm-map "g" 'mon-colorcomp-G-less)
          (define-key mcm-map "G" 'mon-colorcomp-G-more)
          (define-key mcm-map "b" 'mon-colorcomp-B-less)
          (define-key mcm-map "B" 'mon-colorcomp-B-more)
          (define-key mcm-map "k" 'mon-colorcomp-copy-as-kill-and-exit)
          (define-key mcm-map "q" 'bury-buffer)
          mcm-map)))

;;; ==============================
;;; SOURCE: (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00188.html')
;;; FROM: 	Juri Linkov
;;; SUBJECT: 	Re: Darkening font-lock colors
;;; DATE: 	Wed, 05 Aug 2009 01:14:14 +0300
;;; RE: Darkening font-lock colors
;;; ==============================
;; As proposed in 
;; (URL `http://lists.gnu.org/archive/html/emacs-devel/2005-01/msg00251.html')
;; I implemented the color sorting option for `list-colors-display'.
;;
;; Below is a short patch that adds a customizable variable
;; `list-colors-sort' with some useful sort orders to sort
;; by color name, RGB, HSV, and HVS distance to the specified color.
;; The default is unordered - the same order as now.
;;
;; The HVS distance is the most useful sorting order.
;; For instance, for the source color "rosy brown"
;; (the former `font-lock-string-face' color) it shows
;; that a new color "VioletRed4" is far away from "rosy brown".
;; The closest colors for "rosy brown" on the HVS cylinder are:
;;
;;  rosy brown RosyBrown3 RosyBrown4 RosyBrown2 RosyBrown1 light coral indian
;;  IndianRed3 IndianRed4 IndianRed2 IndianRed1 brown brown3 brown4 brown2
;;  firebrick  red
;;
;;; ==============================
;;; :NOTE This does not appear to be working!
;;; :COURTESY Juri Linkov :WAS `list-colors-sort' 
;;; :CREATED <Timestamp: #{2009-09-04T16:08:42-04:00Z}#{09365} - by MON KEY>
;;; (defcustom *mon-list-colors-sort* nil
;;;   "Sort order for `mon-list-colors-display'.\n
;;; `nil' means unsorted (implementation-dependent order).
;;; `name' sorts by color name.
;;; `r-g-b' sorts by red, green, blue components.
;;; `h-s-v' sorts by hue, saturation, value.
;;; `hsv-dist' sorts by the HVS distance to the specified color.
;;; :SEE-ALSO .\n▶▶▶"
;;;   :type '(choice (const :tag "Color Name" name)
;;;                (const :tag "Red-Green-Blue" r-g-b)
;;;                (const :tag "Hue-Saturation-Value" h-s-v)
;;;                (cons :tag "Distance on HSV cylinder"
;;;                      (const :tag "Distance from Color" hsv-dist)
;;;                      (color :tag "Source Color Name"))
;;;                (const :tag "Unsorted" nil))
;;;   :group 'facemenu
;;;   :version "23.2")
;;
;;; ==============================
;;; :COURTESY Juri Linkov :WAS `list-colors-key'
;;; :SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00188.html')
;;; :CREATED <Timestamp: #{2009-09-04T16:08:42-04:00Z}#{09365} - by MON KEY>
;;; (defun mon-list-colors-key (color-to-key)
;;;   "Return a list of keys for sorting colors depending on `*mon-list-colors-sort*'.
;;; COLOR-TO-KEY is the name of the color.  Filters out a color from the output
;;; when return value is nil.
;;; :SEE-ALSO .\n▶▶▶"
;;;   (cond
;;;    ((null *mon-list-colors-sort*) color-to-key)
;;;    ((eq *mon-list-colors-sort* 'name)
;;;     (list color-to-key))
;;;    ((eq *mon-list-colors-sort* 'r-g-b)
;;;     (color-values color-to-key))
;;;    ((eq *mon-list-colors-sort* 'h-s-v)
;;;     (apply 'mon-rgb-to-hsv (color-values color-to-key)))
;;;    ((eq (car *mon-list-colors-sort*) 'hsv-dist)
;;;     (let* ((c-rgb (color-values color-to-key))
;;;            (c-hsv (apply 'mon-rgb-to-hsv c-rgb))
;;;            (o-hsv (apply 'mon-rgb-to-hsv (color-values (cdr *mon-list-colors-sort*)))))
;;;       (unless (and (eq (nth 0 c-rgb) (nth 1 c-rgb)) ; exclude grayscale
;;;                  (eq (nth 1 c-rgb) (nth 2 c-rgb)))
;;;       ;; 3D Euclidean distance
;;;       (list (+ (expt (- (abs (- 180 (nth 0 c-hsv))) ; wrap hue as circle
;;;                         (abs (- 180 (nth 0 o-hsv)))) 2)
;;;                (expt (- (nth 1 c-hsv) (nth 1 o-hsv)) 2)
;;;                (expt (- (nth 2 c-hsv) (nth 2 o-hsv)) 2))))))))
;;
;;; (mon-list-colors-key (mon-rgb-to-hsv 210 105 30))
;; (color-distance "FloralWhite" "seashell")
;;; ==============================
;;; :NOTE This doesn't appear to work!
;;; :COURTESY Juri Linkov :WAS `list-colors-display' <- facemenu.el
;;; :CREATED <Timestamp: #{2009-09-04T16:08:42-04:00Z}#{09365} - by MON KEY>
;;; (defun mon-list-colors-display (&optional colours-l colours-bfr-name)
;;;   "Display names of defined colors, and show what they look like.
;;; If the optional argument LIST is non-nil, it should be a list of
;;; colors to display.  Otherwise, this command computes a list of
;;; colors that the current display can handle.  If the optional
;;; argument COLOURS-BFR-NAME is ommitted, it defaults to buffer named \"*Colors*\".\n▶▶▶"
;;;   (interactive)
;;;   (when (and (null colours-l) (> (display-color-cells) 0))
;;;     (setq colorus-l (list-colors-duplicates (defined-colors)))
;;;     (when *mon-list-colors-sort*
;;;       (setq colours-l 
;;;             (mapcar 'car
;;;                     (sort 
;;;                      (delq nil 
;;;                            (mapcar #'(lambda (c)
;;;                                        (let ((key (mon-list-colors-key (car c))))
;;;                                          (and key (cons c key))))
;;;                                    colours-l))
;;;                      (lambda (a b)
;;;                        (let* ((a-keys (cdr a))
;;;                               (b-keys (cdr b))
;;;                               (a-key (car a-keys))
;;;                               (b-key (car b-keys)))
;;;                          (while (and a-key b-key (eq a-key b-key))
;;;                            (setq a-keys (cdr a-keys) a-key (car a-keys)
;;;                                  b-keys (cdr b-keys) b-key (car b-keys)))
;;;                          (cond
;;;                            ((and (numberp a-key) (numberp b-key))
;;;                             (< a-key b-key))
;;;                            ((and (stringp a-key) (stringp b-key))
;;;                             (string< a-key b-key)))))))))
;;;     (when (memq (display-visual-class) '(gray-scale pseudo-color direct-color))
;;;       ;; Don't show more than what the display can handle.
;;;       (let ((lc (nthcdr (1- (display-color-cells)) colours-l)))
;;; 	(if lc
;;; 	    (setcdr lc nil)))))
;;;   (with-help-window (or colours-bfr-name "*Colors*")
;;;     (with-current-buffer standard-output
;;;       (setq truncate-lines t)
;;;       (if temp-buffer-show-function
;;;           (list-colors-print colours-l)
;;;           ;; Call list-colors-print from temp-buffer-show-hook
;;;           ;; to get the right value of window-width in list-colors-print
;;;           ;; after the buffer is displayed.
;;;           (add-hook 'temp-buffer-show-hook
;;;                     (lambda ()
;;;                       (set-buffer-modified-p
;;;                        (prog1 (buffer-modified-p)
;;;                          (list-colors-print colours-l))))
;;;                     nil t)))))
;;; ==============================


;;; ==============================
(provide 'mon-color-utils)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ================================================================
;;; mon-color-utils.el ends here
;;; EOF
