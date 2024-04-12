;; -*- mode: EMACS-LISP; -*-
;;; this is naf-mode-sql-skeletons.el
;;; ================================================================
;;; DESCRIPTION:
;;; naf-mode-sql-skeletons provides routinely used sql statements that are DBC
;;; MySQL specific. This package _SHOULD NOT_ be exposed/exported publicly.
;;;
;;; :SEE :FILE mon-mysql-utils.el 
;;; :SEE :FILE ../lisp/progmodes/sql.el
;;;
;;; FUNCTIONS:▶▶▶
;;; `mon-insert-sql-update'
;;; FUNCTIONS:◀◀◀
;;;
;;; MACROS:
;;; `mon-insert-sql-item-select'            ; <SKELETON>
;;; `mon-insert-sql-item-range-select'      ; <SKELETON> 
;;; `mon-insert-sql-multiple-items-select'  ; <SKELETON>
;;; `mon-insert-sql-item-update-skeleton'   ; <SKELETON>
;;; `item-naf'                              ; <SKELETON>
;;; METHODS:
;;;
;;; CLASSES:
;;;
;;; CONSTANTS:
;;;
;;; VARIABLES:
;;;
;;; ALIASED/ADVISED/SUBST'D:
;;;
;;; DEPRECATED:
;;;
;;; RENAMED:
;;;
;;; MOVED:
;;;
;;; TODO: `mon-insert-sql-update' needs to flesh out with prompts: 
;;;       i)   What to fields to update;
;;;       ii)  What to fields to insert;
;;;       iii) Ref to insert for;
;;;
;;; NOTES:
;;;
;;; SNIPPETS:
;;;
;;; REQUIRES:
;;;
;;; THIRD PARTY CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;;; FILE-CREATED: Winter 2008
;;; HEADER-ADDED: <Timestamp: #{2009-01-03T18:42:11-05:00Z}#{090106} - by MON>
;;; ================================================================
;;; This file is not part of GNU Emacs.
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
;;; Permission is granted to copy, distribute and/or modify this
;;; document under the terms of the GNU Free Documentation License,
;;; Version 1.3 or any later version published by the Free Software
;;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;;; and no Back-Cover Texts. A copy of the license is included in
;;; the section entitled "GNU Free Documentation License".
;;; A copy of the license is also available from the Free Software
;;; Foundation Web site at:
;;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;;; Copyright © 2009 MON KEY 
;;; ==============================
;;; CODE:


;;; ==============================
(define-skeleton mon-insert-sql-item-select
  "Insert an sql-statement skeleton to select a dcp item.\n
:SEE-ALSO `mon-insert-sql-item-range-select', 
`mon-insert-sql-multiple-items-select', `mon-insert-sql-update',
`mon-insert-sql-item-update-skeleton'.\n▶▶▶"
  (interactive "p")
  "SELECT * FROM `ref` WHERE `ref` =" /n)

;;; ==============================
(define-skeleton mon-insert-sql-item-range-select
  "Insert an sql-statement skeleton to select a range of dcp items.\n
:SEE-ALSO `mon-insert-sql-item-select', `mon-insert-sql-update',
`mon-insert-sql-multiple-items-select', `mon-insert-sql-item-update-skeleton'.
▶▶▶"
  (interactive "p")
  "SELECT * FROM `refs` WHERE `ref` BETWEEN 'nnnnn' AND 'nnnnn'" /n)


;;; ==============================
(define-skeleton mon-insert-sql-multiple-items-select
  "Insert an sql-statement skeleton to select mulitiple dcp items.\n
:SEE-ALSO `mon-insert-sql-item-select', `mon-insert-sql-item-range-select'
`mon-insert-sql-update', `mon-insert-sql-item-update-skeleton'.\n▶▶▶"
  (interactive "p")
  "SELECT * FROM `refs` WHERE `ref` IN ('nnnnn', 'nnnnn','nnnnn')" /n)

