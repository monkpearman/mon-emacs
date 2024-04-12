;;; mon-bzr-utils.el --- utilities for working with distributed VCS
;; -*- mode: EMACS-LISP; -*-

;;; ================================================================
;; Copyright © 2010-2012 MON KEY. All rights reserved.
;;; ================================================================

;; FILENAME: mon-bzr-utils.el
;; AUTHOR: MON KEY
;; MAINTAINER: MON KEY
;; CREATED: 
;; VERSION: 1.0.0
;; COMPATIBILITY: Emacs23.*
;; KEYWORDS: execute, environment, external, processes

;;; ================================================================

;;; COMMENTARY: 

;; =================================================================
;; DESCRIPTION:
;; mon-bzr-utils provides
;;
;; FUNCTIONS:▶▶▶
;; `mon-bzr-log-last', `mon-insert-hgignore-template', `mon-help-bzr-init',
;; `mon-help-bzr-topics', `mon-help-bzr-usage' `mon-help-bzr-aliases',
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
;; `*mon-hgignore-template*',
;;
;; ALIASED/ADVISED/SUBST'D:
;; `mon-help-bzr-commands' -> `mon-help-bzr-topics'
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
;; SNIPPETS:
;;
;; REQUIRES:
;;
;; THIRD-PARTY-CODE:
;;
;; URL: https://github.com/mon-key/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-bzr-utils.el
;; EMACSWIKI-URL: http://www.emacswiki.org/emacs/mon-bzr-utils.el
;; FIRST-PUBLISHED:
;;
;; EMACSWIKI: { URL of an EmacsWiki describing mon-bzr-utils. }
;;
;; FILE-CREATED:
;; <Timestamp: #{2010-01-13T12:38:23-05:00Z}#{10023} - by MON KEY>
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
;; Copyright © 2010-2012 MON KEY 
;;; ==============================

;;; CODE:


(eval-when-compile (require 'cl))

(unless (and (intern-soft "*IS-MON-OBARRAY*")
             (bound-and-true-p *IS-MON-OBARRAY*))
(setq *IS-MON-OBARRAY* (make-vector 17 nil)))

;;; ==============================
;;; :CHANGESET 2393
;;; :CREATED <Timestamp: #{2011-01-14T19:12:06-05:00Z}#{11025} - by MON KEY>
(defgroup mon-bzr-utils nil
  "Customization group for variables and functions of :FILE mon-bzr-utils.el\n
:SEE-ALSO .\n▶▶▶"
  ;; :prefix "<PREFIX>"
  :link '(url-link 
          :tag ":EMACSWIKI-FILE" 
          "http://www.emacswiki.org/emacs/mon-bzr-utils.el")
  :link '(url-link 
          :tag ":GITHUB-FILE" 
          "https://github.com/mon-key/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-bzr-utils.el")
  :link '(emacs-library-link 
          :tag ":FILE mon-bzr-utils.el"
          "mon-bzr-utils.el")
  :group 'mon-base)

;;; ==============================
;;; :CHANGESET 2393
;;; :CREATED <Timestamp: #{2011-01-14T19:11:16-05:00Z}#{11025} - by MON KEY>
(defcustom *mon-bzr-utils-xrefs* 
  '(mon-bzr-log-last mon-insert-hgignore-template mon-help-bzr-init
    mon-help-bzr-topics mon-help-bzr-usage mon-help-bzr-aliases
    *mon-bzr-utils-xrefs*)
  "Xrefing list of `mon-help-bzr-*' symbols, functions, and variables.\n
