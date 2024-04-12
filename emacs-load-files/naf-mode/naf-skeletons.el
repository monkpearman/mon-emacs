;;; naf-skeletons.el --- skeleton templates for use with naf-mode
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: naf-mode-ulan-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-08-22T15:59:58-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: naf-mode, template, name authority files

;;; ================================================================

;;; COMMENTARY: 

;; ================================================================
;; DESCRIPTION:
;; naf-skeletons provides skeleton templates, keyboard macros and helper functions
;; used by `naf-mode'. This enclose simple skeletons are used to load naf 
;; for '.naf' file templates when in `naf-mode'
;; all headwords defined herein are font-locked by constants defined 
;; elsewhere in the naf-mode*.el files.
;;
;; FUNCTIONS:▶▶▶
;;
;; FUNCTIONS:◀◀◀
;;
;; MACROS:
;; `book-naf'             ; <SKELETON>
;; `artist-naf'           ; <SKELETON>
;; `people-naf'           ; <SKELETON>
;; `author-naf'           ; <SKELETON>
;; `brand-naf'            ; <SKELETON>
;; `benezit-naf-template' ; <SKELETON>
;;
;; CONSTANTS:
;;
;; VARIABLES:
;;
;; ALIASED/ADVISED/SUBST'D:
;;
;; DEPRECATED:
;; RENAMED:
;; MOVED:
;; REQUIRES:
;;
;; TODO:
;; Everything in this file should be refactored. We have never really used the
;; features provided by the `define-skeleton' macro (these were the first set
;; procedures implemented by/for `naf-mode' and we really didn't know what we
;; were doing nor was it clear where naf-mode was heading or what it would
;; become. It would be easier and cleaner to either abstract everything here
;; into a macro w/ var lookup or a defclass w/ associated methods. The later
;; would integrate best w/ other features planned and or already implemented in
;; naf-mode.
;;
;; Additionally, the various `*-naf' template types have "field types" which
;; deviate from each other and in some cases there are minor incoconsistencies
;; as to what the particular field indicates and what types of values they
;; should be filled with. As such, when an `*-naf' template is inserted it
;; should be pre-populated with additional help-echo/button text properties to
;; provide usage discussion, xrefs, help, etc.
;; 
;; NOTES:
;;
;; SNIPPETS:
;;
;; THIRD PARTY CODE:
;;
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;;
;; PUBLIC-LINK: (URL `http://www.emacswiki.org/emacs/naf-skeletons.el')
;; FIRST-PUBLISHED:
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-08-22T15:59:58-04:00Z}#{09346} - by MON KEY>

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

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))


;;; ==============================
(define-skeleton book-naf
  "Insert a book-naf skeleton.\n
Fields interted include:\n
 Book-naf: Book-doc: Uploaded-by: Display-title: Full-title:
 Location-published: Published-by: Publication Dates: Number-of-volumes:
 Number-of-pages: Number-of-illustrations: Special-notes: Authors-associated:
 Artists-associated: Content-and-subjects: Auction-records: LOC: OCLC: BNF:
 OTHER-DB: Book-notes:\n
:USED-IN `naf-mode'.\n
:SEE-ALSO `artist-naf', `brand-naf', `people-naf', `author-naf', `item-naf'.\n▶▶▶"
  (interactive "p")

  ";; -*- mode: NAF; -*-" \n
  "Book-naf: " \n
  "Book-doc: " \n
  "Uploaded-by: " \n
  "---"\n
  "Display-title:"
  \n
  \n
  "Full-title:"
  \n
  \n
  "Location-published:"\n
  \n
  "Published-by:"\n
  \n
  "Publication Dates:"\n
  \n
  "Number-of-volumes:"\n
  \n
  "Number-of-pages:"\n
  \n
  "Number-of-illustrations:"\n
  \n
  "Special-notes:"\n
  \n
  "Authors-associated:"\n
  \n
  \n
  "Artists-associated:"\n
  \n
  \n
  "Content-and-subjects:"\n
  \n
  \n
  "Auction-records:"\n
  \n
  \n 
  "---"\n
  "LOC:"\n
  \n
  \n
  "---"\n
  "OCLC:"\n
  \n
  \n
  "---"\n
  "BNF:"\n
  \n
  \n
  "---"\n
  "OTHER-DB:"\n
  \n
  \n
  "---"\n
  "Book-notes:"\n
  \n
  \n
  "---"\n
  ";;; book-naf EOF"\n)


;;; ==============================
(define-skeleton artist-naf
  "Insert an artist-naf skeleton.\n
Fields interted include:\n
 Artist-naf: Artist-doc: Uploaded-by: Display-name:
 Used-for: Roles: Born: Died: 
 Appeared-in: LOC: ULAN: BNF: Bios:\n
:USED-IN `naf-mode'\n
:SEE-ALSO `book-naf', `brand-naf', `book-naf', `people-naf', `author-naf',
`item-naf', `mon-dired-naf-artist-letter'.\n▶▶▶"
  (interactive "p")

  ";; -*- mode: NAF; -*-" \n
  "Artist-naf: " \n
  "Artist-doc: " \n
  "Uploaded-by: " \n
  "---"\n
  "Display-name:" \n 
  \n
  "Used-for:" \n
  \n
  \n
  "Roles:" \n
  \n
  \n
  "Born: " \n
  "Died: " \n
  \n
  "Appeared-in:"\n
  \n
  \n
  "---" \n
  "LOC:"
  \n
  \n
  "---" \n
  "ULAN:" \n
  \n
  \n
  "---" \n
  "BNF:"
  \n
  \n
  "---" \n
  "Bios:" \n
  \n
  \n
  "---"\n
  ";;; artist-naf EOF"\n)