;;; ==============================
;;; NOTE: maybe pack all the let bindings into an alist.
;;;  -> prompt -> valp|nilp -> foreach nil insert ''|valp
(defun mon-insert-sql-update (dbc-title)
  "Insert an sql-statement skeleton to update a dcp items with DBC-TITLE.\n
:SEE-ALSO `mon-insert-sql-item-select', `mon-insert-sql-item-range-select'
`mon-insert-sql-multiple-items-select',`mon-insert-sql-item-update-skeleton'.
▶▶▶"
  (interactive "sDBC-Title:")
  (let ((title dbc-title) 
        ref  
        desc_en  price  desc_fr  
        artist  author  book  people  brand  latin_name
        composer  publisher  publish_location  Plate_number  
        volume  edition  issue  page  date  year
        year_year  user_name  theme3  theme2  theme
        w  h  color  onlinen  condition  notes
        translation  uri  seo_title  description_seo
        keywords_seo  keywords)
    (insert 
     (format 
      (concat 
       "UPDATE `refs` "
       "SET title ='%s', "
       "desc_en ='%s', price ='%s', desc_fr ='%s', "
       "artist ='%s', author ='%s', book ='%s', people ='%s', brand ='%s', latin_name ='%s', "
       "composer ='%s', publisher ='%s', publish_location ='%s', Plate_number ='%s', "
       "volume ='%s', edition ='%s', issue ='%s', page ='%s', date ='%s', year ='%s', "
       "year_year='%s', user_name ='%s', theme3 ='%s', theme2 ='%s', theme ='%s', "
       "w ='%s', h ='%s', color ='%s', onlinen ='%s', condition ='%s', notes ='%s', "
       "translation ='%s', uri ='%s', seo_title ='%s', description_seo ='%s', keywords_seo ='%s',"
       "keywords  ='%s', WHERE `ref` = '%s' " )
      title 
      desc_en price desc_fr 
      artist author book people brand latin_name 
      composer publisher publish_location Plate_number 
      volume edition issue page date year 
      year_year user_name theme3 theme2 theme 
      w h color onlinen condition notes 
      translation uri seo_title description_seo keywords_seo 
      keywords ref))))

;;; ==============================
(define-skeleton mon-insert-sql-item-update-skeleton
  "Insert an sql-statement skeleton to update a dcp item.\n
:SEE-ALSO `mon-insert-sql-item-select', `mon-insert-sql-item-range-select'
`mon-insert-sql-multiple-items-select', `mon-insert-sql-update'\n▶▶▶"
  (interactive "p")
  "UPDATE `refs` SET bar_code ='', title ='', Plate_number ='', price ='0', desc_fr ='', desc_en ='', condition ='', histo_fr ='', histo_en ='0', categ ='0', c1 ='0', c2 ='0', c3 ='0', c4 ='0', theme ='0', keywords ='', issue ='0', year ='0', artist ='', author ='', book ='', publisher ='', publish_location ='', w ='0', h ='0', technique ='', paper ='', color ='0', onlinen ='0', av_repro ='0', latin_name ='', nbre ='0', online ='0', seller ='', people ='', related_doc ='0', brand ='', translation ='0', date ='0', user_name ='0', done ='0', job_name ='0', locked ='0', keywords_type ='', text_quote ='', theme3 ='', theme2 ='', c6 ='', weight ='0', c5 ='0', composer ='', uri ='0', year_year='0', notes ='', volume ='', edition ='', page ='', bct ='', categ_doc ='0', c1_doc ='0', c2_doc ='0', c3_doc ='0', ebay_final ='0', ebay_price ='0', ebay_title ='', ebay_id ='0', seo_title ='', description_seo ='', keywords_seo ='' WHERE `ref` IN ('nnnnn', 'nnnnn','nnnnn')" \n)

;;; ==============================
;; :ITEM-NAF
(define-skeleton item-naf
  "Inserts the item-naf-template. Most fields are fontlocked when used in `naf-mode'.\n
Fields provided and flagged by item-naf:\n
item-number:, created-by:, created-on:, price:, sold:, sold-on:, online:, zoom:,
flash:, header:, category:, artist:, author:, people:, brand:, composer:, latin-name:,
book:, publisher:, publish-location:, year-only:, year-range:, date-mm-dd-yyyy:,
volume:, edition:, issue:, page:, plate:, title:, english-description:,
english-translation:, french-trasnalation:, print-type:, paper-type:, color:,
 on-linen:, width:, height:, condition:, theme-one:, theme-two:, theme-three:,
suggest-alternate-theme:, page-title:, keywords:, adv-description:.\n
:SEE-ALSO `artist-naf', `brand-naf', `book-naf', `people-naf', `author-naf'.\n▶▶▶"
  (interactive "p")
";; -*- mode: NAF; -*-" \n
"item-number: "\n
"created-by: "\n
"created-on: "\n
"---"\n
"price: "\n
"sold: "\n
"sold-on: "\n
"online: "\n
"---"\n
"zoom: "\n
"flash: "\n
"header: "\n
\n 
"---"\n
"category: "\n
\n
"---"\n
"artist: "\n
"author: "\n
"people: "\n
"brand: "\n
"composer: "\n
"latin-name: "\n
"---"\n
"book: "\n
\n
"publisher: "\n
"publish-location: "\n
\n
"---"\n
\n
"year-only: "\n
"year-range: "\n
"date-mm-dd-yyyy: "\n
"---"\n
"volume: "\n
"edition: "\n
"issue: "\n
"page: "\n
"plate: "\n
\n 
"---"
\n
"title: "\n
\n
"english-description: "\n
\n
"english-translation: "\n
\n
"french-trasnalation: "\n
\n
"---"\n
\n
"print-type: "\n
"paper-type: "\n
"color: "\n
"on-linen: "\n
"width: "\n
"height: "\n
"condition: "\n
\n
\n
"---"\n
"theme-one: "\n
"theme-two: "\n
"theme-three: "\n
"suggest-alternate-theme: "\n
"---"\n
"page-title: "\n
"keywords: "\n
\n
"adv-description: "\n
\n
"---"\n
";;; item-naf EOF")