The symbols contained of this list are defined in :FILE mon-bzr-utils.el\n
:SEE-ALSO `*mon-default-loads-xrefs*', `*mon-default-start-loads-xrefs*',
`*mon-dir-locals-alist-xrefs*', `*mon-keybindings-xrefs*',
`*mon-testme-utils-xrefs*', `*mon-button-utils-xrefs*',
`*mon-buffer-utils-xrefs*', `*mon-error-utils-xrefs*', `*mon-line-utils-xrefs*',
`*mon-macs-xrefs*', `*mon-plist-utils-xrefs*', `*mon-post-load-hooks-xrefs*',
`*mon-seq-utils-xrefs*', `*mon-string-utils-xrefs*', `*mon-type-utils-xrefs*',
`*mon-window-utils-xrefs*', `*naf-mode-xref-of-xrefs*', `*mon-slime-xrefs*',
`*naf-mode-faces-xrefs*', `*naf-mode-date-xrefs*', `*mon-ulan-utils-xrefs*',
`*mon-xrefs-xrefs'.\n▶▶▶"
  :type '(repeat symbol)
  :group 'mon-bzr-utils
  :group 'mon-xrefs)

;;; ==============================
;;; :TODO Build utility to present `bzr help <TOPIC>' command in a help window.
;;
;;
;; (defun mon-help-bzr (topic-or-command)
;; (if interactive 
;; 
;;    { ... } (completing-read <LIST-OF-POSSIBLE-BZR-HELP>)  { ... }
;; loop over <LIST-OF-POSSIBLE-BZR-HELP> make sure TOPIC-OR-COMMAND is valid.
;;
;; (let ((mhb (get-buffer-create "*MON-HELP-BZR*")))
;; (with-current-buffer mhb (erase-buffer))
;; (call-process-shell-command "bzr" nil (get-buffer mhb) t (concat "help " topic-or-command))
;;
;; ,---- :BZR-XREFABLE-FORMS
;; | Aliases:  up
;; | See also: pull, status-flags, working-trees
;; | 
;; `----
;;; ==============================

;;; ==============================
;;; :CHANGESET 2376
;;; :CREATED <Timestamp: #{2011-01-04T14:07:13-05:00Z}#{11012} - by MON KEY>
;;;###autoload
(defun mon-help-bzr-topics (&optional insertp intrp)
  "List of bzr help topics and commands.\n
;; :BZR-HELP-USAGE
shell> bzr help commands
shell> bzr help topics
shell> bzr help init\n
;; :BZR-HELP-TOPICS
authentication       Information on configuring authentication
basic                Basic commands
branches             Information on what a branch is
bugs                 Bug tracker settings
checkouts            Information on what a checkout is
commands             Basic help for all commands
configuration        Details on the configuration settings available
conflict-types       Types of conflicts and what to do about them
content-filters      Conversion of content into/from working trees
criss-cross          Information on criss-cross merging
current-formats      Current storage formats
debug-flags          Options to show or record debug information
diverged-branches    How to fix diverged branches
env-variables        Environment variable names and values
eol                  Information on end-of-line handling
files                Information on configuration and log files
formats              Information on choosing a storage format
global-options       Options that control how Bazaar runs
hidden-commands      All hidden commands
hooks                Points at which custom processing can be added
launchpad            Using Bazaar with Launchpad.net
location-alias       Aliases for remembered locations
log-formats          Details on the logging formats available
other-formats        Experimental and deprecated storage formats
patterns             Information on the pattern syntax
repositories         Basic information on shared repositories
revisionspec         Explain how to use --revision
rules                Information on defining rule-based preferences
standalone-trees     Information on what a standalone tree is
standard-options     Options that can be used with any command
status-flags         Help on status flags
sync-for-reconfigure Steps to resolve \"out-of-sync\" when reconfiguring
topics               Topics list
urlspec              Supported transport protocols
working-trees        Information on working trees\n
;; :BZR-HELP-COMMANDS
add                  Add specified files or directories
alias                Set/unset and display aliases
annotate             Show the origin of each line in a file
bind                 Convert the current branch into a checkout of the supplied branch
branch               Create a new branch that is a copy of an existing branch
break-lock           Break a dead lock on a repository, branch or working directory
cat                  Write the contents of a file as of a given revision to standard output
check                Validate working tree structure, branch consistency and repository history
checkout             Create a new checkout of an existing branch
clean-tree           Remove unwanted files from working tree
commit               Commit changes into a new revision
conflicts            List files with conflicts
deleted              List files deleted in the working tree
diff                 Show differences in the working tree, between revisions or branches
export               Export current or past revision to a destination directory or archive
help                 Show help on a command or other topic
ignore               Ignore specified files or patterns
ignored              List ignored files and the patterns that matched them
info                 Show information about a working tree, branch or repository
init                 Make a directory into a versioned branch
init-repository      Create a shared repository for branches to share storage space
join                 Combine a tree into its containing tree
launchpad-login      Show or set the Launchpad user ID. [launchpad]
launchpad-mirror     Ask Launchpad to mirror a branch now. [launchpad]
launchpad-open       Open a Launchpad branch page in your web browser. [launchpad]
log                  Show historical log for a branch or subset of a branch
ls                   List files in a tree
merge                Perform a three-way merge
missing              Show unmerged/unpulled revisions between two branches
mkdir                Create a new versioned directory
mv                   Move or rename a file
nick                 Print or set the branch nickname
pack                 Compress the data within a repository
plugins              List the installed plugins
pull                 Turn this branch into a mirror of another branch
push                 Update a mirror of this branch
reconcile            Reconcile bzr metadata in a branch
reconfigure          Reconfigure the type of a bzr directory
register-branch      Register a branch with launchpad.net. [launchpad]
remerge              Redo a merge
remove               Remove files or directories
remove-tree          Remove the working tree from a given branch/checkout
renames              Show list of renamed files
resolve              Mark a conflict as resolved
revert               Revert files to a previous revision
revisionspec         Revision Identifiers
revno                Show current revision number
root                 Show the tree root directory
send                 Mail or create a merge-directive for submitting changes
serve                Run the bzr server
shelve               Temporarily set aside some changes from the current tree
sign-my-commits      Sign all commits by a given committer
split                Split a subdirectory of a tree into a separate tree
status               Display status summary
switch               Set the branch of a checkout and update
tag                  Create, remove or modify a tag naming a revision
tags                 List tags
testament            Show testament (signing-form) of a revision
unbind               Convert the current checkout into a regular branch
uncommit             Remove the last committed revision
unshelve             Restore shelved changes
update               Update a tree to have the latest code committed to its branch
upgrade              Upgrade branch storage to current format
version              Show version of bzr
version-info         Show version information about this tree
view                 Manage filtered views
whoami               Show or set bzr user id.\n
:ALIASED-By `mon-help-bzr-commands'\n
:SEE-ALSO `mon-help-bzr-aliases', `mon-help-bzr-usage', `mon-help-bzr-init'.\n▶▶▶"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-bzr-topics :insertp t)
    (mon-message :msg-spec '(":FUNCTION `mon-help-bzr-topics' " 
                             "-- pass non-nil for optional arg INTRP"))))
