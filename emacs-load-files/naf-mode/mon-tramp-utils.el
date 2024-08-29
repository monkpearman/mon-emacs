;;; mon-tramp-utils.el --- cross platform utilities for working with tramp.
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2009-2024 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-tramp-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 2009-11-19T14:05:04-05:00Z
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: external, processes, unix, environment, files,

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-tramp-utils provides cross platform utilities for working with tramp.
;; This package should be compatible with both GNU/LINUX and w32 systems.
;; I have no idea if it will work with cygwin. 
;;
;; FUNCTIONS:▶▶▶
;; `mon-tramp-plink-example', `mon-tramp-add-default-methods', 
;; `mon-tramp-putty-conf-status', `mon-tramp-add-pageant-keys',
;; `mon-ssh-add-p', `mon-tramp-connect', `mon-tramp-read-conns',
;; `mon-tramp-disconnect', `mon-tramp-su-local', `mon-tramp-syntax',
;; `mon-tramp-utils-loadtime',
;; FUNCTIONS:◀◀◀
;;
;; MACROS:
;;
;; METHODS:
;;
;; CLASSES:
;;
;; CONSTANTS:
;; `*mon-tramp-mode-line-buffer-ident*'
;;
;; FACES:
;;
;; VARIABLES:
;; `*mon-tramp-default-methods-l*', `*mon-tramp-putty-private-keys*',
;; `*mon-tramp-paths-alist*'
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
;; Following table maps three variabls which are defined in this package but
;; which source their values from a seperate file:
;; ,----
;; | `*mon-tramp-putty-private-keys*' -> `mon-pks'
;; | `*mon-tramp-paths-alist*'        -> `mon-tramp-alist'
;; | `*mon-tramp-default-methods-l*'  -> `*mon-tramp-default-methods-l*'
;; `----
;;
;; If the above symbols `mon-pks', `mon-tramp-alist', and
;; `*mon-tramp-default-methods-l*' are not present on your system they will be
;; populated with example values and these example values will be bound at load
;; time.
;;
;; In particular, this means that when this package is loaded the tramp variable
;; `tramp-default-method-alist' will have contain these examples.  These example
;; values shouldn't pose an immediate concern as I've pointed them to a google
;; IP - if google's ssh ports let you in then they deserve what they get :)
;; Regardless, if you intend to use mon-tramp-utils you will want to examine the
;; source and docstrings for these three variables and replace them with
;; parameters suitable for your system/needs. I've attempted to document the
;; required format these variables expect and the source is fairly well
;; commented. :SEE below for discussion.
;;
;; :NOTE the argument `mon-tramp-alist' to variable `*mon-tramp-paths-alist*' is
;; a symbol defined in an external package. You need to provide your own value
;; for either the variable `*mon-tramp-paths-alist*' or bind it to the
;; `mon-tramp-alist' symbol (either locally or in a separate file). In either
;; case the provided value should reflect defined in the docstring of
;; `*mon-tramp-paths-alist*'.
;;
;; :NOTE on MON systems the variable `*mon-tramp-putty-private-keys*' evaluates
;; the symbol value of `mon-pks' which is defined in an external package. The
;; current default value for `mon-pks' is: '(""). If you intend to use
;; putty/plink on w32 you will need to provide your own value for either the
;; variable `*mon-tramp-putty-private-keys*' or bind it to the `mon-pks' symbol
;; (either locally or in a separate file). In either case the provided value
;; should reflect the format defined in the docstring of
;; `*mon-tramp-putty-private-keys*'.
;;
;; :NOTE The `mon-tramp-add-default-methods' function calls the variable
;; `*mon-tramp-default-methods-l*'. On MON systems the variable
;; `*mon-tramp-default-methods-l*' evaluates the value of the
;; `*mon-tramp-default-methods-l*' symobl. The `*mon-tramp-default-methods-l*'
;; symbol is defined in an external package. You will need to provide your own
;; value for either the variable `*mon-tramp-default-methods-l*' or bind it to
;; the `*mon-tramp-default-methods-l*' symbol (either locally or in a separate
;; file). In either case the provided value should reflect the format defined in
;; docstring of `*mon-tramp-default-methods-l*'.
;;
;; :NOTE For w32 systems this package requires an environment with:
;; a) Putty, putty-agent, and plink in your path.
;;    You can test by evaluating: (mon-tramp-putty-conf-status)
;;
;; b) Putty/plink sessions saved as:
;;   i) <USERNAME>@<HOST>; 
;;  ii) With the correct port number when this is _NOT_ `22';
;;
;; c) putty-agent has the key for each given session loaded.
;;    A utility function is provided to accomodate this.
;;    :SEE `mon-tramp-add-pageant-keys'
;;
;; :NOTE For GNU/Linux this package requires an environment running ssh-agent:
;;  a) MON does this with a script sourced at login.
;;
;;  b) The ssh-agent has the keys loaded via:
;;     - SHELL> ssh-add ~/.ssh/<SOME-KEY>
;;     For GNU/Linux systems a utility is provided to test if keys are loaded:
;;     (mon-ssh-add-p) 
;;     Additionally, provided is an untested function which will 
;;     load a key via ssh-add see the commneted funcion `mon-ssh-add-pass' 
;;     at bottom of file:
;;
;; :NOTE MON systems set an environmental variable "MON_PTTY" e.g.: 
;;  (getenv "MON_PTTY")
;; This is done to make sure that putty.exe et al are in MON paths. Normally,
;; this prob. isn't required but MON does things lysdexically :) IOW if Putty
;; is installed on your system, then it is in your path already and prob. also
;; has its own environmental variable set.
;;
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; `pushnew' <- `cl'
;;
;; `tramp'
;;
;; `IS-MON-P-W32' `IS-MON-P-GNU' <- `mon-default-loads.el' (if in load-path)
;; (featurep 'mon-default-loads)
;;
;; putty, plink, pageant, puttygen executables (on W32)
;;
;; ssh-agent, ssh-add, ssh ssh-keygen etc. executables (on GNU/Linux)
;;
;; THIRD PARTY CODE:
;; constant `*mon-tramp-mode-line-buffer-ident*' from tramp manual.
;;
;; The functions `mon-ssh-add-pass' and `mon-ssh-add-p'
;; :COURTESY Roland Winkler help.gnu.emacs :DATE 2008-03-30
;; :SUBJECT "tramp and ssh-agent / ssh-add"
;; :CREATED <Timestamp: #{2009-11-19T14:19:24-05:00Z}#{09474} - by MON>
;;
;; THIRD-PARTY-CODE:
;;
;; FIRST-PUBLISHED: <Timestamp: #{2009-11-20T13:45:12-05:00Z}#{09475} - by MON>
;;
;; FILE-CREATED:
;; <Timestamp: #{2009-11-19T14:05:04-05:00Z}#{09474} - by MON>
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