;;; ==============================
;;; ,----
;;; | ;;-*- mode: SQL; -*-
;;; `----

;;; ;; :NOTE for use with :FILE ../lisp/progmodes/sql.el
;;; ,----
;;; | (sql-server  "localhost")
;;; | (setq sql-password "")
;;; | (setq sql-user "root")
;;; | 
;;; |  sql-read-passwd
;;; |  sql-get-login
;;; | (sql-get-login 'user 'password 'database)
;;; | 
;;; | sql-mysql
;;; `----

;;; skeletons to quickly insert sql strings
;;; SELECT * FROM `refs` WHERE `ref` = 
;;; SELECT * FROM `refs` WHERE `ref` BETWEEN 'nnnnn' AND 'nnnnn'
;;; SELECT * FROM `refs` WHERE `ref` IN ('nnnnn', 'nnnnn','nnnnn')
;;; SELECT * FROM  tableN WHERE colN = 'val'    
;;; SELECT col1,col2,col3 FROM  tableN WHERE colN = 'val'  
;;;
;;; LIKE "SOMETHING%" ;<= the `%' is a wild card
;;; LIKE "%SOMETHING%"  ;<= the `%' is a wild card
;;; SELECT * FROM `refs` WHERE `bct` LIKE "Art%"
;;; UPDATE `refs` SET ebay_final='0', ebay_price='0', ebay_title='0', ebay_id='0', bct='0' WHERE `bct` LIKE "Art%"
;;; "SELECT * FROM `refs` WHERE `ref` BETWEEN 'nnnnn' AND 'nnnnn';
;;;  UPDATE `refs`
;;; "SELECT `TABLE-NAME`,  FROM `COLUMN-NAME` WHERE `VALUE-NAME` BETWEEN 'nnnnn' AND 'nnnnn';
;;; "UPDATE `COLUMN-NAME` SET `VALUE-NAME` = "VALUE" WHERE `COLUMN-NAME` BETWEEN 'nnnnn' AND 'nnnnn';"


;;; ==============================
;;; :NOTE Following are DCP specific MySQL statements.
;;; ==============================
;;; :ARTIST_INFOS
;;; ,----
;;; | check table derbycityprints.artist_infos;
;;; | show create table artist_infos;
;;; | show columns from artist_infos;
;;; | show index from artist_infos;
;;; | select max(id) FROM artist_infos;
;;; | select display FROM artist_infos;
;;; | select display FROM artist_infos;
;;; | select * from artist_infos where display like "Flagg%";
;;; | select * from artist_infos where id=1227;
;;; `----

;;; ==============================
;;; :ARTIST_LIST
;;; ,----
;;; | show columns from artist_list;
;;; | select * from artist_list;
;;; `----

