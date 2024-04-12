;;; mon-w32-load.el --- common w32 related utils for MON systems
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2008-2012 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-w32-load.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: Winter 2008
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: W32, environment, external, local

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-w32-load provides common w32 related utils for MON systems.
;;
;; FUNCTIONS:▶▶▶
;; `mon-maximize-frame-w32', `mon-minimize-frame', `mon-restore-frame',
;; `mon-menu-bar', `mon-open-explorer', `mon-open-program-files',
;; `mon-open-abbyy', `mon-open-notepad++', `mon-open-fastone',
;; `mon-open-photoshop', `mon-open-images-ed-swap', `mon-open-moz-down',
;; `mon-open-workspace',
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
;; `mon-explorer-open' -> `mon-open-explorer'
;;
;; DEPRECATED:
;;
;; RENAMED:
;;
;; MOVED:
;; `mon-insert-user-name-cond'   -> mon-insertion-utils.el
;; `mon-insert-system-type-cond' -> mon-insertion-utils.el
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
;; URL: http://www.emacswiki.org/emacs/mon-w32-load.el
;; FIRST-PUBLISHED: <Timestamp: #{2009-09-23T16:06:39-04:00Z}#{09393} - by MON>
;;
;; EMACSWIKI: { URL of an EmacsWiki describing mon-w32-load. }
;;
;; HEADER-ADDED: <Timestamp: #{2009-09-23T16:12:48-04:00Z}#{09393} - by MON KEY>
;;
;; FILE-CREATED:
;; <Timestamp: Winter 2008 - by MON KEY>
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
;; Copyright © 2008-2012 MON KEY 
;;; ==============================

;;; CODE:

