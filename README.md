# Emacs configs and utilities I've authored

You can clone MON with:

 shell> git clone https://github.com/monkpearman/mon-emacs.git

# :MON-PACKAGES

Following is organized roughly according to the load order.

# :MON-STARTUP-FILES

* monDOTemacs.el --
  Points to a local directory and for loading mon-site-local-defaults.el

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/.emacs

* mon-site-local-defaults.el -- 
  An example configuration of MON's `site-local-private.el' which acts
  as a bootstrap for mon-default-loads and helps to obfuscate
  information which needn't be revealed other packages.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/mon-site-local-default-loads.el

* mon-default-loads.el -- 
  Setup the globals and base system portability.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/mon-default-loads.el

* mon-default-start-loads.el -- 
  Setup any Emacs and Third party packages required.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/mon-default-start-loads.el

* mon-w32-load.el -- 
  Provides w32 specific features which must be present or are better
  left segregated.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/mon-w32-load.el

* mon-GNU-load.el -- 
  GNU/Linux specific features. Mostly for quick reconfiguration of
  Slime related stuff prior to slime-loads.el

* slime-loads.el --
  Slime is a moving target with multiple backends for multiple
  languages. This is for sanity.

* slime-loads-GNU-clbuild.el -- 
  MON's Slime related extensions.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/slime-loads-GNU-clbuild.el

* mon-keybindings.el --
  Provides MON prefered keybindings and mode specific stuff.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/mon-keybindings.el

* mon-post-load-hooks.el -- 
  Provides functions to evaluate after initializing MON Emacsen.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/mon-post-load-hooks.el

#  :MON-UTILS

The package mon-utils is the entry point which loads the rest of the
system and specifically any mon-*.el and naf-mode-*.el packages.

* mon-utils.el -- (MonUtils) 
  This package is the entry point that loads everything else below.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-utils.el

* mon-text-property-utils.el --
  Provides functions for working with and manipulating text properties
  and overlays.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-text-property-utils.el

* mon-error-utils.el --
  Provides extensions for conditions and error handling.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-error-utils.el

* mon-alphabet-list-utils.el --
  Provides list generation function which returns alphabetic sequences
  in various formats.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-alphabet-list-utils.el

* mon-aliases.el --
  Provides single consolidated file for def(var)aliases across MON packages.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-aliases.el

* mon-dir-locals-alist.el --
  MON global vars bound to commonly used local-site paths.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-dir-locals-alist.el

* mon-dir-utils.el -- 
  Provides a collection of handy functions and interactive commands
  for working with directories and files.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-dir-utils.el

* mon-dir-utils-local.el --
  Provides functions for working with directories and files mostly
  specific to MON systems.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-dir-utils-local.el

* mon-insertion-utils.el --
  Provides insertion related utilities, templates and string
  building/manipulation procedures that ease routine chores and
  interactive command invocation.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-insertion-utils.el

* mon-replacement-utils.el --
  Provides a collection of routines and commands and abstracts some
  commonly encountered procedures for processing regexps with their
  replacements.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-replacement-utils.el

* mon-regexp-symbols.el --
  Provides a collection of Symbols bound to lisp lists of
  regexp/replacement pairs. Allows simple easy interactive command
  invocation using symbols as arguments to containing lists of regexps.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-regexp-symbols.el

* mon-time-utils.el -- (EbayTime)
  Provides procedures for frobbing time.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-time-utils.el