;;; ==============================
(define-skeleton people-naf
  "Insert people-naf skeleton.\n
Fields inserted include:\n
 People-naf: People-doc: Uploaded-by: Display-name: 
 Used-for: Other-roles: Born: Died: 
 Appeared-in: Artists-associated: LOC: OCLC: BNF: Bios:\n
:USED-IN `naf-mode'\n
:SEE-ALSO `artist-naf', `brand-naf', `book-naf', `author-naf', `item-naf'.\n▶▶▶"
  (interactive "p")

";; -*- mode: NAF; -*-" \n
"People-naf: " \n
"People-doc: " \n
"Uploaded-by: " \n
"---"\n
"Display-name:"
\n 
\n
"Used-for:"\n
\n
\n
"Other-roles:"
\n
\n
"Born: " \n
"Died: " \n
\n
"Appeared-in:" \n
\n
\n
"Artists-associated:"\n
\n
\n
"---"\n
"LOC:"\n
\n
\n
"---"\n
"OCLC:"\n
\n
\n
"---"\n
"BNF:"\n
\n
\n
"---"\n
"Bios:"\n
\n
\n
"---"\n
";;; people-naf EOF"\n)


;;; ==============================
(define-skeleton author-naf
  "Insert an author-naf skeleton.\n
Fields inserted include:\n
 Author-naf: Author-doc: Uploaded-by: Display-name: 
 Used-for: Other-roles: Born: Died: 
 Appeared-in: LOC: OCLC: BNF: Bios:\n
:SEE-ALSO `artist-naf', `brand-naf', `book-naf', `people-naf', `item-naf'.\n▶▶▶"
  (interactive "p")
";; -*- mode: NAF; -*-" \n
"Author-naf: " \n
"Author-doc: " \n
"Uploaded-by: " \n
"---"\n
"Display-name:"
\n 
\n
"Used-for:"\n
\n
\n
"Other-roles:"
\n
\n
"Born: " \n
"Died: " \n
\n
"Appeared-in:" \n
\n
\n
"---"\n
"LOC:"\n
\n
\n
"---"\n
"OCLC:"\n
\n
\n
"---"\n
"BNF:"
\n
\n
"---"\n
"Bios:"\n
\n
\n
"---"\n
";;; author-naf EOF"\n)


;;; ==============================
;;; :BRAND-NAF
(define-skeleton brand-naf
  "Insert brand-naf skeleton.\n
Fields inserted include:\n
 Brand-naf: Brand-doc: Uploaded-by: 
 Brand-name: Used-for:
 Products-associated: Slogans: Location-country: Date-founded: Founded-by:
 Artists-associated: Appeared-in: LOC: OCLC: Bios:\n
:USED-IN `naf-mode'\n
:SEE-ALSO `artist-naf', `book-naf', `people-naf', `author-naf',
`item-naf', `mon-dired-naf-brand-letter'.\n▶▶▶"
  (interactive "p")
";; -*- mode: NAF; -*-" \n
"Brand-naf: " \n
"Brand-doc: " \n
"Uploaded-by: " \n
"---"\n
"Brand-name:"\n
\n
\n
"Used-for:"\n
\n
\n
"Products-associated:"\n
\n
\n
"Slogans:"\n
\n
\n
"Location-country:"\n
\n
\n
"Date-founded:"
\n
\n
"Founded-by:"
\n
\n
"Artists-associated:"\n
\n
\n
"Appeared-in:"\n
\n
\n
"---"\n
"LOC:"\n
\n
\n
"---"\n
"OCLC:"\n
\n
\n
"---"\n
"Bios:"\n
\n
\n
"---"\n
";;; brand-naf EOF"\n)


;;; ==============================
(define-skeleton benezit-naf-template
  "Insert relevant benezit declarations for dbc docs pre-upload.\n
:EXAMPLE\n\n\(with-temp-buffer \(benezit-naf-template\)
   \(buffer-substring-no-properties \(buffer-end 0\) \(buffer-end 1\)\)\)\n
:USED-IN `naf-mode'.\n
:SEE-ALSO`non-posting-source', `non-posting-internet-source',
`non-posting-ebay-source', `non-posting-imdb-source', `non-posting-philsp-source',
`non-posting-benezit-source', `benezit-naf-template'.\n▶▶▶"
  (interactive "p")
"-" \n
"source:" \n
"Benezit vol  pg" \n
\n
\n
"- Bio en Français" \n
"-" \n
"Source:" \n
\n
\n
\n
"-----------" \n
"This documentation appears courtesy:" \n
"E. Benezit : Dictionnaire des Peintres, Sculpteurs, Dessinateurs et Graveurs. Grund, Paris, 1999." \n
"To learn more -or to acquire your own Benezit- go to www.benezit.com" \n
)

;;; ==============================
(provide 'naf-skeletons)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ==============================
;;; naf-skeletons.el ends here
;;; EOF