(eval-when-compile (require 'cl))

;;; ==============================
;; :W32-FRAME-ADJUSTMENTS

;;; ==============================
(defun mon-maximize-frame-w32 ()
  "Maximize the current frame \(w32 only\).\n
Conditional on evaluation of system type `IS-W32-P', `IS-GNU-P'.\n
:SEE-ALSO `mon-menu-bar', `mon-restore-frame' `mon-minimize-frame'.\n▶▶▶"
  (interactive)
  (cond 
   (IS-W32-P  (w32-send-sys-command 61488))
   (IS-GNU-P (message "I'm a GNU - that hurts."))))
;;
(defun mon-minimize-frame ()
  "Send frame a Windows WM_SYSCOMMAND of type COMMAND - #xf020\n
Minimize current frame \(w32 only\).\n
Conditional on evaluation of system type `IS-W32-P', `IS-GNU-P'.\n
:SEE-ALSO `mon-menu-bar', `mon-restore-frame', `mon-minimize-frame'.\n▶▶▶"
  (interactive)
  (cond 
    (IS-W32-P
     (w32-send-sys-command #xf020))
    (IS-GNU-P (message "I'm a GNU - that hurts."))))
;; 
(defun mon-restore-frame ()
  "Send frame a Windows WM_SYSCOMMAND of type COMMAND - #xf120\n
Restore current frame \(w32 only\).
Conditional on evaluation of system type `IS-W32-P', `IS-GNU-P'.\n
:SEE-ALSO `mon-menu-bar', ,`mon-minimize-frame', `mon-maximize-frame-w32'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-send-sys-command #xf120))
        (IS-GNU-P (message "I'm a GNU - that hurts."))))
;;
(defun mon-menu-bar ()
  "Send frame a Windows WM_SYSCOMMAND of type COMMAND - #xf120\n
Restore current frame \(w32 only\).
Conditional on evaluation of system type `IS-W32-P', `IS-GNU-P'.\n
:SEE-ALSO `mon-restore-frame' `mon-minimize-frame', `mon-maximize-frame-w32'.\n▶▶▶"
  (interactive)
  (cond  (IS-W32-P (w32-send-sys-command #xf100))
         (IS-GNU-P (message "I'm a GNU - that hurts."))))
;;
;;; :TEST-ME (mon-menu-bar)
;;; :TEST-ME (mon-restore-frame)
;;; :TEST-ME (mon-minimize-frame)
;;; :TEST-ME (mon-maximize-frame-w32)
;;; :TEST-ME (call-interactively 'mon-menu-bar)
;;; :TEST-ME (call-interactively 'mon-restore-frame)
;;; :TEST-ME (call-interactively 'mon-minimize-frame)
;;; :TEST-ME (call-interactively 'mon-maximize-frame-w32)

;;; ==============================
;; :W32-APP-LAUNCHERS

;;; ==============================
(defun mon-open-abbyy ()
  "Launch the ABBYY Finereader OCR editor.\n
:SEE-ALSO `mon-open-notepad++', `mon-open-fastone', `mon-open-photoshop',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-MON-P-W32
         (w32-shell-execute 
          "open" 
          (concat (cadr (assoc 'the-fynrdr-pth *mon-misc-path-alist*))
                  "FineReader.exe")))
        ((or IS-BUG-P IS-BUG-P-REMOTE)
         (message "ABBYY isn't installed. Find a Crack and fix this ASAP."))
        (IS-GNU-P (message "I'm a GNU - that hurts."))))
;;
;;; :TEST-ME (mon-open-abbyy)
;;; :TEST-ME (call-interactively 'mon-open-abbyy)

;;; ==============================
(defun mon-open-notepad++ ()
  "Launch the notepad++ editor.\n
:SEE-ALSO `mon-open-abbyy', `mon-open-fastone', `mon-open-photoshop',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-shell-execute "open" 
                                   (concat 
                                    (cadr (assoc 'the-ntpd++-pth *mon-misc-path-alist*)) 
                                    "notepad++.exe")))
        (IS-GNU-P (message "I'm a GNU - that hurts. USE EMACS!!!"))))
;;
;;; :TEST-ME (mon-open-notepad++)
;;; :TEST-ME (call-interactively 'mon-open-notepad++)

;;; ==============================
(defun mon-open-fastone ()
  "Launch the fastone screen capture editor.\n
:SEE-ALSO `mon-open-abbyy', `mon-open-notepad++', `mon-open-photoshop',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-shell-execute 
                 "open" 
                 (concat 
                  (cadr (assoc 'the-fstone-pth *mon-misc-path-alist*))
                  "FSCapture.exe")))
        (IS-GNU-P (message "I'm a GNU - that hurts."))))
;;
;;; :TEST-ME (mon-open-fastone)
;;; :TEST-ME (call-interactively 'mon-open-fastone)

;;; ==============================
(defun mon-open-photoshop ()
  "Launch Ad0be Ph0t0sh0p editor.\n
:SEE-ALSO `mon-open-abbyy', `mon-open-notepad++', `mon-open-fastone',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-shell-execute "open" 
                                   (concat 
                                    (cadr (assoc 'the-ps-pth *mon-misc-path-alist*))
                                    "Photoshop.exe")))
        (IS-GNU-P (message "I'm a GNU - AND I got no WINE - that hurts."))))
;;
;;; :TEST-ME (mon-open-photoshop)
;;; :TEST-ME (call-interactively 'mon-open-photoshop)

;;; ==============================
;;; :OPEN-DIRECTORIES-EXTERNAL
;;; ==============================
(defun mon-open-explorer ()
  "Launch the w32 explorer in the directory of current file.\n
:ALIASED-BY `mon-explorer-open'\n
:SEE-ALSO 
`mon-explorer-naf-artist', 
`mon-open-program-files', `mon-open-images-ed-swap',
`mon-open-moz-down', `mon-open-workspace', `w32shell-explorer', 
`w32shell-explorer-here', `*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-shell-execute 
                 "explore" 
                 (convert-standard-filename default-directory)))
        (IS-GNU-P (message "I'm a GNU - that hurts."))))
;; 
(defalias 'mon-explorer-open 'mon-open-explorer)
;;         
;;; :TEST-ME (mon-open-explorer)
;;; :TEST-ME (call-interactively 'mon-open-explorer)

;;; ==============================
(defun mon-open-images-ed-swap ()
  "Open the explorer window in \"Images-swap\" folder.
:SEE-ALSO `mon-open-program-files', `mon-open-explorer', `mon-open-moz-down'
`mon-open-workspace', `w32shell-explorer', `w32shell-explorer-here',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-shell-execute "open" "explorer"
                                   (concat "/e, " (cadr (assoc
                                                  (cond (IS-MON-P-W32 'the-mon-img-ed-swp)
                                                        (IS-BUG-P     'the-bug-img-ed-swp))
                                                  *mon-misc-path-alist*)))))
        (IS-GNU-P (message "I'm a GNU and probably not on your Samba right now..."))))
;;
;;; :TEST-ME (mon-open-images-ed-swap)
;;; :TEST-ME (call-interactively 'mon-open-images-ed-swap)
 
;;; ==============================
(defun mon-open-program-files ()
  "Open the w32 explorer in the a 'Program Files' folder.\n
:SEE-ALSO `mon-open-explorer', `mon-open-images-ed-swap',`mon-open-moz-down', 
`mon-open-workspace', `w32shell-explorer', `w32shell-explorer-here',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
  (cond (IS-W32-P (w32-shell-execute "open" "explorer" (concat "/e, " "C:\\Program Files")))
   (IS-GNU-P  (message "I'm a GNU - that hurts."))))
;;
;;; :TEST-ME (mon-open-program-files)
;;; :TEST-ME (call-interactively 'mon-open-program-files)

;;; ==============================
;;; :MODIFICATIONS <Timestamp: #{2009-08-11T21:32:02-04:00Z}#{09333} - by MON>
(defun mon-open-moz-down ()
  (interactive)
  "Open the explorer window of the Mozilla Downloads folder.\n
:SEE-ALSO `mon-open-program-files', `mon-open-explorer',`mon-open-workspace',
`mon-open-images-ed-swap'., `w32shell-explorer', `w32shell-explorer-here',
`*mon-misc-path-alist*'.\n▶▶▶"
  (cond (IS-W32-P (w32-shell-execute 
                 "open" 
                 "explorer" 
                 (concat "/e, " (nth 4  (assoc (cond (IS-MON-P-W32 1)
                                                     (IS-BUG-P-REMOTE 4)
                                                     (IS-BUG-P 3))
                                               *mon-emacsd*)))))
        (IS-GNU-P (message "I'm a GNU - do you have a default download folder?"))))
;;
;;; :TEST-ME (mon-open-moz-down)
;;; :TEST-ME (call-interactively 'mon-open-moz-down)

;;; ==============================
(defun mon-open-workspace ()
  "Open the explorer window in Mon_Workspaces folder.\n
:SEE-ALSO `mon-open-program-files', `mon-open-explorer',  `mon-open-moz-down'
`mon-open-images-ed-swap', `w32shell-explorer', `w32shell-explorer-here',
`*mon-misc-path-alist*'.\n▶▶▶"
  (interactive)
    (cond (IS-MON-P-W32
	   (w32-shell-execute  "open" "explorer"
			       (concat "/e, " 
                                       (nth 3 (assoc 1 *mon-emacsd*)))))
	  ((or IS-BUG-P IS-BUG-P-REMOTE IS-MON-P-GNU)
               (message "This directory isn't set."))))
;;
;;; :TEST-ME (mon-open-workspace)
;;; :TEST-ME (call-interactively 'mon-open-workspace)

;;; ==============================
(provide 'mon-w32-load)
;;; ==============================
;;; mon-w32-load.el ends here
;;; EOF