;;
;;; :TEST-ME (mon-help-bzr-topics)
;;; :TEST-ME (mon-help-bzr-topics t)
;;; :TEST-ME (describe-function 'mon-help-bzr-topics)
;;; :TEST-ME (apply #'mon-help-bzr-topics '(t))

;;; ==============================
;;; :CHANGESET 2378
;;; :CREATED <Timestamp: #{2011-01-04T14:51:45-05:00Z}#{11012} - by MON KEY>
;;;###autoload
(defun mon-help-bzr-usage (&optional insertp intrp)
  "List of usage idioms for the seemingly trivial but non-obvious bzr commands.\n
- List the versioned files in the current directory only:
  shell> bzr ls --versioned\n
- list only the versioned directories in a given directory
  shell> bzr ls --kind=directory --versioned\n
- List the versioned files and dirs in the current directory and subdirs:
  shell> bzr ls --versioned --recursive\n
- List only the versioned files in the current directory and subdirs:
  shell> bzr ls --kind=files --versioned --recursive\n
- Find the list of branches in a given repo:\n
  shell> bzr branches\n
- Find diffs between two different revisions:
  shell> bzr diff -r<REVISION-N1>..<REVISION-N2>
- Find diffs for changes introduced by a specific revision 
  shell> bzr diff -change=<REVISION-N>\n
- Find diffs between the working tree and a revision:
  shell> bzr diff -revision=<REVISION-N>\n
- Find diffs for a single file:
  shell> bzr diff <FILE>\n
- Find diffs for a single file comparing two revisions:
  shell> bzr diff -r<REVISION-N1>..<REVISION-N2> <FILE>\n
- Add a directory to be under version control:
  shell> bzr add <DIRECTORY>\n
- Rename a versioned file:
  shell> bzr mv <OLD-FILENAME> <NEW-FILENAME>
- Move a versioned file into a versioned directory:
  shell> bzr move <FILENAME> <NEW-DIR>/<FILENAME>
  shell> bzr move <FILENAME> <NEW-DIR>/\n
- Stop tracking a revisioned file but don't delete the file
  shell> bzr remove --keep <FILE>

:SEE-ALSO `mon-help-bzr-topics', `mon-help-bzr-aliases', `mon-help-bzr-init'.\n▶▶▶"
  (interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-bzr-usage :insertp t)
    (mon-message :msg-spec '(":FUNCTION `mon-help-bzr-usage' " 
                             "-- pass non-nil for optional arg INTRP"))))
