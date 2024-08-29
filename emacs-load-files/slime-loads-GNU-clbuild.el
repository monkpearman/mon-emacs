;;; :FILE /Users/monkpearman/Documents/HG-Repos/SDP_EMACS/emacs-load-files/slime-loads-GNU-clbuild.el;;; slime-loads-GNU-clbuild.el --- conform slime/swank to current environment
;;; ==============================
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================

;; FILENAME: slime-loads-GNU-clbuild.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-09-06T10:19:19-04:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: environment, external, lisp, programming, processes

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; slime-loads-GNU-clbuild provides procedures to conform slime/swank to the
;; currrent Emacs environment. Includes utilities for finding the currenly
;; installed Quicklisp distribution of slime/swank. Some features provided are
;; GNU/Linux centric and may require adaptation to other OS'. 
;; 
;; slime-loads-GNU-clbuild configs stored seperately from Slime load defs called from 
;; `default-start-loads.el' to prevent the HG synch issues that arise.
;;
;; FUNCTIONS:▶▶▶
;; `quicklisp-find-slime', `quicklisp-current-swank-loader',
;; `quicklisp-write-dot-swank-loader-if', `quicklisp-write-dot-swank-loader',
;; `quicklisp-dot-swank-current-p', `quicklisp-hash-system-completions',
;; `quicklisp-system-complete', `quicklisp-system-complete-if',
;; `quicklisp-hash-system-completions-slime-loadtime', `mon-prev-xref-slime',
;; `mon-next-xref-slime', `mon-quit-slime-description-window',
;; `mon-lisp-set-indent-hook', `mon-lisp-set-indent', `slime-echo-arglist-STFU',
;; `slime-echo-arglist-behave-or-back-to-your-cage', `mon-insert-slime-arglist',
;; `mon-add-lisp-system-paths-to-mon-lisp-system-paths',
;; `mon-slime-start-sbcl',
;; `mon-slime-copy-presentation-at-point-to-kill-ring-no-props',
;; `mon-slime-copy-presentation-to-kill-ring-no-props',
;; `slime-inspect-asdf-defined-systems', `slime-inspect-asdf-system', 
;; `slime-inspect-quicklisp-systems', `slime-make-quicklisp-completion-table',
;; `slime-get-quicklisp-system-completions', `slime-inspect-quicklisp-system',
;; `slime-quicklisp-get-process-start-time',
;; `slime-quicklisp-completion-table-put-hash-meta',
;; `slime-quicklisp-completion-table-get-hash-meta',
;; `slime-quicklisp-completion-table-get-hash-count',
;; `slime-quicklisp-completion-table-get-hashed-last',
;; `slime-quicklisp-completion-table-compare-hashed-last',
;; `slime-quicklisp-completion-table-get-ql-hash-count',
;; `slime-quicklisp-completion-table-compare-hash-counts',
;; `slime-insert-integer-at-point',
;; `mon-add-lisp-system-paths-to-tags-table-list',
;; `slime-macroexpand-again-fix',
;; `mon-slime-ensure-fasl-temp-directory-exists',
;; `slime-fuzzy-sroll-completions-up-from-target-buffer'
;; `slime-fuzzy-sroll-completions-down-from-target-buffer'
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
;; `*quicklisp-path*', `*quicklisp-systems*', `*slime-echo-arglist-STFU*',
;;  `*mon-slime-xrefs*', `*slime-quicklisp-systems*', `*mon-lisp-system-paths*',
;;
;; GROUPS:
;; `mon-slime', `mon-qucklisp',
;;
;; ALIASED/ADVISED/SUBST'D:
;; :NOTE Aliases defined in :FILE mon-aliases.el
;;
;; <PREFIX>-<QUALIFIED> <PREFIX>-<NON-CORE-SYMBOL>
;; 
;; `mon-slime-quit-description'    -> `mon-quit-slime-description-window'
;; `slime-next-xref'               -> `mon-next-xref-slime' 
;; `slime-prev-xref'               -> `mon-prev-xref-slime' 
;; `mon-slime-insert-arglist'      -> `mon-insert-slime-arglist'
;; `slime-compile-defun-for-debug' ->  `mon-slime-compile-defun-for-debug'
;; `slime-copy-presentation-at-point-to-kill-ring-no-props' 
;;    -> `mon-slime-copy-presentation-at-point-to-kill-ring-no-props'
;; `slime-copy-presentation-to-kill-ring-no-props'
;;    -> `mon-slime-copy-presentation-to-kill-ring-no-props'

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
;; :QUICKLISP-NOTES
;; - Grab quicklisp.lisp from http://quickstart.quicklisp.org/quicklisp.lisp 
;; - wget/curl it
;;  wget http://beta.quicklisp.org/quicklisp.lisp && sbcl --no-userinit --load quicklisp.lisp
;;
;;  Or, from Emacs: 
;;       (progn (require 'url)
;;              (require 'url-handlers)
;;              (with-current-buffer (get-buffer-create "*QUICKLISP-QUICKSTART*")
;;                (erase-buffer)
;;                (url-insert-file-contents 
;;                 "http://quickstart.quicklisp.org/quicklisp.lisp")
;;                (write-file "quicklisp.lisp")
;;                (display-buffer (current-buffer) t)))
;;             
;; - Start a lisp and load (load #P"/<QUICKLISP-PATH>/quicklisp.lisp") 
;;
;; - Add  ~/quicklisp/setup.lisp to your lisp implementation's init file, (e.g. ~/.sbclrc)
;;   with something like: 
;;   (load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
;;
;; - Initialize a new lisp session.
;;
;; - To load systems, use (ql:quickload "system-name")
;;
;; - To use slime/swank with the locally installed Emacs do: (ql:quickload "swank") 
;;
;; (URL `http://quicklisp.org/')
;; (URL `http://blog.quicklisp.org/')
;; (URL `http://www.quicklisp.org/beta/faq.html')
;; (URL `git://github.com/quicklisp/quicklisp-projects.git')
;; (URL `git://github.com/quicklisp/quicklisp-client.git')
;; (URL `git://github.com/quicklisp/quicklisp-bootstrap.git')
;; (URL `http://www.youtube.com/watch?v=11wYPAy9qNw&feature=PlayList&p=9A2D7E31B7D039AF&index=0&playnext=1&hd=1')
;; (URL `http://github.com/quicklisp/boston-lisp-meeting/raw/master/blm-lightning-talk.pdf')
;; (URL `http://xach.com/tmp/ql.pdf')
;; (URL `http://xach.com/tmp/fails/')
;; (URL `http://groups.google.com/group/quicklisp')
;; (URL `http://dist.quicklisp.org/quicklisp.txt')
;; 
;;; ==============================
;; :SLIME-MODE-PACKAGES
;;
;; :SLIME-AUTODOC
;; Better arglist display, can be turned off by customization.
;;
;; :SLIME-C-P-C
;; Adds new commands and installs compound-prefix-completion as
;; default completion command.  Behaves similar to standard Emacs
;; completion, unless dashes are present. --mkoeppe
;;
;; :SLIME-EDITING-COMMANDS
;; Just adds commands.  (Well, shadows commands in lisp-mode-map)
;;
;; :SLIME-FANCY-INSPECTOR
;; Makes the inspector fancier.  (Once loaded, can't be turned off.)
;;
;; :SLIME-FUZZY
;; Just adds the command C-c M-i.  We do not make fuzzy completion the
;; default completion invoked by TAB. --mkoeppe
;;
;; :SLIME-HIGHLIGHT-EDITS
;; :NOTE "Do not activate slime-highlighting-edits by default, as it's easier
;;        to explictly activate it (if a user really wants it) than to explictly
;;        deactivate it once it got globally enabled. -TCR."
;;
;; :SLIME-PRESENTATIONS
;; :NOTE "Load slime-presentations even though they seem to be a
;;        controversial feature, as they can be easily turned off by
;;        customizing swank:*record-repl-results*. --mkoeppe"
;;
;; (require 'SLIME-PRESENTATION-STREAMS)
;; :NOTE "Do not load slime-presentation-streams, as this is an experimental
;;        feature that installs patches into some Lisps. --mkoeppe"
;;
;; (require 'slime-typeout-frame)
;; :NOTE "Do not load slime-typeout-frame, as simply loading causes display of a
;;       typeout frame, which cannot be turned off. --mkoeppe"
;;
;; :SLIME-REFERENCES-INIT
;; Puts clickable references to documentation into SBCL errors.
;;
;; :SLIME-MDOT-FU-INIT
;; Makes M-. work on local definitions, too.
;;
;; :SLIME-PACKAGE-FU
;; Add/Remove a symbol at point from the relevant DEFPACKAGE form
;; via C-c x.
;;
;; :SLIME-FONTIFYING-FU
;; Fontify with-foo and do-foo like standard macros.
;;
;; ==============================
;; :LISP-ENVIRONMENT
;;
;; :SBCL-RELEVANT-PATHS
;;
;; ~/.sbclrc
;; ~/.sbcl
;; ~/.sbcl/trusted-uids.lisp
;; ~/.sbcl/keyring.asc
;; ~/.sbcl/site
;; ~/.sbcl/systems
;; /etc/bash_completion.d/sbcl
;; /usr/local/lib/sbcl
;;
;;
;;
;; (setq slime-lisp-implementations
;;       '((sbcl ("sbcl" "--core" (substitute-in-file-name ))))
;; 
;;
;;
;; (custom-set-variables 'slime-sbcl-manual-root
;;                       "file://usr/local/share/doc/sbcl/html/sbcl/")
;;
;; :CLISP-CLOCC
;;
;; :NOTE Following of potential of use this with Sam Steingold's CLOCC:
;; :SEE (URL `http://clocc.sourceforge.net/')
;;
;; (unless (getenv "LISPTYPE")
;;   (setenv "LISPTYPE" inferior-lisp-program))
;;
;; (executable-find "clisp")
;; (setq inferior-lisp-program ;"/usr/bin/clisp")
;;      "/usr/bin/clisp -K full")
;;
;; ==============================
;;
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; THIRD-PARTY-CODE: 
;; :SEE comments above. 
;;
;; URL: https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/slime-loads-GNU-clbuild.el
;;
;; FIRST-PUBLISHED: <Timestamp: #{2010-09-07T11:31:31-04:00Z}#{10362} - by MON>
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-09-06T10:19:19-04:00Z}#{09367} - by MON KEY>
;;
;; =================================================================

;;; LICENSE:

;; =================================================================
;; This file is not part of GNU Emacs.

;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:

;;    1. Redistributions of source code must retain the above copyright
;;       notice, this list of conditions and the following disclaimer.

;;    2. Redistributions in binary form must reproduce the above
;;       copyright notice, this list of conditions and the following
;;       disclaimer in the documentation and/or other materials
;;       provided with the distribution.

;; THIS SOFTWARE IS PROVIDED BY MON KEY ``AS IS'' AND ANY
;; EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
;; PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL MON KEY OR
;; CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
;; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
;; USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
;; ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
;; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
;; OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;; SUCH DAMAGE.

;; The views and conclusions contained in the software and
;; documentation are those of the authors and should not be interpreted
;; as representing official policies, either expressed or implied, of
;; MON KEY."

;;; ==============================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ==============================

;;; CODE:
;; (file-truename (file-relative-name "some-file-name.el" "../emacs-load-files"))
;; (file-truename (file-relative-name "some-file-name.el" "../emacs-load-files") )
;; (file-relative-name "some-file-name.el" "../emacs-load-files")  => "some-file-name.el"
;; (file-name-directory  (file-relative-name "some-file-name.el" "../emacs-load-files")) => nil


(eval-when-compile (require 'cl))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

;;; ==============================
;; :DARWIN 
;; /opt/homebrew/bin/sbcl
;; (executable-find "sbcl") => /opt/homebrew/bin/spcl
;;
;; :NOTE on Darwin with sbcl from homebrew the executable (executable-find
;; "sbcl") exports the following variable: "SBCL_SOURCE_ROOT" and
;; "SBCL_HOME". We here as well so they are synchronized.
(when (equal (mon-system-type-conditionals) "IS-DARWIN-P")
  (unless (getenv "SBCL_HOME")
    (setenv "SBCL_HOME" "opt/homebrew/lib/sbcl"))
  (unless (getenv "SBCL_SOURCE_ROOT")
    (setenv "SBCL_SOURCE_ROOT" "/opt/homebrew/Cellar/sbcl/2.4.1/share/sbcl/src"))
  (setq inferior-lisp-program (concat (executable-find "sbcl") " --noinform")) ;;--no-linedit"))
  (custom-note-var-changed 'inferior-lisp-program))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-01-12T14:04:51-05:00Z}#{11023} - by MON KEY>
(defgroup mon-slime nil
  "Customization group for variables and functions of :FILE slime-loads-GNU-clbuild.el\n
:SEE-ALSO `mon-base', `mon-xrefs', `mon-macs', `mon-dir-locals', `mon-error-warn',
`mon-regexp-symbols', `mon-dir-utils', `mon-line-utils', `mon-seq-utils',
`mon-plist-utils', `mon-string-utils', `mon-insertion-utils',
`mon-replacement-utils', `mon-buffer-utils', `mon-window-utils',
`mon-button-utils', `mon-type-utils', `mon-type-utils-vars', `mon-image-utils',
`mon-bzr-utils', `mon-env-proc-utils', `mon-testme-utils', `mon-error-utils',
`mon-url-utils', `mon-boxcutter'.\n▶▶▶"
  :link '(url-link  :tag "\n:SLIME-DEVEL (URL `http://news.gmane.org/gmane.lisp.slime.devel')"
                    "http://news.gmane.org/gmane.lisp.slime.devel")
  :link '(info-link :tag "\n:SLIME-INFO-NODE" "(info-node)slime")  
  :link '(emacs-library-link :tag "\n:FILE slime-autoloads.el" "slime-autoloads.el")
  :link '(emacs-library-link  :tag "\n:FILE slime.el"  "slime.el")
  :link '(url-link  :tag "\n:SLIME-URL (URL `http://www.common-lisp.net/project/slime/')"
                    "http://www.common-lisp.net/project/slime/")
  :link '(custom-group-link  :tag "\n:CUSTOM-GROUP mon-qucklisp" 'mon-qucklisp)  
  :link '(url-link 
          :tag "\n:GITHUB-FILE (URL `https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/slime-loads-GNU-clbuild.el')" 
          "https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/slime-loads-GNU-clbuild.el")
  :link '(emacs-library-link :tag "\n:FILE slime-loads-GNU-clbuild.el" "slime-loads-GNU-clbuild.el")
  :group 'mon-base)

;;; ==============================
;;; :CREATED <Timestamp: #{2011-01-12T14:03:36-05:00Z}#{11023} - by MON KEY>
(defcustom *mon-slime-xrefs*
  '(mon-insert-slime-arglist mon-lisp-set-indent mon-lisp-set-indent-hook
    mon-next-xref-slime mon-prev-xref-slime mon-quit-slime-description-window
    mon-slime-quit-description mon-slime-setup-init mon-slime-start-sbcl
    quicklisp-current-swank-loader quicklisp-dot-swank-current-p
    quicklisp-hash-system-completions
    quicklisp-hash-system-completions-slime-loadtime quicklisp-system-complete
    quicklisp-system-complete-if quicklisp-write-dot-swank-loader
    quicklisp-write-dot-swank-loader-if 
    slime-echo-arglist-behave-or-back-to-your-cage slime-echo-arglist-STFU
    slime-next-xref slime-prev-xref
    mon-add-lisp-system-paths-to-mon-lisp-system-paths
    mon-common-lisp-hyperspec-browse-url-w3m
    mon-common-lisp-hyperspec-browse-url-eww
    mon-common-lisp-hyperspec-browse-url-set-init
    mon-slime-copy-presentation-at-point-to-kill-ring-no-props
    mon-slime-copy-presentation-to-kill-ring-no-props
    mon-slime-compile-defun-for-debug
    quicklisp-find-slime
    slime-inspect-asdf-system
    slime-inspect-asdf-defined-systems
    slime-inspect-quicklisp-system
    slime-inspect-quicklisp-systems
    slime-make-quicklisp-completion-table
    slime-get-quicklisp-system-completions
    slime-quicklisp-get-process-start-time
    slime-quicklisp-completion-table-put-hash-meta
    slime-quicklisp-completion-table-get-hash-meta
    slime-quicklisp-completion-table-get-hash-count
    slime-quicklisp-completion-table-get-hashed-last
    slime-quicklisp-completion-table-compare-hashed-last
    slime-quicklisp-completion-table-get-ql-hash-count
    slime-quicklisp-completion-table-compare-hash-counts
    slime-insert-integer-at-point
    mon-add-lisp-system-paths-to-tags-table-list
    slime-macroexpand-again-fix
    mon-slime-ensure-fasl-temp-directory-exists
    slime-fuzzy-sroll-completions-up-from-target-buffer
    slime-fuzzy-sroll-completions-down-from-target-buffer
    ;; :VARIABLES
    *mon-common-lisp-hyperspec-browser-function*
    *slime-echo-arglist-STFU*
    *quicklisp-path* *quicklisp-systems*
    *slime-quicklisp-systems* 
    *mon-slime-xrefs*
    *mon-lisp-system-paths*)
    "Xrefing list of mon slime related symbols, functions constants, and variables.\n
The symbols contained of this list are defined in :FILE slime-loads-GNU-clbuild.el\n
:SEE-ALSO `*mon-default-loads-xrefs*', `*mon-default-start-loads-xrefs*',
`*mon-dir-locals-alist-xrefs*', `*mon-keybindings-xrefs*',
`*mon-testme-utils-xrefs*', `*mon-button-utils-xrefs*',
`*mon-buffer-utils-xrefs*', `*mon-line-utils-xrefs*', `*mon-plist-utils-xrefs*'
`*mon-seq-utils-xrefs*', `*mon-string-utils-xrefs*', `*mon-type-utils-xrefs*',
`*mon-window-utils-xrefs*', `*naf-mode-xref-of-xrefs*',
`*naf-mode-faces-xrefs*', `*naf-mode-date-xrefs*', `*mon-ulan-utils-xrefs*',
`*mon-xrefs-xrefs'.\n▶▶▶"
    :type '(repeat symbol)
    :group 'mon-slime
    :group 'mon-xrefs)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-10-21T18:59:23-04:00Z}#{10424} - by MON KEY>
(defgroup mon-qucklisp nil
  "Configuations for Zach Beane's Common Lisp Quicklisp related procedures.\n
:SEE-ALSO .\n▶▶▶"
  :link '(url-link 
          :tag "\n:EMACSWIKI-FILE (URL `http://www.emacswiki.org/emacs/slime-loads-GNU-clbuild.el')" 
          "http://www.emacswiki.org/emacs/slime-loads-GNU-clbuild.el")
  :link '(emacs-library-link 
          :tag "\n:FILE slime-loads-GNU-clbuild.el"
          "slime-loads-GNU-clbuild.el")
  :link '(url-link 
          :tag "\n:QUICKLISP (URL `http://www.quicklisp.org/')" 
          "http://www.quicklisp.org/")
  :link '(url-link 
          :tag "\n:QUICKLISP-BLOG (URL `http://blog.quicklisp.org/')"
          "http://blog.quicklisp.org/")
  :link '(url-link
          :tag "\n:QUICKLISP-FAQ (URL `http://www.quicklisp.org/beta/faq.html')"
          "http://www.quicklisp.org/beta/faq.html")
  :link '(url-link 
          :tag "\n:QUICKLISP-GG-GROUP (URL `http://groups.google.com/group/quicklisp')"
          "http://groups.google.com/group/quicklisp")
  :link '(url-link 
          :tag "\n:QUICKLISP-CLIENT-FROM-GIT (URL `http://github.com/quicklisp/quicklisp-client.git')"
          "http://github.com/quicklisp/quicklisp-client.git")
  :link '(url-link 
          :tag "\n:QUICKLISP-PROJECTS-FROM-GIT (URL `git://github.com/quicklisp/quicklisp-projects.git')"
          "git://github.com/quicklisp/quicklisp-projects.git")
  :link '(url-link 
          :tag "\n:QUICKLISP-BOOTSTRAP-FROM-GIT (URL `git://github.com/quicklisp/quicklisp-bootstrap.git')"
          "git://github.com/quicklisp/quicklisp-bootstrap.git")
  ;; :link '(url-link 
  ;;         :tag ":QUICKLISP-SLIME-HELPER (URL `http://github.com/quicklisp/quicklisp-slime-helper')"
  ;;         "http://github.com/quicklisp/quicklisp-slime-helper"')
  :prefix "quicklisp-"
  :group 'mon-slime
  :group 'mon-doc-help-utils)