;;; ==============================
;; :SHOW-DBC-TABLE-COLS
;;; ,----
;;; | show columns from author_infos;
;;; | show columns from bios;
;;; | show columns from book_infos;
;;; | show columns from brand_infos;
;;; | show columns from c_1;
;;; | show columns from c_2;
;;; | show columns from c_3;
;;; | show columns from c_4;
;;; | show columns from categ;
;;; | show columns from categ_short;
;;; | show columns from categs_ebay;
;;; | show columns from categs_ebay_fr;
;;; | show columns from compare_box;
;;; | show columns from condition;
;;; | show columns from countries;
;;; | show columns from customers;
;;; | show columns from docs;
;;; | show columns from docs_index;
;;; | show columns from ebay_users;
;;; | show columns from french_english;
;;; | show columns from general_infos;
;;; | show columns from history;
;;; | show columns from inquiries;
;;; | show columns from mattes_color;
;;; | show columns from orders;
;;; | show columns from paper_infos;
;;; | show columns from people_infos;
;;; | show columns from player_infos;
;;; | show columns from refs;
;;; | show columns from reserved_items;
;;; | show columns from saved_user_searches;
;;; | show columns from sold_in_store;
;;; | show columns from sold_refs;
;;; | show columns from states;
;;; | show columns from styles_refs;
;;; | show columns from technique_infos;
;;; | show columns from themes;
;;; | show columns from themesTEST;
;;; | show columns from themes_active;
;;; | show columns from themes_fr;
;;; | show columns from thms_actv;
;;; | show columns from translations;
;;; | show columns from users;
;;; | show columns from weights;
;;; | show columns from whislist;
;;; | show columns from words;
;;; `----

;;; ==============================
;;; NOT-FUNCTIONAL AS-OF: <Timestamp: Wednesday May 13, 2009 @ 11:57.11 AM - by MON KEY>
;;; Install to naf-mode-sql-skeletons.el when complete
;;; TODO: will be used to clean B's mailing list vcard->csv->elisp 
;;; Can be used in ebay-templates and DBC.
;;; The full file and notes for this are in: 
;;; `../emacs-load-files/naf-mode/notes/Barbara_Mailing-5-12-09'
;;; File contains additional .el files for csv-mode, csv-nav, csv.el vcard.el vm-vcard.el etc.
;;; ==============================
;;;;;(defun mon-csv-loop (delimiter &optional eol-is prefix-c-with suffix-c-with)
;; (defun test-csv-loop (col-hdr-ln-at delimiter &optional eol-is prefix-c-with suffix-c-with)
;;   (interactive)
;;   (let ((walker)
;; 	(holder)
;; 	(empty)
;; 	;;(hdr-ln col-hdr-ln-at)
;; 	;;(prfx-c prefix-c-with) 
;; 	;;(sfx-c suffix-c-with)
;; 	;;(delim delimiter)
;; 	;(eol-is
;; 	;;(cols-are ;(defun get-csv-col-header-line hdr-ln)
;; 	;'("Col1" "Col2" "Col3" "Col4" "Col5" "Col6" "Col7" "Col8" "Col9"
;; 	;"Col10" "Col11" "Col12" "Col13" "Col14" "Col15" "Col16" "Col17" "Col18"
;; 	;"Col19" "Col20" "Col21" "Col22" "Col23" "Col24" "Col25" "Col26" "Col27"
;; 	;"Col28" "Col29" "Col30" "Col31" "Col32" "Col33"))
;; 	)
;;     (setq csv-hdr '("1:" "2:" "3:" "4:" "5:" "6:"))
;;     ;;(setq csv-hdr cols-are)
;;     (setq csv-ln '("," "," "," "," "," ","))
;;     (setq csv-cntr ())
;;     (while csv-hdr
;;       (let ((frnt (car csv-hdr))
;;         (put-it (car csv-ln)))
;;     (setq csv-cntr (cons (concat "mon-key::" frnt put-it) csv-cntr))
;;     (setq csv-hdr (cdr csv-hdr))
;;     (setq csv-ln (cdr csv-ln))))
;;     (setq csv-cntr (nreverse csv-cntr))
;;     (progn (newline)
;;        (prin1 csv-cntr (current-buffer)))))
;; (test-csv-loop)

;;;=> ("mon-key::1:," "mon-key::2:," "mon-key::3:," "mon-key::4:," "mon-key::5:," "mon-key::6:,")

;;; ==============================
;;; :TEST-ME ;"1:," "2:," "3:," "4:," "5:," "6:,"
;;; :TEST-ME "1:," "2:," "3:," "4:," "5:," "6:,"
;;; :TEST-ME "1:," "2:," "3:," "4:," "5:," "6:,"
;;; :TEST-ME "1:," "2:," "3:," "4:," "5:," "6:,"
;;; :TEST-ME "Col1" "Col2" "Col3" "Col4" "Col5" "Col6" "Col7" "Col8" "Col9"
;;;  "Col10" "Col11" "Col12" "Col13" "Col14" "Col15" "Col16" "Col17" "Col18"
;;;  "Col19" "Col20" "Col21" "Col22" "Col23" "Col24" "Col25" "Col26" "Col27"
;;;  "Col28" "Col29" "Col30" "Col31" "Col32" "Col33"
;;; ==============================

;;; ==============================
(provide 'naf-mode-sql-skeletons)
;;; ==============================

;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; naf-mode-sql-skeletons.el ends here
;;; EOF