* mon-testme-utils.el --
  Provides `mon-*' tests and template for inserting them

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-testme-utils.el

* mon-plist-utils.el --
  Provides procedures for frobbing plist-like seqs

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-plist-utils.el

* mon-macs.el --
  Provides macros.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-macs.el

* mon-type-utils.el --
  Provides procedures useful for interrogating lisp objects.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-type-utils.el

* mon-type-utils-vars.el --
  Provides variables useful for interrogating lisp objects.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-type-utils-vars.el

* mon-window-utils.el --
  Provides window related procedures.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-window-utils.el

* mon-word-syntax-utils.el --
  Provides procedures for counting things with word syntax.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-word-syntax-utils.el

* mon-buffer-utils.el --
  Provides buffer related procedures.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-buffer-utils.el

* mon-event-utils.el --
  Provides event related procedures.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-event-utils.el

* mon-line-utils.el --
  Provides line centric procedures.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-line-utils.el

* mon-region-utils.el --
  Provides region oriented procedures.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-region-utils.el

* mon-seq-utils.el --
  Provides procedures for frobbing sequences.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-seq-utils.el

* mon-string-utils.el -- 
  Provides string frobbing procedures.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-string-utils.el

* mon-env-proc-utils.el --
  Provides procedures for interacting w/ process environment.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-env-proc-utils.el

* mon-randomize-utils.el --
  Provides procedures for generating pseudo randomness.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-randomize-utils.ell

* mon-rectangle-utils.el --
  Provides procedures for manipulating rectangles.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-rectangle-utils.el

* mon-button-utils.el --
  Provides utilities for examining button properties.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-button-utils.el

* mon-cl-compat.el -- 
  This is intended to be used as a drop-in replacement for the
  cl-seq.el When compiling your packages: 
   (eval-when-compile (require 'mon-cl-compat))

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-cl-compat.el

* mon-cl-compat-regexps.el -- 
  Provides regular expressions for replacing the symbol-names from the
  cl-seq.el package with a `cl::' prefix

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-cl-compat-regexps.el

* mon-empty-registers.el (EmptyRegisters) -- 
  Provides utilities for filling/emptying register locations en
  masse. Also provides interactive tools for register centric
  coercion, manipulation, round-tripping of chars, strings, etc.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-empty-registers.el

* mon-hash-utils.el --
  Provides a collection of procedures to extend Emacs lisp hash table functionality.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-hash-utils.el

* mon-name-utils.el --
  Provides procedures to rotate, combine, and permute string-like name forms.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-name-utils.el

* mon-image-utils.el --
  Provides procedures for interfacing with image manipulation processes.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-image-utils.el

* mon-rename-image-utils.el (RenameImageUtils) -- 
  Provides utility functions for working with images and EmacsImageManipulation.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-rename-image-utils.el

* mon-boxcutter.el -- 
  For initializing w32 screen captures from Emacs using Matthew
  D. Rasmussen's Boxcutter screen-capture executables:
  boxcutter-fs.exe and boxcutter.exe

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-boxcutter.el

* mon-color-utils.el --
  Provides an assembled set of routines for manipulations/examinations
  of 'color'.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-color-utils.el

* mon-mysql-utils.el (MySqlHelp) -- 
  Provides interactive procedures for stripping content from MySQL
  query result tables.  Also, provides an alist of MySQL help
  categories and topics and a rudimentary completion functionality for
  accessing MySQL's `mysql' client help facility.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-mysql-utils.el

* mon-url-utils.el --
  Provides utilities for interactively calling URL data lookups and
  for in buffer modification of web/internet scrapes.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-url-utils.el

* mon-jg-directory-creator.el -- 
  Provides utils for massive directory hierarchy creation.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-jg-directory-creator.el

* mon-wget-utils.el -- 
  Provides lightweight routines for pulling files with wget.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-wget-utils.el

* mon-get-freenode-lisp-logs --
  Pull freenode logs for #lisp with wget.
  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-get-freenode-lisp-logs

* mon-cifs-utils.el -- (MonCifsUtils) 
  Provides utilities for mapping and mounting a CIFS domain using
  auth-source. Common Internet File System protocol, e.g. successor to
  the SMB (Server Message Block) protocol with the Samba Server.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-cifs-utils.el

* mon-tramp-utils.el --
  Provides cross platform utilities for working with tramp. This
  package should be compatible with both GNU/LINUX and w32 systems and
  helps MON with Emacs portability across environments.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-tramp-utils.el

* google-define-redux.el --
  Extends google-define.el

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/google-define-redux.el

* mon-color-occur.el --
  A patched version of Matsushita Akihisa's color-cccur.el 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-color-occur.el

* mon-css-check.el -- 
  This is Niels Giss css-check.el with MON documentation features and
  minor changes.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-css-check.el

* mon-css-color.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-css-color.el

* mon-css-complete.el --
  This is a highly modified version of Niels Giesen's css-complete.el

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-css-complete.el

* mon-drive-transfer-utils.el --
  Template builder for transferring backing up large hard-drives.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-drive-transfer-utils.el