;;
;;; :TEST-ME (mon-help-bzr-usage)
;;; :TEST-ME (mon-help-bzr-usage t)
;;; :TEST-ME (describe-function 'mon-help-bzr-usage)

;;; ==============================
;;; :CHANGESET 2378
;;; :CREATED <Timestamp: #{2011-01-04T15:02:18-05:00Z}#{11012} - by MON KEY>
;;;###autoload
(defun mon-help-bzr-aliases (&optional insertp intrp)
  "List of bzr commands with aliases.\n
;; :BZR-HELP-COMMAND-ALIASES
diff 
:BZR-ALIASED-BY `di`, `dif`\n
mv
:BZR-ALIASED-BY `move`, `rename`\n
status
:BZR-ALIASED-BY `st`, `stat`\n
remove 
:BZR-ALIASED-BY `rm`, `del`
:SEE-ALSO `mon-help-bzr-topics', `mon-help-bzr-usage', `mon-help-bzr-init'.\n▶▶▶"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-bzr-aliases :insertp t)
    (mon-message :msg-spec '(":FUNCTION `mon-help-bzr-aliases' " 
                             "-- pass non-nil for optional arg INTRP"))))
;;
;;; :TEST-ME (mon-help-bzr-aliases)
;;; :TEST-ME (mon-help-bzr-aliases t)
;;; :TEST-ME (describe-function 'mon-help-bzr-aliases)

 


;;; ==============================
;;; :CHANGESET 2376
;;; :CREATED <Timestamp: #{2011-01-04T14:07:24-05:00Z}#{11012} - by MON KEY>
;;;###autoload
(defun mon-help-bzr-init (&optional insertp intrp)
"List of options and usage for the bzr init-repository command.\n
;; :BZR-INIT-REPOSITORY-DISCUSSION
The purpops of the bzr init-repository command is to create a shared repository
for branches to share storage space.\n
New branches created under the repository directory will store their
revisions in the repository, not in the branch directory.  For branches
with shared history, this reduces the amount of storage needed and 
speeds up the creation of new branches.\n
If the --no-trees option is given then the branches in the repository
will not have working trees by default.  They will still exist as 
directories on disk, but they will not have separate copies of the 
files at a certain revision.  This can be useful for repositories that
store branches which are interacted with through checkouts or remote
branches, such as on a server.\n
;; :BZR-INIT-REPOSITORY-USAGE
bzr {init-repository|init-repo} <OPTIONS> <LOCATION>\n
;; :BZR-INIT-REPOSITORY-OPTIONS
 --no-trees            Branches in the repository will default to not having a working tree.
 --verbose, -v         Display more information.
 --quiet, -q           Only display errors and warnings.
 --usage               Show usage message and options.
 --help, -h            Show help message.\n
;; :BZR-INIT-REPOSITORY-OPTIONS-FORMAT
 --format=ARG        Specify a format for this repository. 
                     :SEE \"bzr help formats\" for details.\n
 --1.14              A working-tree format that supports content filtering.\n
 --1.14-rich-root    A variant of 1.14 that supports rich-root data.
                     :NOTE Needed for use with bzr-svn and bzr-git.\n
 --2a                First format for bzr 2.0 series. Uses group-compress storage. 
                     Provides rich roots which are a one-way transition.\n
 --default           First format for bzr 2.0 series. Uses group-compress storage.
                     Provides rich roots which are a one-way transition.\n
 --pack-0.92         Pack-based format with data compatible with dirstate-tags format repositories.
                        Interoperates with bzr repositories before 0.92 but cannot be read by bzr < 0.92.
                        New in bzr version 0.92 -- previously called knitpack-experimental.
                        :SEE (URL `http://doc.bazaar-vcs.org/latest/developers/packrepo.html')\n
;; :BZR-ALIASED-BY
`bzr init-repo`\n
:BZR-SEE-ALSO `bzr branch` `bzr checkout`, `bzr init`, `bzr repositories`\n
:EXAMPLE\n
Create a shared repository holding just branches:\n
shell>  bzr init-repo --no-trees repo
shell>  bzr init repo/trunk\n
Make a lightweight checkout elsewhere:
shell>  bzr checkout --lightweight repo/trunk trunk-checkout\n
shell>  cd trunk-checkout
        \(... add files here ...\)\n
Find the list of branches in a given repo \(This isn't obvious...)\:
shell> bzr branches
:SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2010-01/msg01091.html')
:SEE (URL `http://bzr.savannah.gnu.org/r/emacs/')\n
:SEE-ALSO `mon-help-bzr-topics'.\n▶▶▶"
(interactive "i\nP")
  (if (or insertp intrp)
      (mon-help-function-spit-doc 'mon-help-bzr-init :insertp t)
    (mon-message :msg-spec '(":FUNCTION `mon-help-bzr-init' " 
                             "-- pass non-nil for optional arg INTRP"))))