;;; ==============================
;;; :PASTED (URL `http://paste.lisp.org/+2EGF')
;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T16:13:46-04:00Z}#{10263} - by MON KEY>
(defcustom *quicklisp-path* (substitute-in-file-name "${DEVHOME}/quicklisp/")
  "Names a directory for use with Zach Beane's Quicklisp for Common Lisp.\n
Defaults to the value of:\n
 \(merge-pathnames \"quicklisp/\" \(user-homedir-pathname\)\)\n
:SEE (URL `http://www.quicklisp.org').\n
:SEE-ALSO `slime-backend', `quicklisp-find-slime',
`quicklisp-current-swank-loader', `quicklisp-write-dot-swank-loader-if',
`quicklisp-write-dot-swank-loader', `quicklisp-dot-swank-current-p',
`*quicklisp-path*'.\n▶▶▶"
  :type  'directory
  :group 'mon-quicklisp
  :group 'mon-doc-help-CL)
;;
;; (unless (and (intern-soft "*quicklisp-path*" obarray)
;;              (bound-and-true-p *quicklisp-path*))
;;   ;; (setq *quicklisp-path* (substitute-in-file-name "$HOME/quicklisp")
;;   ;; (setq *quicklisp-path* (expand-file-name "quicklisp/" (getenv "HOME")))
;;   (setq *quicklisp-path* (concat (getenv "HOME") "/quicklisp/")))


;; (let ((fnd-slm-rgxp "\\(slime-\\(%s\\)-cvs\\)"))
;; (directory-files *quicklisp-path* nil (format "\\(slime-\\(%s\\)\\)" "[0-9]+"))

;; (directory-files (concat (or ql-path *quicklisp-path*) "dists/quicklisp/software/") nil (format "\\(slime-v\\(%s\\)\\)" "[0-9]+"))
        

;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T16:13:52-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-find-slime (&optional ql-path) 
  "Find the most-recently installed slime/swank quicklisp installation.\n
QL-PATH is directory namestring of an alternate path to the quicklisp directory,
when provided it has the form:\n
 \"/some/path/to/quicklisp/\"\n
Where \"software/\" is an immediate subdir of QL-PATH.\n
When ommitted defaults to the value of `*quicklisp-path*'.\n
Signal an error if ther is not a directory name matching the regexp:
 \\\(slime-\\\(%s\\\)-cvs\\\)\n
in the software subdir of `*quicklisp-path*'.\n
:EXAMPLE\n\n\(quicklisp-find-slime\)\n
\(quicklisp \"~/quicklisp/\")\n
:SEE-ALSO `slime-backend', `quicklisp-current-swank-loader',
`quicklisp-write-dot-swank-loader-if', `quicklisp-dot-swank-current-p',
`quicklisp-write-dot-swank-loader', `*quicklisp-path*'.\n▶▶▶"
  (let* ((ql-softs (concat (or ql-path *quicklisp-path*) 
                           "dists/quicklisp/software/")) 
         ;; (fnd-slm-rgxp "\\(slime-\\(%s\\)-cvs\\)") ;; %s -> "[0-9]+" & most-recent
         (fnd-slm-rgxp "\\(slime-v\\(%s\\)\\)")
         (ql-slimes  (directory-files ql-softs nil (format fnd-slm-rgxp "[0-9]+")))
         (ql-esignal (format (concat ":FUNCTION `quicklisp-find-slime' "
                                     "-- no slime/swank directory in `*quicklisp-path*': %s")
                             ql-softs))
         most-recent)
    (if (null ql-slimes)
        (error ql-esignal)
      (dolist (mr ql-slimes 
                  (if (null most-recent)
                      (error ql-esignal)
                    (setq most-recent 
                          (car (sort (nreverse most-recent) 
                                     #'(lambda (old new) (string< new old)))))))
                                         
        (progn (string-match (format fnd-slm-rgxp "[0-9]+") mr)
               (when (> (match-beginning 2) 0)
                 (push (substring mr (match-beginning 2) (match-end 2))
                       most-recent)))))
    (let ((mr most-recent))
      (dolist (fnd-slm ql-slimes)
        (when (string-match-p (format fnd-slm-rgxp mr) fnd-slm)
          (setq most-recent fnd-slm))))
    ;; :NOTE `most-recent' is either a datestring, or a directory-namestring:
    ;;  "*quicklisp-path*/*/slime-<DATE>-cvs"
    ;; If its a directory we win.
    (if (file-directory-p (concat ql-softs most-recent))
        (file-truename (concat ql-softs most-recent))
      (error ql-esignal))))
;;
;;; :TEST-ME (quicklisp-find-slime)
;;; :TEST-ME (quicklisp-find-slime "~/quicklisp/")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T16:44:21-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-current-swank-loader (&optional ql-path)
  "Return a list suitable for writing/verifying the existence of
  \".swank-loader.lisp\" in quicklisp directory `*quicklisp-path*'.
Optional arg QL-PATH is as per `quicklisp-find-slime'.\n
Return value is a three elt list of the form:
\( \( {t | nil} . { *quicklisp-path* | ql-path }.swank-loader.lisp \)
  { *quicklisp-path* | ql-path }software/slime-<DATE>-cvs
  { *quicklisp-path* | ql-path }software/slime-<DATE>-cvs/swank-loader.lisp \)\n
When file with name \".swank-loder.lisp\" is not present car of elt 0 is nil.\n
cdr of elt 0 is the file's truename whether it exists or not, signal an error if
file is can not be written.\n
elt1 is the `directory-file-name' of the most current slime directory having the form:
 slime-<DATE>-cvs\n
elt2 is the truename of the most current swank-loader.lisp\n
:EXAMPLE\n\n\(quicklisp-current-swank-loader\)\n
\(quicklisp-current-swank-loader \"~/quicklisp/\"\)\n
:SEE-ALSO `slime-backend', `quicklisp-find-slime',
`quicklisp-write-dot-swank-loader-if', `quicklisp-write-dot-swank-loader',
`quicklisp-dot-swank-current-p', `*quicklisp-path*'.\n▶▶▶"
  (let* ((swk-ldr-pth (quicklisp-find-slime ql-path))
         (swk-ldr     (concat (file-name-as-directory swk-ldr-pth)
                              "swank-loader.lisp"))
         (dt-swk-ldr  (concat (file-name-directory
                               (directory-file-name 
                                (file-name-directory swk-ldr-pth)))
                              ".swank-loader.lisp")))
    (and (or ;; Unless, Slime-devs change this flname should be ok. Check anyhow.
          (file-exists-p swk-ldr) 
          (or (and (featurep 'mon-error-utils)
                   (mon-file-non-existent-ERROR :w-error t
                                                :fun-name "quicklisp-current-swank-loader"
                                                :locus "swk-ldr"
                                                :got-val swk-ldr))
              (error (concat ":FUNCTION `quicklisp-current-swank-loader' "
                             "-- non-existent :FILE %S") swk-ldr)))
         (cond ((file-exists-p dt-swk-ldr) 
                (setq dt-swk-ldr `(t . ,dt-swk-ldr)))
               ((file-writable-p dt-swk-ldr) 
                (setq dt-swk-ldr `(nil . ,dt-swk-ldr)))
               (t (or (and (featurep 'mon-error-utils)
                           (mon-format :w-fun #'error 
                                       :w-spec '(":FUNCTION `quicklisp-current-swank-loader' "
                                                 "-- non-writable :FILE %S")
                                       :w-args swk-ldr))
                      (error (concat ":FUNCTION `quicklisp-current-swank-loader' "
                                     "-- non-writable :FILE %S")
                             swk-ldr))))
    `(,dt-swk-ldr ,swk-ldr-pth ,swk-ldr))))
;;
;;; :TEST-ME (quicklisp-current-swank-loader)
;;; :TEST-ME (quicklisp-current-swank-loader "~/quicklisp/")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T19:09:57-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-write-dot-swank-loader (&optional w-swank-loader-list
                                                   ql-path w-msg-user)
  "Write new .swank-loader.lisp file with pointer to most current swank/slime.\n
When optional arg W-SWANK-LOADER-LIST is omitted default is the value returned
by `quicklisp-current-swank-loader', when non-nil it is a list of the form
returned by that function.
When W-SWANK-LOADER-LIST is omitted and optional arg QL-PATH is non-nil it is a
directory namestring as per `quicklisp-find-slime' and .swank-loader.lisp file
is written to the QL-PATH directory. 
When W-SWANK-LOADER-LIST and QL-PATH are ommitted, default to value of
`*quicklisp-path*'.\n
When optional arg W-MSG-USER is non-nil write a message to \"*Messages*\" buffer
indicating that file has changed.\n
:SEE-ALSO `slime-backend', `quicklisp-find-slime',
`quicklisp-current-swank-loader', `quicklisp-write-dot-swank-loader-if',
`quicklisp-dot-swank-current-p', `*quicklisp-path*'.\n▶▶▶"
  (let* ((qcsw (or w-swank-loader-list
                   (quicklisp-current-swank-loader ql-path)))
         (dot-swank  (cdar qcsw))
         (cur-swank  (cadr qcsw))
         (ldr-swank  (caddr qcsw)))
    (with-temp-file dot-swank
      (insert (format ";;; %s\n;;; %s\n" dot-swank
                      (format-time-string "%Y-%m-%dT%T%z\n"))
              (format (concat "(unless (find-package 'swank-loader)\n"
                              "  (load #P\"%s\"))") ldr-swank)))
    (if w-msg-user
        (progn
          (or (and (featurep 'mon-error-utils)
                   (mon-message :msg-spec '(":FUNCTION `quicklisp-write-dot-swank-loader' "
                                            "-- wrote:\n:FILE #%S\n"
                                            ":FINDS-FILE %S")
                                :msg-args `(,dot-swank ,ldr-swank)))
              (message (concat ":FUNCTION `quicklisp-write-dot-swank-loader' "
                               "-- wrote:\n:FILE #%S\n"
                               ":FINDS-FILE %S") dot-swank ldr-swank))
          dot-swank)
      dot-swank)))
;;
;;; :TEST-ME (quicklisp-write-dot-swank-loader)
;;; :TEST-ME (quicklisp-write-dot-swank-loader "~/quicklisp/")
 
;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T19:29:49-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-write-dot-swank-loader-if (&optional w-swank-loader-list
                                                      ql-path w-msg-user)
  "Write a new .swank-loader.lisp if current one does not exist.\n
Optional arg W-SWANK-LOADER-LIST is as per `quicklisp-write-dot-swank-loader'.\n
Optional arg QL-PATH is directory namestring of an alternate path to the
quicklisp directory as per `quicklisp-find-slime'.\n
When optional arg W-MSG-USER is non-nil write a message to \"*Messages*\" buffer
indicating that file has changed as per `quicklisp-write-dot-swank-loader'.\n
:SEE-ALSO `slime-backend',`quicklisp-find-slime',
`quicklisp-current-swank-loader', `quicklisp-write-dot-swank-loader',
`quicklisp-dot-swank-current-p', `*quicklisp-path*'.\n▶▶▶"
  (let ((swk-ldr-lst 
         (or w-swank-loader-list
             (quicklisp-current-swank-loader ql-path))))
    (if (or (null (caar swk-ldr-lst))
            (null (car (quicklisp-dot-swank-current-p swk-ldr-lst))))
        (quicklisp-write-dot-swank-loader swk-ldr-lst nil w-msg-user)
      (cdar swk-ldr-lst))))
;;
;;; :TEST-ME (quicklisp-write-dot-swank-loader-if)
;;; :TEST-ME (quicklisp-write-dot-swank-loader-if nil nil t)
;;; :TEST-ME (quicklisp-write-dot-swank-loader-if nil "~/quicklisp/" t)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T17:54:15-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-dot-swank-current-p (&optional w-swank-loader-list ql-path)
  "Test if the swank-loader.lisp is current.\n
Search in file returned by `quicklisp-current-swank-loader' e.g.
<QUICKLISP-PATH>/.swank-loader.lisp for a swank-loader filename which
matches the most current Quicklisp dists slime/swank.\n
Optional arg W-SWANK-LOADER-LIST is as per `quicklisp-write-dot-swank-loader'.\n
Optional arg QL-PATH is directory namestring of an alternate path to the
quicklisp directory as per `quicklisp-find-slime'./n
:EXAMPLE\n\n\(quicklisp-dot-swank-current-p\)\n
\(quicklisp-dot-swank-current-p nil \"~/quicklisp/\"\)\n
\(quicklisp-dot-swank-current-p
 \(quicklisp-current-swank-loader \"~/quicklisp/\"\)\)\n
:SEE-ALSO `slime-backend', `quicklisp-find-slime',
`quicklisp-current-swank-loader', `quicklisp-write-dot-swank-loader',
`quicklisp-write-dot-swank-loader-if', `*quicklisp-path*'.\n▶▶▶"
  ;; Assumes the swank-loader.lisp path is a namestring.
  (let ((ql-cur-slm (or w-swank-loader-list
                        (quicklisp-current-swank-loader ql-path))))
    (when (caar ql-cur-slm)
      (with-temp-buffer 
        (insert-file-contents (cdar ql-cur-slm))
        (search-forward-regexp (caddr ql-cur-slm) nil t)
        (if (> (point) (buffer-end 0))
            `(t . ,(caddr ql-cur-slm))
          (if (progn
                (goto-char (buffer-end 0))
                (search-forward-regexp "/.*/swank-loader.lisp" nil t))
              `(nil . ,(match-string-no-properties 0))))))))
;;
;;; :TEST-ME (quicklisp-dot-swank-current-p)
;;; :TEST-ME (quicklisp-dot-swank-current-p nil "~/quicklisp/")
;;; :TEST-ME (quicklisp-dot-swank-current-p
;;;            (quicklisp-current-swank-loader "~/quicklisp/")))


;;; :PASTED (URL `http://paste.lisp.org/+2EGX')
;;; quicklisp completing-read systems.txt -> hash-table
;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T23:12:26-04:00Z}#{10263} - by MON KEY>
(defvar *quicklisp-systems* nil
  "Hash-table of Quicklisp systems.\n
:EXAMPLE\n\n\(hash-table-size *quicklisp-systems*\)\n
\(hash-table-count *quicklisp-systems*\)\n
\(hash-table-test *quicklisp-systems*\)\n
:SEE-ALSO `quicklisp-system-complete', `quicklisp-system-complete-if',
`quicklisp-hash-system-completions',
`quicklisp-hash-system-completions-slime-loadtime', `*quicklisp-path*'.\n▶▶▶")
;;
(unless (and (intern-soft "*quicklisp-systems*" obarray)
             (bound-and-true-p *quicklisp-systems*))
  (setq *quicklisp-systems* (make-hash-table :test 'equal)))


;; (define-hash-table-test name test hash)

;;; ==============================
;;; :NOTE Can/should this leverage `lazy-completion-table'?
;;; :CREATED <Timestamp: #{2010-06-30T23:12:22-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-hash-system-completions (&optional force-rehash)
  "Hash all system names in file \"quicklisp/index/systems.txt\".\n
Return number of system names hashed.\n
When optional arg FORCE-REHASH is non-nil clear the `*quicklisp-systems*'
hash-table, this effectivley forces a rehash of existing systems.\n
:SEE-ALSO `quicklisp-system-complete', `quicklisp-system-complete-if',
`quicklisp-hash-system-completions-slime-loadtime', `*quicklisp-systems*',
`*quicklisp-path*'.\n▶▶▶"
  (when force-rehash (clrhash *quicklisp-systems*))
  (if (< (hash-table-count *quicklisp-systems*) 67) ;don't branch needlesly
      (let ((ql-sys-txt ;; :WAS pre-2010/09/01 (concat *quicklisp-path* "index/systems.txt")) 
             (expand-file-name "dists/quicklisp/systems.txt" *quicklisp-path*))
            (ql-sys-bfr (upcase (symbol-name '*quicklisp-systems*)))
            (rd-reading t)
            rd-got)
        (if (not (file-exists-p ql-sys-txt))
            (or (and (featurep 'mon-error-utils)
                     (mon-file-non-existent-ERROR :w-error t
                                                  :fun-name "quicklisp-hash-system-completions"
                                                  :locus "ql-sys-txt"
                                                  :got-val ql-sys-txt))
                (error (concat ":FUNCTION `quicklisp-hash-system-completions' "
                               "-- non-existent :FILE %s")
                       ql-sys-txt))
          (with-current-buffer (get-buffer-create ql-sys-bfr)
            (save-excursion (insert-file-contents ql-sys-txt))
            ;; Remove the comment at BOF Emacs lisp doesn't have `#' read syntax :(
            ;; "# project system-file system-name [dependency1..dependencyN]"
            (flush-lines "^#.*$" (buffer-end 0) (buffer-end 1)))
          (unwind-protect
              (ignore-errors
                (while rd-reading
                  (setq rd-got (read (get-buffer ql-sys-bfr)))
                  (if (null rd-got)
                      (setq rd-reading nil)
                    (unless (gethash rd-got *quicklisp-systems*)
                      (puthash (format "%s" rd-got) rd-got *quicklisp-systems*)))))
            (with-current-buffer (get-buffer ql-sys-bfr)
              (kill-buffer (current-buffer))))
          (hash-table-count *quicklisp-systems*)))
    (hash-table-count *quicklisp-systems*)))
;;
;;; :TEST-ME (quicklisp-hash-system-completions)
;;; :TEST-ME (quicklisp-hash-system-completions 'force-rehash)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-30T23:12:53-04:00Z}#{10263} - by MON KEY>
(defun quicklisp-system-complete (&optional insrtp intrp)
  "A `completing-read' for currenlty provided quicklisp systems.\n
When called-interactively or ptional arg INSRTP is non-nil insert retrun value
in current-buffer moving point.\n
:EXAMPLE\n\n(quicklisp-system-complete\)\n
:SEE-ALSO `quicklisp-system-complete-if', `quicklisp-hash-system-completions',
`*quicklisp-systems*' `mon-help-CL-symbols', `mon-help-CL-pkgs'.\n▶▶▶"
  (interactive "i\np")
  (let ((ql-sys-cmplt 
         (gethash 
          (completing-read (concat ":FUNCTION `quicklisp-system-complete' "
                                   " -- Quicklisp system name: ")
                           *quicklisp-systems*)
          *quicklisp-systems*)))
    (if (or insrtp intrp)
        (prin1 ql-sys-cmplt (current-buffer))
      ql-sys-cmplt)))
;; 
;;; :TEST-ME (quicklisp-system-complete)
;;; :TEST-ME (quicklisp-system-complete t)
;;; :TEST-ME (quicklisp-system-complete nil t)

;;; ==============================
;;; :CREATED <Timestamp: #{2011-01-14T17:20:31-05:00Z}#{11025} - by MON KEY>
(defun quicklisp-system-complete-if (completion-regexp &optional insrtp intrp)
  "Like `quicklisp-system-complete' but filter by COMPLETION-REGEXP.\n
Optional args INSRTP and INTRP are as per `quicklisp-system-complete'.\n
:EXAMPLE\n\n\(quicklisp-system-complete-if \"^cl-*\" nil t\)\n
\(call-interactively 'quicklisp-system-complete-if\\\)\)\n
:SEE-ALSO `quicklisp-hash-system-completions', `*quicklisp-systems*'
`mon-help-CL-symbols', `mon-help-CL-pkgs'.\n▶▶▶"
  (interactive (list (read-regexp "Filter quiclklisp systems matching regexp") 
                     current-prefix-arg
                     t))
  (let ((completion-regexp-list 
         (list completion-regexp)))
    (quicklisp-system-complete insrtp intrp)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-07-01T13:29:02-04:00Z}#{10264} - by MON KEY>
(defun quicklisp-hash-system-completions-slime-loadtime ()
  "Initialize `quicklisp-hash-system-completions' when loading `slime'.\n
:SEE-ALSO `quicklisp-hash-system-completions', `quicklisp-system-complete',
`quicklisp-system-complete-if',
`quicklisp-hash-system-completions-slime-loadtime'.\n▶▶▶"
  (let* ( ;; Find the current slime in `load-path'.
         (get-cur-slm (locate-library "slime"))
         ;; If we found it, make sure it has an ".el" extension not ".elc"
         (cur-slm-as-el
          (when get-cur-slm 
            (let* ((prpr-ext  (file-name-extension get-cur-slm t))
                   (prpr-ext-lst 
                    (if prpr-ext
                        (car (nreverse (append prpr-ext nil)))
                      (or (and (featurep 'mon-error-utils)
                               (mon-format :w-fun #'error
                                           :w-spec '(":FUNCTION `quicklisp-hash-system-completions-slime-loadtime' "
                                                     "-- no extension for slime library:\n%s"
                                                     :w-args get-cur-slm)))
                          (error (concat ":FUNCTION `quicklisp-hash-system-completions-slime-loadtime' "
                                         "-- no extension for slime library:\n%s")
                                 get-cur-slm)))))
              (file-truename
               (concat (file-name-sans-extension get-cur-slm) 
                       ;; (case prpr-ext-lst ;; its either l or c
                       (cl-case prpr-ext-lst ;; its either l or c 
                         (108 prpr-ext) 
                         (99  ".el")
                         (t (or (and (featurep 'mon-error-utils)
                                     (mon-format :w-fun #'error
                                                 :w-spec '(":FUNCTION `quicklisp-hash-system-completions-slime-loadtime' "
                                                           "-- no extension for slime library:\n%s"
                                                           :w-args get-cur-slm)))
                                (error (concat ":FUNCTION `quicklisp-hash-system-completions-slime-loadtime' "
                                               "-- unknown extension for slime library:\n%s")
                                       get-cur-slm)))))))))
         ;; Find the current slime/swank dist dir in `*quicklisp-path*'
         (ql-cur-slm-dr (cadr (quicklisp-current-swank-loader)))
         ;; If found: i) make directory namestring; ii) tack on /slime.el 
         (ql-cur-slm-fnm (when ql-cur-slm-dr 
                           (concat (file-name-as-directory ql-cur-slm-dr) "slime.el")))
         ;; Make sure the slime.el file exists and return its truename.
         (ql-cur-slm-if (when (and ql-cur-slm-fnm (file-exists-p ql-cur-slm-fnm))
                          (file-truename ql-cur-slm-fnm))))
    (when (and ql-cur-slm-if cur-slm-as-el (string-equal ql-cur-slm-if cur-slm-as-el))
      (ignore-errors (quicklisp-hash-system-completions)))))
;;
;; :FIXME this needs t0 be run on a siome mode hook
;; slime-lisp-mode-hook or slime-setup-first-change-hook
(add-hook 'slime-load-hook 'quicklisp-hash-system-completions-slime-loadtime)
;; (eval-after-load "slime" '(quicklisp-hash-system-completions-slime-loadtime))

;; (quicklisp-hash-system-completions-slime-loadtime)

;; (slime-eval-async `(swank::format-values-for-echo-area ',integer) '%slime-insert-integer-at-point)
;; `(%%swank-compile-load-ql-inspect-file 
;;   "slime-quicklisp-inspect"
;;   `(%%swank-compile-load-ql-inspect-file 
;;     (slime-eval-async `(cl:make-pathname :directory '(:absolute "Users" "monkpearman""Documents" "HG-Repos" "CL-MON-CODE" "mon-slime-extend")))


;;; ==============================
;; :QUICKLISP-SLIME-PATH 
;; :NOTE To test above w/ quicklisp + sbcl
;;
;; ,---- :UNCOMMENT-BELOW-TO-TEST
;; | (setq inferior-lisp-program (executable-find "sbcl"))  
;; | (set-language-environment "UTF-8")
;; |   ;; (setq slime-net-coding-system 'iso-latin-1-unix)
;; | (setq slime-net-coding-system 'utf-8-unix)
;; | (setq slime-backend (quicklisp-write-dot-swank-loader-if))
;; | (let ((this-swank (quicklisp-current-swank-loader)))
;; |   (add-to-list 'load-path (concat (cadr this-swank) "/contrib"))
;; |   (add-to-list 'load-path  (cadr this-swank))
;; |   (add-to-list 'load-path  (cadr this-swank))
;; |   (load (locate-library "slime")))
;; `----


;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-20T14:08:57-04:00Z}#{11163} - by MON KEY>
(defcustom *mon-lisp-system-paths* nil ;; (:root-path nil :base-system-path nil :system-paths (list nil))
  "A plist for constructing tags files pathnames in Common Lisp system directories.\n
Plist has the following form:\n
 \(:root-path        <ROOT-DIRECTORY-NAMESTRING>
  :base-system-path <SUB-DIRECTORY-NAMESTRING>
  :system-paths     \(<SYSTEM-DIRECTORY-NAME>*\)\)\n
<ROOT-DIRECTORY-NAMESTRING> is a pathname to a directory containing
base-system-path it should not end in a trailing slash.\n
<SUB-DIRECTORY-NAMESTRING> is an immediate subdirectory of
<ROOT-DIRECTORY-NAMESTRING> it should not end in a trailing slash.
When the directory named by <ROOT-DIRECTORY-NAMESTRING> is the immediate
parent-directory of all <SYSTEM-DIRECTORY-NAME> values then
base-syst<SUB-DIRECTORY-NAMESTRING> should be provided the emtpy string.\n
<SYSTEM-DIRECTORY-NAME> is a string naming a directory contained by
<SUB-DIRECTORY-NAMESTRING> it should not end in a trailing slash.
When generating TAGS file pathnames prior to adding them to `tags-table-list'.\n
these values are expanded as follows by `mon-add-lisp-system-paths-to-tags-table-list':
 \(expand-file-name \"TAGS\"
   \(expand-file-name <SYSTEM-DIRECTORY-NAME>
     \(expand-file-name <SUB-DIRECTORY-NAMESTRING> <ROOT-DIRECTORY-NAMESTRING>\)\)\)\n
To customize this variable the following are sufficient:
 \(custom-set-variables *mon-lisp-system-paths*
   '\(:root-path \"/ROOT/PATH/HERE\"
     :base-system-path \"SOME/SUBDIR\" 
     :system-paths \(\"YOUR-SYSTEM-A\" \"YOUR-SYSTEM-B\" \"YOUR-SYSTEM-C\"\)\)\)
 \(custom-note-var-changed '*mon-lisp-system-paths*\)\n
:EXAMPLE\n\n
 \(plist-get \(symbol-plist '*mon-lisp-system-paths*\) :root-path\)\n
 \(plist-get \(symbol-plist '*mon-lisp-system-paths*\) :base-system-path\)\n
 \(plist-get \(symbol-plist '*mon-lisp-system-paths*\)  :system-paths\)\n
:SEE-ALSO `mon-add-lisp-system-paths-to-mon-lisp-system-paths'.\n▶▶▶"
  :type '(plist :options ((:root-path directory) (:base-system-path string) (:system-paths (repeat string))))
  :group 'mon-slime
  :group 'mon-base)

;;; ==============================
;;; :CREATED <Timestamp: #{2024-08-26T19:30:26-04:00Z}#{24351} - by MON KEY>
(defun mon-add-lisp-system-paths-to-mon-lisp-system-paths ()
  "Make sure `symbol-plist' of `*mon-lisp-system-paths*' contains the key/val pairs.
set value for :root-path, :base-system-path and :system-paths according to value of 
`*mon-lisp-system-paths*'.\n
Evaluated at loadtime from `mon-slime-setup-init'.\n 
:SEE-ALSO `mon-add-lisp-system-paths-to-mon-lisp-system-paths', `mon-slime-setup-init'.\n▶▶▶"
  (when (or (and (intern-soft "IS-MON-P-DARWIN" obarray)
                         (bound-and-true-p IS-MON-P-DARWIN))
          (and (intern-soft "IS-MON-P-GNU" obarray)
                         (bound-and-true-p IS-MON-P-GNU)))
  ;; We put these values on the symbol-plist of `*mon-lisp-system-paths*' because
  ;; `mon-add-lisp-system-paths-to-tags-table-list' expects them there.
  (cl-loop 
   for prop  in '(:root-path :base-system-path :system-paths)
   for got-prop  = (member prop *mon-lisp-system-paths*)
   for prop = (car got-prop)
   for prop-val  = (cadr got-prop)
   do  (unless  (and (plist-get (symbol-plist '*mon-lisp-system-paths*) prop)
                     (equal (plist-get (symbol-plist '*mon-lisp-system-paths*) prop)
                            prop-val))
         (plist-put (symbol-plist '*mon-lisp-system-paths*) prop prop-val))
   finally
   (return 
    (setq *mon-lisp-system-paths*
     (list 
      :root-path        (plist-get (symbol-plist '*mon-lisp-system-paths*) :root-path)
      :base-system-path (plist-get (symbol-plist '*mon-lisp-system-paths*) :base-system-path)
      :system-paths     (plist-get (symbol-plist '*mon-lisp-system-paths*) :system-paths)))))))
;;
;; (progn (setq *mon-lisp-system-paths* nil)
;;        (mon-add-lisp-system-paths-to-mon-lisp-system-paths))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-20T14:06:45-04:00Z}#{11163} - by MON KEY>
(defun mon-add-lisp-system-paths-to-tags-table-list (&optional tags-paths-only)
  "Add TAGS file pathnames to `tags-table-list'.\n
Return `tags-table-list'.\n
TAGS file pathnames constructed from elts of plist in variable `*mon-lisp-system-paths*'.\n
Pathnames are added as if by `add-to-list' with the optional arg APPEND non-nil.
Pathnames are only added if the constructed TAGS file satisfies `file-exists-p'.
Custom is notified of the changes as if by `custom-note-var-changed'.\n
When optional arg TAGS-PATHS-ONLY is non-nil do not add generated TAGS file
pathnames to `tags-table-list' instead only return a list of what would have
been added.\n
:EXAMPLE\n\n\(mon-add-lisp-system-paths-to-tags-table-list t\)\n
:SEE-ALSO `mon-add-lisp-system-paths-to-mon-lisp-system-paths'.\n▶▶▶"
  (let* ((paths-plist (or (bound-and-true-p *mon-lisp-system-paths*)
                          (mon-add-lisp-system-paths-to-mon-lisp-system-paths)))
         (root-path (plist-get paths-plist :root-path))
         (base-system-path (and root-path
                                (expand-file-name (plist-get paths-plist :base-system-path) root-path)))         
         (expand-paths (and base-system-path (plist-get paths-plist :system-paths)))
         (expansions '()))
    (and paths-plist root-path base-system-path expand-paths
         (dolist (malsptttl-D-0 expand-paths (setq expansions (nreverse expansions)))
           (let ((mlsp-L-chk-pth '()))
             (setq mlsp-L-chk-pth (expand-file-name malsptttl-D-0 base-system-path))
             (and (file-directory-p mlsp-L-chk-pth)
                  (setq mlsp-L-chk-pth (expand-file-name "TAGS" mlsp-L-chk-pth))
                  (file-exists-p mlsp-L-chk-pth)
                  (push mlsp-L-chk-pth expansions)))))
    (unless (null expansions)
      (dolist (malsptttl-D-1 expansions tags-table-list)
        (add-to-list 'tags-table-list malsptttl-D-1 t)
        (custom-note-var-changed 'tags-table-list)))))

;;; ==============================
;;; :COURTESY gbbopen/gbbopen-indent.el :WAS `set-indent-hook'
;;; :CREATED <Timestamp: #{2010-10-16T11:19:11-04:00Z}#{10416} - by MON KEY>
(defun mon-lisp-set-indent (symbol value)
  "Put VALUE on SYMBOL's `lisp-indent-function` property.\n
Run on the `lisp-mode-hook' by `mon-lisp-set-indentation'.\n
:EXAMPLE\n\n
:SEE-ALSO `mon-lisp-set-indent-hook', `lisp-indent-function'.\n▶▶▶"
  (put symbol 'lisp-indent-function value))
;;
;; (remove-hook 'lisp-mode-hook #'mon-lisp-set-indent-hook)
;; (add-hook 'lisp-mode-hook #'mon-lisp-set-indent-hook))

;;; ==============================
;;; :COURTESY gbbopen/gbbopen-indent.el:WAS `gbbopen:add-indentation'
;;; :CREATED <Timestamp: #{2010-10-16T15:45:46-04:00Z}#{10416} - by MON KEY>
(defun mon-lisp-set-indent-hook ()
  "Put `lisp-indent-function` property for all `*mon-CL-indent-specs*' symbols.\n
Run on the `lisp-mode-hook'.\n
:SEE-ALSO `mon-lisp-set-indent'.\n▶▶▶"
  (interactive)
  (and (bound-and-true-p *mon-CL-indent-specs*)
       (dolist (mlsih-D *mon-CL-indent-specs*)
         (mon-lisp-set-indent (car mlsih-D) (cdr mlsih-D)))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-07-04T13:01:36-04:00Z}#{11271} - by MON KEY>
(defun mon-slime-setup-add-hooks ()
  ;; :TODO Need to set whitespace-style on the lisp-interaction-mode-hook and/or
  ;;       add it to file-local-variables
  ;;
  (add-hook 'slime-repl-mode-hook
            (function (lambda () (set (make-local-variable 'indent-tabs-mode) nil))))
  ;;
  ;; (add-hook 'slime-mode-hook
  ;;           (function (lambda () 
  ;;                       (set (make-local-variable 'indent-tabs-mode) nil))))
  ;;
  ;; (add-hook 'lisp-interaction-mode-hook 
  ;; (function (lambda () 
  ;;                       (set (make-local-variable 'indent-tabs-mode) nil))))
  ;;
  ;; (add-hook 'lisp-mode-hook
  ;;           (function (lambda () 
  ;;                       (set (make-local-variable 'indent-tabs-mode) nil))))
  ;;
  ;; (add-hook 'lisp-interaction-mode-hook  'slime-mode)

  (add-hook 'lisp-mode-hook              'slime-mode)

  ;; DARWIN TESTME
  ;; (add-hook 'lisp-mode-hook              'mon-slime-ensure-file-local-variables)
  ;; (add-hook 'lisp-interaction-mode-hook  'mon-slime-ensure-file-local-variables)
  ;; (add-hook 'slime-mode-hook             'mon-slime-ensure-file-local-variables)
  ;;
  ;; :NOTE This is `slime-lisp-mode-hook' `slime-lisp-mode' is run on the
  ;; `lisp-mode-hook' if slime-setup was evald
  (add-hook 'slime-mode-hook ;; (remove-hook 'slime-mode-hook
            (function (lambda () (set (make-local-variable 'lisp-indent-function) 'common-lisp-indent-function))))  
  (add-hook 'slime-inspector-mode-hook 'mon-keybind-slime-inspector t t)
  (add-hook 'slime-mode-hook           'mon-keybind-slime t)
  ;; DARWIN TEST-ME
  ;; (add-hook 'slime-connected-hook 
  ;;           (function (lambda () (slime-make-quicklisp-completion-table))) t)
  )


;;; ==============================
;;; :CREATED <Timestamp: #{2011-07-04T13:02:41-04:00Z}#{11271} - by MON KEY>
(defun mon-slime-ensure-file-local-variables ()
  "For whatever reason when moving into a lispy mode, certain
`buffer-local-variables' aren't set even if they are present as
file-local-variables; specifically `show-trailing-whitespace' isn't being
recognized -- this function fixes that.\n
:EXAMPLE\n\n
:SEE-ALSO .\n▶▶▶"
  (let ( ;;(mseflv-blv  (buffer-local-variables (current-buffer))))
        (mseflv-flva file-local-variables-alist))
    (dolist (mseflv-D-0 '(indent-tabs-mode show-trailing-whitespace))
      (let ((mseflv-localp (assq mseflv-D-0 mseflv-flva)))
        (when mseflv-localp 
          (set (make-local-variable (car mseflv-localp)) (cdr mseflv-localp)))))))

;; (setq slime-compile-file-options '(:fasl-directory "/tmp/slime-fasls/"))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-10-14T14:24:10-04:00Z}#{11415} - by MON KEY>
(defun mon-slime-ensure-fasl-temp-directory-exists ()
  "Create a fasl directory beneate /tmp for `slime-compile-file-options' :fasl-directory option.\n
Per stassats Slime Tip \"Keeping FASLs away\".\n
C-c C-k by default puts FASLs in the same directory as the .lisp file, which may
not always be what is wanted.\n
To automatically put slime compiled files into \"/tmp/slime-fasls/\":\n
 \(setq slime-compile-file-options '\(:fasl-directory \"/tmp/slime-temp-fasls/\"\)\)
To make sure the directory exists:\n
  \(make-directory \"/tmp/slime-temp-fasls/\" t\)\n
:NOTE The /tmp dire gets cleaned on each reboot.\n
:SEE (URL `http://slime-tips.tumblr.com/post/11398866534/keeping-fasls-away')
:EXAMPLE\n\n
:SEE-ALSO `slime-compile-file-options'.\n▶▶▶"
  (let ((mseftde-dir "/tmp/slime-temp-fasls/"))
    (make-directory mseftde-dir t)
    (when (file-directory-p mseftde-dir)
      (setq slime-compile-file-options (list :fasl-directory mseftde-dir)))))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-08-26T18:32:53-04:00Z}#{24351} - by MON KEY>
(defvar *mon-common-lisp-hyperspec-browser-function*
  ;; 'mon-common-lisp-hyperspec-browse-url-eww
  'mon-common-lisp-hyperspec-browse-url-w3m
"Handler function for `browse-url' cdr of a cons cell as per `browse-url-handlers'.\n
Used in conjunction with `mon-common-lisp-hyperspec-use-dedicated-browser-p'
which if URL satisfies will cause allow this function to invoke a url-handler
function with URL as it's argument.\n
Current possible is one of the following:\n
 `mon-common-lisp-hyperspec-browse-url-eww'
 `mon-common-lisp-hyperspec-browse-url-w3m'\n
:SEE-ALSO `common-lisp-hyperspec', `common-lisp-hyperspec-root',
`browse-url-generic-program', `browse-url-browser-function'.\n▶▶▶")

;;; ==============================
;;; :CREATED <Timestamp: #{2024-08-26T18:32:56-04:00Z}#{24351} - by MON KEY>
(defun mon-common-lisp-hyperspec-use-dedicated-browser-p (url)
  "Predicate function for variable use with `browse-url-handlers'.
URL is a url for use with `browse-url' \(or local equivalent indirected throught it\).\n
Check if `common-lisp-hyperspec-root' is non-nil and URL matches it's value as
if by `string-match-p'.\n
If return value is non-nil the asociate HANDLER function is invoked. HANDLER
function is a value as per `*mon-common-lisp-hyperspec-browser-function*'.\n
:EXAMPLE 
 \(mon-common-lisp-hyperspec-use-dedicated-browser-p
   \(concat common-lisp-hyperspec-root \"Body/m_defpar.htm\"\)\)\\n
 \(mon-common-lisp-hyperspec-use-dedicated-browser-p \"FOOBAR\"\)\\n
:SEE-ALSO `mon-common-lisp-hyperspec-browse-url-eww',
`mon-common-lisp-hyperspec-browse-url-w3m',
`common-lisp-hyperspec', `common-lisp-hyperspec-root',
`browse-url-generic-program', `browse-url-browser-function'.\n▶▶▶"
  (and common-lisp-hyperspec-root  
       (and (string-match-p common-lisp-hyperspec-root url)
            t)))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-08-26T18:33:02-04:00Z}#{24351} - by MON KEY>
(defun mon-common-lisp-hyperspec-browse-url-eww (url &rest args)
"Handler function for `browse-url' cdr of a cons cell as per `browse-url-handlers'.\n
Used in conjunction with `mon-common-lisp-hyperspec-use-dedicated-browser-p'
which if URL satisfies will cause allow this function to invoke `eww-open-file'
with URL as it's argument.\n
Used as a value for `*mon-common-lisp-hyperspec-browser-function*'.\n
:EXAMPLE\n
 \(mon-common-lisp-hyperspec-browse-url-eww
   \(concat common-lisp-hyperspec-root \"Body/m_defpar.htm\"\)\)\n
:SEE-ALSO `mon-common-lisp-hyperspec-browse-url-w3m',
`common-lisp-hyperspec', `common-lisp-hyperspec-root',
`mon-set-browser-init', `browse-url-generic-program',
`browse-url-browser-function'.\n▶▶▶"
 (and (string-match-p common-lisp-hyperspec-root url)
      (if (string-equal "file:/" (substring url 0 6))
          (eww-open-file (substring url 6))
        (eww-open-file url)
        url)))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-08-26T18:33:04-04:00Z}#{24351} - by MON KEY>
(defun mon-common-lisp-hyperspec-browse-url-w3m (url &rest args)
"Handler function for `browse-url' cdr of a cons cell as per `browse-url-handlers'.\n
Used in conjunction with `mon-common-lisp-hyperspec-use-dedicated-browser-p'
which if URL satisfies will cause allow this function to invoke `w3m-browse-url'
with URL as it's argument.\n
Used as a value for `*mon-common-lisp-hyperspec-browser-function*'.\n
:EXAMPLE\n
 \(mon-common-lisp-hyperspec-browse-url-w3m
   \(concat common-lisp-hyperspec-root \"Body/m_defpar.htm\"\)\)\n
:SEE-ALSO `mon-common-lisp-hyperspec-browse-url-eww',
`common-lisp-hyperspec', `common-lisp-hyperspec-root',
`browse-url-generic-program', `browse-url-browser-function'.\n▶▶▶"
 (w3m-browse-url url))

;;; ==============================
;;; :CREATED <Timestamp: #{2024-08-26T20:30:26-04:00Z}#{24351} - by MON KEY>
(defun mon-common-lisp-hyperspec-browse-url-set-init ()
 "Set or update `browse-url-handlers' according to value of 
`*mon-common-lisp-hyperspec-browser-function*'.\n
Evaluated at loadtime by `mon-common-lisp-hyperspec-browse-url-set-init'.\n
:SEE-ALSO `mon-common-lisp-hyperspec-browse-url-eww',
`mon-common-lisp-hyperspec-browse-url-w3m',
`common-lisp-hyperspec', `common-lisp-hyperspec-root',
`browse-url-generic-program', `browse-url-browser-function'.\n▶▶▶"
 (and *mon-common-lisp-hyperspec-browser-function*
      (cond ((eql *mon-common-lisp-hyperspec-browser-function*
                  'mon-common-lisp-hyperspec-browse-url-w3m)
             (unless (featurep 'w3m) 
               ;; w3m directory should already be in path per `mon-set-w3m-init', but just in case.
               (require 'w3m 
                        (and (or (and (intern-soft "IS-MON-P-DARWIN" obarray)
                                      (bound-and-true-p IS-MON-P-DARWIN))
                                 (and (intern-soft "IS-MON-P-GNU" obarray)
                                      (bound-and-true-p IS-MON-P-GNU)))
                             (locate-library "site-lisp/emacs-w3m_GIT/w3m")))))
            ((eql *mon-common-lisp-hyperspec-browser-function*
                  'mon-common-lisp-hyperspec-browse-url-eww)
              (unless (featurep 'eww) (require 'eww))))
      (progn
        ;; first remove any existing handlers pairs we may already have set.
        (unless (null browse-url-handlers)
          (mapcar #'(lambda (x) 
                 (eql (car x) 'mon-common-lisp-hyperspec-use-dedicated-browser-p)
                 (when (eql (car x) 'mon-common-lisp-hyperspec-use-dedicated-browser-p)
                   (setq browse-url-handlers (delete x browse-url-handlers))))
                  browse-url-handlers))
        (setq browse-url-handlers
              (push (cons 'mon-common-lisp-hyperspec-use-dedicated-browser-p
                          *mon-common-lisp-hyperspec-browser-function*)
                    browse-url-handlers))
        (custom-note-var-changed 'browse-url-handlers)
        (mon-message :msg-spec '(":FUNCTION `mon-common-lisp-hyperspec-browse-url-set-init'"
                            "updating value of `browse-url-handlers'. New value:\n   %S")
                :msg-args browse-url-handlers)
        browse-url-handlers)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-06-23T20:38:32-04:00Z}#{10253} - by MON KEY>
(defun mon-slime-setup-init ()
  "Configure some Slime/Swank related setings at init.\n
Evaluates `set-language-environment' with \"UTF-8\".\n
Adds value of `quicklisp-current-swank-loader' to `load-path'\n
Sets slime-backend to value of `quicklisp-write-dot-swank-loader-if'
Sets the following variables:\n
 `inferior-lisp-program' `slime-net-coding-system'`slime-truncate-lines'
Attempts to disable `slime-use-autodoc-mode' in various ways \(mostly w/out success\).\n
Requires slime package.\n
Evaluates `slime-setup', `slime-require'.\n
:SEE-ALSO `mon-set-lisp-init', `mon-slime-start-sbcl', `mon-keybind-slime',
`mon-slime-ensure-fasl-temp-directory-exists', `mon-help-CL-slime-keys',
`slime-cheat-sheet', `mon-slime-setup-mon',
`init-keybind-lisp-interaction-mode', `mon-keybind-emacs-lisp-mode',
`slime-setup-contribs', `slime-load-contribs', `slime-required-modules'.\n▶▶▶"
  ;; evaluate `mon-add-lisp-system-paths-to-mon-lisp-system-paths'
  ;; to make sure value of `*mon-lisp-system-paths*' is non-null and it's
  ;; symbol-plist is sane.
  (mon-add-lisp-system-paths-to-mon-lisp-system-paths)
  ;; :NOTE sb-ext:*runtime-pathname* returns the current SBCL runtime
  (set-language-environment "UTF-8")
  ;; :QUICKLISP-SLIME-PATH
  (let ((this-swank (quicklisp-current-swank-loader)))
    (add-to-list 'load-path  (concat (cadr this-swank) "/contrib"))
    (add-to-list 'load-path  (cadr this-swank))
    (add-to-list 'load-path  (cadr this-swank))
    ) ;;(load (locate-library "slime")))
  
  ;; (add-to-list 'auto-mode-alist '("\\(?:\\.pctd\\)" . lisp-mode))

  ;; (pop slime-completion-at-point-functions)
  (custom-set-variables
   '(inferior-lisp-program (concat (executable-find "sbcl") " --noinform --no-linedit"))
   ;; '(slime-net-coding-system 'iso-latin-1-unix))
   '(slime-net-coding-system 'utf-8-unix)
   '(slime-backend (quicklisp-write-dot-swank-loader-if))
   '(slime-truncate-lines nil)
   ;; :NOTE Setting `slime-use-autodoc-mode' is about the only to stop the
   ;;       insanity once it starts.
   ;; :OBSOLETE `slime-complete-symbol-function' :USE `slime-completion-at-point-functions'
   ;; '(slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
   ;; '(slime-completion-at-point-functions  (add-to-list  'slime-completion-at-point-functions 'slime-fuzzy-complete-symbol) t)
   '(slime-completion-at-point-functions
     '(slime-fuzzy-complete-symbol
       slime-filename-completion
       slime-simple-completion-at-point))
   '(slime-use-autodoc-mode nil)
   '(slime-autodoc-delay 2)
   '(slime-autodoc-accuracy-depth 4) ;; The default: 10 is prob. way to much IMHO
   '(slime-repl-history-remove-duplicates t)
   '(slime-repl-history-trim-whitespaces t)
   ;; '(slime-repl-history-file "~/.slime/.slime-history.eld") :DEFAULT "~/.slime-history.eld"
   ;; `comint-replace-by-expanded-filename', `comint-dynamic-complete-as-filename'
   '(slime-when-complete-filename-expand t)
   '(lisp-align-keywords-in-calls t)
   '(lisp-lambda-list-keyword-alignment t)
   '(lisp-lambda-list-keyword-parameter-alignment t)
   '(lisp-lambda-list-keyword-parameter-indentation 0)
   '(common-lisp-style-default "mon") ;; (common-lisp-style-names)
   ;;
   ;; '(slime-asdf-collect-notes t)
   )
  ;; DARWIN is needed? 
  ;; (setq slime-lisp-modes '(lisp-mode lisp-interaction-mode))
  (mon-slime-ensure-fasl-temp-directory-exists)
  ;;
  ;; (setq slime-selector-other-window t) ;; :DEFAULT nil
  (progn 
    (require 'slime)
    (when (or (slime-bytecode-stale-p)
              (not (file-exists-p (concat (file-name-sans-extension (locate-library "slime")) ".elc"))))
      (slime-recompile-bytecode)))
  ;;
  ;; (setq slime-protocol-version (slime-changelog-date))
  ;;
  ;; (require 'slime-autoloads)
  (slime-setup '(slime-fancy 
                 slime-sbcl-exts
                 slime-asdf
                 slime-tramp
                 slime-presentation-streams 
		 slime-repl 
                 slime-scratch 
                 slime-references
                 slime-snapshot 
                 slime-sprof  ;; (featurep 'slime-sprof)
                 slime-indentation
                 ;; slime-cl-indent
                 ;; slime-cover
                 ;; slime-highlight-edits
                 ))
  ;; (locate-library "libe/hyperspec")
  (slime-require :swank-sbcl-exts)
  
  (slime-require :swank-listener-hooks)
  ;; :NOTE `slime-setup-contribs' is a function and a variable
  ;; `slime-setup' <- `slime-setup-contribs' 
  ;; The slime-fancy.el package is one `define-slime-contrib' macro form that
  ;; requires, compiles, and loads certain slime/contrib packages. 
  ;; For each slime-fancy package, it also builds the functions: 
  ;;  `slime-<SOME-CONTRIB>-init' and `slime-<SOME-CONTRIB>-unload':
  ;; slime-fancy loads the following packages:
  ;; slime-repl             ;; (require 'slime-repl)
  ;; slime-autodoc          ;; (require 'slime-autodoc)
  ;; slime-c-p-c            ;; (require 'slime-c-p-c)
  ;; slime-editing-commands ;; (require 'slime-editing-commands)
  ;; slime-fancy-inspector  ;; (require 'slime-fancy-inspector)
  ;; slime-fuzzy            ;; (require 'slime-fuzzy)
  ;; slime-presentations    ;; (require 'slime-presentations)
  ;; slime-scratch          ;; (require 'slime-scratch)
  ;; slime-references       ;; (require 'slime-references)
  ;; slime-package-fu       ;; (require 'slime-package-fu)
  ;; slime-fontifying-fu    ;; (require 'slime-fontifying-fu)
  ;;
  ;; :WHEN-SBCL
  ;; (require 'slime-sbcl-exts) (slime-sbcl-exts-init)                                          
  ;; ==============================
  ;; Not loaded by `slime-fancy'
  ;; (require 'slime-highlight-edits) (slime-highlight-edits-init)
  ;; (require 'slime-presentation-streams) (slime-presentation-streams-init)
  ;; (require 'slime-tramp) (slime-tramp-init)
  ;; (require 'slime-asdf) (slime-asdf-init)
  ;; (require 'slime-mdot-fu) (slime-mdot-fu-init)
  ;;; ==============================
  ;; (slime)
  ;;

  (add-hook 'slime-mode-hook ;; (remove-hook 'slime-mode-hook  
            (function (lambda ()
                        (set (make-local-variable 'slime-use-autodoc-mode) nil))) t)
  ;;
  ;; (add-hook 'slime-mode-hook    ;;(remove-hook 'slime-mode-hook 
  ;;              (function (lambda () (slime-list-threads))))
  ;;
  ;; (add-hook 'slime-load-hook   ;; (remove-hook 'slime-load-hook 
  ;;           (when (buffer-local-value 'slime-highlight-edits-mode (current-buffer))
  ;;             (slime-highlight-edits-mode -1)))
  ;;
  ;; :SLIME-LISP-MODES

  ;; (add-hook 'lisp-interaction-mode-hook 'slime-mode)
  
  (add-hook 'lisp-mode-hook             'slime-mode)
  ;;
  ;; :NOTE This is `slime-lisp-mode-hook' `slime-lisp-mode' is run on the
  ;; `lisp-mode-hook' if slime-setup was evald
  ;; (add-hook 'slime-mode-hook   ;; (remove-hook 'slime-mode-hook
  ;;           (function (lambda () 
  ;;                       (set (make-local-variable 'lisp-indent-function)  
  ;;                            'common-lisp-indent-function))))
  (add-hook 'slime-mode-hook
            (function (lambda () 
                        (set (make-local-variable 'indent-tabs-mode) nil))) t)
  ;;
  ;; M-X slime-toggle-debug-on-swank-error
  ;; swank::*inspector-verbose-printer-bindings* 
  ;; swank::*inspector-printer-bindings*

  ;; :DARWIN
  ;; (add-hook 'slime-inspector-mode-hook 'mon-keybind-slime-inspector t t)

  ;; :DARWIN
  ;; (add-hook 'slime-mode-hook 'mon-keybind-slime t)
  (add-hook 'slime-connected-hook 
            (function (lambda () (slime-make-quicklisp-completion-table))) t)
  ;;

  ;; We're not using this anymore.
  ;; (add-to-list 'auto-mode-alist  '("\\.kif\\'" . lisp-interaction-mode))
  ;; 
  ;; :NOTE If this block fails, move it into `mon-slime-setup-init'.
  (eval-after-load "slime-repl"
    (progn
      (defslime-repl-shortcut nil ("asdf-systems" "asdf-all")
      (:handler 'slime-inspect-asdf-defined-systems)
      (:one-liner "inspect all defined systems"))

    (defslime-repl-shortcut nil ("asdf-system" "asdf-sys")
      (:handler (lambda (&optional preserve) 
                  ;; allow McClim2 to pass through without zapping case 
                  ;; w/ e.g. M-2 , sys McClim2
                  (interactive "P")
                  (slime-inspect-asdf-system (read-string "system: ") 
                                             current-prefix-arg)))
      (:one-liner "inspect asdf system"))

    ;; DAWIN TESTME
    (defslime-repl-shortcut nil ("ql-systems-all" "ql-all-sys")
      (:handler 'slime-inspect-quicklisp-systems)
      (:one-liner "inspect all quicklisp systems"))
    
    (defslime-repl-shortcut nil ("ql-system" "ql-sys")
      (:handler 'slime-inspect-quicklisp-system)
      (:one-liner "inspect a quicklisp system"))

    ;; (defslime-repl-shortcut nil ("ql-all-dists" "all-dists")
    ;;   (:handler 'slime-inspect-quicklisp-dists-all)
    ;;   (:one-liner "inspect all quicklisp dists"))

    ;; (defslime-repl-shortcut nil ("ql-enabled-dists" "enabled-dists")
    ;;   (:handler 'slime-inspect-quicklisp-dists-enabled)
    ;;   (:one-liner "inspect enabled quicklisp dists"))

    ))

  )

(defun slime-fuzzy-sroll-completions-up-from-target-buffer ()
  "For use with `mon-keybind-slime-fuzzy-completions'."
  (interactive)
  (scroll-other-window))

(defun slime-fuzzy-sroll-completions-down-from-target-buffer ()
  "For use with `mon-keybind-slime-fuzzy-completions'."
  (interactive)
  (scroll-other-window '-))

;; (mon-slime-setup-init)
;; 

;; (mon-define-common-lisp-style)
(defun mon-define-common-lisp-style ()
  (define-common-lisp-style "mon" ;; "sbcl"
    "Adapted from the \"sbcl\" style in contribs/slime-cl-indent.el 
   Style used in SBCL sources. A good if somewhat intrusive general purpose
   style based on the \"modern\" style. Adds indentation for a few SBCL
   specific constructs, sets indentation to use spaces instead of tabs,
   fill-column to 80, and activates whitespace-mode to show tabs and trailing
   whitespace."
    (:inherit "modern")
    (:eval (whitespace-mode 1))
    ;; (:eval (whitespace-mode 0))     
    (:variables
     ;; (whitespace-style (tabs trailing))
     (whitespace-style (tabs))
     (indent-tabs-mode nil)
     (comment-fill-column nil)
     (fill-column 80))
    ;; Indentation forms look like this:
    ;; explicit:
    ;; (cl-case (4 &rest (&whole 2 &rest 3)))  
    ;; inheritted:
    ;; (FOOconstant       (as defconstant))
    ;;  (FOOdefun (as defun))
    ;; (:indentation <FORMS>)
    ))

;; :TODO automaticallly `untabify' the .lisp files in MON projects 
;; in the same manner as `require-final-newline'
;; write-contents-functions
;; before-save-hook
;; before-save-hook 
;; after-save-hook

;;; ==============================
;;; Fix to prevent slime-macroexpans-again from clobbering contents of current buffer.
;;; Can be removed if the buggy `slime-macroexpand-again' in slime.el is ever fixed...
;; An alternative approach would be to make `slime-macroexpand-again' non-interactive and 
;; (define-key slime-macroexpansion-minor-mode-map "g" #'(lambda () (interactive) (slime-macroexpand-again)))
;;; :SEE (URL `https://bugs.launchpad.net/slime/+bug/777405')
;;; :CREATED <Timestamp: #{2011-05-07T21:41:20-04:00Z}#{11186} - by MON KEY>
(defun slime-macroexpand-again-fix ()
  "Reperform the last macroexpansion."
  (interactive)
  (slime-eval-async slime-eval-macroexpand-expression 
    (slime-rcurry #'slime-initialize-macroexpansion-buffer 
                  ;; :WAS (current-buffer)
                  (slime-buffer-name :macroexpansion))))

;;
;; FIXME DARWUIN REENABLE after slime startup fixed
;; (eval-after-load "slime" 
;;   (fset 'slime-macroexpand-again (symbol-function 'slime-macroexpand-again-fix)))


;;; ==============================
;; :NOTES re a TAB completion style binding of `minibuffer-complete' on entry
;;        from `execute-extended-command' (e.g. M-x) to the minibuffer when
;;        (slime-current-connection) returns non-nil allowing completion of
;;        slime functions as per `slime-complete-symbol'.
;; 
;; - hook into the minibuffer setup for `execute-extended-command' 
;;
;; - make a sparse keymap `slime-minibuffer-complete-map' from
;;   `minibuffer-local-completion-map'/`minibuffer-local-map'
;;
;; - define a function `slime-minibuffer-complete-for-execute-extended-command'
;;   which checks value of `slime-current-connection' which if non-nil:
;;    will evaluate `slime-complete-symbol' (cf slime-complete-symbol-function)
;;    else defaults to `minibuffer-complete'
;;
;; - Bind <S-tab>, <backtab>, <S-iso-lefttab> to
;;   `slime-minibuffer-complete-for-execute-extended-command'
;;
;; - Use value of `slime-minibuffer-history' as history
;;
;; - On exit leaves existing bindinding of TAB to `minibuffer-complete' intact.
;;
;; Probably requires messing around with either or both `minibuffer-setup-hook'
;; and `minibuffer-with-setup-hook'
;;
;; (defun slime-minibuffer-complete-for-execute-extended-command ()
;;   (or 
;;    (and (slime-current-connection) (slime-complete-symbol)) 
;;    (minibuffer-complete)))
;;
;; (dolist (smcm (list (kbd "<S-iso-lefttab>") (kbd "<S-tab>") (kbd "<backtab>")))
;;   (define-key slime-minibuffer-complete-map smcm
;;     'slime-minibuffer-complete-for-execute-extended-command))
;; 
;;; ==============================

;;; ==============================
;;; :CREATED <Timestamp: #{2011-02-11T19:07:56-05:00Z}#{11065} - by MON KEY>
;;; ,----
;;; | When source buffer is not displaying on a visible window, `sldb-show-source' is
;;; | not able to `slime-highlight-sexp' because `slime-flash-region' does not delay
;;; | long enough for the window to be raised.
;;; | 
;;; | Following patch modifies `slime-highlight-sexp' by adding a new local variable
;;; | `flash-delay` which checks if the source buffer's window is window-live-p and
;;; | adjusts to run-with-timer for a longer period if not.
;;; `---- 
;;; :SEE (URL `https://bugs.launchpad.net/slime/+bug/717390')
;;
;; :NOTE This can be removed if/when the above is accounted for in SLIME.
(defun slime-highlight-sexp (&optional start end)
  "Highlight the first sexp after point."
  (let ((start (or start (point)))
	(end (or end (save-excursion (ignore-errors (forward-sexp)) (point))))
        (flash-delay (if (window-live-p (get-buffer-window (current-buffer))) 0.2 0.4)))
    (slime-flash-region start end flash-delay)))

;;; ==============================
;;; :NOTE (where-is 'slime-selector)
;;;       `slime-selector-other-window'
;; This doesn't really work correctly b/c the *slime-inspector* may be empty and
;; we can corrupt its stack.
;;
;; http://paste.lisp.org/+2K1B
;; Rebinds "i" to select the "*slime-inspector*" 
;; (def-slime-selector-method ?i
;;   "*slime-inspector* buffer."
;;   (or (and (slime-connected-p)
;;            (or 
;;             (and (slime-inspector-visible-p)
;;                  (switch-to-buffer (slime-inspector-buffer) t)
;;                  (or (and (= (point-min) (point-max))
;;                           (progn 
;;                             (slime-inspector-pop)
;;                             (and (null slime-inspector-mark-stack)
;;                                  (slime-inspector-next)
;;                                  t)
;;                             (current-buffer)))
;;                      (current-buffer)))
;;             (and (get-buffer (slime-buffer-name :inspector))
;;                  (switch-to-buffer-other-window (slime-buffer-name :inspector) t)
;;                  (or (and (= (point-min) (point-max))
;;                           (progn 
;;                             (slime-inspector-pop)
;;                             (and (null slime-inspector-mark-stack)
;;                                  (slime-inspector-next)
;;                                  t)
;;                             (current-buffer)))
;;                      (current-buffer)))
;;             (slime-inspector-buffer)))
;;       (mon-format :w-fun #'error
;;                   :w-spec '(":FUNCTION "
;;                             "but not `slime-connected-p'"))))
;;; ==============================
;; (def-slime-selector-method ?i
;;   "*slime-inspector* buffer."
;;   (or (and (slime-connected-p)
;;            (or 
;;             (and (slime-inspector-visible-p)
;;                  (or (with-current-buffer (slime-buffer-name :inspector)
;;                        (and (or (null slime-inspector-mark-stack)
;;                                 (= (point-min) (point-max)))
;;                             (progn (slime-inspect "nil") t)
;;                             (current-buffer)))
;;                      (switch-to-buffer (slime-buffer-name :inspector))))
;;             (and (get-buffer (slime-buffer-name :inspector))
;;                  (or (and (with-current-buffer (slime-buffer-name :inspector)
;;                             (and (or (null slime-inspector-mark-stack)
;;                                      (= (point-min) (point-max)))
;;                                  (progn (slime-inspect "nil") t)
;;                                  (current-buffer))))
;;                      (switch-to-buffer-other-window (slime-buffer-name :inspector))))
;;             (slime-inspector-buffer)))
;;       (mon-format :w-fun #'error
;;                   :w-spec '(":FUNCTION "
;;                             "but not `slime-connected-p'"))))
;;; ==============================
;;
;; (with-no-warnings
;;   (def-slime-selector-method ?I
;;     "*inferior-lisp* buffer."
;;     (cond ((and (slime-connected-p) (slime-process))
;;            (process-buffer (slime-process)))
;;           (t
;;            "*inferior-lisp*"))))
;;
;; (add-hook 'slime-inspector-mode-hook 'mon-keybind-slime-inspector)


(defun mon-clouseau-inspect (string)
  "Tell SLIME to use Clouseau for inspecting objects
Clouseau is an graphical inspector for Common Lisp. SLIME’s built-in inspector
is great, but Clouseau is better \(If you doubt it, try inspecting a complex number\).\n
With this tweak, invoking the inspector will open a new window with the graphical inspector.\n
If there is already a window with the graphical inspector, the existing window is reused.\n
:NOTE For this code to work, you also need to have Clouseau loaded it your
Common Lisp image. This can be achieved either by putting following into the
startup file of your Common Lisp implementation, or by integrating Clouseau into
a core file:\n
 \(ql:quickload \"clouseau\"\)\n
:SEE https://github.com/marcoheisig/common-lisp-tweaks \n
:SEE-ALSO `slime-list-threads',`slime-inspect'..\n▶▶▶"
  (interactive (list 
                (slime-read-from-minibuffer "Inspect value (evaluated): " (slime-sexp-at-point))))                                            
  (let ((inspector 'cl-user::*clouseau-inspector*))
    (slime-eval-async
        `(cl:progn
          (cl:defvar ,inspector nil)
          ;; (Re)start the inspector if necessary.
          (cl:unless (cl:and (clim:application-frame-p ,inspector)
                             (clim-internals::frame-process ,inspector))
                     (cl:setf ,inspector (cl:nth-value 1 (clouseau:inspect nil :new-process t))))
          ;; Tell the inspector to visualize the correct datum.
          (cl:setf (clouseau:root-object ,inspector :run-hook-p t)
                   (cl:eval (cl:read-from-string ,string)))
          ;; Return nothing.
          (cl:values)))))

;; (define-key slime-prefix-map (kbd "C-c i") 'mon-clouseau-inspect)
;;; 
;;; ==============================
;;; :CREATED <Timestamp: #{2011-02-10T13:17:55-05:00Z}#{11064} - by MON KEY>
(defun mon-slime-compile-defun-for-debug ()
  "Like `slime-compile-defun' but with (debug 3).\n
:EXAMPLE\n\n
:ALIASED-BY `slime-compile-defun-for-debug'.\n
:SEE-ALSO `slime-compute-policy'.\n▶▶▶"
  (interactive)
  (slime-compile-defun 3))

;;; ==============================
;;; :NOTE Slime CHANGELOG indicate that slime-insert-arglist was a slime
;;; function until circa 2005-02-20:
;; ,----
;; | Supersede the command slime-insert-arglist with the new command
;; | slime-complete-form and bind it to C-c C-s.  The command completes
;; | an incomplete form with a template for the missing arguments.
;; | There is special code for discovering extra keywords of generic
;; | functions and for handling make-instance.
;; `----
;;; :CREATED <Timestamp: #{2011-01-12T13:06:20-05:00Z}#{11023} - by MON KEY>
(defun mon-insert-slime-arglist ()
  "Insert a commented operator signature at beginning of previous line.\n
Insertion is as per `slime-operator-before-point' unless return value of
`slime-retrieve-arglist' is `:not-available`, in which case do nothing
successfully.\n
Does not move point.\n
:EXAMPLE\n
When invoked with point positioned after a Common Lisp operator as follows:
   (subseq
   ^^^^^^^^! <- point
Return value is:
;; (subseq sequence start &optional end)
   (subseq
   ^^^^^^^^! <- point

:NOTE Assumes an active slime connection and \(featurep 'slime-autodoc\) non-nil.\n
:ALIASED-BY `mon-slime-insert-arglist'\n
:SEE-ALSO `slime-complete-form'.\n▶▶▶"
  (interactive)
  (let ((got-sym 
       (save-match-data
	 (slime-retrieve-arglist (slime-operator-before-point)))))
  (unless (eq got-sym :not-available)
    (save-excursion
      (forward-line 0) 
    (insert ";; " got-sym "\n")))))

(defun %slime-insert-integer-at-point (return-str)
  (save-excursion (insert ";; " return-str)))

(defun slime-insert-integer-at-point (integer)
  ;; (slime-insert-integer-at-point 88)
  ;; => 88 (7 bits, #x58, #o130, #b1011000)
  ;; 
  ;; :NOTE following is the relevant format spec integers given
  ;; SWANK::FORMAT-VALUES-FOR-ECHO-AREA
  ;;  (format nil "A~D (~a bit~:p, #x~X, #o~O, #b~B)" 
  ;;            ";; => "
  ;;            integer (integer-length integer) integer integer integer)
  (interactive "Nnumber: ")
  (if (and (wholenump integer) 
           (setq integer (list integer)))
      (slime-eval-async `(swank::format-values-for-echo-area ',integer) '%slime-insert-integer-at-point)
    (minibuffer-message "arg INTEGER not `wholenump', got: %S type-of: %S"
                        integer 
                        (type-of integer))))


;;; ==============================
;;; :TODO When `IS-MON-SYSTEM-P' bound by `mon-keybind-slime' on the `slime-mode-hook'.\n
;;; :CREATED <Timestamp: #{2010-09-29T13:18:37-04:00Z}#{10393} - by MON KEY>
(defun mon-next-xref-slime ()
  "Invoke `slime-goto-next-xref' and move forward to next slime-xref.\n
:ALIASED-BY `slime-next-xref'.\n
:SEE-ALSO `mon-prev-xref-slime', `slime-xref-last-buffer',
`slime-next-location', `slime-xref-next-line', `slime-next-location-function',
`slime-xref-show-location', `slime-show-xref-buffer', `slime-show-xrefs',
`slime-insert-xrefs', `slime-with-xref-buffer', `slime-xref-last-buffer',
`slime-xref-mode', `slime-xref-mode-map'.\n▶▶▶"
  (interactive)
  (slime-goto-next-xref))

;;; ==============================
;;; :TODO When `IS-MON-SYSTEM-P' bound by `mon-keybind-slime' on the `slime-mode-hook'.\n
;;; :CREATED <Timestamp: #{2010-09-29T13:18:35-04:00Z}#{10393} - by MON KEY>
(defun mon-prev-xref-slime ()
  "Invoke `slime-goto-next-xref' and move backward to prev slime-xref.\n
:ALIASED-BY `slime-prev-xref'.\n
:SEE-ALSO `mon-next-xref-slime', `slime-xref-last-buffer',
`slime-prev-location', `slime-xref-prev-line',
`slime-previous-location-function', `slime-xref-show-location',
`slime-show-xref-buffer', `slime-show-xrefs', `slime-insert-xrefs',
`slime-with-xref-buffer', `slime-xref-last-buffer', `slime-xref-mode',
`slime-xref-mode-map'.\n▶▶▶"
  (interactive)
  (slime-goto-next-xref t))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-10-01T21:07:38-04:00Z}#{10395} - by MON KEY>
(defun mon-quit-slime-description-window ()
  "If buffer \"*slime-description*\" is active and displayed then quit-window.\n
:ALIASED-BY `mon-slime-quit-description'\n
:SEE-ALSO `mon-next-xref-slime', `mon-prev-xref-slime',
`slime-with-popup-buffer', `slime-make-popup-buffer', `slime-init-popup-buffer',
`slime-display-popup-buffer', `slime-popup-buffer-mode',
`slime-popup-buffer-quit-function', `slime-popup-restore-data', `window-buffer',
`selected-window'.\n▶▶▶"
  (interactive)
  ;; (let ((slm-dscr (get-buffer (slime-buffer-name :description))))
  ;;   (if (and slm-dscr (eq (current-buffer) slm-dscr))
  ;;       ;; (or (slime-popup-buffer-quit t) (quit-window))
  ;;       (quit-window)
  ;;     (when (and slm-dscr (buffer-live-p slm-dscr)
  ;;                (get-buffer-window slm-dscr 'visible))
  ;;       (with-selected-window (get-buffer-window slm-dscr 'visible)
  ;;         ;; (or (slime-popup-buffer-quit t) (quit-window))
  ;;         (quit-window)
  ;;         )))))
  (slime-popup-buffer-quit t))


;;; ==============================
;;: :SEE (URL `http://common-lisp.net/pipermail/slime-devel/2011-March/thread.html#17984')
;;; :CREATED <Timestamp: #{2011-03-10T13:33:08-05:00Z}#{11104} - by MON KEY>
(defun mon-slime-description-view-source-file ()
  "Find source file referenced in *slime-description* buffer.\n
:EXAMPLE\n\n
:ALIASED-BY `slime-description-view-source-file'
:SEE-ALSO `mon-slime-description-view-source-file',
`mon-slime-setup-show-description-buffer-locals', `mon-slime-show-description',
`*slime-show-description-hook*'.\n▶▶▶"
  (interactive)
  (when (string-equal (buffer-name (current-buffer)) 
                      (slime-buffer-name :description))
    (let (if-matched)
      (save-excursion 
        (goto-char (point-min))
        (and 
         (search-forward-regexp "^[[:blank:]]*?Source file: \\(/.*\\)$" nil t)
         (setq if-matched (match-string 1))))
      (and if-matched
           (not (or (null (file-name-extension if-matched))
                    (member (file-name-extension if-matched) '("fasl" "fsl"))
                    (string-match-p "^/t.?mp" if-matched)))
           (file-exists-p if-matched)
           (view-file-other-window if-matched)))))

;;; ==============================
;;
;; Following call `slime-eval-describe' when generating/entering the 
;; "*slime description*" buffer:
;;  `slime-describe-function' `slime-describe-symbol' 
;;  `slime-documentation' `slime-disassemble-symbol'
;;
;; The call chain has this general form:
;;
;; `slime-eval-describe'
;;  `-> `slime-show-description'
;;       `-> `slime-with-popup-buffer'
;;            `-> `slime-make-popup-buffer'
;; 
;;  :NOTE `slime-make-popup-buffer' has a `kill-all-local-variables'
;;
;;; ==============================
;;
;; We add a new hook variable `*slime-show-description-hook*'
;; Functions added to this hook will automatically be made buffer-local on
;; entry to *slime description*, IOW there is likely little efficacy in
;; passing a non-nil value for `add-hook's LOCAL arg e.g.:
;;  (add-hook '*slime-show-description-hook* '<MY-FOO> t t)
;;
(defvar *slime-show-description-hook* nil)

(defvar *slime-local-show-description-hook* nil)
;;
;; We add a new function which sets some buffer local variables on entry to the
;; *slime description* buffer
(defun mon-slime-setup-show-description-buffer-locals ()
  (when (get-buffer (slime-buffer-name :description))
    (with-current-buffer (get-buffer (slime-buffer-name :description))
      (set (make-local-variable '*slime-local-show-description-hook*) '*slime-show-description-hook*)
      (run-hooks (buffer-local-value '*slime-local-show-description-hook* (current-buffer))))))
;;
;; We redefine `slime-show-description' by adding a call to
;; `slime-setup-show-description-buffer-locals' after `slime-with-popup-buffer'
;; Note, this must happen _after_ `slime-with-popup-buffer'.
;; We local bind the `slime-description-view-source-file' command 
;;  -  I prefer C-c C-f for its mnemomoic congruence with C-x C-f 
(defun mon-slime-show-description (string package)
  (let ((bufname (slime-buffer-name :description)))
    (slime-with-popup-buffer (bufname :package package
                                      :connection t
                                      :select slime-description-autofocus)
      (princ string)
      (goto-char (point-min)))
    ;; Additions begin here.
    ;; Note, functions run on the hook will need to recognize `buffer-read-only'
    ;; if they intend modfifying the *slime description* buffer contents...
    (with-current-buffer (get-buffer bufname)
      (mon-slime-setup-show-description-buffer-locals))))
;;
;; FIXME DARWIN reenable once we've debugged the slime startup
;;
;; (eval-after-load "slime"
;;   (fset 'slime-show-description (symbol-function 'mon-slime-show-description)))
;;
;; This can't be in mon-keybindings or `mon-slime-setup-init' because the
;; redefinition of `slime-show-description' hasn't occured yet.
;;
;; FIXME DARWIN reenable once we've debugged the slime startup
;; (add-hook '*slime-show-description-hook*
;;           (function (lambda () (local-set-key "\C-c\C-f"  'mon-slime-description-view-source-file))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-01-22T13:45:15-05:00Z}#{11036} - by MON KEY>
(defun mon-slime-copy-presentation-at-point-to-kill-ring-no-propso (point)
"Like `slime-copy-presentation-at-point-to-kill-ring' but discards text-properties.\n
:EXAMPLE\n\n
:ALIASED-BY `slime-copy-presentation-at-point-to-kill-ring-no-props'\n
:SEE-ALSO `mon-slime-copy-presentation-to-kill-ring-no-props'.\n▶▶▶"
  (interactive "d")
  ;; (multiple-value-bind (presentation start end)
  (cl-multiple-value-bind (presentation start end) 
      (slime-presentation-around-or-before-point-or-error point)
    (mon-slime-copy-presentation-to-kill-ring-no-props presentation start end (current-buffer))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-01-22T13:45:19-05:00Z}#{11036} - by MON KEY>
(defun mon-slime-copy-presentation-to-kill-ring-no-props (presentation start end buffer)
  "Like `slime-copy-presentation-to-kill-ring' but discards text-properties.\n
:EXAMPLE\n\n
:ALIASED-BY `slime-copy-presentation-to-kill-ring-no-props'
:SEE-ALSO `mon-slime-copy-presentation-at-point-to-kill-ring-no-props'.\n▶▶▶"
  (let ((presentation-text 
           (with-current-buffer buffer
             (buffer-substring-no-properties start end))))
    (kill-new presentation-text)
    (message "Saved presentation \"%s\" to kill ring" presentation-text)))


(declare-function mon-file-truename-p          "mon-dir-utils"   t t)
(declare-function mon-file-non-existent-ERROR  "mon-error-utils" t t)
(declare-function mon-message                  "mon-error-utils" t t)

;;; ==============================
;;; :CREATED <Timestamp: #{2011-01-18T13:56:13-05:00Z}#{11032} - by MON KEY>
(defun mon-slime-start-sbcl (&optional core-file)
  "Start a fresh SBCL as if by `slime-start'.\n
Optional arg core-file names an SBCL <FILENAME>.core to initialize.\n
Signal an error if it does not satisfy `mon-file-truename-p'.\n
When `slime-connected-p' is non-nil and `slime-connection-name' returns \"sbcl\"
this command will message it refusal to initialize a new SBCL and instead return
a list of details about the state of `slime-current-connection'.\n
This command locates the SBCL binary as if by `executable-find'. When one is
found it then expands paths relative to the binary but does not traverse outside
the local paths file tree. IOW, if SBCL is installed locally to <SBCL-PATH>, the
sequence of traversal is as follows:\n
 <SBCL-PATH>/bin/sbcl
 <SBCL-PATH>
 <SBCL-PATH>/lib/sbcl/sbcl.core | <PATH-TO>/<FILENAME>.core\n
If any of these paths do not satisfy `mon-file-truename-p' an error is
signalled. IOW, if your SBCL is installed to \"/usr/local/bin/sbcl\" and doesn't
symlink to some other path you loose.\n
:EXAMPLE\n\n\(mon-slime-start-sbcl\)\n
;; Following fails successfully:
 \(mon-slime-start-sbcl \"/some-nonexistent-core/sbcl-not.core\"\)\n
:NOTE When `IS-MON-P-GNU', the most current SBCL is likely built from sources
and its truename is to a local non-standard pathname. This is dereferenced via a
symlink from the otherwise standard SBCL install location.\n
:NOTE SBCL's cl-user package has the following inherited symbols:\n
 `*core-pathname*' `*runtime-pathname*'\n
CL-USER> \(find-symbol \"*CORE-PATHNAME*\" \)
         ;=> *CORE-PATHNAME*, :INHERITED\n
CL-USER> \(find-symbol \"*RUNTIME-PATHNAME*\"\)
         ;=> *RUNTIME-PATHNAME*, :INHERITED\n
:SEE-ALSO `mon-set-lisp-init', `mon-keybind-slime', `mon-help-CL-slime-keys',
`slime-cheat-sheet', `mon-slime-setup-init',
`mon-keybind-lisp-interaction-mode', `mon-keybind-emacs-lisp-mode',
`slime-setup-contribs', `slime-load-contribs', `slime-required-modules'.\n▶▶▶"
  (let* ((sbcl-exec (file-truename (or (executable-find "sbcl") "/SOME-NON-EXISTENT-FILE")))
         (sbcl-exec (or (mon-file-truename-p  sbcl-exec) 
                        (mon-file-non-existent-ERROR :w-error  t
                                                     :fun-name "mon-slime-start-sbcl" 
                                                     :locus    "sbcl-exec \(local-var\)" 
                                                     :got-val  sbcl-exec)))
         (sbcl-dir  (file-truename (expand-file-name  "../" (file-name-directory sbcl-exec))))
         (sbcl-dir  (or (mon-file-truename-p sbcl-dir)
                        (mon-file-non-existent-ERROR :w-error  t
                                                     :fun-name "mon-slime-start-sbcl" 
                                                     :locus    "sbcl-dir \(local-var\)"
                                                     :got-val  sbcl-dir)))
         (sbcl-core (or (and core-file (file-truename core-file))
                        (file-truename (expand-file-name  "lib/sbcl/sbcl.core" sbcl-dir))))
         ;; (executable-find "sbcl")


         (sbcl-core (or (mon-file-truename-p sbcl-core)
                        (mon-file-non-existent-ERROR :w-error  t
                                                     :fun-name "mon-slime-start-sbcl"
                                                     :locus    (or (and core-file "core-file")
                                                                   "sbcl-core \(local-var\)")
                                                     :got-val sbcl-core))))
    ;; :DEBUGGING 
    ;; (mon-pairlis `(#::SBCL-EXEC #::SBCL-DIR #::SBCL-CORE)
    ;;                          (list sbcl-exec sbcl-dir sbcl-core))))
    (or (and (slime-connected-p)
             (string= (slime-connection-name) "sbcl")
             (let ((slc (slime-current-connection)))
               (mon-message :msg-spec '(":FUNCTION `mon-slime-start-sbcl' "
                                        "-- `slime-connected-p' returned non-nil, "
                                        "not invoking `slime-start'"))
               (sit-for 2)
               `(#::LISP-CURRENT   ,slc
                 #::LISP-NAME      ,(slime-connection-name)
                 #::LISP-PROGRAM   ,(slime-lisp-implementation-program)
                 #::LISP-PORT-NUM  ,(slime-connection-port slc)
                 #::LISP-CONXION   ,(slime-connection-number slc)
                 #::LISP-PROCESS   ,(slime-process )
                 #::LISP-PROCESSES ,slime-net-processes)))
        (slime-start :program sbcl-exec 
                     :program-args (list "--core" sbcl-core) ;; "--dynamic-space-size" "<NNN>M"
                   ;; :env (list (concat "SBCL_HOME=" sbcl-dir))))
                   ))))

;;; ==============================
;; ,----
;; | :PASTE-NUMBER 123730
;; | :PASTE-TITLE "my swank setting"
;; | :PASTE-BY 	pjb
;; | :PASTE-DATE 2011-08-02
;; | :PASTE-URL (URL `http://paste.lisp.org/+2NGY')
;; | :PASTE-CHANNEL	#lisp
;; | 
;; |  (let ((bindings '((*PRINT-PRETTY* . nil)
;; |                    (*PRINT-LEVEL* . nil)
;; |                    (*PRINT-LENGTH* . nil)
;; |                    (*PRINT-CIRCLE* . T)
;; |                    (*PRINT-READABLY*)
;; |                    (*PRINT-GENSYM* . T)
;; |                    (*PRINT-BASE* . 10.)
;; |                    (*PRINT-RADIX* . nil)
;; |                    (*PRINT-ARRAY* . T)
;; |                    (*PRINT-LINES* . nil)
;; |                    (*PRINT-ESCAPE* . T)
;; |                    (*PRINT-RIGHT-MARGIN* . 1000)
;; |                    (*SLDB-BITVECTOR-LENGTH* . nil)
;; |                    (*SLDB-STRING-LENGTH* . nil)))
;; |        (variables '(SWANK:*MACROEXPAND-PRINTER-BINDINGS*
;; |                     SWANK::*INSPECTOR-VERBOSE-PRINTER-BINDINGS*
;; |                     SWANK::*INSPECTOR-PRINTER-BINDINGS*
;; |                     SWANK:*BACKTRACE-PRINTER-BINDINGS*
;; |                     SWANK:*SLDB-PRINTER-BINDINGS*)))
;; |    (dolist (var variables)
;; |      (set var bindings)))
;; `----
;;; ==============================


;; (defun slime-process-attributes ()
;;   (let ((sip (slime-inferior-process)))
;;     (and sip 
;;          (setq sip (process-id sip))
;;          (setq sip (process-attributes sip))
;;          )))




;;; ==============================
;; :NOTE Various forms for getting at QL dist/system info:
;;
;; (ql-dist::system-index (car (ql-dist:enabled-dists)))
;; (ql-dist:provided-systems (car (ql-dist:enabled-dists)))
;; (slime-eval-async '(swank:init-inspector "(ql-dist::system-index (car (ql-dist:enabled-dists)))") 'slime-open-inspector)
;; (slime-eval-async '(swank:init-inspector "(ql-dist:provided-systems (car (ql-dist:enabled-dists)))") 'slime-open-inspector)
;; (slime-eval-async '(swank:init-inspector "(car (ql-dist:provided-systems (car (ql-dist:enabled-dists))))") 'slime-open-inspector)
;; (ql-dist::system-index (car (ql-dist:enabled-dists)))
;; (describe (ql-dist:find-system "zs3"))
;;
;;; ==============================



;;; ==============================
;;; :SWANK-SIDE
;;; :FILE (substitute-env-vars "$CL_MON_CODE/mon-slime-extend/slime-quicklisp-inspect.lisp")
;;; ==============================
;;
;; (in-package #:swank)
;;
;; (defslimefun hash-ql-systems ()
;;   (loop 
;;      with sys-idx = (ql-dist::system-index (car (ql-dist:enabled-dists)))
;;      with sz = (1+ (hash-table-count sys-idx))
;;      for sys-key being each hash-key of sys-idx
;;      for sys-val being each hash-value of sys-idx
;;      nconcing (list sys-key (format nil "~S" sys-val)) into for-emacs
;;      finally (return (format nil "#s(hash-table test equal size ~D data ~S)" sz for-emacs))))
;;
;; (defslimefun hash-ql-systems-count ()
;;   (hash-table-count (ql-dist::system-index (car (ql-dist:enabled-dists)))))
;;
;;; ==============================

;;; ==============================
;;; :NOTE this was brought in from :FILE slime-quicklisp-inspect.el
;;; :CREATED <Timestamp: #{2024-03-11T14:54:55-04:00Z}#{24111} - by MON KEY>
(defgroup slime-quicklisp-inspect nil
  "Shortcuts for Quicklisp inspection.
:SEE-ALSO `mon-base', `mon-xrefs', `mon-macs', `mon-dir-locals', `mon-error-warn',
`mon-regexp-symbols', `mon-dir-utils', `mon-line-utils', `mon-seq-utils',
`mon-plist-utils', `mon-string-utils', `mon-insertion-utils',
`mon-replacement-utils', `mon-buffer-utils', `mon-window-utils',
`mon-button-utils', `mon-type-utils', `mon-type-utils-vars', `mon-image-utils',
`mon-bzr-utils', `mon-env-proc-utils', `mon-testme-utils', `mon-error-utils',
`mon-url-utils', `mon-boxcutter'.\n▶▶▶"
  ;; :prefix "slime-quicklisp-"
  :group 'slime)

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-05T15:20:21-04:00Z}#{11142} - by MON KEY>
(defvar *slime-quicklisp-systems* nil
  "A hash-table of quiklisp system names and the unreadable objects they map to.\n
Contents of hash generated with `slime-make-quicklisp-completion-table'.\n
:EXAMPLE\n\n\(gethash \"cl-ppcre\" *slime-quicklisp-systems*\)\n
\(hash-table-p *slime-quicklisp-systems*\)\n
\(hash-table-count *slime-quicklisp-systems*\)\n
\(hash-table-size *slime-quicklisp-systems*\)\n
\(hash-table-test *slime-quicklisp-systems*\)\n
:SEE-ALSO `slime-get-quicklisp-completions', `slime-inspect-quicklisp-system'.\n▶▶▶")

;;; ==============================
;; (eval-when (compile load)
;;   (slime-quicklisp-completion-table-put-hash-meta))
;; (progn (setq *slime-quicklisp-systems* nil) (setplist '*slime-quicklisp-systems* nil))

;; Consider evaluating early in an init to guarantee initialization of the
;; variable's plist:
;;  (slime-quicklisp-completion-table-put-hash-meta))

;; auto-init-on-connect
;; (add-hook 'slime-connected-hook 
;;           (function (lambda () (slime-make-quicklisp-completion-table))) t)


;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-05T15:19:57-04:00Z}#{11142} - by MON KEY>
(defun slime-make-quicklisp-completion-table (&optional force-rehash)
  "Read a return value of `slime-eval' and set the Elisp friendly hash-table
structure returned to hash-table at global variable `*slime-quicklisp-systems*'.\n
When optional arg FORCE-REHASH is non-nil clear the existing hash-table in
`*slime-quicklisp-systems*' (in any) and rehash.\n
:EXAMPLE\n
\(and \(slime-connected-p\) 
     \(slime-make-quicklisp-completion-table\)\)\n
\(slime-quicklisp-completion-table-get-hash-meta\)
 => \(:hash-table-count 1182 :hashed-last \(19868 54896 556409\)\)\n
\(slime-make-quicklisp-completion-table t\)
 {... big hashy thing here ...}\n
\(slime-quicklisp-completion-table-get-hash-meta\)
 => \(:hash-table-count 1182 :hashed-last \(19868 55149 360421\)\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (when (or (and (null (slime-quicklisp-completion-table-get-hashed-last))
                 (null (slime-quicklisp-completion-table-get-hash-count)))
            (and force-rehash
                 (progn 
                   (setq *slime-quicklisp-systems* nil)
                   (setplist '*slime-quicklisp-systems* nil)
                   t)))
    (slime-quicklisp-completion-table-put-hash-meta))
  (or (and (slime-connected-p)
           (when (slime-quicklisp-completion-table-compare-hashed-last)
             ;; (case (slime-quicklisp-completion-table-compare-hash-counts)
             (cl-case (slime-quicklisp-completion-table-compare-hash-counts)
               (eq     (message "`*slime-quicklisp-systems*' hash-table counts match."))
               (rehash (setq *slime-quicklisp-systems* (read (slime-eval `(swank::hash-ql-systems)))))))
           (slime-quicklisp-completion-table-put-hash-meta)
           *slime-quicklisp-systems*)
      (message (concat ":FUNCTION `slime-make-quicklisp-completion-table' -- "
                       "Quicklisp systems not \(re\)hashed, not currently `slime-connected-p'"))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:10:03-04:00Z}#{11143} - by MON KEY>
(defun slime-quicklisp-get-process-start-time ()
  "Return two elt list contained of the process start time and its `decode-time'.\n
:EXAMPLE\n\n\(slime-quicklisp-get-process-start-time\)
=> \(\(19867 48229 842540\) \(2011 4 5 21 5 41\)\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (let ((sip (slime-inferior-process)))
    (and sip 
         (setq sip (process-id sip))
         (setq sip (process-attributes sip))
         (setq sip (assq 'start sip))
         (and sip (setq sip (cdr sip))))
    (setq sip (list sip 
                    ;; (multiple-value-bind (s min h d mon y dow  dst zn)
                    (cl-multiple-value-bind (s min h d mon y dow  dst zn)
                        (decode-time sip)
                      (list y mon d h min s))))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:09:38-04:00Z}#{11143} - by MON KEY>
(defun slime-quicklisp-completion-table-put-hash-meta ()
  "Record metadata on the plist of `*slime-quicklisp-systems*'.\n
:EXAMPLE\n\n\(slime-quicklisp-completion-table-put-hash-meta\)
=> \(:hash-table-count 1182 :hashed-last \(19868 55149 360421\)\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (if (hash-table-p *slime-quicklisp-systems*)
      (let* ((w-meta-cnt (slime-quicklisp-completion-table-get-hash-count))
             (w-curr-cnt (hash-table-count *slime-quicklisp-systems*)))
        (if (and (eq w-meta-cnt w-curr-cnt)
                 (not (and (zerop w-meta-cnt) (zerop w-curr-cnt))))
            (and (or (null (slime-quicklisp-completion-table-get-hashed-last))
                     (zerop (apply #'+ (or (slime-quicklisp-completion-table-get-hashed-last) 0))))
                 (put '*slime-quicklisp-systems* :hashed-last (current-time)))
          (progn
            (put '*slime-quicklisp-systems* :hash-table-count w-curr-cnt)
            (unless (and (zerop w-curr-cnt)
                         (zerop (apply #'+ (or (slime-quicklisp-completion-table-get-hashed-last) 0))))  
              (put '*slime-quicklisp-systems* :hashed-last (current-time))))))
    (progn 
      ;; Give `slime-quicklisp-completion-table-compare-hashed-last'
      ;; something to pivot on, e.g: (time-less-p (list 0 0 0) (current-time))
      (put '*slime-quicklisp-systems* :hashed-last (list 0 0 0))
      ;; We don't initialize a new hash-table if one doesn't exist so set 0.
      (put '*slime-quicklisp-systems* :hash-table-count 0)))
  (slime-quicklisp-completion-table-get-hash-meta))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:09:17-04:00Z}#{11143} - by MON KEY>
(defun slime-quicklisp-completion-table-get-hash-meta ()
  "Get the metadata on the plist of `*slime-quicklisp-systems*'.\n
:EXAMPLE\n\n\(slime-quicklisp-completion-table-get-hash-meta\)
=> \(:hash-table-count 1182 :hashed-last \(19868 55149 360421\)\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (let ((slqctghm-gthr '()))
    (dolist (slqctghm-D-0 '(:hashed-last :hash-table-count) slqctghm-gthr)
      (setq slqctghm-gthr 
            (nconc
             `(,slqctghm-D-0 ,(get '*slime-quicklisp-systems* slqctghm-D-0))
             slqctghm-gthr)))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:09:07-04:00Z}#{11143} - by MON KEY>
(defun slime-quicklisp-completion-table-get-hash-count ()
  "Get the :hash-table-count property on `*slime-quicklisp-systems*' plist.\n
:EXAMPLE\n\n\(slime-quicklisp-completion-table-get-hash-count\)\n=> 1182\n
:NOTE Why don't we just do (hash-table-count *slime-quicklisp-systems*)?\n
B/c there may not be a hash-table at `*slime-quicklisp-systems*' so we
check its plist instead.\n
The plist key :hash-table-count defaults to 0 if the hash-table isn't yet
initialized. Which isn't important now but if/when the interface is
extended to accomodate multiple dists it will prob. become more relevant
esp. b/c blindly re-initializing the emacs hash-table via RPC is
potentially costly.\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (plist-get (slime-quicklisp-completion-table-get-hash-meta) :hash-table-count))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:08:45-04:00Z}#{11143} - by MON KEY>
(defun slime-quicklisp-completion-table-get-hashed-last ()
  "Get the :hashed-last property on `*slime-quicklisp-systems*' plist.\n
:EXAMPLE\n\n\(slime-quicklisp-completion-table-get-hashed-last\)\n=> \(19868 55149 360421\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (plist-get (slime-quicklisp-completion-table-get-hash-meta) :hashed-last))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:08:33-04:00Z}#{11143} - by MON KEY>
(declare-function time-less-p "time-date" (t1 t2))
;; Or to be sure do: (eval-when-compile (require 'time-date))
(defun slime-quicklisp-completion-table-compare-hashed-last ()
  "Whether the current `slime-inferior-process' began after the most recent hash?
                hashed-last           slime process-start
 \(time-less-p '\(19868 45400 162683\) '\(19868 45401 259977\)\)

A return value of T indicates we should check if the current-process' 
return value for: 
 \(hash-table-count \(ql-dist::system-index \(car \(ql-dist:enabled-dists\)\)\)\)
is eq the `hash-table-count' of `*slime-quicklisp-systems*', if not this
indicates we should rehash, else do nothing.\n
:EXAMPLE\n\n\(slime-quicklisp-completion-table-compare-hashed-last\)\n=> <BOOLEAN>
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (and (slime-connected-p)
       (catch 'ql-hashed-zero-time
         (let* ((last-hash (slime-quicklisp-completion-table-get-hashed-last))
                (last-proc (or (and (equal (list 0 0 0) last-hash)
                                    (throw 'ql-hashed-zero-time t))
                               (car (slime-quicklisp-get-process-start-time)))))
           (when (and (eq (length last-hash) 3)
                      (eq (length last-proc) 3))
             (time-less-p last-hash last-proc))))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:08:06-04:00Z}#{11143} - by MON KEY>
;; :NOTE this requires the function swank::hash-ql-systems-count which we define in CL-MON-CODE/mon-slime-extend/swank-quicklisp-inspect.lisp 
;; :NOTE we should reference the double dotted notatiojn for swank::hash-ql-systems-count as we don't export it 
(defun slime-quicklisp-completion-table-get-ql-hash-count ()
  "Get the Quicklisp hash-table-count for current QL-DIST::SYSTEM-INDEX.\n
:EXAMPLE\n\n\(slime-quicklisp-completion-table-get-ql-hash-count\)\n=> 1182\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (slime-eval '(swank::hash-ql-systems-count)))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-06T19:07:56-04:00Z}#{11143} - by MON KEY>
(defun slime-quicklisp-completion-table-compare-hash-counts ()
"If current slime-inferior-process started after the most recent hash are
their respective hash-table-counts eq?
:EXAMPLE\n\n\(slime-quicklisp-completion-table-compare-hash-counts\)
=> { eq | rehash }\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (and (slime-connected-p)
       (let ((el-ht-cnt (slime-quicklisp-completion-table-get-hash-count))
             (ql-ht-cnt (slime-quicklisp-completion-table-get-ql-hash-count))) 
         (or (and el-ht-cnt ql-ht-cnt
                  (cond ((and (eq el-ht-cnt ql-ht-cnt) 'eq))
                        ((> ql-ht-cnt el-ht-cnt)       'rehash)))
             'rehash))))

;;; ==============================
;;; :CREATED <Timestamp: #{2011-04-05T15:25:06-04:00Z}#{11142} - by MON KEY>
(defun slime-get-quicklisp-system-completions (&optional hash-value)
  "A `completing-read' for currenlty provided quicklisp systems.\n
When optional arg HASH-VALUE is non-nil return the hash-table value associated
with quicklisp system.\n
:EXAMPLE\n\n(slime-get-quicklisp-system-completions\)\n  
\(slime-get-quicklisp-system-completions t\)\n
\(slime-eval-async 
    `\(swank:init-inspector 
      ,\(format \"%S\" `\(ql-dist:find-system ,\(slime-get-quicklisp-system-completions\)\)\)\)
  'slime-open-inspector\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*', `quicklisp-system-complete-if',
`quicklisp-hash-system-completions', `*quicklisp-systems*'
`mon-help-CL-symbols', `mon-help-CL-pkgs'.\n▶▶▶"
  (interactive)
  (if (and (not (null *slime-quicklisp-systems*))
           (hash-table-p *slime-quicklisp-systems*))
      (let ((ql-got-cmplt nil)
            (ql-sys-cmplt #'(lambda ()
                              (completing-read (concat ":FUNCTION `slime-quicklisp-system-complete' "
                                                       " -- Quicklisp system name: ")
                                               *slime-quicklisp-systems* nil t )))
            (ql-sys-cmplt-hashed #'(lambda (qsch-L-1) 
                                     (gethash qsch-L-1 *slime-quicklisp-systems*))))
        (while (null (setq ql-got-cmplt (funcall ql-sys-cmplt)))
          (setq ql-got-cmplt (funcall ql-sys-cmplt)))
        (if hash-value
            (and ql-got-cmplt (funcall ql-sys-cmplt-hashed ql-got-cmplt))
          ql-got-cmplt))
    (message (concat ":FUNCTION `slime-get-quicklisp-system-completions' -- "
                     "global variable `*slime-quicklisp-systems*' "
                     "either null or not `hash-table-p'"))))


;;; ==============================
;; :PASTE-NUMBER 121190
;; :PASTE-TITLE slime-inspect-quicklisp-system now functional
;; :PASTED-BY 	mon_key
;; :PASTE-CHANNEL	#lisp
;; :PASTE-TIME 2011-04-05
;; :PASTE-URL (URL `http://paste.lisp.org/display/121190')
;;; ==============================
;;; ==============================
;;; :NOTE Directly inpsecting the hash-table value returned from doesn't work
;;; e.g. with: (slime-get-quicklisp-system-completions t)
;;; This sucks b/c we do have ahold of the unreadable object that the system
;;; string maps to. It would save us having to do a ql-dist:find-system when
;;; we already have its identity esp. where that isn't likely to change in a
;;; given session :(
;;; IWBN to figure out how to pass slime/swank the unreadable object in
;;; emacs' hash-table at `*slime-quicklisp-systems*', e.g. the "#< ... >" reader
;;; syntax signals an error:
;;;
;;;  (slime-eval-async 
;;;   `(swank:init-inspector \"#<QL-DIST:SYSTEM zs3 / zs3-1.1.4 / quicklisp 2011-03-20>\") 
;;;  'slime-open-inspector)
;;;
;;; :CREATED <Timestamp: #{2011-04-05T15:24:40-04:00Z}#{11142} - by MON KEY>
(defun slime-inspect-quicklisp-system ()
  "Inspect a specific Quicklisp system.\n
:EXAMPLE\n\n\(slime-inspect-quicklisp-system\)\n
:SEE-ALSO `slime-inspect-quicklisp-system',
`slime-get-quicklisp-system-completions',
`slime-make-quicklisp-completion-table',
`slime-quicklisp-get-process-start-time',
`slime-quicklisp-completion-table-put-hash-meta',
`slime-quicklisp-completion-table-get-hash-meta',
`slime-quicklisp-completion-table-get-hash-count',
`slime-quicklisp-completion-table-get-hashed-last',
`slime-quicklisp-completion-table-compare-hashed-last',
`slime-quicklisp-completion-table-get-ql-hash-count',
`slime-quicklisp-completion-table-compare-hash-counts',
`*slime-quicklisp-systems*'.\n▶▶▶"
  (interactive)
  (if  (slime-connected-p)
      (let ((inspect-if (slime-get-quicklisp-system-completions)))
        (and inspect-if 
             ;; (prog1 inspect-if
             ;; (setq inspect-if (format "%S" `(ql-dist:find-system ,inspect-if)))
             ;; => "(ql-dist:find-system \"yason\")"
             ;; (slime-eval-async `(swank:init-inspector ,inspect-if) 'slime-open-inspector))))
             (slime-eval-async `(swank::find-ql-system ,inspect-if)    'slime-quicklisp-open-inspector-if)))
    (message (concat ":FUNCTION `slime-inspect-quicklisp-system' -- "
                     "not currently `slime-connected-p'"))))


(defun slime-inspect-quicklisp-systems ()
  "Inspect all QuickLisp SYSTEMS.\n
:EXAMPLE\n\n\(slime-inspect-quicklisp-systems\)\n
:SEE-ALSO `slime-inspect-asdf-system', `slime-inspect-quicklisp-dists-all',
`slime-inspect-enabled-dists-enabled', `slime-inspect-quicklisp-systems',
`slime-inspect', `slime-inspect-presentation', `slime-inspect-definition'.\n▶▶▶"
  (interactive)
  (slime-eval-async '(swank::init-inspector "(ql:system-list)") 'slime-open-inspector))


;; :NOTE How to look up * (last value in repl) in slime inspector -> C-c I * CR
;; (interactive "n")
(defun slime-quicklisp-open-inspector-if (inspected-parts)
  "Default callback for returning inspectable Quicklisp objects.\n
If INSPECTED-PARTS is non-nil pass them to `slime-open-inspector'.\n
If INSPECTED-PARTS is null minibuffer-message that ther is nothing to inspect.\n
:SEE-ALSO .\n▶▶▶"
  (or 
   (and inspected-parts (or (slime-open-inspector inspected-parts) t))
   (minibuffer-message "nothing to inpsect, declining to display with *slime-inspector*")))

(defun slime-inspect-quicklisp-release ()
  "Inspect a Quicklisp release.
:EXAMPLE\n\n\(slime-inspect-quicklisp-release \"yason\"\)
:SEE-ALSO .\n▶▶▶"
  (interactive)
  (if (slime-connected-p)      
      (let ((inspect-if (slime-get-quicklisp-system-completions)))
        (and inspect-if 
             ;; (prog1 
             ;;     inspect-if
             (slime-eval-async `(swank::find-ql-release ,inspect-if)    'slime-quicklisp-open-inspector-if)))
    (message (concat ":FUNCTION `slime-inspect-quicklisp-release' -- "
                     "not currently `slime-connected-p'"))))

(defun slime-inspect-quicklisp-apropos (term)
  "Inspect QUICKLISP systems matching TERM.\n
:EXAMPLE\n\n\(slime-inspect-quicklisp-apropos \"anaph\"\)
:SEE-ALSO .\n▶▶▶"
  (interactive "sQuicklisp apropos term: ")
  (if (slime-connected-p)      
      (slime-eval-async `(swank::apropos-ql-system ,term)    'slime-quicklisp-open-inspector-if)
    (message (concat ":FUNCTION `slime-inspect-quicklisp-release' -- "
                     "not currently `slime-connected-p'"))))


;;; ==============================
;;; :PASTED (URL `http://paste.lisp.org/display/121086')
;;; :CREATED <Timestamp: #{2011-04-01T13:49:17-04:00Z}#{11135} - by MON KEY>
(defun slime-inspect-asdf-defined-systems ()
  "Inspect the hash-table of ASDF::*DEFINED-SYSTEMS*.\n
:EXAMPLE\n\n
 \(slime-inspect-asdf-defined-systems\)\n
:SEE-ALSO `slime-inspect-asdf-system', `slime-inspect-quicklisp-systems',
`slime-inspect', `slime-inspect-presentation', `slime-inspect-definition'.\n▶▶▶"
  (interactive)
  (slime-eval-async '(swank::init-inspector "ASDF::*DEFINED-SYSTEMS*") 'slime-open-inspector))

;;; ==============================
;;; :PASTED (URL `http://paste.lisp.org/display/121086')
;;; :CREATED <Timestamp: #{2011-04-01T16:33:49-04:00Z}#{11135} - by MON KEY>
(defun slime-inspect-asdf-system (system-name &optional preserve-case)
  "Inspect an ASDF system with SYSTEM-NAME in *slime-inspector* buffer.\n
If SYSTEM-NAME is not found display inspector for ASDF::*DEFINED-SYSTEMS*.\n
SYSTEM-NAME is a string or symbol naming a system in the hash-table of
ASDF::*DEFINED-SYSTEMS*.\n
When optional arg PRESERVE-CASE is non-nil do not downcase SYSTEM-NAME.\n
If SYSTEM-NAME is T/NIL, or neither `stringp' nor `symbolp' signal an error.\n
:EXAMPLE\n\n \(slime-inspect-asdf-system \"cl-ppcre\"\)\n
 \(slime-inspect-asdf-system \"CL-PPCRE\" t\)\n
 \(slime-inspect-asdf-system \"not-a-system\"\)\n
:NOTE ASDF's COERCE-NAME function will CL:STRING-DOWNCASE defsystem component
entries which are keys on the ASDF::*DEFINED-SYSTEMS* hash-table. However, if
the argument to ASDF:COERCE-NAME is CL:STRINGP the string's case is preserved.\n
:SEE-ALSO `slime-inspect-asdf-defined-systems',
`slime-inspect-quicklisp-systems', `slime-inspect',
`slime-inspect-presentation', `slime-inspect-definition'.\n▶▶▶"
  (interactive "s:FUNCTION `slime-inspect-asdf-system' -- name of system to inspect: \np" )
  (setq system-name
        (or (and (stringp system-name) 
                 (or (and preserve-case system-name)
                     (downcase system-name)))
            (and (symbolp system-name) 
                 (not (eq system-name t))
                 (not (null system-name))
                 (or (and preserve-case (symbol-name system-name))
                     (downcase (symbol-name system-name))))
            (error "arg SYMBOL-NAME neither `stringp' nor `symbolp', got: %S" system-name)))
  (setq system-name 
        (format "%S"
                `(let ((asrp-if (asdf:system-registered-p ,system-name)))
                   (or (and asrp-if (cdr asrp-if)) ASDF::*DEFINED-SYSTEMS*))))
  (slime-eval-async `(swank::init-inspector ,system-name) 'slime-open-inspector))



;; (slime-eval-async `(swank:find-ql-system ,release)   'slime-quicklisp-open-inspector-if)
;; (slime-eval-async '(swank:find-ql-system "no-yason") 'slime-quicklisp-open-inspector-if)
;; (slime-eval-async `(swank:find-ql-release "yason")   'slime-quicklisp-open-inspector-if)

;; (and 
;; (let ((qdfs (ql-dist:find-system "yason"))) 
;;   (and qdfs (slot-boundp qdfs 'QL-DIST:RELEASE) (slot-value qdfs 'QL-DIST:RELEASE)))

;; (let ((qdfs (ql-dist:find-system "yason"))) 
;;   (and qdfs (slot-boundp qdfs 'QL-DIST:RELEASE) (slot-value qdfs 'QL-DIST:RELEASE)))

;;; ==============================
;; :WAS `slime-fancy'
;; (define-slime-contrib mon-slime-fancy
;;   "Make SLIME fancy."
;;   (:authors "Matthias Koeppe  <mkoeppe@mail.math.uni-magdeburg.de>"
;;             "Tobias C Rittweiler <tcr@freebits.de>")
;;   (:license "GPL")
;;   (:slime-dependencies slime-repl
;;                        slime-autodoc
;;                        slime-c-p-c
;;                        slime-editing-commands
;;                        slime-fancy-inspector
;;                        slime-fuzzy
;;                        slime-presentations
;;                        slime-scratch
;;                        slime-references     ;; SBCL-ONLY `slime-sbcl-manual-root'
;;                        slime-package-fu
;;                        slime-fontifying-fu)
;;
;;   (:on-load  (slime-repl-init)
;;              (slime-autodoc-init)
;;              (slime-c-p-c-init)
;;              (slime-editing-commands-init)
;;              (slime-fancy-inspector-init)
;;              (slime-fuzzy-init)
;;              (slime-presentations-init)
;;              (slime-scratch-init)
;;              (slime-references-init)
;;              (slime-package-fu-init)
;;              (slime-fontifying-fu-init)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-10-31T16:15:03-04:00Z}#{10437} - by MON>
(defvar *slime-echo-arglist-STFU* nil
  "When non-nil `slime-space' won't invoke `slime-echo-arglist' verbosely.\n
`slime-echo-arglist-behave-or-back-to-your-cage' toggles `slime-echo-arglist'
back on, and `slime-echo-arglist-STFU' shuts it up again.\n
Evaluate `slime-show-arglist' explicitly if an arglist is needed.\n
:SEE-ALSO `slime-echo-arglist-function'.\n▶▶▶")
;;
(make-variable-buffer-local '*slime-echo-arglist-STFU*)
(put '*slime-echo-arglist-STFU* 'permanent-local t)
(set-default '*slime-echo-arglist-STFU* nil)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-11-01T16:55:20-04:00Z}#{10441} - by MON KEY>
(defun slime-echo-arglist-behave-or-back-to-your-cage ()
  "De-gimpify `slime-space's and allow `slime-echo-arglist' in current-buffer.\n
Evaluate `slime-echo-arglist-STFU' to tone down the minibuffer noise.\n
:SEE ALSO `*slime-echo-arglist-STFU*', `slime-echo-arglist-function'.\n▶▶▶"
  (interactive)
  (with-current-buffer (current-buffer)
    (set (make-local-variable '*slime-echo-arglist-STFU*) nil)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-11-01T16:55:16-04:00Z}#{10441} - by MON KEY>
(defun slime-echo-arglist-STFU ()
  "Silence `slime-space's invocation of `slime-echo-arglist' in current-buffer.\n
Evaluate `slime-echo-arglist-behave-or-back-to-your-cage' to turn it back on.\n
Evaluate `slime-show-arglist' explicitly if an arglist is needed.\n
:SEE-ALSO `*slime-echo-arglist-STFU*', `slime-echo-arglist-function'.\n▶▶▶"
  (interactive)
  (with-current-buffer (current-buffer)
    (set (make-local-variable '*slime-echo-arglist-STFU*) t)))

;;; ==============================
;; Define after slime is loaded and shadow `slime-space' so we can silence
;; `slime-echo-arglist' more easily.
;; (defun slime-space (n)
;;   (interactive "p")
;;   (self-insert-command n)
;;   (when (and (not *slime-echo-arglist-STFU*) ;; <- redefined here.
;;              (slime-background-activities-enabled-p))
;;     (slime-echo-arglist)))
;;
;; (put 'slime-space 'function-documentation
;;      (mapconcat #'identity
;;                 '("Insert a space and print some relevant information (function arglist).\n"
;;                   "Designed to be bound to the SPC key.\n"
;;                   "Prefix argument can be used to insert more than one space.\n"
;;                   ":SEE-ALSO `slime-echo-arglist-STFU', `*slime-echo-arglist-STFU*',"
;;                   "`slime-echo-arglist-behave-or-back-to-your-cage', `slime-echo-arglist-function'."
;;                   "▶▶▶") "\n"))
;;; ==============================
;;; :CREATED <Timestamp: #{2010-07-14T17:41:00-04:00Z}#{10283} - by MON KEY>
;; (defun slime-auto-doc-mode-STFU ()
;;   "Make `slime-autodoc-mode' STFU. Silence his little buddy `eldoc-mode' too.\n
;; :EXAMPLE\n\n
;; :SEE-ALSO .\n▶▶▶"
;;   (interactive)
;;   (when (buffer-local-value 'slime-autodoc-mode (current-buffer))
;;     ;(set (make-local-variable  'slime-autodoc-mode) nil)
;;     ;(set (make-local-variable 'eldoc-mode) nil)))
;;; ==============================
;;; :CREATED <Timestamp: #{2010-09-29T14:08:07-04:00Z}#{10393} - by MON KEY>
;; (defun slime-autodoc-mode-first-change-hook ()
;;   (when *slime-autodoc-mode-STFU*
;;     (make-local-variable 'first-change-hook)
;;     'slime-auto-doc-mode-STFU))

;;  (add-hook 'slime-mode-hook 'slime-autodoc-mode-first-change-hook)

;;; ==============================
;; :SOURCE (URL `http://paste.lisp.org/display/120141')
;; :PASTED-BY antifuchs "my safe local variables" :DATE 2011-03-02
;;
;; (put 'package 'safe-local-variable 'symbolp)
;; (put 'Package 'safe-local-variable 'symbolp)
;; (put 'syntax 'safe-local-variable 'symbolp)
;; (put 'Syntax 'safe-local-variable 'symbolp)
;; (put 'Base 'safe-local-variable 'integerp)
;; (put 'base 'safe-local-variable 'integerp)
;; (put 'readtable 'safe-local-variable 'symbolp)
;; (put 'Readtable 'safe-local-variable 'symbolp)
;; (put 'Lowercase 'safe-local-variable 'symbolp)
;; (put 'lowercase 'safe-local-variable 'symbolp)
;; (put 'Encoding 'safe-local-variable 'symbolp)
;; (put 'encoding 'safe-local-variable 'symbolp)
;; (put 'buffer-file-coding-system 'safe-local-variable 'symbolp)
;; (put 'Buffer-file-coding-system 'safe-local-variable 'symbolp)
;;; ==============================
;; :SORUCE (URL `http://paste.lisp.org/display/120142')
;; :PASTED-BY fe[nl]ix "safe local variables" :DATE 2011-03-02
;;
;; (macrolet ((define-safe-variables (&rest vars)
;;              `(progn
;;                 ,@(mapcar (lambda (v)
;;                             (destructuring-bind (sym . type) v
;;                               `(put ',sym 'safe-local-variable ',type)))
;;                           vars))))
;;   (define-safe-variables
;;     (package . symbolp) 
;;     (Package . symbolp)
;;     (syntax . symbolp)
;;     (Syntax . symbolp)
;;     (base . integerp) 
;;     (Base . integerp)
;;     (readtable . symbolp)
;;     (Readtable . symbolp)
;;     (lowercase . symbolp)
;;     (Lowercase . symbolp)
;;     (unibyte . symbolp) 
;;     (Unibyte . symbolp)
;;     ;;(log . symbolp);;(Log . symbolp)
;;     ))
;;; ==============================

;;; ==============================
;;; :GUILE/GEISER

;;; :NOTE This can't be installed until >= Guile 1.9.12 is installed.
;;
;; :FILE geiser-install.el
;; (setq geiser-scheme-dir 
;;     (expand-file-name "geiser/scheme" *mon-site-lisp-root*))
;;
;; :FILE geiser-custom.el
;; `geiser-custom--defcustom' 
;;
;; :FILE geiser-guile.el
;; `geiser-guile-init-file' "~/.guile-geiser"
;; `define-geiser-implementation' 
;; `geiser-guile-binary'

;; 
;; (add-to-list 'load-path 
;;              (expand-file-name "company" *mon-site-lisp-root*))

;; (add-to-list 'load-path 
;;              (expand-file-name "geiser/elisp" *mon-site-lisp-root*))

;; (custom-set-variables 
;;  '(geiser-scheme-dir 
;;    (expand-file-name "geiser/scheme" *mon-site-lisp-root*))

;;  '(geiser-guile-binary (expand-file-name "guile-1.9.11/bin/guile1.9.11" (getenv "LOCAL_MON")))
;;  '(geiser-active-implementations '(guile)) ;; '(guile racket))
;;  '(geiser-default-implementation 'guile))
;;
;; (require 'company)
;; (load-library "geiser.el")
;;
;; (require 'quack) ;; NO, Don't do it!

;;; ==============================
;; :PASTE-TITLE "debug keys"
;; :PASTED-BY pjb
;; :PASTE-DATE 2012-02-13
;; :PASTE-NUMBER 127751 	
;; :PASTE-URL (URL `http://paste.lisp.org/display/127751')
;;
;; (defun make-lisp-command-sender (string)
;;   (byte-compile `(lambda ()
;;                    (interactive)
;;                    (cond
;;                      ((and (boundp 'slime-inferior-process:connlocal)
;;                            slime-inferior-process:connlocal)
;;                       (slime-repl-send-string ,(format "%s\n" string)))
;;                      ((and inferior-lisp-buffer
;;                            (inferior-lisp-proc))
;;                       (comint-send-string (inferior-lisp-proc)
;;                                           ,(format "%s\n" string)))
;;                      ((get-buffer-process (current-buffer))
;;                       (comint-send-string (get-buffer-process (current-buffer))
;;                                           ,(format "%s\n" string)))
;;                      (t (error "No process to send debugging command to."))))))
;;
;; (defun clisp-debug-keys ()
;;   "Binds locally some keys to send clisp debugger commands to the inferior-lisp
;; <f5> step into
;; <f6> next
;; <f7> step over
;; <f8> continue\n"
;;
;;   (interactive)
;;   (local-set-key (kbd "<f5>") (make-lisp-command-sender ":s"))
;;   (local-set-key (kbd "<f6>") (make-lisp-command-sender ":n"))
;;   (local-set-key (kbd "<f7>") (make-lisp-command-sender ":o"))
;;   (local-set-key (kbd "<f8>") (make-lisp-command-sender ":c"))
;;   (message "<f5> step into  <f6> next       <f7> step over  <f8> continue"))
;;
;; (defun ecl-debug-keys ()
;;   "Binds locally some keys to send clisp debugger commands to the inferior-lisp
;; <f5> step into
;; <f6> next
;; <f7> step over
;; <f8> continue\n"
;;   (interactive)
;;   (local-set-key (kbd "<f5>") (make-lisp-command-sender ""))
;;   (local-set-key (kbd "<f6>") (make-lisp-command-sender ""))
;;   (local-set-key (kbd "<f7>") (make-lisp-command-sender ":skip"))
;;   (local-set-key (kbd "<f8>") (make-lisp-command-sender ":exit"))
;;   (message "<f5> step into  <f6> next       <f7> step over  <f8> continue"))
;;
;; (defun sbcl-debug-keys ()
;;   "Binds locally some keys to send clisp debugger commands to the inferior-lisp
;; <f5> step into
;; <f6> next
;; <f7> step over
;; <f8> continue\n"
;;   (interactive)
;;   (local-set-key (kbd "<f5>") (make-lisp-command-sender "step"))
;;   (local-set-key (kbd "<f6>") (make-lisp-command-sender "next"))
;;   (local-set-key (kbd "<f7>") (make-lisp-command-sender "over"))
;;   (local-set-key (kbd "<f8>") (make-lisp-command-sender "out"))
;;   (message "<f5> step into  <f6> next       <f7> step over  <f8> continue"))
;;
;; (defun allegro-debug-keys ()
;;   "Binds locally some keys to send allegro debugger commands to the inferior-lisp
;; <f5> step into
;; <f7> step over
;; <f8> continue\n"
;;   (interactive)
;;   (local-set-key (kbd "<f5>") (make-lisp-command-sender ":scont 1"))
;;   ;; (local-set-key (kbd "<f6>") (make-lisp-command-sender ))
;;   (local-set-key (kbd "<f7>") (make-lisp-command-sender ":sover"))
;;   (local-set-key (kbd "<f8>") (make-lisp-command-sender ":continue"))
;;   (message "<f5> step into                  <f7> step over  <f8> continue"))
;;
;;; ==============================

;;; ==============================
(provide 'slime-loads-GNU-clbuild)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; mode: EMACS-LISP
;; coding: utf-8
;; End:

;;; ====================================================================
;;; slime-loads-GNU-clbuild.el ends here
;;; EOF