* mon-doc-help-utils.el -- (ReferenceSheetHelpUtils) (MonDocHelpUtilsDictionary)

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-utils.el

* mon-doc-help-char-encoding-lossage.el --
  Show lossage across encoding points

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-char-encoding-lossage.el

* mon-doc-help-css.el --
  Extends mon-doc-help-utils.el with CSS related docs

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-css.el

* mon-doc-help-mail.el --
  Extends mon-doc-help-utils package with mail xrefs.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-mail.el

* mon-doc-help-pacman.el --
  Some help functions for using the package manager with the GNU/Linux
  Arch distribution.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-pacman.el

* mon-doc-help-tidy.el --
  Extends mon-doc-help-utils.el package with HTML Tidy docs.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-tidy.el

* mon-doc-help-CL.el --
  Some Emacs Lisp help functions for using Common-Lisp functions (loop, do, etc.)

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-CL.el

* mon-doc-help-proprietary.el --
  Extends mon-doc-help-utils with ms w32 related docs.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-doc-help-proprietary.el

* mon-iptables-regexps.el --
  Provides interactive utilities for converting iptables short flags
  to long flags.  Also provides procedures for using Emacs help-mode
  to document the order of position for the symbols, flags, etc. used
  with `iptables' AKA `netfilter'.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-iptables-regexps.el

* mon-iptables-vars.el --
  Provides gigantic alist `*mon-iptables-alst*' needed for use with
  mon-iptables-regexps.el

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/mon-iptables-vars.el

* perlisisms.el (Perlisisms) -- 

* STING-software-engineering-glossary.el --

* ebay-template-mode.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/ebay-template-mode/ebay-template-mode.el

* ebay-template-tools.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/ebay-template-mode/ebay-template-tools.el


#  :NAF-MODE

* naf-mode.el -- 
  naf-mode is a major mode for editing NAFs (Name Authority
  Files). naf-mode provides utilities for working with and unifying
  authority records of various public accessible datasets LOC, BNF,
  ULAN, OCLC, Wikipedia, IMDB, etc. This package provides the core
  naf-mode facilities and require statements for loading the other
  naf-mode-*.el packages below.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode.el

* naf-mode-faces.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-faces.el

* naf-mode-insertion-utils.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-insertion-utils.el

* naf-mode-replacements.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-replacements.el

* naf-mode-classes.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-classes.el

* naf-mode-db-fields.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-db-fields.el

* naf-mode-db-flags.el --
  keyword lists and regexps for font-locking in `naf-mode'

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-db-flags.el

* naf-mode-dates.el --
  regexp variables for matching dates in `naf-mode' Name Authority files

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-dates.el

* naf-mode-french-months.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-french-months.el

* naf-mode-nation-english.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-nation-english.el

* naf-mode-nation-french.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-nation-french.el

* naf-mode-nationality-english.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-nationality-english.el

* naf-mode-nationality-french.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-nationality-french.el

* naf-mode-intnl-city-names.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-intnl-city-names.el

* naf-mode-city-names-us.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-city-names-us.el

* naf-mode-state-names.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-state-names.el

* naf-mode-regions.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-regions.el

* naf-mode-publications-periodicals-english.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-publications-periodicals-english.el

* naf-mode-publications-periodicals-french.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-publications-periodicals-french.el

* naf-mode-publications-periodicals-intnl.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-publications-periodicals-intnl.el

* naf-mode-institution.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-institution.el

* naf-mode-students-of-julian.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-students-of-julian.el

* naf-mode-events.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-events.el

* naf-mode-english-roles.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-english-roles.el

* naf-mode-french-roles.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-french-roles.el

* naf-mode-awards-prizes.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-awards-prizes.el

* naf-mode-group-period-styles.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-group-period-styles.el

* naf-mode-art-keywords.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-art-keywords.el

* naf-mode-benezit-flags.el -- 

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-benezit-flags.el

* naf-mode-ulan-utils.el --
  Provides utility procedures for converting ULAN data for naf-mode.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-ulan-utils.el

* naf-mode-xrefs.el -- 
  Provides xrefing variable list of corelated naf-mode symbols.

  :SEE https://github.com/monkpearman/mon-emacs/raw/master/emacs-load-files/naf-mode/naf-mode-xrefs.el

 =

/s_P\
