;;; naf-mode-ulan-help-docs.el -- help related functions for naf-mode-ulan-utils.el
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: naf-mode-ulan-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-09-01T11:30:04-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: naf-mode, help, name authority files

;;; ================================================================

;;; COMMENTARY: 

;; ================================================================
;; DESCRIPTION:
;; naf-mode-ulan-help-docs provides NON-POSTING help docs related to use of
;; ULAN data in naf-mode.  The docs originate from the getty website or a
;; J.P. Getty Trust affiliates.  The docs are verbose and it is considered
;; overkill to include them in :FILE "naf-mode-ulan-utils.el"
;; 
;; FUNCTIONS:▶▶▶
;; `mon-help-naf-mode-ulan-flags', `mon-help-naf-mode-ulan-fields',
;; FUNCTIONS:◀◀◀
;;
;; CONSTANTS:
;;
;; VARIABLES:
;;
;; MACROS:
;;
;; SUBST or ALIASES:
;;
;; DEPRECATED:
;;
;; RENAMED: 
;;
;; MOVED:
;;
;; REQUIRES:
;;
;; TODO:
;;
;; NOTES:
;;
;; SNIPPETS:
;;
;; THIRD PARTY CODE:
;;
;; URL: http://www.emacswiki.org/emacs/naf-mode-ulan-help-docs.
;; FIRST-PUBLISHED: 
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-09-12T11:35:50-04:00Z}#{09376} - by MON KEY>
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

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

;;; ==============================
;;; CREATED: <Timestamp: #{2009-09-12T11:42:41-04:00Z}#{09376} - by MON KEY>
(defun mon-help-naf-mode-ulan-flags (&optional insertp intrp)
  "Valuse identified by regexps in `naf-mode-db-field-flags-ulan-paren',.\n\n
ULAN-PREFERRED-FLAG:
'preferred' following a role indicates that the role is the so-called
'preferred' role for the record. It is typically the first in a list of roles
for the artist. A preferred role is flagged in order to provide a default role
for displays.\n
NON-PREFERRED-PARENTS-FLAG:
The [N] flage indicates 'non-preferred' parent. Names may have multiple
hierarchical views because ULAN is polyhierarchical. One parent is considered
'preferred,' and other parents are 'non-preferred.' When names are displaying
with their non-preferred parent, an 'N' in square brackets appears to the right
as [N].\n
HISTORICAL-FLAG:
Indicates if the Role is current or historical. Currently in ULAN, most roles
are flagged 'N/A' for Not Applicable. Possible values are:
C -> Current
H -> Historical
B -> Both current and historical
U -> Unknown
NA -> Not Applicable\n
PREFERRED-NATIONALITY-FLAG:
'preferred' following a nationality indicates that this is the nationality most
commonly associated with the artist. Note that nationality is not a legalistic
designation; it does not necessarily indicate citizenship of a particular
nation, empire, or city state.\n
HIERARCHICAL-RELATIONSHIP-FLAG:
Indicates if the link to the parent is current, historical, or of another type.
C -> Current
H -> Historical
B -> Both current and historical
U -> Unknown
NA -> Not Applicable 
BTP -> part/whole relationship
BTI -> genus/species relationship
BTG -> generic relationship\n
LC-FLAG:
Indicates if this is the name used in preferred headings in Library of Congress
authorities. Also called the 'AACR2 flag.'
NA -> Not applicable.\n
REPRESENTATIVE-IMAGES-FLAG:
In a proof-of-concept, a selected small number of vocabulary records have been
linked to images in the Getty collections. Further development of this project
will take place in 2009-2010.\n
VERNACULAR-FLAG:
Indicates if the name is in the vernacular (local) language or some other
language. Currently in the ULAN, most names are flagged 'V'.  Diacritics: If a
box displays instead of a character in a name or term, this means that your
system cannot display the Unicode character represented.\n
V = Vernacular
O = Other
U = Undetermined\n

:SOURCE ULAN Code Lookup, VERSION: Wednesday, May 13, 2009 12:29:23 PM
:SEE \(URL `http://www.getty.edu/research/conducting_research/vocabularies/ulan/ULANCodeLookup.html?flag=#preferred_role')
:SEE-ALSO .\n▶▶▶"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-naf-mode-ulan-flags :insertp t)
    (message (concat ":FUNCTION `mon-help-naf-mode-ulan-flags' " 
                     "-- pass non-nil for optional arg INTRP"))))
;;
;;; :TEST-ME (mon-help-naf-mode-ulan-flags)
;;; :TEST-ME (mon-help-naf-mode-ulan-flags t)
;;; :TEST-ME (documentation 'mon-help-naf-mode-ulan-flags)
;;; :TEST-ME (apply  'mon-help-naf-mode-ulan-flags '(t))

;;; ==============================
;; (defun mon-help-naf-mode-ulan-fields
;; ":CORPORATE-BODIES Related People or Corporate Bodies
;;
;; A corporate body may be a legally incorporated entity, such as
;; a modern architectural firm or museum, but it is not necessarily legally
;; incorporated; for example, a 16th-century sculptors’ studio or a family of
;; artists may be recorded as a corporate body.\n
;;
;; A corporate body must be an organized, identifiable group of individuals
;; working together in a particular place and within a defined period of
;; time. roles of corporate bodies include:
;;
;; :EXAMPLE\n
;; artists, firm, atelier, family, architects, architectural, firm, workshop,
;; university, painters, studio, manufactory, repository, sculptors, museum, art
;; museum, art gallery\n
;;
;; :RECORD-TYPE
;;
;; :PERSON 
;; Refers to records in the ULAN that represent a single individual, usually
;; someone who was engaged in the design or creation of art or architecture.\n
;;
;; :CORPORATE-BODY
;; Refers to records in the ULAN that represent two or more people, not necessarily
;; legally incorporated. They are generally people who worked together to
;; collectively create art, such as an architectural firm, porcelain manufactory,
;; or painters' workshop. A family of artists may also be a 'corporate body.'\n
;;
;; :GUIDE-TERM
;; Refers to records that serve as place savers to create a level in the hierarchy
;; under which the ULAN can collocate records. Guide terms are not used for
;; indexing or cataloguing. They are enclosed in angled brackets.\n
;;
;; :SOURCE ULAN Editorial Guidelines VERSION: 2008-11-12.\n
;; :SEE \(URL `http://www.getty.edu/research/conducting_research/vocabularies/ulan/')
;; ▶▶▶"

;;; ==============================
;;; :SOURCE ULAN Editorial Guidelines VERSION: 2008-11-12
;;
;; CORPORATE BODIES
;; A corporate body may be a legally incorporated entity, such as
;; a modern architectural firm or museum, but it is not necessarily legally
;; incorporated; for example, a 16th-century sculptors’ studio or a family of
;; artists may be recorded as a corporate body.
;;
;; A corporate body must be an organized, identifiable group of individuals working
;; together in a particular place and within a defined period of time. Examples of
;; roles of corporate bodies are listed below.
;;
;; EXAMPLES:
;; artists, firm, atelier, family, architects, architectural, firm, workshop,
;; university, painters, studio, manufactory, repository, sculptors, museum, art
;; museum, art gallery
;;
;;; :SOURCE
;;; (URL `http://www.getty.edu/vow/AATHierarchy?find=&logic=AND&note=&english=N&subjectid=300000000')
;;; :CREATED <Timestamp: #{2009-08-31T21:39:45-04:00Z}#{09362} - by MON>

;;; ==============================
(provide 'naf-mode-ulan-help-docs)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; naf-mode-ulan-help-docs.el ends here
;;; EOF