;;; `mon-tramp-add-default-methods' <- `pushnew'.
(eval-when-compile (require 'cl)) 

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))


;;; ==============================
;; `mon-tramp-plink-example' <- `cl::subst' 
;; (eval-when-compile 
;;   (if (locate-library "mon-cl-compat")
;;       (require 'mon-cl-compat)
;;     (fset 'cl::subst (symbol-function 'subst))))
;;; ==============================

(unless (featurep 'tramp) (require 'tramp))

;;; :NOTE :EMACS-WIKI if :FILE mon-default-loads.el isn't in load-path.
(unless (featurep 'mon-default-loads)
  (cond ((eq system-type 'windows-nt)
         (setq IS-MON-P-W32 t)
         (setq IS-MON-P-GNU nil))
        ((or (eq system-type 'gnu/linux) (eq system-type 'linux))
         (setq IS-MON-P-W32 nil)
         (setq IS-MON-P-GNU t))))
;;
;;; :TEST-ME IS-MON-P-W32
;;; :TEST-ME IS-MON-P-GNU

(declare-function w32-shell-execute "w32fns.c")

;;; ==============================
;;; :NOTE Make sure our initial tramp methods are sane.
(cond ((and  (intern-soft "IS-MON-P-W32"  obarray)
             (bound-and-true-p IS-MON-P-W32))
       (custom-set-variables '(tramp-default-method "plinkx")))
      ;; :NOTE It isn't clear whether this should be "ssh2".
      ((and (intern-soft "IS-MON-P-GNU"  obarray)
            (bound-and-true-p IS-MON-P-GNU))
       (custom-set-variables '(tramp-default-method "ssh")))
      ((and (intern-soft "IS-MON-P-DARWIN"  obarray)
           (bound-and-true-p IS-MON-P-DARWIN)
           (custom-set-variables '(tramp-default-method "ssh"))))) ; :WAS "scp")
;;
;;; :TODO Tweak `mode-line-remote' to adust for tramp remotely.
;;; :FUNCTION `file-remote-p' when invoked for w/ 
;;; (file-remote-p default-directory)
;;; will return a suitable id to match on.
;;; dired-subdir-alist will return the marker positions of subdirs in dired-mode

;;; ==============================
;;; :NOTE Following block :FROM (info "(tramp)Frequently Asked Questions")
;;; :CREATED <Timestamp: #{2009-11-18T15:38:32-05:00Z}#{09473} - by MON KEY>
(defvar *mon-tramp-mode-line-buffer-ident* 
  (list '(:eval (let ((mtmlbi-hn
                       (or (file-remote-p default-directory 'host)
                           (system-name))))
                  (if (string-match "^[^0-9][^.]*\\(\\..*\\)" mtmlbi-hn)
                      (substring mtmlbi-hn 0 (match-beginning 1))
                    mtmlbi-hn)))
        ": %12b")
  "*Show tramp suitable mode line identification when visiting a tramp buffer.\n
Run on the `dired-mode-hook' when `IS-MON-SYSTEM-P'.\n
:NOTE Verbatim from info node `(tramp)Frequently Asked Questions'.\n
:SEE-ALSO `mode-line-buffer-identification', `mode-line-remote', `file-remote-p'.\n▶▶▶")
;;
(when (and (intern-soft "IS-MON-SYSTEM-P"  obarray) ;; *IS-MON-OBARRAY*
           (bound-and-true-p IS-MON-SYSTEM-P))
  (setq-default mode-line-buffer-identification *mon-tramp-mode-line-buffer-ident*)
;;
  (add-hook 'dired-mode-hook
          (function (lambda () 
                      (set (make-local-variable 'mode-line-buffer-identification)
                           *mon-tramp-mode-line-buffer-ident*)))))

;;; ==============================
;;; :NOTE uncomment to change persistent store connection path.
;;; Set to nil to turn tramp-persistency off entirely. Don't do it!
;;; <Timestamp: #{2009-11-18T13:03:50-05:00Z}#{09473} - by MON KEY>
;;; (setq tramp-persistency-file-name "~/tramp-persistency") ;nil)

;;; ==============================
;;; :NOTE If the `mon-pks'isn't avaiable default it it to '("").
;;; :CREATED <Timestamp: #{2009-11-19T16:26:42-05:00Z}#{09474} - by MON>
(defvar *mon-tramp-putty-private-keys* (if (bound-and-true-p mon-pks) 
                                             mon-pks
                                             (setq mon-pks '("")))
  "*List of keys to add to the putty agent pageant.exe
:NOTE the symbol `mon-pks' is sourced from an external package.
You should provide your own list (or symbol) for the value of 
`*mon-tramp-putty-private-keys*'.
Each elt of list is a key string as a fully qualified path.
Path should be escaped for `w32-shell-execute' with `\\\\' not as `/'.\n
:EXAMPLE\n '\(\"C:\\\\SOME\\\\PATH\\\\TO\\\\PUTTY-KEY-1.ppk\"
   \"C:\\\\SOME\\\\PATH\\\\TO\\\\PUTTY-KEY-2.ppk\")\n
:SEE-ALSO `*mon-tramp-paths-alist*', `*mon-tramp-default-methods-l*',
`mon-tramp-add-pageant-keys', `mon-tramp-putty-conf-status'\n▶▶▶")
;;
;;; :TEST-ME *mon-tramp-putty-private-keys*
;;
;;; (makunbound '*mon-tramp-putty-private-keys*)

;;; ==============================
;;; :NOTE `mon-tramp-alist' is sourced from an external package. 
;;; :CREATED <Timestamp: #{2009-11-19T17:04:40-05:00Z}#{09474} - by MON KEY>
(defvar *mon-tramp-paths-alist* 
  (if (bound-and-true-p mon-tramp-alist) 
      mon-tramp-alist
      (setq mon-tramp-alist 
            ;;  KEY         ;; GNU/Linux ssh tramp path  ;; W32 plinkx tramp path
            '((example-key1 "/ssh2:root@74.125.45.100:" "/plinkx:<EXAMPLE-SESSION1>:")
              (example-key2 "/ssh:gg@74.125.45.100#2200:/home/gg" "/plinkx:<EXAMPLE-SESSION2>:")
              (example-key3 "/ssh:<USER>@<HOST>:/home/<USER>:" "/plinkx:<EXAMPLE-SESSION3>:"))))
  "*An alist of paths for use with `mon-tramp-connect's completing-read.
List is formatted to be portable between GNU/Linux <-> W32 systems.
Elements of alist should be as shown below.\n\n:EXAMPLE\n\(let \(\(mta '\(\(<KEY> 
              \"/<METHOD>:<USER>@<HOST>:/PATH/ON/HOST\" 
              \"/plinkx:<PUTTY-SESSION>:/PATH/ON/HOST\"\)
             \(brazil
              \"/ssh2:aapatriota@brasilemb.org#666:/home/tony/laundry\" 
              \"/plinkx:brasile:/home/tony/dirt\"\)\)\)\)
  \(setq mta`\(,\(mapcar 'car mta\) ,\(mapcar 'cadr mta\) ,\(mapcar 'caddr mta\)\)\)
  \(format \"The keys -> %s\\nThe GNU paths -> %s\\nThe Putty paths -> %s\"
          \(car mta\) \(cadr mta\) \(caddr mta\)\)\)\n
:SEE-ALSO `*mon-tramp-putty-private-keys*', `*mon-tramp-default-methods-l*',
`mon-tramp-plink-example'.\n▶▶▶")
;;
;;; :TEST-ME *mon-tramp-paths-alist*
;;; :TEST-ME (let ((mta (mapcar 'car *mon-tramp-paths-alist*))) mta)

;;; ==============================
;;; :NOTE Symbol `*mon-tramp-default-methods-l*' is pre-sourced from an external package. 
;;; :CREATED <Timestamp: #{2009-11-19T19:41:09-05:00Z}#{09475} - by MON KEY>
(defvar *mon-tramp-default-methods-l* nil  
  "*Two element list containing `tramp-default-methods' according to system type.\n
:CALLED-BY `mon-tramp-add-default-methods'.\n
:NOTE On MON systems this variable evalautes the value of the  symbol.
The `*mon-tramp-default-methods-l*' symbol is defined in a separate private file.
You should create and provide your own list and supply its symbol or value here.\n
Your list will contain two elements - each a list.\n
The car of the list will contain tramp \"plinkx\" style host strings.
These are for use with `IS-MON-P-W32' tramp related conditionals and should be
formatted for tramp's HOST arg with the \"plinkx\" method.
Each string in this first list is a putty/plink session name with tramp's
usual \"\\\\`HOST\\\\'\" escapes e.g.:\n
 \(\"\\\\`session1\\\\'\" \"\\\\`session2\\\\'\" \"\\\\`session3\\\\'\"\)\n
To wit, each elt of the example list above is a string comprised of:\n
 quotation-mark backslash backslash backquote sessionN backslash backslash apostrophe quotation-mark\n
:EXAMPLE \(mon-tramp-plink-example\)
                                 Subst ^^^^^ HOSTN w/ putty session name.\n
The second elt of your list (the cadr) is for `IS-MON-P-GNU' tramp conditionals.
This is a list of lists for tramp when using GNU/LINUX's ssh-agent.\n
Each list should contain three strings formatted as per tramps
`tramp-default-method-alist' e.g. (HOST USER METHOD) and properly escaped as:\n
  \(\"\\\\`HOST\\\\'\" \"\\\\`USER\\\\'\" \"\\\\`METHOD\\\\'\"\)\n
:SEE-ALSO `*mon-tramp-putty-private-keys*', `*mon-tramp-paths-alist*'
`mon-tramp-plink-example'.\n▶▶▶")
;;
(unless (bound-and-true-p *mon-tramp-default-methods-l*)
  (setq *mon-tramp-default-methods-l*
        ;; First list for IS-MON-P-W32 - list with 3 strings.
        `( ;; (elt (assoc 'example-key1 *mon-tramp-paths-alist*) 2)
          ("\\`<EXAMPLE-SESSION1>\\'"  
           ;; (elt (assoc 'example-key2 *mon-tramp-paths-alist*) 2)
           "\\`<EXAMPLE-SESSION2>\\'"  
           ;; (elt (assoc 'example-key3 *mon-tramp-paths-alist*) 2)
           "\\`<EXAMPLE-SESSION3>\\'") 
          ;; Second list for IS-MON-P-GNU - list of lists.
          ( ;; (elt (assoc 'example-key1 *mon-tramp-paths-alist*) 1)
           ("\\`74\\.125\\.45\\.100\\'" "\\`root\\'" "ssh2")
           ;; (elt (assoc 'example-key2 *mon-tramp-paths-alist*) 1)
           ("\\`74\\.125\\.45\\.100#2200\\'" "\\`gg\\'" "ssh") ;; Uses port 2200
           ;; (elt (assoc 'example-key3 *mon-tramp-paths-alist*) 1)
           ("\\`<SOME.HOST.IP>\\'" "\\`<USER>\\'" "ssh")))))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-19T20:05:54-05:00Z}#{09475} - by MON KEY>
(defun mon-tramp-plink-example ()
  "Return a  correct formatting for car of `*mon-tramp-default-methods-l*'.\n
Return value as with `momentary-string-display'.\n
:EXAMPLE\n\n(mon-tramp-plink-example)\n
:SEE-ALSO `*mon-tramp-putty-private-keys*', `*mon-tramp-paths-alist*'.\n▶▶▶"
  (interactive)
  (let ((h-seq '(34 92 92 96 72 79 83 84 49 92 92 39 34))
        (h-sb '(49 50 51))
        ;; This is `cl-do-subst' which `subst' calls unless arg CL-OLD is
        ;; `floatp'.. and its not here.
        (cds-L-1 #'(lambda (cds-L-1-new cds-L-1-old cds-L-1-tree)
                     (cond ((eq cds-L-1-tree cds-L-1-old) cds-L-1-new)
                           ((consp cds-L-1-tree)
                            (let ((cds-L-1-a 
                                   (apply cds-L-1 (list cds-L-1-new cds-L-1-old (car cds-L-1-tree))))
                                  (cds-L-1-d 
                                   (apply cds-L-1 (list cds-L-1-new cds-L-1-old (cdr cds-L-1-tree)))))
                              (if (and (eq cds-L-1-a (car cds-L-1-tree)) (eq cds-L-1-d (cdr cds-L-1-tree)))
                                  cds-L-1-tree (cons cds-L-1-a cds-L-1-d))))
                           (t cds-L-1-tree))))
        h-lst)
    (dolist (i h-sb (setq h-lst (nreverse h-lst)))
      ;; :WAS (push (apply 'string  (cl::subst i 49 h-seq)) h-lst))
      (push (apply 'string (apply cds-L-1 (list i 49 h-seq))) h-lst))
    (momentary-string-display  (format "%s" h-lst) (point))))
;;
;;; :TEST-ME (mon-tramp-plink-example)

;;; ==============================
;;; :NOTE Uses (pushnew X PLACE :test 'equal) idiom - b/c `add-to-list' bites!
;;; :CREATED <Timestamp: #{2009-11-19T14:19:29-05:00Z}#{09474} - by MON>
(defun mon-tramp-add-default-methods ()
  "Map elts of `*mon-tramp-default-methods-l*' to `tramp-default-method-alist'.\n
When `IS-MON-P-W32' add the the 'plinkx' methods.\n
When `IS-MON-P-GNU' add the the ssh-agent style methods.\n
:NOTE Evaluated at loadtime with `mon-tramp-utils-loadtime' by
`mon-after-mon-utils-loadtime'.\n
:SEE-ALSO `tramp-default-method-alist', `tramp-default-method'\n▶▶▶"
  ;; (let ((IS-MON-P-GNU t)   ; :FOR-TESTING cross-platform.
  ;;      (IS-MON-P-W32 nil)) ; :FOR-TESTING cross-platform.
  (cond (;;IS-MON-P-W32  
         (and (intern-soft "IS-MON-P-W32" obarray) ;; *IS-MON-OBARRAY*
              (bound-and-true-p IS-MON-P-W32))
         (mapc #'(lambda (t-mthd) 
                 (pushnew (list t-mthd "" "plinkx") tramp-default-method-alist :test 'equal))
               (car *mon-tramp-default-methods-l*)) t) ;; Return t to obfuscate setq side-effects.
        ((and (intern-soft "IS-MON-P-GNU" obarray) ;; *IS-MON-OBARRAY*
              (bound-and-true-p IS-MON-GNU))
         (mapc #'(lambda (t-mthd) 
                 (pushnew t-mthd tramp-default-method-alist :test 'equal))
               (cadr *mon-tramp-default-methods-l*)) t)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-05-24T19:01:57-04:00Z}#{10211} - by MON KEY>
(defun mon-tramp-utils-loadtime ()
  "Evalutate `mon-tramp-add-default-methods' at loadtime.\n
:NOTE Evaluated by `mon-after-mon-utils-loadtime'.\n
:SEE-ALSO `*mon-tramp-default-methods-l*'.\n▶▶▶"
  (mon-tramp-add-default-methods))
;;
;;; :TEST-ME *mon-tramp-default-methods-l*

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-19T15:04:05-05:00Z}#{09474} - by MON>
(defun mon-tramp-putty-conf-status ()
  "Retrun a two elt list of executable paths for pageant, putty, plink.\n
First elt is a formatted string of paths. Second is an alist as same.\n
:EXAMPLE\n\n\(mon-tramp-putty-conf-status\)\n
\(car \(mon-tramp-putty-conf-status\)\)\n
\(cadr \(mon-tramp-putty-conf-status\)\)\n
\(assoc 'putty \(cadr \(mon-tramp-putty-conf-status\)\)\)\n
:NOTE Will not return particularly relevant results when the executables
pageant, putty, or plink are not pressent in current systems path.\n
:SEE-ALSO `*mon-tramp-putty-private-keys*', `mon-tramp-add-pageant-keys'.\n▶▶▶"
  (interactive)
  (let* ((putty-stat-l
          `((pageant ,(or (executable-find "pageant.exe") 
                          (executable-find "pageant")))
            (putty   ,(or (executable-find "putty.exe") 
                          (executable-find "putty")))
            (plink   ,(or (executable-find "plink.exe") 
                          (executable-find "plink")))))
         ;; (bubba  ,(executable-find "bubba.exe")) ;; :DEBUG-TRACER
         (putty-stat-str           
          (mapconcat #'(lambda (x) 
                         (concat (format "The %s path is -> %s" (car x) (cadr x))))
                     putty-stat-l "\n")))
    `(,putty-stat-str ,putty-stat-l)))
;;
;;; :TEST-ME (mon-tramp-putty-conf-status)
;;; :TEST-ME (car (mon-tramp-putty-conf-status))
;;; :TEST-ME (cadr (mon-tramp-putty-conf-status))
;;; :TEST-ME (assoc 'putty (cadr (mon-tramp-putty-conf-status)))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-19T15:20:00-05:00Z}#{09474} - by MON>
(defun mon-tramp-add-pageant-keys ()
  "Add all keys in var `*mon-tramp-putty-private-keys*' to the putty agent.\n
Signal error if symbol pageant is associated in `mon-tramp-putty-conf-status'.\n
:NOTE Existing putty keys will be over-written.\n
:SEE-ALSO `mon-ssh-add-p'.\n▶▶▶"
  (interactive)
  (let ((pag (cadr (assoc 'pageant (cadr (mon-tramp-putty-conf-status))))))
    (if pag 
        (setq pag (replace-regexp-in-string "/" "\\\\" pag))
      (error ":FUNCTION `mon-tramp-add-pageant-keys' -- no pageant executable found"))
    (cond ((and (intern-soft "IS-MON-P-W32" obarray)
                (bound-and-true-p IS-MON-P-W32))
           (w32-shell-execute 
            "open" pag (mapconcat #'identity *mon-tramp-putty-private-keys* " ")))
          ((or (and (intern-soft "IS-MON-P-GNU" obarray) 
                    (bound-and-true-p IS-MON-P-GNU))
               (and (intern-soft "IS-MON-P-DARWIN" obarray) 
                    (bound-and-true-p IS-MON-P-DARWIN)))
           (message ":FUNCTION `mon-tramp-add-pageant-keys' -- :FIXME What to do here???\n")))
          ;;; (call-process-shell-command 
    ))
;; 
;;; :TEST-ME (mon-tramp-add-pageant-keys)

;;; ==============================
;;; :TODO Extend `mon-ssh-add-p' to snarf auth data and add them to the running
;;;       agent (ssh|gpg)
;;; :NOTE (getenv "GPG_AGENT_INFO")
;;;       (getenv "SSH_AUTH_SOCK")
;;;       (getenv "SSH_AGENT_PID")
;;;       (process-environment)
;;; ==============================
;;; :COURTESY Roland Winkler help.gnu.emacs :DATE 2008-03-30
;;; :SUBJECT "tramp and ssh-agent / ssh-add"
;;; :CREATED <Timestamp: #{2009-11-19T14:19:24-05:00Z}#{09474} - by MON>
(defun mon-ssh-add-p ()
  "On GNU/LINUX return t if ssh-add -l has know identities.\n
On W32 message user about putty/pagent/plink.\n
:EXAMPLE\n\n(mon-ssh-add-p)\n
:SEE-ALSO `mon-tramp-add-pageant-keys'.\n▶▶▶"
  (interactive)
  (if (and (intern-soft "IS-MON-P-GNU"  obarray)
           (bound-and-true-p IS-MON-P-GNU))
      (with-temp-buffer
        (call-process "/usr/bin/ssh-add" nil t nil "-l")
        (goto-char (point-min))
        (not (search-forward "The agent has no identities." nil t)))
    (message ":FUNCTION `mon-ssh-add-p' -- A ssh-agent is not available on w32; use command `mon-tramp-add-pageant-keys'")))
;;
;;; :TEST-ME (mon-ssh-add-p)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-20T12:53:50-05:00Z}#{09475} - by MON KEY>
(defun mon-tramp-read-conns ()
  "Return a tramp connection for `mon-tramp-connect'.
Return value is conditional on whether `IS-MON-P-W32' or `IS-MON-P-GNU'.\n
:EXAMPLE\n(mon-tramp-read-conns)\n
:SEE-ALSO `*mon-tramp-paths-alist*'.\n▶▶▶"
  (let (;; (IS-MON-P-W32 nil) ; :FOR-TESTING cross-platform.
        ;; (IS-MON-P-GNU t)   ; :FOR-TESTING cross-platform.
        (conn-key (mapcar #'(lambda (x) 
                              (format "%s" (car x))) *mon-tramp-paths-alist*))
        (read-conn))
    (setq read-conn (read (completing-read "Choose a connection (tab completes): " conn-key nil t)))
    (setq read-conn (assoc read-conn *mon-tramp-paths-alist*))
(cond ((and (intern-soft "IS-MON-P-W32"  obarray)
            (bound-and-true-p IS-MON-P-W32))
         
       (let ((tst-can-conn (elt read-conn 2)))
         (if (and tst-can-conn ; Is not nil.
                  (not (eq "" tst-can-conn))) ; And has a value.
                  tst-can-conn
                  (error "Can't find a connection for this system"))))
      ((and (intern-soft "IS-MON-P-GNU"  obarray)
            (bound-and-true-p IS-MON-P-GNU))
       (let ((tst-can-conn (elt read-conn 1)))
         (if (and tst-can-conn ; Is not nil.
                  (not (eq "" tst-can-conn))) ; And has a value.
             tst-can-conn
             (error ":FUNCTION `mon-tramp-read-conns' -- Can't find a connection for this system")))))))
;;
;;; :TEST-ME (mon-tramp-read-conns)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-15T20:10:48-05:00Z}#{09467} - by MON KEY>
(defun mon-tramp-connect (&optional tramp-path)
  "Tramp to a host in the `*mon-tramp-default-methods-l*'.
Use `mon-tramp-read-conns' to specify the host.
Completions return per current system's type `IS-MON-P-W32' or `IS-MON-P-GNU'.
When TRAMP-PATH is non-nil attempt to connect to specified host.
:SEE-ALSO `mon-tramp-disconnect', `mon-tramp-su-local'.\n▶▶▶"
  (interactive "i")
  (if tramp-path
      (dired tramp-path)
      (dired (mon-tramp-read-conns))))
;;
;;; :TEST-ME (mon-tramp-connect)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-11-18T15:14:11-05:00Z}#{09473} - by MON KEY>
(defun mon-tramp-disconnect ()
  "All remote connections are cleaned up.  
All buffers, which are related to a remote connection, are killed.
Flushes objects for all active remote connections. For more fine grained control
:SEE `tramp-cleanup-all-connections', `tramp-cleanup-all-buffers'
`tramp-cleanup-connection'.
:SEE-ALSO `mon-tramp-connect', `mon-tramp-read-conns'\n▶▶▶"
  (interactive)
  (progn
    (tramp-cleanup-all-connections)
    (tramp-cleanup-all-buffers)))

;;; ==============================
;;; :CREATED <Timestamp: #{2009-09-27T02:36:30-04:00Z}#{09397} - by MON KEY>
(defun mon-tramp-su-local ()
  "Open a local tramp shell process with su.\n
Don't be concerned by those nagging voices in your head:\n
   \"Are you crazy God damnit?
    Don't you think its a little risky to tramp this CPU?\"\n
Steel yourself and quiet those doubts with your best Colonel Kilgore:\n
    If I say its safe to su this CPU, then its safe to su this CPU. 
    I mean I'm not afraid to su this CPU, I'll su this whole fucking CPU! 
    Tramps don't sudo!\n
:SEE-ALSO `mon-tramp-connect', `mon-tramp-disconnect'.\n▶▶▶"
  (interactive)
  (cond ((and (intern-soft "IS-MON-P-GNU"  obarray) ;; *IS-MON-OBARRAY*
              (bound-and-true-p IS-MON-P-GNU))
         (dired "/su::"))
	((and (intern-soft "IS-MON-P-W32"  obarray) ;; *IS-MON-OBARRAY*
              (bound-and-true-p IS-MON-P-W32))
         "I don't see no su 'round here...")))
;;
;;; :TEST-ME (mon-tramp-su-local)
;;;


;;; ==============================
;;; :NOTE
;;; ->  ssh:daniel@melancholia:.emacs
;;; ->  /ssh://daniel@melancholia/.emacs
;;; CREATED: <Timestamp: #{2009-11-11T16:03:52-05:00Z}#{09463} - by MON KEY>
(defun mon-tramp-syntax ()
  "Return the format of for current tramp-syntax.\n
:SEE info node `(tramp)Alternative Syntax'.\n
:EXAMPLE\n(mon-tramp-syntax)\n
:SEE-ALSO `mon-tramp-putty-conf-status'.\n▶▶▶"
  (interactive "p")
  (cond ((eq tramp-syntax 'url) 
         (princ "/ssh://<NAME>@<MACHINE>/path/to/.emacs"))
        ((eq tramp-syntax 'ftp) 
         (princ "ssh:<NAME>@<MACHINE>:/path/to/.emacs"))))
;;
;;; :TEST-ME (mon-tramp-syntax)


;;; ==============================
;;; :NOTE only _think_ about using this if other solutions unavialble.
;;; :SEE Michael Albinus' response to this implementation and recs to use
;;; password.el instead. Or, consider auth-source.el as pass handler.
;;; :COURTESY Roland Winkler help.gnu.emacs :DATE 2008-03-30
;;; :SUBJECT "tramp and ssh-agent / ssh-add"
;;; :CREATED <Timestamp: #{2009-11-19T14:19:24-05:00Z}#{09474} - by MON>
;;; ==============================
;;; (defun mon-ssh-add-pass (&optional password)
;;;   "Add ssh passphrase."
;;;   (interactive)
;;;   (if (ssh-add-p)
;;;       (if (interactive-p) (message "Passphrase already entered."))
;;;     (with-temp-buffer
;;;       (insert (or password (read-passwd "Passphrase: ")) "\n")
;;;       (let ((process-environment (copy-alist process-environment)))
;;;         (setenv "DISPLAY") ;; unset DISPLAY
;;;         (call-process-region (point-min) (point-max)
;;;                              "/usr/bin/ssh-add" t t nil))
;;;       ;; Massage output
;;;       (goto-char (point-min))
;;;       ;; suppress "Enter passphrase for ...: "
;;;       (search-forward ": " nil t)
;;;       (let ((beg (point)))
;;;         (goto-char (point-max))
;;;         (skip-chars-backward " \t\n")
;;;         (message "%s" (buffer-substring-no-properties beg (point)))))))

;;; ==============================
(provide 'mon-tramp-utils)
;;; ==============================


;; Local Variables:
;; mode: EMACS-LISP
;; generated-autoload-file: "./mon-loaddefs.el"
;; coding: utf-8
;; End:

;;; ================================================================
;;; mon-tramp-utils.el ends here
;;; EOF