;;
;;; :TEST-ME (mon-help-bzr-init)
;;; :TEST-ME (mon-help-bzr-init t)
;;; :TEST-ME (describe-function 'mon-help-bzr-init)
;;; :TEST-ME (apply #'mon-help-bzr-init '(t))



;;; ==============================
;; Yes, "bzr diff" supports versions.  E.g.,
;;     bzr diff -r101100..101101

;; > Let us say I first in this case write the parts for multi major modes.
;; > I guess I then submit this to my local rep? How?

;; You need to create a separate branch, with the "bzr branch" command.
;; Then you can commit there with "bzr ci".

;; Alternatively, you can use "bzr ci --local" in the bound branch, but
;; this is less recommended, since it requires you to be aware of local
;; commits that you didn't push to the remote repository.

;;; ==============================



;;; ==============================
;; :NOTE Figure out what to do with these:
;;  :LOG-EDIT-FUNCTIONS                       :SEE :FILE log-edit.el
;; `log-edit'
;; `log-edit-done'
;; `log-edit-comment-to-change-log'
;; `log-edit-mode'
;; `log-edit-done'
;; `log-edit-insert-changelog'
;; `log-edit-show-diff'
;; `log-edit-show-files'
;; `log-edit-next-comment'
;; `log-edit-previous-comment'
;; `log-edit-comment-search-backward'
;; `log-edit-comment-search-forward'
;; `log-edit-mode-help'
;; `log-edit-new-comment-index'
;;
;; :LOG-EDIT-HOOKS
;; `log-edit-checkin-hook'
;; `log-edit-hook'
;; `log-edit-done-hook'
;; `log-edit-mode-hook'
;;
;; :LOG-EDIT-VARIABLES
;; `log-edit-confirm'
;; `log-edit-menu'
;; `log-edit-keep-buffer'
;; `log-edit-require-final-newline'
;; `log-edit-strip-single-file-name'
;; `log-edit-changelog-full-paragraphs'
;; `log-edit-listfun'
;; `log-edit-diff-function'
;; `log-edit-maximum-comment-ring-size'
;; `log-edit-files-buf' ;<CONSTANT>
;;
;;
;; :ADD-LOG
;; `add-change-log-entry'
;; `change-log-default-name''
;; `add-log-always-start-new-record'
;; `add-log-keep-changes-together'

;; :DVC-DIFF
;; `dvc-diff-add-log-entry'
;; `dvc-diff-clear-buffers'
;; `dvc-file-ediff'
;; `dvc-dvc-file-diff'
;; `dvc-diff-log-single'
;; 
;; `dvc-add-log-entry'

;;
;; :DVC-LOG
;; `dvc-fileinfo-add-log-entry'
;; `dvc-fileinfo-add-log-entry-1'
;; `dvc-fileinfo-revert-files'
;; `dvc-log-edit-other-frame'  ; <VARIABLE>

;; :DVC-FILE                 ; :NOTE These appear to handle cl defstruct objects
;; dvc-current-file-list
;; dvc-fileinfo-file-status
;; dvc-fileinfo-all-files
;; dvc-fileinfo-current-file
;; dvc-fileinfo-path

;;
;; :DVC-REVERT-FUNCTIONS      <- BAD :SEE :FILE mon-keybindings.el
;; `bzr-dvc-revert-files'
;; `dvc-keyvec-revert' <- [85] :SEE :FILE dvc-ui.el
;; `dvc-key-revert'    <- 85  ;(char-to-string 85)
;;
;; `dvc-revert-files'   
;;  (where-is 'dvc-revert-files) 
;; => dvc-revert-files is on C-x V f R, <menu-bar> <tools> <DVC> <Revert Files>nil
;;

;;
;; `dvc-global-keymap'
;; (define-key map [?U] 'tla-undo) => C-x V U
;; (define-key map (dvc-prefix-file ?R) 'dvc-revert-files)
;;
;; `dvc-revert-some-buffers'
;; `dvc-fileinfo-revert-files'
;; `dvc-revert-some-buffers'
;; `bzr-dvc-revert-files'
;; `dvc-automatically-revert-buffers' => t

;; `dvc-keyvec-add' <- 97 
;; `dvc-key-add'    <- 97 
;;
;; (bzr-config-directory)
;; `vc-revert' => C-x v u
;;
;; `bzr-dvc-revert-files' (where-is 'bzr-dvc-revert-files)
;; `xhg-revert-files'     (where-is 'xhg-revert-files)
;;

;; (dvc-current-active-dvc) 

;; (custom-set-variables 
;;                       '(dvc-select-priority 
;; '(dvc-log-edit-other-frame t t));; 
;; :FILE dvc-defs.el
;; `dvc-select-priority' 
;; `dvc-prompt-active-dvc'
;; `dvc-registered-backends'         :NOTE macro `dvc-register-dvc' in dvc-register.el binds this.
;;
;;
;; :FILE dvc-register.el
;; `dvc-buffer-current-active-dvc'
;; `dvc-current-active-dvc'
;; `dvc-current-active-dvc-cache'  <- hashtable
;; `dvc-select-dvc'
;; `dvc-clear-dvc-cache'
;; `dvc-temp-current-active-dvc'   <- let-bound
;; `dvc-buffer-current-active-dvc' <- buffer-local
;;

;; dvc-bzr
;; `bzr-log-edit-done'
;; `bzr-log-edit-commit'
;; `bzr-log-edit-commit-local'
;; `bzr-config-directory'
;; `bzr-default-init-repository-directory'
;; `bzr-log-edit-file-name'
;; `bzr-dvc-revert-files'
;;
;; (directory-file-name (executable-find "bzr"))
;; (directory-file-name (file-name-directory (executable-find "bzr")))
;;
;;
;; (buffer-local-variables (get-buffer "*bzr-status*"))
;; (princ (buffer-local-variables (get-buffer "*bzr-status*")) (get-buffer "*scratch*"))
;;  => ( {...} (Revert File menu-item Revert File dvc-fileinfo-revert-files) {...} 
;;            (85 . dvc-fileinfo-revert-files) {...} 
;;           )
;;  {...}  
;;
;;; (buffer-local-value 'dvc-fileinfo-ewoc (get-buffer "*bzr-status*"))
;;; (princ (buffer-local-value 'dvc-fileinfo-ewoc (get-buffer "*bzr-status*")) (get-buffer "*scratch*"))
;; 
;;


;;; ==============================
;;; :NOTE Assumes the `DVC' package is loaded and present in current EMACS.
;;; :CREATED <Timestamp: #{2010-01-13T12:43:25-05:00Z}#{10023} - by MON KEY>
(defun mon-bzr-log-last (&optional log-last-n)
  "Read last n bzr logs in buffer's default-directory.\n
When optional arg LOG-LAST-N is non-nil read logs for the last N revisions.\n
:SEE-ALSO `*mon-hgignore-template*', `mon-insert-hgignore-template'.\n▶▶▶"
  (interactive "p")
  ;; (bzr-log "./"  log-last-n)
  (bzr-log default-directory (or log-last-n 1)))
;;
;;; :TEST-ME (mon-bzr-log-last)

;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-23T20:17:17-04:00Z}#{09436} - by MON KEY>
(defvar *mon-hgignore-template* 
  '(;; :GLOB-PATTERNS
    "syntax: glob"    
    ;; :COMPRESSED-ARCHIVES
    "**.7z"
    "**.bkf"
    "**.bz2"
    "**.cab"            ;; MS Cabinet
    "**.cpio"
    "**.dar" 
    "**.ecab" "**.ECAB" ;; MS Extended Cabinet
    "**.emz"            ;; Compressed `.emf' :SEE `.wmf' below.
    "**.ezip"           
    "**.gho"            ;; Norton Ghost
    "**.ghs"            ;; Norton Ghost
    "**.gz"
    "**.gzip"
    "**.iso"
    "**.lz"
    "**.lzh"
    "**.lzo"
    "**.lzma"
    "**.oxps"           ;; MS XML Paper archive
    "**.jar"
    "**.rz"
    "**.rar"
    "**.s7z"
    "**.shar"
    "**.sit"            ;; Stuffit
    "**.sitx"           ;; Stuffit
    "**.sqx"
    "**.tar"
    "**.tar.gz"
    "**.tbz2"
    "**.tgz"
    "**.tlz"
    "**.uca"
    "**.war"            ;; Jave Web Archive
    "**.wmz"            ;; Compressed `.wmf' :SEE `.wmf' below.
    "**.xar"            
    "**.xpi"            ;; Mozilla extension archive
    "**.xps"            ;; MS XML Paper archive
    "**.xz"
    "**.zip"
    "**.z"
    "**.Z"
    ;; :HEAVY-DOCUMENTS
    "**.doc"            ;; MS W0RD document
    "**.odm"            ;; OpenDocument Master
    "**.odt"            ;; OpenDocument text document
    "**.ott"            ;; OpenDocument template
    "**.rtf"
    ;; :FONTS
    "**.abf" "**.ABF"   ;; Adobe Binary Screen Font
    "**.afm" "**.AFM"   ;; Adobe Font Metrics
    "**.bdf" "**.BDF"   ;; Bitmap Distribution Format
    "**.bmf" "**.BMF"   ;; ByteMap Font
    "**.fnt" "**.FNT"   ;; Bitmapped Font Graphical Environment Manager
    "**.fon" "**.FON"   ;; Bitmapped Font MS Windoze
    "**.fond" "**.FOND" ;; Mac OS -Font Description Resource
    "**.otf" "**.OTF"   ;; OpenType Font
    "**.pcf" "**.PCF"   ;; Portable Compiled Font
    "**.pfa" "**.PFA"   ;; Adobe Printer Font Metrics
    "**.pfb" "**.PFB"   ;; Adobe Printer Font Metrics
    "**.pfm" "**.PFM"   ;; Adobe Printer Font Metrics
    "**.ttc" "**.TTC"   ;; TrueType Font
    "**.ttf" "**.TTF"   ;; TrueType Font
    "**.tfm" "**.TFM"   ;; TeX Font Metric
    ;; :WEB
    "**.asp"  
    "**.css"
    "**.hta"            ;; MS VBScript interface
    "**.htm"
    "**.html"
    "**.js"
    "**.jse"
    "**.jsp"
    "**.xht"
    "**.xhtml"
    "**.wsc"            ;; MS VBScript Windoz Script Component 
    ;; :PAGE-DESCRIPTON
    "**.chm"
    "**.ps"
    "**.dvi"
    "**.pdf"
    ;; :IMAGES-GRAPHICS
    "**.eps"            ;; Encapsulated Postscript
    "**.ppt"            
    "**.bmp"            
    "**.emf"            ;; Enhanced MS Windoze MetaFile :SEE `.wmf' below.
    "**.gif" "**.GIF"
    "**.ico"
    "**.jpg"
    "**.jpeg"
    "**.pbm"
    "**.png"
    "**.psd"
    "**.svg"
    "**.tif"
    "**.tiff"
    "**.wmf" ;; MS Windz Meta File - Potential target of trojan fishing attacks.
             ;; :SEE (URL `http://www.f-secure.com/weblog/archives/00000779.html')
    "**.xbm"
    "**.xpm"
    ;; :EXEC-SCRIPT-SUSPECT
    "**.com" "**.COM"  ;; MS 
    "**.dll" "**.DLL"
    "**.exe" "**.EXE"
    "**.last"
    "**.msi"            ;; MS installer
    "**.reg" "**.REG"   ;; MS registry
    "**.vbs"            ;; MS VBScript
    "**.vbe"            ;; MS VBScript
    "**.wsf"            ;; MS VBScript
    ;; :EMACS
    "**.elc"
    "**.nosearch"
    "#TAGS#"
    ;; :MISC-MON
    "**.naf~"
    ;; :REGEXP-PATTERNS
    "syntax: regexp"
    "(.*\\~\\)"         ;; Escaped for Elisp -> (.*\~\)
    "(.*\\#\\)")        ;; Escaped for Elisp -> (.*\#\)
  "*List of glob and regexp string patterns for use with .hgignore files.\n
Patterns match on commonly encountered file formats including:\n
   o Commpressed file formats;
   o Image and graphics formats;
   o HTML related formats;
   o Encoded Document formats;
   o Page Description formats;
   o Font enoding formats;
   o Executables and 'unsafe' scripting extensions;
   o Emacs specific extensions and suffixes:
     o Files suffixed with `~' and `#';
     o .nosearch and #TAGS# files;
     o .elc files;\n
:NOTE As this list is broadly scoped it should be manually reviewed when
inserted from a calling function or command as it could prevent files from being
tracked with hg. The source is commented with rationale for inclusion of some
format and includes extension mappings to the full format name/spec where this
may be unclear or forgotten.\n
:CALLED-BY `mon-insert-hgignore-template'.\n▶▶▶")
;;
;;; :TEST-ME *mon-hgignore-template* 
;;; (progn (makunbound '*mon-hgignore-template*)
;;;         (unintern '*mon-hgignore-template*) )


;;; ==============================
;;; :CREATED <Timestamp: #{2009-10-23T16:06:04-04:00Z}#{09435} - by MON KEY>
;;;###autoload
(defun mon-insert-hgignore-template (&optional insrtp intrp)
  "Insert MON standard list of patterns for .hgignore files.
When INSERTP is non-nil or called-interactively insert at point.
Does not move point.\n
Patterns consist primarily of file extensions in glob and regexp formats.
Patterns held as a list of strings by:
:VARIABLE `*mon-hgignore-template*'\n
:EXAMPLE\n
\(momentary-string-display \(mon-insert-hgignore-template\) (1+ \(point\)\))\n
:SEE-ALSO `mon-bzr-log-last'.\n▶▶▶"
  (interactive "i\np")
  (let ((hgignr (mapconcat 'identity *mon-hgignore-template* "\n")))
    (if (or insrtp intrp)
        (save-excursion (newline)(princ hgignr (current-buffer)))
        hgignr)))
;;
;;; :TEST-ME (mon-insert-hgignore-template)

;;; ==============================
(provide 'mon-bzr-utils)
;;; ==============================


;; Local Variables:
;; generated-autoload-file: "./mon-loaddefs.el"
;; mode: EMACS-LISP
;; coding: utf-8
;; End:

;;; ================================================================
;;; mon-bzr-utils.el ends here
;;; EOF
