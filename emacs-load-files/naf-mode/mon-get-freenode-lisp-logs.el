;;; mon-get-freenode-lisp-logs.el --- pull Freenode IRC logs for #lisp with wget
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2010-2011 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-get-freenode-lisp-logs.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2010-02-18T14:20:54-05:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: IRC, lisp, hypermedia, comm, execute, external

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-get-freenode-lisp-logs provides procudures to pull Freenode IRC logs for
;; #lisp with wget. Porivdes a list of logs to pull from 2004-01-01 through 2010-02-16 
;; 
;; Logs maintained courtesy:
;; :SEE (URL `http://tunes.org/~nef/logs/lisp/')
;;
;; FUNCTIONS:►►►
;; `mon-wget-freenode-lisp-logs', `mon-get-freenode-lisp-logs-dates',
;; FUNCTIONS:◄◄◄
;;
;; MACROS:
;;
;; METHODS:
;;
;; CLASSES:
;;
;; CONSTANTS:
;;
;; VARIABLES:
;; `*freenode-lisp-logs*',
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
;; Bind the variable `*freenode-lisp-logs*' to the list at BOF.
;; `mon-wget-freenode-lisp-logs' will unbind it after snarfing the #lisp logs.
;;
;; SNIPPETS:
;;
;; REQUIRES:
;; Requires mon-wget-utils.el
;; :SEE (URL `http://www.emacswiki.org/emacs/mon-wget-utils.el')
;;
;; THIRD-PARTY-CODE:
;;
;; URL: http://www.emacswiki.org/emacs/mon-get-freenode-lisp-logs.el
;; FIRST-PUBLISHED: <Timestamp: #{2010-03-27T17:21:04-04:00Z}#{10126} - by MON>
;;
;; EMACSWIKI: { URL of an EmacsWiki describing mon-get-freenode-lisp-logs. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2010-02-18T14:20:54-05:00Z}#{10074} - by MON KEY>
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
;; Copyright © 2010-2011 MON KEY 
;;; ==============================

;;; CODE:


(eval-when-compile (require 'cl))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

(require 'mon-wget-utils)


;;; ==============================
;;; :TODO should be defcustom'd
;;; :CREATED <Timestamp: #{2010-02-18T14:25:50-05:00Z}#{10074} - by MON KEY>
(defvar *freenode-lisp-logs* nil
  "*A list of IRC logs from freenode #lisp 2004-2010.\n
:SEE (URL `http://tunes.org/~nef/logs/lisp/').\n
:SEE-ALSO `mon-wget-freenode-lisp-logs', `mon-cln-freenode-log',
`mon-cln-freenode-log-TEST', `mon-help-CL-minion'.\n►►►")

;;; ==============================
;;; :TODO Build a non wget alternative using `url-insert-file-contents' instead.
;;; :NOTE (browse-url-emacs "http://tunes.org/~nef/logs/lisp" t)
;;; :CREATED <Timestamp: #{2010-02-18T14:39:26-05:00Z}#{10074} - by MON KEY>
;;;###autoload
(defun mon-wget-freenode-lisp-logs (freenode-logs-list 
                                    &optional save-wget-fname and-these-flags)
  "Invoke wget in `default-directory' and pull the logfiles.\n
The wget command and args generated with/from FREENODE-LOGS-LIST a list of
logfiles). If FREENODE-LOGS-LIST is `*freenode-lisp-logs*' and that var is bound
use it. If `*freenode-lisp-logs*' is nil, bind it to value of FREENODE-LOGS-LIST and 
set `*freenode-lisp-logs*' to nil upon succesfull snarafage.\n 
Optional args SAVE-WGET-FNAME and AND-THESE-FLAGS are as per
`mon-wget-list-to-script'.\n
:SEE (URL `http://tunes.org/~nef/logs/lisp/').\n
:SEE-ALSO `mon-wget-list-give-script-to-shell-command',
`mon-help-CL-wget-pkgs', `mon-help-CL-wget-pkgs-for-shell-command',
`mon-cln-freenode-log', `mon-cln-freenode-log-TEST', `mon-help-CL-minion'.\n►►►"
  (let (did-bind)
    (unwind-protect
         (if (and (boundp '*freenode-lisp-logs*)
                  (equal freenode-logs-list *freenode-lisp-logs*))
             (progn 
               (setq did-bind t)
               (mon-wget-list-give-script-to-shell-command 
                *freenode-lisp-logs* 
                "http://tunes.org/~nef/logs/lisp/" 
                save-wget-fname
                and-these-flags))
             (mon-wget-list-give-script-to-shell-command 
              freenode-logs-list
              "http://tunes.org/~nef/logs/lisp/"
              save-wget-fname
              and-these-flags))
      (when did-bind (setq *freenode-lisp-logs* nil)))))

;;; ==============================
;;; :CHANGESET 2387
;;; :CREATED <Timestamp: #{2011-01-11T20:50:40-05:00Z}#{11022} - by MON KEY>
;;;###autoload
(defun mon-get-freenode-lisp-logs-dates ()
  "Snarf the contents of (URL `http://tunes.org/~nef/logs/lisp/') and extract the date logs.
:SEE-ALSO `mon-wget-freenode-lisp-logs', `mon-cln-freenode-log',
`mon-cln-freenode-log-TEST', `mon-help-CL-minion'.\n►►►"
  (with-current-buffer (get-buffer-create "*MON-GET-FREENODE-LISP-LOGS-DATES*")
    (erase-buffer)
    (url-insert-file-contents "http://tunes.org/~nef/logs/lisp/" t)
    (mon-g2be -1)
    (save-excursion 
      (while (search-forward "<tr><td valign=\"top\"><img src=\"/icons/unknown.gif\" alt=\"[   ]\"></td><td><a href=\"" nil t)
        (replace-match ""))
      (mon-g2be -1)
      (while (search-forward-regexp "\"\>\\([[:digit:]]\\{2,2\\}\.\\)\\{3,3\\}.*</td></tr>" nil t)
        (replace-match ""))
      (delete-region (point) (search-forward-regexp  ".*</body></html>"))
      (mon-g2be -1)    
      (delete-region (point) (search-forward "</td></tr>" nil t)))
    (display-buffer (current-buffer) t)))

;;
;;; :NOTE Evaluate the setq form below to bind the variable `*freenode-lisp-logs*'.
;;; To pull the logs cd to the dir you wish to download the logs to and evaluate:
;;; (mon-wget-freenode-lisp-logs *freenode-lisp-logs*)
;;;
;;; (setq *freenode-lisp-logs* 
;;; '("04.01.01" "04.01.02" "04.01.03" "04.01.04" "04.01.05" "04.01.06" "04.01.07"
;;;   "04.01.08" "04.01.09" "04.01.10" "04.01.11" "04.01.12" "04.01.13" "04.01.14"
;;;   "04.01.15" "04.01.16" "04.01.17" "04.01.18" "04.01.19" "04.01.20" "04.01.21"
;;;   "04.01.22" "04.01.23" "04.01.24" "04.01.25" "04.01.26" "04.01.27" "04.01.28"
;;;   "04.01.29" "04.01.30" "04.01.31" "04.02.01" "04.02.02" "04.02.03" "04.02.04"
;;;   "04.02.05" "04.02.06" "04.02.07" "04.02.08" "04.02.09" "04.02.10" "04.02.11"
;;;   "04.02.12" "04.02.13" "04.02.14" "04.02.15" "04.02.16" "04.02.17" "04.02.18"
;;;   "04.02.19" "04.02.20" "04.02.21" "04.02.22" "04.02.23" "04.02.24" "04.02.25"
;;;   "04.02.26" "04.02.27" "04.02.28" "04.02.29" "04.03.01" "04.03.02" "04.03.03"
;;;   "04.03.04" "04.03.05" "04.03.06" "04.03.07" "04.03.08" "04.03.09" "04.03.10"
;;;   "04.03.11" "04.03.12" "04.03.13" "04.03.14" "04.03.15" "04.03.16" "04.03.17"
;;;   "04.03.18" "04.03.19" "04.03.20" "04.03.21" "04.03.22" "04.03.23" "04.03.24"
;;;   "04.03.25" "04.03.26" "04.03.27" "04.03.28" "04.03.29" "04.03.30" "04.03.31"
;;;   "04.04.01" "04.04.02" "04.04.03" "04.04.04" "04.04.05" "04.04.06" "04.04.07"
;;;   "04.04.08" "04.04.09" "04.04.10" "04.04.11" "04.04.12" "04.04.13" "04.04.14"
;;;   "04.04.15" "04.04.16" "04.04.17" "04.04.18" "04.04.19" "04.04.20" "04.04.21"
;;;   "04.04.22" "04.04.23" "04.04.24" "04.04.25" "04.04.26" "04.04.27" "04.04.28"
;;;   "04.04.29" "04.04.30" "04.05.01" "04.05.02" "04.05.03" "04.05.04" "04.05.05"
;;;   "04.05.06" "04.05.07" "04.05.08" "04.05.09" "04.05.10" "04.05.11" "04.05.12"
;;;   "04.05.13" "04.05.14" "04.05.15" "04.05.16" "04.05.17" "04.05.18" "04.05.19"
;;;   "04.05.20" "04.05.21" "04.05.22" "04.05.23" "04.05.24" "04.05.25" "04.05.26"
;;;   "04.05.27" "04.05.28" "04.05.29" "04.05.30" "04.05.31" "04.06.01" "04.06.02"
;;;   "04.06.03" "04.06.04" "04.06.05" "04.06.06" "04.06.07" "04.06.08" "04.06.09"
;;;   "04.06.10" "04.06.11" "04.06.12" "04.06.13" "04.06.14" "04.06.15" "04.06.16"
;;;   "04.06.17" "04.06.18" "04.06.19" "04.06.20" "04.06.21" "04.06.22" "04.06.23"
;;;   "04.06.24" "04.06.25" "04.06.26" "04.06.27" "04.06.28" "04.06.29" "04.06.30"
;;;   "04.07.01" "04.07.02" "04.07.03" "04.07.04" "04.07.05" "04.07.06" "04.07.07"
;;;   "04.07.08" "04.07.09" "04.07.10" "04.07.11" "04.07.12" "04.07.13" "04.07.14"
;;;   "04.07.15" "04.07.16" "04.07.17" "04.07.18" "04.07.19" "04.07.20" "04.07.21"
;;;   "04.07.22" "04.07.23" "04.07.24" "04.07.25" "04.07.26" "04.07.27" "04.07.28"
;;;   "04.07.29" "04.07.30" "04.07.31" "04.08.01" "04.08.02" "04.08.03" "04.08.04"
;;;   "04.08.05" "04.08.06" "04.08.07" "04.08.08" "04.08.09" "04.08.10" "04.08.11"
;;;   "04.08.12" "04.08.13" "04.08.14" "04.08.15" "04.08.16" "04.08.17" "04.08.18"
;;;   "04.08.19" "04.08.20" "04.08.21" "04.08.22" "04.08.23" "04.08.24" "04.08.25"
;;;   "04.08.26" "04.08.27" "04.08.28" "04.08.29" "04.08.30" "04.08.31" "04.09.01"
;;;   "04.09.02" "04.09.03" "04.09.04" "04.09.05" "04.09.06" "04.09.07" "04.09.08"
;;;   "04.09.09" "04.09.10" "04.09.11" "04.09.12" "04.09.13" "04.09.14" "04.09.15"
;;;   "04.09.16" "04.09.17" "04.09.18" "04.09.19" "04.09.20" "04.09.21" "04.09.22"
;;;   "04.09.23" "04.09.24" "04.09.25" "04.09.26" "04.09.27" "04.09.28" "04.09.29"
;;;   "04.09.30" "04.10.01" "04.10.02" "04.10.03" "04.10.04" "04.10.05" "04.10.06"
;;;   "04.10.07" "04.10.08" "04.10.09" "04.10.10" "04.10.11" "04.10.12" "04.10.13"
;;;   "04.10.14" "04.10.15" "04.10.16" "04.10.17" "04.10.18" "04.10.19" "04.10.20"
;;;   "04.10.21" "04.10.22" "04.10.23" "04.10.24" "04.10.25" "04.10.26" "04.10.27"
;;;   "04.10.28" "04.10.29" "04.10.30" "04.10.31" "04.11.01" "04.11.02" "04.11.03"
;;;   "04.11.04" "04.11.05" "04.11.06" "04.11.07" "04.11.08" "04.11.09" "04.11.10"
;;;   "04.11.11" "04.11.12" "04.11.13" "04.11.14" "04.11.15" "04.11.16" "04.11.17"
;;;   "04.11.18" "04.11.19" "04.11.20" "04.11.21" "04.11.22" "04.11.23" "04.11.24"
;;;   "04.11.25" "04.11.26" "04.11.27" "04.11.28" "04.11.29" "04.11.30" "04.12.01"
;;;   "04.12.02" "04.12.03" "04.12.04" "04.12.05" "04.12.06" "04.12.07" "04.12.08"
;;;   "04.12.09" "04.12.10" "04.12.11" "04.12.12" "04.12.13" "04.12.14" "04.12.15"
;;;   "04.12.16" "04.12.17" "04.12.18" "04.12.19" "04.12.20" "04.12.21" "04.12.22"
;;;   "04.12.23" "04.12.24" "04.12.25" "04.12.26" "04.12.27" "04.12.28" "04.12.29"
;;;   "04.12.30" "04.12.31" "05.01.01" "05.01.02" "05.01.03" "05.01.04" "05.01.05"
;;;   "05.01.06" "05.01.07" "05.01.08" "05.01.09" "05.01.10" "05.01.11" "05.01.12"
;;;   "05.01.13" "05.01.14" "05.01.15" "05.01.16" "05.01.17" "05.01.18" "05.01.19"
;;;   "05.01.20" "05.01.21" "05.01.22" "05.01.23" "05.01.24" "05.01.25" "05.01.26"
;;;   "05.01.27" "05.01.28" "05.01.29" "05.01.30" "05.01.31" "05.02.01" "05.02.02"
;;;   "05.02.03" "05.02.04" "05.02.05" "05.02.06" "05.02.07" "05.02.08" "05.02.09"
;;;   "05.02.10" "05.02.11" "05.02.12" "05.02.13" "05.02.14" "05.02.15" "05.02.16"
;;;   "05.02.17" "05.02.18" "05.02.19" "05.02.20" "05.02.21" "05.02.22" "05.02.23"
;;;   "05.02.24" "05.02.25" "05.02.26" "05.02.27" "05.02.28" "05.03.01" "05.03.02"
;;;   "05.03.03" "05.03.04" "05.03.05" "05.03.06" "05.03.07" "05.03.08" "05.03.09"
;;;   "05.03.10" "05.03.11" "05.03.12" "05.03.13" "05.03.14" "05.03.15" "05.03.16"
;;;   "05.03.17" "05.03.18" "05.03.19" "05.03.20" "05.03.21" "05.03.22" "05.03.23"
;;;   "05.03.24" "05.03.25" "05.03.26" "05.03.27" "05.03.28" "05.03.29" "05.03.30"
;;;   "05.03.31" "05.04.01" "05.04.02" "05.04.03" "05.04.04" "05.04.05" "05.04.06"
;;;   "05.04.07" "05.04.08" "05.04.09" "05.04.10" "05.04.11" "05.04.12" "05.04.13"
;;;   "05.04.14" "05.04.15" "05.04.16" "05.04.17" "05.04.18" "05.04.19" "05.04.20"
;;;   "05.04.21" "05.04.22" "05.04.23" "05.04.24" "05.04.25" "05.04.26" "05.04.27"
;;;   "05.04.28" "05.04.29" "05.04.30" "05.05.01" "05.05.02" "05.05.03" "05.05.04"
;;;   "05.05.05" "05.05.06" "05.05.07" "05.05.08" "05.05.09" "05.05.10" "05.05.11"
;;;   "05.05.12" "05.05.13" "05.05.14" "05.05.15" "05.05.16" "05.05.17" "05.05.18"
;;;   "05.05.19" "05.05.20" "05.05.21" "05.05.22" "05.05.23" "05.05.24" "05.05.25"
;;;   "05.05.26" "05.05.27" "05.05.28" "05.05.29" "05.05.30" "05.05.31" "05.06.01"
;;;   "05.06.02" "05.06.03" "05.06.04" "05.06.05" "05.06.06" "05.06.07" "05.06.08"
;;;   "05.06.09" "05.06.10" "05.06.11" "05.06.12" "05.06.13" "05.06.14" "05.06.15"
;;;   "05.06.16" "05.06.17" "05.06.18" "05.06.19" "05.06.20" "05.06.21" "05.06.22"
;;;   "05.06.23" "05.06.24" "05.06.25" "05.06.26" "05.06.27" "05.06.28" "05.06.29"
;;;   "05.06.30" "05.07.01" "05.07.02" "05.07.03" "05.07.04" "05.07.05" "05.07.06"
;;;   "05.07.07" "05.07.08" "05.07.09" "05.07.10" "05.07.11" "05.07.12" "05.07.13"
;;;   "05.07.14" "05.07.15" "05.07.16" "05.07.17" "05.07.18" "05.07.19" "05.07.20"
;;;   "05.07.21" "05.07.22" "05.07.23" "05.07.24" "05.07.25" "05.07.26" "05.07.27"
;;;   "05.07.28" "05.07.29" "05.07.30" "05.07.31" "05.08.01" "05.08.02" "05.08.03"
;;;   "05.08.04" "05.08.05" "05.08.06" "05.08.07" "05.08.08" "05.08.09" "05.08.10"
;;;   "05.08.11" "05.08.12" "05.08.13" "05.08.14" "05.08.15" "05.08.16" "05.08.17"
;;;   "05.08.18" "05.08.19" "05.08.20" "05.08.21" "05.08.22" "05.08.23" "05.08.24"
;;;   "05.08.25" "05.08.26" "05.08.27" "05.08.28" "05.08.29" "05.08.30" "05.08.31"
;;;   "05.09.01" "05.09.02" "05.09.03" "05.09.04" "05.09.05" "05.09.06" "05.09.07"
;;;   "05.09.08" "05.09.09" "05.09.10" "05.09.11" "05.09.12" "05.09.13" "05.09.14"
;;;   "05.09.15" "05.09.16" "05.09.17" "05.09.18" "05.09.19" "05.09.20" "05.09.21"
;;;   "05.09.22" "05.09.23" "05.09.24" "05.09.25" "05.09.26" "05.09.27" "05.09.28"
;;;   "05.09.29" "05.09.30" "05.10.01" "05.10.02" "05.10.03" "05.10.04" "05.10.05"
;;;   "05.10.06" "05.10.07" "05.10.08" "05.10.09" "05.10.10" "05.10.11" "05.10.12"
;;;   "05.10.13" "05.10.14" "05.10.15" "05.10.16" "05.10.17" "05.10.18" "05.10.19"
;;;   "05.10.20" "05.10.21" "05.10.22" "05.10.23" "05.10.24" "05.10.25" "05.10.26"
;;;   "05.10.27" "05.10.28" "05.10.29" "05.10.30" "05.10.31" "05.11.01" "05.11.02"
;;;   "05.11.03" "05.11.04" "05.11.05" "05.11.06" "05.11.07" "05.11.08" "05.11.09"
;;;   "05.11.10" "05.11.11" "05.11.12" "05.11.13" "05.11.14" "05.11.15" "05.11.16"
;;;   "05.11.17" "05.11.18" "05.11.19" "05.11.20" "05.11.21" "05.11.22" "05.11.23"
;;;   "05.11.24" "05.11.25" "05.11.26" "05.11.27" "05.11.28" "05.11.29" "05.11.30"
;;;   "05.12.01" "05.12.02" "05.12.03" "05.12.04" "05.12.05" "05.12.06" "05.12.07"
;;;   "05.12.08" "05.12.09" "05.12.10" "05.12.11" "05.12.12" "05.12.13" "05.12.14"
;;;   "05.12.15" "05.12.16" "05.12.17" "05.12.18" "05.12.19" "05.12.20" "05.12.21"
;;;   "05.12.22" "05.12.23" "05.12.24" "05.12.25" "05.12.26" "05.12.27" "05.12.28"
;;;   "05.12.29" "05.12.30" "05.12.31" "06.01.01" "06.01.02" "06.01.03" "06.01.04"
;;;   "06.01.05" "06.01.06" "06.01.07" "06.01.08" "06.01.09" "06.01.10" "06.01.11"
;;;   "06.01.12" "06.01.13" "06.01.14" "06.01.15" "06.01.16" "06.01.17" "06.01.18"
;;;   "06.01.19" "06.01.20" "06.01.21" "06.01.22" "06.01.23" "06.01.24" "06.01.25"
;;;   "06.01.26" "06.01.27" "06.01.28" "06.01.29" "06.01.30" "06.01.31" "06.02.01"
;;;   "06.02.02" "06.02.03" "06.02.04" "06.02.05" "06.02.06" "06.02.07" "06.02.08"
;;;   "06.02.09" "06.02.10" "06.02.11" "06.02.12" "06.02.13" "06.02.14" "06.02.15"
;;;   "06.02.16" "06.02.17" "06.02.18" "06.02.19" "06.02.20" "06.02.21" "06.02.22"
;;;   "06.02.23" "06.02.24" "06.02.25" "06.02.26" "06.02.27" "06.02.28" "06.03.01"
;;;   "06.03.02" "06.03.03" "06.03.04" "06.03.05" "06.03.06" "06.03.07" "06.03.08"
;;;   "06.03.09" "06.03.10" "06.03.11" "06.03.12" "06.03.13" "06.03.14" "06.03.15"
;;;   "06.03.16" "06.03.17" "06.03.18" "06.03.19" "06.03.20" "06.03.21" "06.03.22"
;;;   "06.03.23" "06.03.24" "06.03.25" "06.03.26" "06.03.27" "06.03.28" "06.03.29"
;;;   "06.03.30" "06.03.31" "06.04.01" "06.04.02" "06.04.03" "06.04.04" "06.04.05"
;;;   "06.04.06" "06.04.07" "06.04.08" "06.04.09" "06.04.10" "06.04.11" "06.04.12"
;;;   "06.04.13" "06.04.14" "06.04.15" "06.04.16" "06.04.17" "06.04.18" "06.04.19"
;;;   "06.04.20" "06.04.21" "06.04.22" "06.04.23" "06.04.24" "06.04.25" "06.04.26"
;;;   "06.04.27" "06.04.28" "06.04.29" "06.04.30" "06.05.01" "06.05.02" "06.05.03"
;;;   "06.05.04" "06.05.05" "06.05.06" "06.05.07" "06.05.08" "06.05.09" "06.05.10"
;;;   "06.05.11" "06.05.12" "06.05.13" "06.05.14" "06.05.15" "06.05.16" "06.05.17"
;;;   "06.05.18" "06.05.19" "06.05.20" "06.05.21" "06.05.22" "06.05.23" "06.05.24"
;;;   "06.05.25" "06.05.26" "06.05.27" "06.05.28" "06.05.29" "06.05.30" "06.05.31"
;;;   "06.06.01" "06.06.02" "06.06.03" "06.06.04" "06.06.05" "06.06.06" "06.06.07"
;;;   "06.06.08" "06.06.09" "06.06.10" "06.06.11" "06.06.12" "06.06.13" "06.06.14"
;;;   "06.06.15" "06.06.16" "06.06.17" "06.06.18" "06.06.19" "06.06.20" "06.06.21"
;;;   "06.06.22" "06.06.23" "06.06.24" "06.06.25" "06.06.26" "06.06.27" "06.06.28"
;;;   "06.06.29" "06.06.30" "06.07.01" "06.07.02" "06.07.03" "06.07.04" "06.07.05"
;;;   "06.07.06" "06.07.07" "06.07.08" "06.07.09" "06.07.10" "06.07.11" "06.07.12"
;;;   "06.07.13" "06.07.14" "06.07.15" "06.07.16" "06.07.17" "06.07.18" "06.07.19"
;;;   "06.07.20" "06.07.21" "06.07.22" "06.07.23" "06.07.24" "06.07.25" "06.07.26"
;;;   "06.07.27" "06.07.28" "06.07.29" "06.07.30" "06.07.31" "06.08.01" "06.08.02"
;;;   "06.08.03" "06.08.04" "06.08.05" "06.08.06" "06.08.07" "06.08.08" "06.08.09"
;;;   "06.08.10" "06.08.11" "06.08.12" "06.08.13" "06.08.14" "06.08.15" "06.08.16"
;;;   "06.08.17" "06.08.18" "06.08.19" "06.08.20" "06.08.21" "06.08.22" "06.08.23"
;;;   "06.08.24" "06.08.25" "06.08.26" "06.08.27" "06.08.28" "06.08.29" "06.08.30"
;;;   "06.08.31" "06.09.01" "06.09.02" "06.09.03" "06.09.04" "06.09.05" "06.09.06"
;;;   "06.09.07" "06.09.08" "06.09.09" "06.09.10" "06.09.11" "06.09.12" "06.09.13"
;;;   "06.09.14" "06.09.15" "06.09.16" "06.09.17" "06.09.18" "06.09.19" "06.09.20"
;;;   "06.09.21" "06.09.22" "06.09.23" "06.09.24" "06.09.25" "06.09.26" "06.09.27"
;;;   "06.09.28" "06.10.01" "06.10.02" "06.10.03" "06.10.04" "06.10.05" "06.10.06"
;;;   "06.10.07" "06.10.08" "06.10.09" "06.10.10" "06.10.11" "06.10.12" "06.10.13"
;;;   "06.10.14" "06.10.15" "06.10.16" "06.10.17" "06.10.18" "06.10.19" "06.10.20"
;;;   "06.10.21" "06.10.22" "06.10.23" "06.10.24" "06.10.25" "06.10.26" "06.10.27"
;;;   "06.10.28" "06.10.29" "06.10.30" "06.10.31" "06.11.01" "06.11.02" "06.11.03"
;;;   "06.11.04" "06.11.05" "06.11.06" "06.11.07" "06.11.08" "06.11.09" "06.11.10"
;;;   "06.11.11" "06.11.12" "06.11.13" "06.11.14" "06.11.15" "06.11.16" "06.11.17"
;;;   "06.11.18" "06.11.19" "06.11.20" "06.11.21" "06.11.22" "06.11.23" "06.11.24"
;;;   "06.11.25" "06.11.26" "06.11.27" "06.11.28" "06.11.29" "06.11.30" "06.12.01"
;;;   "06.12.02" "06.12.03" "06.12.04" "06.12.05" "06.12.06" "06.12.07" "06.12.08"
;;;   "06.12.09" "06.12.10" "06.12.11" "06.12.12" "06.12.13" "06.12.14" "06.12.15"
;;;   "06.12.16" "06.12.17" "06.12.18" "06.12.19" "06.12.20" "06.12.21" "06.12.22"
;;;   "06.12.23" "06.12.24" "06.12.25" "06.12.26" "06.12.27" "06.12.28" "06.12.29"
;;;   "06.12.30" "06.12.31" "07.01.01" "07.01.02" "07.01.03" "07.01.04" "07.01.05"
;;;   "07.01.06" "07.01.07" "07.01.08" "07.01.09" "07.01.10" "07.01.11" "07.01.12"
;;;   "07.01.13" "07.01.14" "07.01.15" "07.01.16" "07.01.17" "07.01.18" "07.01.19"
;;;   "07.01.20" "07.01.21" "07.01.22" "07.01.23" "07.01.24" "07.01.25" "07.01.26"
;;;   "07.01.27" "07.01.28" "07.01.29" "07.01.30" "07.01.31" "07.02.01" "07.02.02"
;;;   "07.02.03" "07.02.04" "07.02.05" "07.02.06" "07.02.07" "07.02.08" "07.02.09"
;;;   "07.02.10" "07.02.11" "07.02.12" "07.02.13" "07.02.14" "07.02.15" "07.02.16"
;;;   "07.02.17" "07.02.18" "07.02.19" "07.02.20" "07.02.21" "07.02.22" "07.02.23"
;;;   "07.02.24" "07.02.25" "07.02.26" "07.02.27" "07.02.28" "07.03.01" "07.03.02"
;;;   "07.03.03" "07.03.04" "07.03.05" "07.03.06" "07.03.07" "07.03.08" "07.03.09"
;;;   "07.03.10" "07.03.11" "07.03.12" "07.03.13" "07.03.14" "07.03.15" "07.03.16"
;;;   "07.03.17" "07.03.18" "07.03.19" "07.03.20" "07.03.21" "07.03.22" "07.03.23"
;;;   "07.03.24" "07.03.25" "07.03.26" "07.03.27" "07.03.28" "07.03.29" "07.03.30"
;;;   "07.03.31" "07.04.01" "07.04.02" "07.04.03" "07.04.04" "07.04.05" "07.04.06"
;;;   "07.04.07" "07.04.08" "07.04.09" "07.04.10" "07.04.11" "07.04.12" "07.04.13"
;;;   "07.04.14" "07.04.15" "07.04.16" "07.04.17" "07.04.18" "07.04.19" "07.04.20"
;;;   "07.04.21" "07.04.22" "07.04.23" "07.04.24" "07.04.25" "07.04.26" "07.04.27"
;;;   "07.04.28" "07.04.29" "07.04.30" "07.05.01" "07.05.02" "07.05.03" "07.05.04"
;;;   "07.05.05" "07.05.06" "07.05.07" "07.05.08" "07.05.09" "07.05.10" "07.05.11"
;;;   "07.05.12" "07.05.13" "07.05.14" "07.05.15" "07.05.16" "07.05.17" "07.05.18"
;;;   "07.05.19" "07.05.20" "07.05.21" "07.05.22" "07.05.23" "07.05.24" "07.05.25"
;;;   "07.05.26" "07.05.27" "07.05.28" "07.05.29" "07.05.30" "07.05.31" "07.06.01"
;;;   "07.06.02" "07.06.03" "07.06.04" "07.06.05" "07.06.06" "07.06.07" "07.06.08"
;;;   "07.06.09" "07.06.10" "07.06.11" "07.06.12" "07.06.13" "07.06.14" "07.06.15"
;;;   "07.06.16" "07.06.17" "07.06.18" "07.06.19" "07.06.20" "07.06.21" "07.06.22"
;;;   "07.06.23" "07.06.24" "07.06.25" "07.06.26" "07.06.27" "07.06.28" "07.06.29"
;;;   "07.06.30" "07.07.01" "07.07.02" "07.07.03" "07.07.04" "07.07.05" "07.07.06"
;;;   "07.07.07" "07.07.08" "07.07.09" "07.07.10" "07.07.11" "07.07.12" "07.07.13"
;;;   "07.07.14" "07.07.15" "07.07.16" "07.07.17" "07.07.18" "07.07.19" "07.07.20"
;;;   "07.07.21" "07.07.22" "07.07.23" "07.07.24" "07.07.25" "07.07.26" "07.07.27"
;;;   "07.07.28" "07.07.29" "07.07.30" "07.07.31" "07.08.01" "07.08.02" "07.08.03"
;;;   "07.08.04" "07.08.05" "07.08.06" "07.08.07" "07.08.08" "07.08.09" "07.08.10"
;;;   "07.08.11" "07.08.12" "07.08.13" "07.08.14" "07.08.15" "07.08.16" "07.08.17"
;;;   "07.08.18" "07.08.19" "07.08.20" "07.08.21" "07.08.22" "07.08.23" "07.08.24"
;;;   "07.08.25" "07.08.26" "07.08.27" "07.08.28" "07.08.29" "07.08.30" "07.08.31"
;;;   "07.09.01" "07.09.02" "07.09.03" "07.09.04" "07.09.05" "07.09.06" "07.09.07"
;;;   "07.09.08" "07.09.09" "07.09.10" "07.09.11" "07.09.12" "07.09.13" "07.09.14"
;;;   "07.09.15" "07.09.16" "07.09.17" "07.09.18" "07.09.19" "07.09.20" "07.09.21"
;;;   "07.09.22" "07.09.23" "07.09.24" "07.09.25" "07.09.26" "07.09.27" "07.09.28"
;;;   "07.09.29" "07.09.30" "07.10.01" "07.10.02" "07.10.03" "07.10.04" "07.10.05"
;;;   "07.10.06" "07.10.07" "07.10.08" "07.10.09" "07.10.10" "07.10.11" "07.10.12"
;;;   "07.10.13" "07.10.14" "07.10.15" "07.10.16" "07.10.17" "07.10.18" "07.10.19"
;;;   "07.10.20" "07.10.21" "07.10.22" "07.10.23" "07.10.24" "07.10.25" "07.10.26"
;;;   "07.10.27" "07.10.28" "07.10.29" "07.10.30" "07.10.31" "07.11.01" "07.11.02"
;;;   "07.11.03" "07.11.04" "07.11.05" "07.11.06" "07.11.07" "07.11.08" "07.11.09"
;;;   "07.11.10" "07.11.11" "07.11.12" "07.11.13" "07.11.14" "07.11.15" "07.11.16"
;;;   "07.11.17" "07.11.18" "07.11.19" "07.11.20" "07.11.21" "07.11.22" "07.11.23"
;;;   "07.11.24" "07.11.25" "07.11.26" "07.11.27" "07.11.28" "07.11.29" "07.11.30"
;;;   "07.12.01" "07.12.02" "07.12.03" "07.12.04" "07.12.05" "07.12.06" "07.12.07"
;;;   "07.12.08" "07.12.09" "07.12.10" "07.12.11" "07.12.12" "07.12.13" "07.12.14"
;;;   "07.12.15" "07.12.16" "07.12.17" "07.12.18" "07.12.19" "07.12.20" "07.12.21"
;;;   "07.12.22" "07.12.23" "07.12.24" "07.12.25" "07.12.26" "07.12.27" "07.12.28"
;;;   "07.12.29" "07.12.30" "07.12.31" "08.01.01" "08.01.02" "08.01.03" "08.01.04"
;;;   "08.01.05" "08.01.06" "08.01.07" "08.01.08" "08.01.09" "08.01.10" "08.01.11"
;;;   "08.01.12" "08.01.13" "08.01.14" "08.01.15" "08.01.16" "08.01.17" "08.01.18"
;;;   "08.01.19" "08.01.20" "08.01.21" "08.01.22" "08.01.23" "08.01.24" "08.01.25"
;;;   "08.01.26" "08.01.27" "08.01.28" "08.01.29" "08.01.30" "08.01.31" "08.02.01"
;;;   "08.02.02" "08.02.03" "08.02.04" "08.02.05" "08.02.06" "08.02.07" "08.02.08"
;;;   "08.02.09" "08.02.10" "08.02.11" "08.02.12" "08.02.13" "08.02.14" "08.02.15"
;;;   "08.02.16" "08.02.17" "08.02.18" "08.02.19" "08.02.20" "08.02.21" "08.02.22"
;;;   "08.02.23" "08.02.24" "08.02.25" "08.02.26" "08.02.27" "08.02.28" "08.02.29"
;;;   "08.03.01" "08.03.02" "08.03.03" "08.03.04" "08.03.05" "08.03.06" "08.03.07"
;;;   "08.03.08" "08.03.09" "08.03.10" "08.03.11" "08.03.12" "08.03.13" "08.03.14"
;;;   "08.03.15" "08.03.16" "08.03.17" "08.03.18" "08.03.19" "08.03.20" "08.03.21"
;;;   "08.03.22" "08.03.23" "08.03.24" "08.03.25" "08.03.26" "08.03.27" "08.03.28"
;;;   "08.03.29" "08.03.30" "08.03.31" "08.04.01" "08.04.02" "08.04.03" "08.04.04"
;;;   "08.04.05" "08.04.06" "08.04.07" "08.04.08" "08.04.09" "08.04.10" "08.04.11"
;;;   "08.04.12" "08.04.13" "08.04.14" "08.04.15" "08.04.16" "08.04.17" "08.04.18"
;;;   "08.04.19" "08.04.20" "08.04.21" "08.04.22" "08.04.23" "08.04.24" "08.04.25"
;;;   "08.04.26" "08.04.27" "08.04.28" "08.04.29" "08.04.30" "08.05.01" "08.05.02"
;;;   "08.05.03" "08.05.04" "08.05.05" "08.05.06" "08.05.07" "08.05.08" "08.05.09"
;;;   "08.05.10" "08.05.11" "08.05.12" "08.05.13" "08.05.14" "08.05.15" "08.05.16"
;;;   "08.05.17" "08.05.18" "08.05.19" "08.05.20" "08.05.21" "08.05.22" "08.05.23"
;;;   "08.05.24" "08.05.25" "08.05.26" "08.05.27" "08.05.28" "08.05.29" "08.05.30"
;;;   "08.05.31" "08.06.01" "08.06.02" "08.06.03" "08.06.04" "08.06.05" "08.06.06"
;;;   "08.06.07" "08.06.08" "08.06.09" "08.06.10" "08.06.11" "08.06.12" "08.06.13"
;;;   "08.06.14" "08.06.15" "08.06.16" "08.06.17" "08.06.18" "08.06.19" "08.06.20"
;;;   "08.06.21" "08.06.22" "08.06.23" "08.06.24" "08.06.25" "08.06.26" "08.06.27"
;;;   "08.06.28" "08.06.29" "08.06.30" "08.07.01" "08.07.02" "08.07.03" "08.07.04"
;;;   "08.07.05" "08.07.06" "08.07.07" "08.07.08" "08.07.09" "08.07.10" "08.07.11"
;;;   "08.07.12" "08.07.13" "08.07.14" "08.07.15" "08.07.16" "08.07.17" "08.07.18"
;;;   "08.07.19" "08.07.20" "08.07.21" "08.07.22" "08.07.23" "08.07.24" "08.07.25"
;;;   "08.07.26" "08.07.27" "08.07.28" "08.07.29" "08.07.30" "08.07.31" "08.08.01"
;;;   "08.08.02" "08.08.03" "08.08.04" "08.08.05" "08.08.06" "08.08.07" "08.08.08"
;;;   "08.08.09" "08.08.10" "08.08.11" "08.08.12" "08.08.13" "08.08.14" "08.08.15"
;;;   "08.08.16" "08.08.17" "08.08.18" "08.08.19" "08.08.20" "08.08.21" "08.08.22"
;;;   "08.08.23" "08.08.24" "08.08.25" "08.08.26" "08.08.27" "08.08.28" "08.08.29"
;;;   "08.08.30" "08.08.31" "08.09.01" "08.09.02" "08.09.03" "08.09.04" "08.09.05"
;;;   "08.09.06" "08.09.07" "08.09.08" "08.09.09" "08.09.10" "08.09.11" "08.09.12"
;;;   "08.09.13" "08.09.14" "08.09.15" "08.09.16" "08.09.17" "08.09.18" "08.09.19"
;;;   "08.09.20" "08.09.21" "08.09.22" "08.09.23" "08.09.24" "08.09.25" "08.09.26"
;;;   "08.09.27" "08.09.28" "08.09.29" "08.09.30" "08.10.01" "08.10.02" "08.10.03"
;;;   "08.10.04" "08.10.05" "08.10.06" "08.10.07" "08.10.08" "08.10.09" "08.10.10"
;;;   "08.10.11" "08.10.12" "08.10.13" "08.10.14" "08.10.15" "08.10.16" "08.10.17"
;;;   "08.10.18" "08.10.19" "08.10.20" "08.10.21" "08.10.22" "08.10.23" "08.10.24"
;;;   "08.10.25" "08.10.26" "08.10.27" "08.10.28" "08.10.29" "08.10.30" "08.10.31"
;;;   "08.11.01" "08.11.02" "08.11.03" "08.11.04" "08.11.05" "08.11.06" "08.11.07"
;;;   "08.11.08" "08.11.09" "08.11.10" "08.11.11" "08.11.12" "08.11.13" "08.11.14"
;;;   "08.11.15" "08.11.16" "08.11.17" "08.11.18" "08.11.19" "08.11.20" "08.11.21"
;;;   "08.11.22" "08.11.23" "08.11.24" "08.11.25" "08.11.26" "08.11.27" "08.11.28"
;;;   "08.11.29" "08.11.30" "08.12.01" "08.12.02" "08.12.03" "08.12.04" "08.12.05"
;;;   "08.12.06" "08.12.07" "08.12.08" "08.12.09" "08.12.10" "08.12.11" "08.12.12"
;;;   "08.12.13" "08.12.14" "08.12.15" "08.12.16" "08.12.17" "08.12.18" "08.12.19"
;;;   "08.12.20" "08.12.21" "08.12.22" "08.12.23" "08.12.24" "08.12.25" "08.12.26"
;;;   "08.12.27" "08.12.28" "08.12.29" "08.12.30" "08.12.31" "09.01.01" "09.01.02"
;;;   "09.01.03" "09.01.04" "09.01.05" "09.01.06" "09.01.07" "09.01.08" "09.01.09"
;;;   "09.01.10" "09.01.11" "09.01.12" "09.01.13" "09.01.14" "09.01.15" "09.01.16"
;;;   "09.01.17" "09.01.18" "09.01.19" "09.01.20" "09.01.21" "09.01.22" "09.01.23"
;;;   "09.01.24" "09.01.25" "09.01.26" "09.01.27" "09.01.28" "09.01.29" "09.01.30"
;;;   "09.01.31" "09.02.01" "09.02.02" "09.02.03" "09.02.04" "09.02.05" "09.02.06"
;;;   "09.02.07" "09.02.08" "09.02.09" "09.02.10" "09.02.11" "09.02.12" "09.02.13"
;;;   "09.02.14" "09.02.15" "09.02.16" "09.02.17" "09.02.18" "09.02.19" "09.02.20"
;;;   "09.02.21" "09.02.22" "09.02.23" "09.02.24" "09.02.25" "09.02.26" "09.02.27"
;;;   "09.02.28" "09.03.01" "09.03.02" "09.03.03" "09.03.04" "09.03.05" "09.03.06"
;;;   "09.03.07" "09.03.08" "09.03.09" "09.03.10" "09.03.11" "09.03.12" "09.03.13"
;;;   "09.03.14" "09.03.15" "09.03.16" "09.03.17" "09.03.18" "09.03.19" "09.03.20"
;;;   "09.03.21" "09.03.22" "09.03.23" "09.03.24" "09.03.25" "09.03.26" "09.03.27"
;;;   "09.03.28" "09.03.29" "09.03.30" "09.03.31" "09.04.01" "09.04.02" "09.04.03"
;;;   "09.04.04" "09.04.05" "09.04.06" "09.04.07" "09.04.08" "09.04.09" "09.04.10"
;;;   "09.04.11" "09.04.15" "09.04.16" "09.04.17" "09.04.18" "09.04.19" "09.04.20"
;;;   "09.04.21" "09.04.22" "09.04.23" "09.04.24" "09.04.25" "09.04.26" "09.04.27"
;;;   "09.04.28" "09.04.29" "09.04.30" "09.05.01" "09.05.02" "09.05.03" "09.05.04"
;;;   "09.05.05" "09.05.06" "09.05.07" "09.05.08" "09.05.09" "09.05.10" "09.05.11"
;;;   "09.05.12" "09.05.13" "09.05.14" "09.05.15" "09.05.16" "09.05.17" "09.05.18"
;;;   "09.05.19" "09.05.20" "09.05.21" "09.05.22" "09.05.23" "09.05.24" "09.05.25"
;;;   "09.05.26" "09.05.27" "09.05.28" "09.05.29" "09.05.30" "09.05.31" "09.06.01"
;;;   "09.06.02" "09.06.03" "09.06.04" "09.06.05" "09.06.06" "09.06.07" "09.06.08"
;;;   "09.06.09" "09.06.10" "09.06.11" "09.06.12" "09.06.13" "09.06.14" "09.06.15"
;;;   "09.06.16" "09.06.17" "09.06.18" "09.06.19" "09.06.20" "09.06.21" "09.06.22"
;;;   "09.06.23" "09.06.24" "09.06.25" "09.06.26" "09.06.27" "09.06.28" "09.06.29"
;;;   "09.06.30" "09.07.01" "09.07.02" "09.07.03" "09.07.04" "09.07.05" "09.07.06"
;;;   "09.07.07" "09.07.08" "09.07.09" "09.07.10" "09.07.11" "09.07.12" "09.07.13"
;;;   "09.07.14" "09.07.15" "09.07.16" "09.07.17" "09.07.18" "09.07.19" "09.07.20"
;;;   "09.07.21" "09.07.22" "09.07.23" "09.07.24" "09.07.25" "09.07.26" "09.07.27"
;;;   "09.07.28" "09.07.29" "09.07.30" "09.07.31" "09.08.01" "09.08.02" "09.08.03"
;;;   "09.08.04" "09.08.05" "09.08.06" "09.08.07" "09.08.08" "09.08.09" "09.08.10"
;;;   "09.08.11" "09.08.12" "09.08.13" "09.08.14" "09.08.15" "09.08.16" "09.08.17"
;;;   "09.08.18" "09.08.19" "09.08.20" "09.08.21" "09.08.22" "09.08.23" "09.08.24"
;;;   "09.08.25" "09.08.26" "09.08.27" "09.08.28" "09.08.29" "09.08.30" "09.08.31"
;;;   "09.09.01" "09.09.02" "09.09.03" "09.09.04" "09.09.05" "09.09.06" "09.09.07"
;;;   "09.09.08" "09.09.09" "09.09.10" "09.09.11" "09.09.12" "09.09.13" "09.09.14"
;;;   "09.09.15" "09.09.16" "09.09.17" "09.09.18" "09.09.19" "09.09.20" "09.09.21"
;;;   "09.09.22" "09.09.23" "09.09.24" "09.09.25" "09.09.26" "09.09.27" "09.09.28"
;;;   "09.09.29" "09.09.30" "09.10.01" "09.10.02" "09.10.03" "09.10.04" "09.10.05"
;;;   "09.10.06" "09.10.07" "09.10.08" "09.10.09" "09.10.10" "09.10.11" "09.10.12"
;;;   "09.10.13" "09.10.14" "09.10.15" "09.10.16" "09.10.17" "09.10.18" "09.10.19"
;;;   "09.10.20" "09.10.21" "09.10.22" "09.10.23" "09.10.24" "09.10.25" "09.10.26"
;;;   "09.10.27" "09.10.28" "09.10.29" "09.10.30" "09.10.31" "09.11.01" "09.11.02"
;;;   "09.11.03" "09.11.04" "09.11.05" "09.11.06" "09.11.07" "09.11.08" "09.11.09"
;;;   "09.11.10" "09.11.11" "09.11.12" "09.11.13" "09.11.14" "09.11.15" "09.11.16"
;;;   "09.11.17" "09.11.18" "09.11.19" "09.11.20" "09.11.21" "09.11.22" "09.11.23"
;;;   "09.11.24" "09.11.25" "09.11.26" "09.11.27" "09.11.28" "09.11.29" "09.11.30"
;;;   "09.12.01" "09.12.02" "09.12.03" "09.12.04" "09.12.05" "09.12.06" "09.12.07"
;;;   "09.12.08" "09.12.09" "09.12.10" "09.12.11" "09.12.12" "09.12.13" "09.12.14"
;;;   "09.12.15" "09.12.16" "09.12.17" "09.12.18" "09.12.19" "09.12.20" "09.12.21"
;;;   "09.12.22" "09.12.23" "09.12.24" "09.12.25" "09.12.26" "09.12.27" "09.12.28"
;;;   "09.12.29" "09.12.30" "09.12.31" "10.01.01" "10.01.02" "10.01.03" "10.01.04"
;;;   "10.01.05" "10.01.06" "10.01.07" "10.01.08" "10.01.09" "10.01.10" "10.01.11"
;;;   "10.01.12" "10.01.13" "10.01.14" "10.01.15" "10.01.16" "10.01.17" "10.01.18"
;;;   "10.01.19" "10.01.20" "10.01.21" "10.01.22" "10.01.23" "10.01.24" "10.01.25"
;;;   "10.01.26" "10.01.27" "10.01.28" "10.01.29" "10.01.30" "10.01.31" "10.02.01"
;;;   "10.02.02" "10.02.03" "10.02.04" "10.02.05" "10.02.06" "10.02.07" "10.02.08"
;;;   "10.02.09" "10.02.10" "10.02.11" "10.02.12" "10.02.13" "10.02.14" "10.02.15"
;;;   "10.02.16" "10.02.17" "10.02.18" "10.02.19" "10.02.20" "10.02.21" "10.02.22"
;;;   "10.02.23" "10.02.24" "10.02.25" "10.02.26" "10.02.27" "10.02.28" "10.03.01"
;;;   "10.03.02" "10.03.03" "10.03.04" "10.03.05" "10.03.06" "10.03.07" "10.03.08"
;;;   "10.03.09" "10.03.10" "10.03.11" "10.03.12" "10.03.13" "10.03.14" "10.03.15"
;;;   "10.03.16" "10.03.17" "10.03.18" "10.03.19" "10.03.20" "10.03.21" "10.03.22"
;;;   "10.03.23" "10.03.24" "10.03.25" "10.03.26" "10.03.27" "10.03.28" "10.03.29"
;;;   "10.03.30" "10.03.31" "10.04.01" "10.04.02" "10.04.03" "10.04.04" "10.04.05"
;;;   "10.04.06" "10.04.07" "10.04.08" "10.04.09" "10.04.10" "10.04.11" "10.04.12"
;;;   "10.04.13" "10.04.14" "10.04.15" "10.04.16" "10.04.17" "10.04.18" "10.04.19"
;;;   "10.04.20" "10.04.21" "10.04.22" "10.04.23" "10.04.24" "10.04.25" "10.04.26"
;;;   "10.04.27" "10.04.28" "10.04.29" "10.04.30" "10.05.01" "10.05.02" "10.05.03"
;;;   "10.05.04" "10.05.05" "10.05.06" "10.05.07" "10.05.08" "10.05.09" "10.05.10"
;;;   "10.05.11" "10.05.12" "10.05.13" "10.05.14" "10.05.15" "10.05.16" "10.05.17"
;;;   "10.05.18" "10.05.19" "10.05.20" "10.05.21" "10.05.22" "10.05.23" "10.05.24"
;;;   "10.05.25" "10.05.26" "10.05.27" "10.05.28" "10.05.29" "10.05.30" "10.05.31"
;;;   "10.06.01" "10.06.02" "10.06.03" "10.06.04" "10.06.05" "10.06.06" "10.06.07"
;;;   "10.06.08" "10.06.09" "10.06.10" "10.06.11" "10.06.12" "10.06.13" "10.06.14"
;;;   "10.06.15" "10.06.16" "10.06.17" "10.06.18" "10.06.19" "10.06.20" "10.06.21"
;;;   "10.06.22" "10.06.23" "10.06.24" "10.06.25" "10.06.26" "10.06.27" "10.06.28"
;;;   "10.06.29" "10.06.30" "10.07.01" "10.07.02" "10.07.03" "10.07.04" "10.07.05"
;;;   "10.07.06" "10.07.07" "10.06.17" "10.06.18" "10.06.19" "10.06.20" "10.06.21"
;;;   "10.06.22" "10.06.23" "10.06.24" "10.06.25" "10.06.26" "10.06.27" "10.06.28"
;;;   "10.06.29" "10.06.30" "10.07.01" "10.07.02" "10.07.03" "10.07.04" "10.07.05"
;;;   "10.07.06" "10.07.07" "10.07.08" "10.07.09" "10.07.10" "10.07.11" "10.07.12"
;;;   "10.07.13" "10.07.14" "10.07.15" "10.07.16" "10.07.17" "10.07.18" "10.07.19"
;;;   "10.07.20" "10.07.21" "10.07.22" "10.07.23" "10.07.24" "10.07.25" "10.07.26"
;;;   "10.07.27" "10.07.28" "10.07.29" "10.07.30" "10.07.31" "10.08.01" "10.08.02"
;;;   "10.08.03" "10.08.04" "10.08.05" "10.08.06" "10.08.07" "10.08.08" "10.08.09"
;;;   "10.08.10" "10.08.11" "10.08.12" "10.08.13" "10.08.14" "10.08.15" "10.08.16"
;;;   "10.08.17" "10.08.18" "10.08.19" "10.08.20" "10.08.21" "10.08.22" "10.08.23"
;;;   "10.08.24" "10.08.25" "10.08.26" "10.08.27" "10.08.28" "10.08.29" "10.08.30"
;;;   "10.08.31" "10.09.01" "10.09.02" "10.09.03" "10.09.04" "10.09.05" "10.09.06"
;;;   "10.09.07" "10.09.08" "10.09.09" "10.09.10" "10.09.11" "10.09.12" "10.09.13"
;;;   "10.09.14" "10.09.15" "10.09.16" "10.09.17" "10.09.18" "10.09.19" "10.09.20"
;;;   "10.09.21" "10.09.22" "10.09.23" "10.09.24" "10.09.25" "10.09.26" "10.09.27"
;;;   "10.09.28" "10.09.29" "10.09.30" "10.10.01" "10.10.02" "10.10.03" "10.10.04"
;;;   "10.10.05" "10.10.06" "10.10.07" "10.10.08" "10.10.09" "10.10.10" "10.10.11"
;;;   "10.10.12" "10.10.13" "10.10.14" "10.10.15" "10.10.16" "10.10.17" "10.10.18"
;;;   "10.10.19" "10.10.20" "10.10.21" "10.10.22" "10.10.23" "10.10.24" "10.10.25"
;;;   "10.10.26" "10.10.27" "10.10.28" "10.10.29" "10.10.30" "10.10.31" "10.11.01"
;;;   "10.11.02" "10.11.03" "10.11.04" "10.11.05" "10.11.06" "10.11.07" "10.11.08"
;;;   "10.11.09" "10.11.10" "10.11.11" "10.11.12" "10.11.13" "10.11.14" "10.11.15"
;;;   "10.11.16" "10.11.17" "10.11.18" "10.11.19" "10.11.20" "10.11.21" "10.11.22"
;;;   "10.11.23" "10.11.24" "10.11.25" "10.11.26" "10.11.27" "10.11.28" "10.11.29"
;;;   "10.11.30" "10.12.01" "10.12.02" "10.12.03" "10.12.04" "10.12.05" "10.12.06"
;;;   "10.12.07" "10.12.08" "10.12.09" "10.12.10" "10.12.11" "10.12.12" "10.12.13"
;;;   "10.12.14" "10.12.15" "10.12.16" "10.12.17" "10.12.18" "10.12.19" "10.12.20"
;;;   "10.12.21" "10.12.22" "10.12.23" "10.12.24" "10.12.25" "10.12.26" "10.12.27"
;;;   "10.12.28" "10.12.29" "10.12.30" "10.12.31" "11.01.01" "11.01.02" "11.01.03"
;;;   "11.01.04" "11.01.05" "11.01.06" "11.01.07" "11.01.08" "11.01.09" "11.01.10"
;;;   "11.01.11"))

;;; ==============================
(provide 'mon-get-freenode-lisp-logs)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; coding: utf-8
;; generated-autoload-file: "./mon-loaddefs.el"
;; End:

;;; ================================================================
;;; mon-get-freenode-lisp-logs.el ends here
;;; EOF
