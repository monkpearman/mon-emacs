;;; mon-eight-bit-raw-utils.el --- Match and normalize strings corrupted by eight bit raw.
;;; ================================================================
;;; DESCRIPTION:
;;; mon-eight-bit-raw-utils provides {description here}.
;;;
;;; FUNCTIONS:▶▶▶
;;; `mon-cln-eight-bit-raw'
;;; FUNCTIONS:◀◀◀
;;;
;;; MACROS:
;;;
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
;;; TODO:
;;;
;;; NOTES:
;;;
;;; SNIPPETS:
;;;
;;; REQUIRES:
;;;
;;; THIRD-PARTY-CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;;; PUBLIC-LINK: (URL `http://www.emacswiki.org/emacs/mon-eight-bit-raw-utils.el')
;;; FIRST-PUBLISHED:
;;;
;;; FILE-CREATED:
;;; <Timestamp: #{2010-02-12T13:08:34-05:00Z}#{10065} - by MON KEY>
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
;; document under the terms of the GNU Free Documentation License,
;; Version 1.3 or any later version published by the Free Software
;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;; and no Back-Cover Texts. A copy of the license is included in
;; the section entitled ``GNU Free Documentation License''.
;; 
;; A copy of the license is also available from the Free Software
;; Foundation Web site at:
;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;; Copyright © 2010-2024 MON KEY 
;;; ==============================
;;; CODE:

(eval-when-compile (require 'cl))


;;; ==============================
;;; :TODO Finish populating the map and build the replace function.
;;;       To be used with SQL cleanups also.
;;; :NOTE This problem is do to dumping from an NTFS -> FAT32 drive.
;;; Filenames lost some metadata.
;;; :CREATED <Timestamp: #{2010-02-12T13:06:57-05:00Z}#{10065} - by MON>
(defun mon-cln-eight-bit-raw ()
"List of raw eight bit chars that may get clobbered on w32 file systems.\n

\261 -> This gets mapped to ñ (241, #o361, #xf1) :CODE-POINT 0xF1
        :EIGHT-BIT-RAW (4194225, #o17777661, #x3fffb1)

\311 -> \"\\311\" -> É \(201, #o311, #xc9\) :CODE-POINT 0xC9 
        :EIGHT-BIT-RAW \(4194249, #o17777711, #x3fffc9\)

\347 -> \"\\347\" -> ç \(231, #o347, #xe7\) :CODE-POINT 0xE7
        :EIGHT-BIT-RAW \(4194279, #o17777747, #x3fffe7\)

\350 -> \"\\350\" -> è \(232, #o350, #xe8\) :CODE-POINT 0xE8
        :EIGHT-BIT-RAW \(4194280, #o17777750, #x3fffe8\)

\351 -> \"\\351\" -> é \(233, #o351, #xe9\) :CODE-POINT 0xE9
        :EIGHT-BIT-RAW \(4194281, #o17777751, #x3fffe9\)

\353 -> \"\\353\" -> ë \(235, #o353, #xeb\) code point: 0xEB
        :EIGHT-BIT-RAW \(4194283, #o17777753, #x3fffeb\)

:SEE-ALSO :SEE-ALSO `mon-help-bitwise-functions', `mon-help-binary-representation',
`mon-help-charset-coding-functions', `mon-help-char-composition'.\n▶▶▶"
nil)

;;; ==============================
(provide 'mon-eight-bit-raw-utils)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; mon-eight-bit-raw-utils.el ends here
;;; EOF
