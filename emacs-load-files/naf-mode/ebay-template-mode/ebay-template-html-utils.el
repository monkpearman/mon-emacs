;;; ebay-template-html-utils.el --- combines fncns from html-lite and xmlgen packages
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009-2012 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: ebay-template-html-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-08-19T15:13:39-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: external, files, tools

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; ebay-template-html-utils provides combined features from 
;; html-lite.el and xmlgen.el
;; 
;; :SEE (URL `http://www.emacswiki.org/cgi-bin/wiki/download/html-lite.el')\n
;;
;; :SEE (URL `http://www.shellarchive.co.uk/content/emacs.html')
;; :SEE (URL `http://repo.or.cz/w/ShellArchive.git/blob_plain/master:/xmlgen.el')
;; :SEE (URL `http://repo.or.cz/w/ShellArchive.git/blob_plain/master:/xmlgen.etest')
;;
;; FUNCTIONS:▶▶▶
;; `xmlgen', `xmlgen-attr-to-string', `xmlgen-extract-plist',
;; `html-lite-doctype', `html-lite-doctype-alist', `html-lite-define-elements',
;; `html-lite-make-element', `with-html-lite-header', `with-html-lite-header',
;; `html-doctype', `html-lite-make-name', `html-lite-write-tree',
;; `html-lite-browse-tree',
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
;;
;; NOTES:
;; The macro `html-lite-define-elements' interns html elements. this means they
;; become symbols in the obarray. This needs to be fixed. w/ a get-hash/memoize
;; or some such.
;;
;; 
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; THIRD-PARTY-CODE:
;;
;; URL: http://www.emacswiki.org/emacs/ebay-template-html-utils.el
;; FIRST-PUBLISHED: <Timestamp: #{2009-09-20} - by MON KEY>
;;
;; EMACSWIKI: { URL of an EmacsWiki describing ebay-template-html-utils. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-08-19T15:13:39-04:00Z}#{09343} - by MON>
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
;;; inlining: xmlgen.el
;;; ==============================
;;; works basically the same as html-lite but without indentation headers etc.
;;; ==============================
;;; xmlgen.el --- A DSL for generating XML.
;;
;; Copyright (C) 2008 Philip Jackson
;;
;; Author: Philip Jackson <phil@shellarchive.co.uk>
;; Version: 0.4
;;
;; { ... GPLv2 elided ... }
;;
;; Generate XML using sexps with the function `xmlgen':
;;
;; (xmlgen '(p :class "big"))      => "<p class=\"big\" />")
;; (xmlgen '(p :class "big" "hi")) => "<p class=\"big\">hi</p>")
;;
;; (xmlgen '(html
;;           (head
;;            (title "hello")
;;            (meta :something "hi"))
;;           (body
;;            (h1 "woohhooo")
;;            (p "text")
;;            (p "more text"))))
;;
;; produces this (though wrapped):
;;
;; <html>
;;   <head>
;;     <title>hello</title>
;;     <meta something="hi" />
;;   </head>
;;   <body>
;;     <h1>woohhooo</h1>
;;     <p>text</p>
;;     <p>more text</p>
;;   </body>
;; </html>
;;;;
;;; (eval-when-compile (require 'cl))
;;
(defvar xmlgen-escape-attribute-vals t
  "When non-nil xmlgen will escape the characters <>'\"&' in an
attribute value.")
;;
(defvar xmlgen-escape-elm-vals t
  "When non-nil xmlgen will escape the characters <>'\"&' in an
elements content.")
;;
(defvar xmlgen-escapees
  '(("&"  . "&amp;")
    ("'"  . "&apos;")
    ("\"" . "&quot;")
    ("<"  . "&lt;")
    (">"  . "&gt;"))
  "List of (find . replace) pairs for escaping. See
`xmlgen-escape-elm-vals' and `xmlgen-escape-attribute-vals'")
;;
(defun xmlgen (form &optional in-elm level)
  "Convert a sexp to XML.\n
:EXAMPLE
\(xmlgen '\(p :class \"big\"\)\)      => \"<p class=\\\"big\\\" />\"\)\n

\(xmlgen '\(p :class \"big\" \"hi\"\)\) => \"<p class=\\\"big\\\">hi</p>\"\)\n

\(xmlgen '\(html
          \(head
           \(title \"hello\"\)
           \(meta :something \"hi\"\)\)
          \(body
           \(h1 \"woohhooo\"\)
           \(p \"text\"\)
           \(p \"more text\"\)\)\)\)\n

Produces this (though wrapped):\n

 <html>
   <head>
     <title>hello</title>
     <meta something=\"hi\" />
   </head>
   <body>
     <h1>woohhooo</h1>
     <p>text</p>
     <p>more text</p>
   </body>
 </html>\n
:SEE-ALSO `mon-help-ebay-template-mode', `xmlgen-escapees',
`xmlgen-attr-to-string',`xmlgen-extract-plist', `xmlgen-string-escape'.\n▶▶▶"
  (let ((level (or level 0)))
    (cond
      ((numberp form) (number-to-string form))
      ((stringp form) form)
      ((listp form)
       ;; (destructuring-bind (xml attrs) (xmlgen-extract-plist form)
       (cl-destructuring-bind (xml attrs) (xmlgen-extract-plist form)
         (let ((el (car xml)))
           (unless (symbolp el)
             (error ":FUNCTION `xmlgen' -- element must be a symbol (got '%S')." el))
           (setq el (symbol-name el))
           (concat "<" el (xmlgen-attr-to-string attrs)
                   (if (> (length xml) 1)
                       (concat ">" (mapconcat #'(lambda (s) 
                                                  (xmlgen s el (1+ level)))
                                              (if xmlgen-escape-elm-vals
                                                  (mapcar 'xmlgen-string-escape (cdr xml))
                                                (cdr xml))
                                              "")
                               "</" el ">")
                       "/>"))))))))
;;
(defun xmlgen-string-escape (string)
  "Escape STRING for inclusion in some XML.\n
:SEE-ALSO `mon-help-ebay-template-mode', `xml-gen', `xmlgen-escapees',
`xmlgen-attr-to-string',`xmlgen-extract-plist', `xmlgen-string-escape'.\n▶▶▶"
  (when (stringp string)
    (mapc
     #'(lambda (e)
       (setq string
        (replace-regexp-in-string (car e) (cdr e) string)))
     xmlgen-escapees))
  string)
;;
(defun xmlgen-attr-to-string (plist)
  "Convert a plist to xml style attributes.\n
:SEE-ALSO `mon-help-ebay-template-mode', `xml-gen', `xmlgen-escapees',
`xmlgen-attr-to-string',`xmlgen-extract-plist', `xmlgen-string-escape'.\n▶▶▶"
  (let ((res ""))
    (while plist
      (let* ((sym (pop plist))
             (val (pop plist))
             (treated (cond
                        ((numberp val)
                         (number-to-string val))
                        ((stringp val)
                         val))))
        (setq res
              (concat res " " (substring (symbol-name sym) 1 ) "=\""
                      (if xmlgen-escape-attribute-vals
                          (xmlgen-string-escape treated)
                          treated)
                      "\""))))
    res))
;;
(defun xmlgen-extract-plist (list)
  "Extract a plist from LIST returning the original list without the plist and the plist.\n
:SEE-ALSO `mon-help-ebay-template-mode', `xml-gen', `xmlgen-escapees',
`xmlgen-attr-to-string',`xmlgen-extract-plist', `xmlgen-string-escape'.\n▶▶▶"
  (let ((nlist '())
        (plist '())
        (last-keyword nil))
    (mapc
     #'(lambda (item)
       (let ((item (pop list)))
         (cond
           (last-keyword
            (setq plist (append plist (list last-keyword)))
            (setq plist (append plist (list item)))
            (setq last-keyword nil))
           ((keywordp item) (setq last-keyword item))
           (t (setq nlist (append nlist (list item)))))))
     list)
    (when last-keyword
      (error ":FUNCTION `xmlgen-extract-plist' -- no value to satisfy keyword '%s'"
             (symbol-name last-keyword)))
    (list nlist plist)))
;;
;; (provide 'xmlgen)
;;
;;
;; xmlgen.etest
;; :SOURCE (URL `http://repo.or.cz/w/ShellArchive.git/blob_plain/master:/xmlgen.etest')
;;               git://github.com/philjackson/etest.git
;; (etest
;;  ("xml-gen"
;;   ("extract-plist"
;;    (equal (xmlgen-extract-plist '(h1 :class "big" "A Title"))
;;           '((h1 "A Title") (:class "big")))
;;    (equal (xmlgen-extract-plist '(hello :big "world"))
;;           '((hello) (:big "world")))
;;    (equal (xmlgen-extract-plist '(big :one 1 :two 2 :three 3))
;;           '((big) (:one 1 :two 2 :three 3))
;;           "Slightly bigger plist")
;;    (error (xmlgen-extract-plist '(hello "world" :how))
;;           "Error thrown when plist is wrong size"))
;;   ("xmlgen-attr-to-string"
;;    (equal (xmlgen-attr-to-string '(:one "1" :two "2")) " one=\"1\" two=\"2\""))
;;   ("xmlgen-string-escape"
;;    (equal "This &amp; this" (xmlgen-string-escape "This & this"))
;;    (equal "This &lt;&amp;&gt; this" (xmlgen-string-escape "This <&> this")))
;;   ("xmlgen"
;;    (equal (xmlgen '(p "this & this")) "<p>this &amp; this</p>")
;;    (equal (xmlgen '(p :class "big")) "<p class=\"big\"/>")
;;    (equal (xmlgen '(p :class "big" "hi")) "<p class=\"big\">hi</p>")
;;    (equal (xmlgen '(h1)) "<h1/>")
;;    (equal (xmlgen '(h1 "Title")) "<h1>Title</h1>")
;;    (equal (xmlgen '(h1 :class "something" "hi"))
;;         "<h1 class=\"something\">hi</h1>")
;;    (equal (xmlgen '(p "hello" "again")) "<p>helloagain</p>")
;;    ("more complex"
;;     (equal (xmlgen
;;             '(html
;;               (head
;;                (title "hello")
;;                (meta :something "hi"))))
;;             (concat "<html><head><title>hello</title><meta something=\"hi\"/></head></html>"))))))
;;
;;
;;; ==============================
;;; xmlgen.el section ends here
;;; ==============================

;;; ==============================
;;; inlining html-lite.el
;;; ==============================
;;; html-lite.el --- Construct html with sexp
;; Copyright (C) 2004  Free Software Foundation, Inc.
;; Author: Mario Domgörgen <kanaldrache@gmx.de>
;; Keywords: hypermedia
;;
;;; {...GPL Elided... re-insert if distributed} 
;;
;;; Commentary:
;; Provides procedures to construct an HTML document easily.  For
;; example, you can construct an HTML table by the following code:
;;
;; (html-table :border "1" 
;;  (html-tr (html-th "Item No") (html-th "Quantity"))
;;  (html-tr (html-td "1") (html-td "120")) 
;;  (html-tr (html-td "2") (html-td "30")) 
;;  (html-tr (html-td "3") (html-td "215")))
;;
;; There are mainly two functions to access the constructed
;; tree. `html-lite-write-tree' writes the tree indented to the
;; current ouput stream and `html-lite-browse-tree' use
;; `browse-url-browser-function' to browse the tree.
;;
;; You can construct complete html tree by using:
;;
;; (append
;;  (html-doctype)
;;  (html-html
;;   (html-head
;;    (html-title "Title"))
;;   (html-body "Content")))
;;
;; But the simpler way would be jsut to use `with-html-lite-header' like 
;;
;; (with-html-lite-header "Title" 
;;   (html-p "foo") (html-p "bar"))
;;
;; (html-table :border "1" 
;;  (html-tr (html-th "Item No") (html-th "Quantity"))
;;  (html-tr (html-td "1") (html-td "120")) 
;;  (html-tr (html-td "2") (html-td "30")) 
;;  (html-tr (html-td "3") (html-td "215")))
;;
;; The code is ported from html-lite.scm in the Gauche distribution. 
;; Some things are missings but will be added asap.
;; I wrote this just for the fun of it and hope someone will find it
;; useful.
;;
;;; ==============================
;;; html-lite.el
;;; :SEE (URL `http://www.emacswiki.org/emacs/download/html-lite.el')
;;; ==============================
(defgroup html-lite nil
  "*Library for construction of html documents with sexps."
  :prefix "html-lite-"
  :group 'hypermedia)

;;; ==============================
(defcustom html-lite-doctype 'strict
  "If non-nil specify the standard doctype for your html document"
  :group 'html-lite
  :type '(choice (const :tag "Strict" strict)
  		 (const :tag "Transitional" transitional)
                 (const :tag "Frameset" frameset)
                 (const :tag "XHTML 1.0 Strict" xhtml-1.0-strict)
                 (const :tag "XHTML 1.0 Transitional" xhtml-1.0-transitional)
                 (const :tag "XHTML 1.0 Frameset" xhtml-1.0-frameset)
                 (const :tag "XHTML 1.1" xhtml-1.1)))

;;; ==============================
(defconst html-lite-version "0.3")

;;; ==============================
(defconst html-lite-doctype-alist
  '((strict
     "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"
       \"http://www.w3.org/TR/html4/strict.dtd\">\n")
    (transitional
     "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"
       \"http://www.w3.org/TR/html4/loose.dtd\">\n")
    (frameset
     "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"
       \"http://www.w3.org/TR/html4/frameset.dtd\">\n")
    (xhtml-1.0-strict
     "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"
       \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n")
    (xhtml-1.0-transitional
     "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"
       \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n")
    (xhtml-1.0-frameset
     "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"
       \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">\n")
    (xhtml-1.1
     "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"
       \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n")
    ))

;;; ==============================
(defmacro html-lite-define-elements (&rest elements)
  "Define ELEMENTS as funcs that eval to their html-tree element.
ELEMENTS must be a string. When surroundes by parens make the
element a emtpy one."
  (declare (indent defun))
  `(progn
     ,@(mapcar 
	#'(lambda (element)
	  (if (listp element)
	      (list 'defun (html-lite-make-name (car element)) 
		    '(&rest args)
		    (concat "Produce tree element " (car element))
		    (list 'html-lite-make-element (car element) t 'args))
	    (list 'defun (html-lite-make-name element) 
		  '(&rest args)
		  (concat "Produce tree element " element)
		  (list 'html-lite-make-element element nil 'args))))
	elements)))

;;; ==============================
(defun html-lite-make-element (name empty args)
  (let ((propstring "")
	(tags))
    (while args
      (let ((arg (car args)))	
	(setq args (cdr args))
	(cond ((keywordp arg)
	       (let ((keyword arg)
		     (value (car args)))
		 (unless args
		   (error "Keyword %s is missing an argument" keyword))
		 (setq args (cdr args))
		 (setq propstring (concat propstring 
					  " "
					  (substring (symbol-name arg) 1)
					  "="
					  "\"" value "\""))))
	      ((stringp arg)
	       (setq tags (append tags 
				  (list (html-lite-escape-string arg)))))
	      ((listp arg)
	       (setq tags (append tags arg))))))
    
    (cond (empty
	   (list (concat "<" name propstring "/>")))
	  ((null tags)
	   (error "Non empty element must have content: %s" name))
	  (t
	   `(,(concat "<" name propstring ">")
	     ,tags
	     ,(concat "</" name ">"))))))

;;; ==============================
(defmacro with-html-lite-header (title &rest body)
  "Construct html with doctype and head and eval BODY as content.
TITLE must be a string and is used as content in the title-tag."
  `(append
    (html-doctype)
    (html-html 
    (html-head
     (html-title ,title))
    (html-body
     ,@body))))

;;; ==============================     
(defun html-lite-escape-string (string)
  "Escape dangerous character in html strings."
  (mapc #'(lambda (elt) (setq string (replace-regexp-in-string (car elt) (cdr elt)
	  string))) '(("&" .  "&amp;") ("<" . "&lt;") (">" . "&gt;") ("\""
	  . "&quot;"))) string)

;;; ==============================
(defun html-doctype (&optional type)
  "Return the doctype for TYPE.
TYPE can be one of the following symbols: strict, transitional,
frameset, xhtml-1.0-strict, xhtml-1.0-transitional,
xhtml-1.0-frameset and xhtml-1.1."
  (let ((type (or type html-lite-doctype)))
    (cdr (assoc type html-lite-doctype-alist))))

;;; ==============================
(defun html-lite-make-name (name)
  "Return the function-name for NAME."
  (intern (format "html-%s" name)))

;;; ==============================
(defun html-lite-write-tree (tree &optional indent)
  "Write tree to buffer.
Indent tag to column INDENT."
  (let ((indent (or indent 0)))
    (mapc
     #'(lambda (element)
       (cond ((listp element)
	      (html-lite-write-tree element (+ indent 2)))
	     (t
	      (indent-to-column indent) 
	      (insert element "\n"))))
     tree)))

;;; ==============================		
(defun html-lite-browse-tree (tree)
  "Browse TREE.
Variable`browse-url-browser-function' says which browser to use."
  (let ((file (make-temp-file "html-lite" nil ".html")))
    (with-temp-file file (html-lite-write-tree tree))
    (browse-url-of-file file)))
  


;; '(
;; ;; :HTML-%fontstyle
;;   "tt" "i" "b" "big" "small"
;; ;; :HTML-%phrase
;; "em" "strong" "dfn" "code" "samp" 
;; "kbd" "var" "cite" "abbr" "acronym"
;; ;; :HTML-CONTENT-MODELS
;; "sub" "sup" "font" "span" "bdo" ("br")
;; ;; :HTML-DOCUMENT-BODY
;; "body" "addres" "div" ;;  Is this address? -MON
;; ;; :HTML-ANCHOR ELEMENT
;; "a"
;; ;; :HTML-CLIENT-SIDE IMAGE MAPS
;; "map" ("area")
;; ;; :HTML-LINK
;; ("link")
;; ;; :HTML-IMAGES
;; ("img")
;; ;; :HTML-OBJECT
;; ("object") ("param")
;; ;; :HTML-HORIZONTAL-RULE
;; ("hr")
;; ;; :HTML-PARAGRAPHS
;; "p"
;; ;; :HTML-HEADINGS
;; "h1" "h2" "h3" "h4" "h5" "h6"
;; ;; :HTML-PREFORMATTED
;; "pre"
;; ;; :HTML-INLINE-QUOTES
;; "q"
;; ;; :HTML-BLOCK-LIKE-QUOTES
;; "blockquote"
;; ;; :HTMl-INSERTED/DELETED-TEXT
;; "ins" "del"
;; ;; :HTML-LISTS
;; "dl" "dt" "dd" "ol" "ul" "li"
;; ;; :HTML-FORMS
;; "form" "label" ("input") "select" 
;; "optgroup" "option" "textarea" 
;; "fieldset" "legend" "button"
;; ;; :HTML-TABLES
;; "table" "caption" "thead" "tfoot" 
;; "tbody" "colgroup" ("col") 
;; "tr" "th" "td"
;; ;; :HTML-DOCUMENT-HEAD
;; "head" "title" ("base") ("meta")
;; "style" "script" "noscript"
;; ;; :HTML-DOCUMENT-STRUCTURE
;; "html"
;; )

;;; ==============================
;; TEXT MARKUP: (URL `http://www.w3.org/TR/html4/sgml/dtd.html')
;;; ==============================

;; %fontstyle
(html-lite-define-elements 
  "tt" "i" "b" "big" "small")

;; %phrase
(html-lite-define-elements 
  "em" "strong" "dfn" "code" "samp" 
  "kbd" "var" "cite" "abbr" "acronym")

;; HTML CONTENT MODELS
(html-lite-define-elements "sub" "sup" "font" "span" "bdo" ("br"))

;; DOCUMENT BODY
(html-lite-define-elements "body" "addres" "div") ;;  Is this address? -MON

;; THE ANCHOR ELEMENT
(html-lite-define-elements "a")

;; cLIENT-SIDE IMAGE MAPS
(html-lite-define-elements "map" ("area"))

;; THE LINK EKEMENT
(html-lite-define-elements ("link"))

;; IMAGES
(html-lite-define-elements ("img"))

;; OBJECT
(html-lite-define-elements ("object") ("param"))

;; ;; HORIZONTAL RULE
(html-lite-define-elements ("hr"))

;; PARAGRAPHS
(html-lite-define-elements "p")

;; HEADINGS
(html-lite-define-elements "h1" "h2" "h3" "h4" "h5" "h6")

;; PREFORMATTED
(html-lite-define-elements "pre")

;; INLINE QUOTES
(html-lite-define-elements "q")

;; BLOCK-LIKE QUOTES
(html-lite-define-elements "blockquote")

;; INSERTED/DELETED TEXT
(html-lite-define-elements "ins" "del")

;; LISTS
(html-lite-define-elements "dl" "dt" "dd" "ol" "ul" "li")

;; FORMS
(html-lite-define-elements "form" "label" ("input") "select" 
			   "optgroup" "option" "textarea" 
			   "fieldset" "legend" "button")

;; TABLES
(html-lite-define-elements "table" "caption" "thead" "tfoot" 
			   "tbody" "colgroup" ("col") 
			   "tr" "th" "td")

;; DOCUMENT HEAD
(html-lite-define-elements "head" "title" ("base") ("meta")
			   "style" "script" "noscript")

;; DOCUMENT STRUCTURE
(html-lite-define-elements "html")

;;; ==============================
;;; html-lite.el section ends here
;;; ==============================

;;; ==============================
(provide 'ebay-template-html-utils)
;;; ==============================

;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; ebay-template-html-utils.el ends here
;;; EOF
