;;; mon-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:

;;;***

;;;### (autoloads (mon-help-w32-functions mon-index-elisp-symbol
;;;;;;  mon-help-format-width mon-help-unix-commands mon-help-permissions
;;;;;;  mon-help-crontab mon-help-hg-archive mon-help-install-info-incantation
;;;;;;  mon-help-rename-incantation mon-help-tar-incantation mon-help-info-incantation
;;;;;;  mon-help-bookmark-functions mon-help-mon-time-functions mon-help-time-functions
;;;;;;  mon-help-iso-8601 mon-help-nclose-functions mon-help-ipv4-header
;;;;;;  mon-help-byte-compile-functions mon-help-symbol-functions
;;;;;;  mon-help-binary-representation mon-help-char-raw-bytes mon-help-char-representation
;;;;;;  mon-help-char-logic mon-help-diacritics mon-help-char-ecma-35
;;;;;;  mon-help-char-ecma-48 mon-help-char-iso-8859-1 mon-help-char-ascii
;;;;;;  mon-help-char-composition mon-help-char-unidata-table mon-help-display-table-functions
;;;;;;  mon-help-char-table-functions mon-help-char-coding-functions
;;;;;;  mon-help-char-charset-functions mon-help-char-functions mon-help-custom-keywords
;;;;;;  mon-help-widgets mon-help-easy-menu mon-help-color-chart
;;;;;;  mon-help-color-functions mon-help-text-property-functions-ext
;;;;;;  mon-help-text-property-stickyness mon-help-text-property-properties
;;;;;;  mon-help-text-property-functions mon-help-overlay-functions
;;;;;;  mon-help-font-lock mon-help-font-lock-functions mon-help-faces-font-lock
;;;;;;  mon-help-faces-basic mon-help-faces mon-help-faces-themes
;;;;;;  mon-help-plist-properties mon-help-plist-functions mon-help-hash-functions
;;;;;;  mon-help-marker-functions mon-help-print-functions mon-help-read-functions
;;;;;;  mon-help-load-functions mon-help-key-functions mon-help-sequence-functions
;;;;;;  mon-help-predicate-functions mon-help-type-predicates mon-help-eieio-methods
;;;;;;  mon-help-eieio-functions mon-help-eieio-defclass mon-help-xml-functions
;;;;;;  mon-help-mode-functions mon-help-window-functions mon-help-frame-functions
;;;;;;  mon-help-buffer-functions mon-help-inhibit-functions mon-help-server-functions
;;;;;;  mon-help-make-network-process mon-help-process-functions
;;;;;;  mon-help-file-dir-functions-usage mon-help-file-dir-functions
;;;;;;  mon-help-hooks mon-help-search-functions mon-help-syntax-functions
;;;;;;  mon-help-syntax-class mon-help-regexp-syntax mon-help-package-keywords
;;;;;;  mon-help-emacs-introspect mon-help-ebay-template-mode mon-help-mon-functions
;;;;;;  mon-help-mon-help mon-help-help-functions) "mon-doc-help-utils"
;;;;;;  "mon-doc-help-utils.el" "7949a1b0d8c1590fb96bda9efc84559c")
;;; Generated autoloads from mon-doc-help-utils.el

(autoload 'mon-help-help-functions "mon-doc-help-utils" "\
List of functions and vars from the help packages.

;; :HELP-FUNCTIONS-MODE
`help-mode-setup'
`help-mode-finish'
`help-buffer'

;; :HELP-FUNCTIONS-HELP
`with-help-window'      ;<MACRO>

;; :HELP-FUNCTONS-FNS
`describe-function'
`describe-function-1'
`doc-file-to-man'
`doc-file-to-info'
`help-split-fundoc'
`help-add-fundoc-usage'
`help-function-arglist'
`help-make-usage'
`help-C-file-name'
`help-highlight-arg'
`help-do-arg-highlight'
`help-highlight-arguments'
`find-lisp-object-file-name'
`variable-at-point'
`describe-variable-custom-version-info'
`describe-variable'
`describe-syntax'
`describe-vector'
`internal-describe-syntax-value'
`help-describe-category-set'

;; :HELP-FUNCTIONS-KEYS
`where-is'
`where-is-internal'
`substitute-command-keys'
`describe-bindings'
`describe-bindings-internal'
`describe-buffer-bindings'
;; :HELP-FUNCTIONS
`documentation'
`documentation-property'
`describe-buffer-case-table'
;; :HELP-FUNCTIONS-APROPOS
`apropos-command'
`apropos-value'
`apropos-variable'
`apropos-library'
`apropos-documentation'
`apropos-documentation-check-doc-file'
`apropos-documentation-check-elc-file'
`apropos-safe-documentation'
`apropos-documentation-property'
`apropos-format-plist'
`apropos-symbol-button-display-help'
`apropos-internal'          ;; :NOTE This is `mapatoms' with a regexp test on symbol-name. 
                            ;; Its PREDICATE arg is similiar to the FUNCTION arg of mapatoms 
                            ;; However, it is hardwired to only grovel `obarray'.
                            ;; For example, following are the call sequences:
                            ;; `apropos-internal'
                            ;; map_obarray (Vobarray, apropos_accum, regexp);
                            ;; apropos_accum ---> call1 (apropos_predicate, symbol);
                            ;; `mapatoms' 
                            ;; map_obarray (obarray, mapatoms_1, function);
                            ;; mapatoms_1   ---> call1 (function, sym);
`apropos-symbols-internal'
`apropos-value-internal'
`apropos-documentation-internal'

;; :HELP-VARIABLES-FNS
`help-downcase-arguments'

;; :HELP-VARIABLES
`internal-doc-file-name'
`doc-directory'
`help-window'
`help-window-select'  ; [ never | other | always ]
`help-window-point-marker'

:FILE help.el help-mode.el help-fns.el help-macro.el 
:SEE-ALSO `mon-help-mon-help'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-mon-help "mon-doc-help-utils" "\
Help `mon-help-*' to help you find help references. Why not! :).

;; :MON-DOC-FUNCTION-LISTS
`mon-help-bookmark-functions'
`mon-help-buffer-functions'
`mon-help-ebay-template-mode'
`mon-help-emacs-introspect'
`mon-help-file-dir-functions'
`mon-help-file-dir-functions-usage'
`mon-help-frame-functions'
`mon-help-help-functions'
`mon-help-inhibit-functions'
`mon-help-mon-functions'
`mon-help-mon-help'
`mon-help-hooks'
`mon-help-plist-functions'
`mon-help-plist-properties'
`mon-help-print-functions'
`mon-help-mail'
`mon-help-mode-functions'
`mon-help-make-network-process'
`mon-help-process-functions'
`mon-help-sequence-functions'
`mon-help-server-functions'
`mon-help-symbol-functions'
`mon-help-byte-code-vector-symbols'
`mon-help-type-predicates'
`mon-help-predicate-functions'
`mon-help-read-functions'
`mon-help-window-functions'
`mon-help-xml-functions'

;; :MON-DOC-SEARCHING
`mon-help-search-functions'
`mon-help-regexp-syntax'
`mon-help-syntax-class'
`mon-help-syntax-functions'

;; :MON-DOC-HELP
`mon-help-buffer-spc-*DOC*'
`mon-tags-apropos'
`mon-tags-naf-apropos'
`mon-help-package-keywords'

;; :MON-DOC-TIME
`mon-help-iso-8601'

`mon-help-CL-local-time'
`mon-help-CL-time'
`mon-help-time-functions'
`mon-help-mon-time-functions'

;; :MON-DOC-EIEIO
`mon-help-eieio-defclass'
`mon-help-eieio-functions'
`mon-help-eieio-methods'

;; :MON-DOC-CL                            ; :SEE :FILE mon-doc-help-CL.el
`mon-help-CL-arrays'
`mon-help-CL-bit-byte-bool-logic'
`mon-help-CL-chars'
`mon-help-CL-conses'
`mon-help-CL-control-flow'
`mon-help-CL-do'
`mon-help-CL-environment'
`mon-help-CL-error-condition-restart'
`mon-help-CL-eval-compile'
`mon-help-CL-file-dir-functions'
`mon-help-CL-hash-tables'
`mon-help-CL-intern-symbol'
`mon-help-CL-iteration'
`mon-help-CL-lispdoc'
`mon-help-CL-load-compile'
`mon-help-CL-local-time'
`mon-help-CL-loop'
`mon-help-CL-minion'
`mon-help-CL-numbers'
`mon-help-CL-object-CLOS'
`mon-help-CL-package-functions'
`mon-help-CL-pkgs'
`mon-help-CL-print'
`mon-help-CL-reader'
`mon-help-CL-sequence-predicates'
`mon-help-CL-sequences'
`mon-help-CL-sharpsign-syntax'
`mon-help-CL-slime-keys'
`mon-help-CL-stream-keywords'
`mon-help-CL-stream-keywords'
`mon-help-CL-streams'
`mon-help-CL-strings'
`mon-help-CL-structures'
`mon-help-CL-swank-functions'
`mon-help-CL-symbols'
`mon-help-CL-time'

;; :MON-DOC-CSS-HTML
`mon-help-css-color'
`mon-help-css-mode'
`mon-help-css-complete'
`mon-help-css-check'
`mon-help-css-properties'
`mon-help-tidy'

;; :MON-DOC-ASCII-ART
`mon-help-color-chart'
`mon-help-easy-menu'
`mon-help-font-lock'
`mon-help-ipv4-header'
`mon-help-widgets'

;; :MON-DOC-PRESENTATION
`mon-help-custom-keywords'
`mon-help-color-functions'
`mon-help-faces'
`mon-help-faces-basic'
`mon-help-faces-themes'
`mon-help-faces-font-lock'
`mon-help-font-lock'
`mon-help-font-lock-functions'
`mon-help-overlay-functions'
`mon-help-text-property-functions'
`mon-help-text-property-properties'
`mon-help-text-property-functions-ext'
`mon-help-text-property-stickyness'

;; :MON-DOC-KEYS
`mon-help-key-functions'
`mon-help-keys'
`mon-help-CL-slime-keys'

;; :MON-DOC-CHAR-TABLES
`mon-help-binary-representation'
`mon-help-char-functions'
`mon-help-char-representation'
`mon-help-char-composition',
`mon-help-char-raw-bytes'
`mon-help-char-unidata-table'
`mon-help-diacritics'
`mon-help-char-ascii'
`mon-help-char-iso-8859-1'
`mon-help-char-ecma-35'
`mon-help-char-ecma-48'

;; :MON-DOC-EXTERNAL
`mon-help-crontab'
`mon-help-du-incantation'
`mon-help-format-width'
`mon-help-hg-archive'
`mon-help-info-incantation'
`mon-help-install-info-incantation'
`mon-help-pacman-Q'
`mon-help-permissions'
`mon-help-rename-incantation'
`mon-help-tar-incantation'
`mon-help-unix-commands'

;; :MON-DOC-INTROSPECTION-AND-UTILITY
`mon-help-w32-env'
`mon-index-elisp-symbol'
`mon-help-function-args'
`mon-help-parse-interactive-spec'
`mon-help-xref-symbol-value'
`mon-help-swap-var-doc-const-val'
`mon-help-function-spit-doc'
`mon-help-insert-documentation'
`mon-help-permanent-locals-find'
`mon-insert-doc-help-tail'
`mon-insert-doc-help-cookie'
`mon-help-utils-loadtime'
`mon-help-escape-for-ewiki'
`mon-help-unescape-for-ewiki'

;; :MON-DOC-FACES
`mon-help-PNTR-tag'
`mon-help-DYNATAB-tag'
`mon-help-DYNATAB-tag'
`mon-help-KEY-tag'
`mon-help-COMMENT-TAG'
`mon-help-META-tag'
`mon-help-URL-wrap-tag'
`mon-help-BUILTIN-tag'
`mon-help-BUILTIN-tag'
`mon-help-INNER-KEY-tag'
`mon-help-OLAY-RESULT'
`mon-help-OLAY-RESULT-string-show'
`mon-help-OLAY-RESULT-match-show'

;; :MON-DOC-GROUPS


;; :MON-DOC-VARIABLES
`*mon-doc-cookie*'
`*mon-help-interactive-spec-alist*'
`*mon-iptables-alst*'
`*mon-help-reference-keys*'
`*mon-help-side-effect-free*'
`*mon-help-side-effect-and-error-free*'
`*mon-help-pure-functions*'
`*mon-help-permanent-locals*'
`*mon-help-subrs*'
`*mon-help-byte-optimizer-vals*'
`*regexp-mon-doc-help-docstring-tags-DYNAMIC*'
`*regexp-mon-doc-help-docstring-tags-TABLES*'
`*regexp-mon-doc-help-docstring-tags*'
`*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-pointer-tags*'
`*regexp-mon-doc-help-meta-tags*'
`*regexp-clean-du-flags*'
`*regexp-symbol-defs*'
`*regexp-clean-pacman-Q*'
`*w32-env-variables-alist*'

:ALIASED-BY `mon-help-reference-sheet'

:SEE-ALSO `mon-help-mon-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-mon-functions "mon-doc-help-utils" "\
Incomplete list of MON functions and their related variables.

;; :MON-FUNCTIONS-BUFFER
`mon-g2be'
`mon-get-buffer-hidden'
`mon-buffer-exists-so-kill'
`mon-print-in-buffer-if-p'
`mon-buffer-written-p'
`mon-buffer-exists-p'
`mon-buffer-name->kill-ring'
`mon-with-file-buffer'
`mon-get-proc-buffers-directories'
`mon-get-buffers-directories'
`mon-get-buffer-parent-dir'
`mon-get-buffer-w-mode'
`mon-get-new-buffer-w-stamp'
`mon-string-split-buffer-name'
`mon-string-split-buffer-parent-dir'
`mon-buffer-get-shell'
`mon-buffer-make-shell'
`mon-buffer-get-scratch'
`mon-print-buffer-object-readably'
`mon-with-inhibit-buffer-read-only'
`mon-with-buffer-undo-disabled'
`mon-buffer-get-mesages'
`mon-kill-completions'
`mon-buffer-narrowed-p'
`mon-buffer-sub-no-prop'
`mon-buffer-sub-no-prop-check'
`mon-get-buffer-window-if'

;; :MON-FUNCTIONS-CHARS
`mon-decode-coding-region-utf-8-unix'
`mon-word-count-chars-region'
`mon-char-code'

;; :MON-FUNCTIONS-COLUMN
`mon-indent-lines-from-to-col'
`mon-line-strings-pipe-to-col'
`mon-string-fill-to-col'
`mon-comment-lisp-to-col'
`mon-mysql-cln-pipes-map-col-field'
`mon-mysql-csv-map-col-field'
`mon-mysql-get-field-col'
`mon-rectangle-columns'
`mon-rectangle-sum-column'
`mon-show-columns'

;; :MON-FUNCTIONS-RECTANGLE
`mon-rectangle-apply-on-region-points'
`mon-rectangle-capitalize'
`mon-rectangle-columns'
`mon-rectangle-downcase'
`mon-rectangle-operate-on'
`mon-rectangle-sum-column'
`mon-rectangle-upcase'

;; :MON-FUNCTIONS-LINE
`mon-line-bol-is-eol'
`mon-line-count-matchp'
`mon-line-count-region'
`mon-line-count-buffer'
`mon-line-dolines'
`mon-line-move-n'
`mon-line-drop-in-words'
`mon-line-end-or-code-end'
`mon-line-eol-is-eob'
`mon-line-find-duplicates'
`mon-line-get-next'
`mon-line-indent-from-to-col'
`mon-line-length-max'
`mon-line-next-bol-is-eol'
`mon-line-number-region-incr'
`mon-line-previous-bol-is-eol'
`mon-line-string-insert-chars-under'
`mon-line-string-rotate-name'
`mon-line-string-rotate-namestrings'
`mon-line-string-rotate-namestrings-combine'
`mon-line-string-unrotate-namestrings'
`mon-line-strings'
`mon-line-strings-bq-qt-sym-bol'
`mon-line-strings-indent-to-col'
`mon-line-strings-one-list'
`mon-line-strings-pipe-bol'
`mon-line-strings-qt-region'
`mon-line-strings-region'
`mon-line-strings-to-list'
`mon-line-test-content'
`mon-toggle-truncate-line'

;; :MON-FUNCTIONS-STRING
`mon-string-spread'
`mon-region-split-commas'
`mon-string->strings-splice-sep'
`mon-string->symbol'
`mon-string-after-index'
`mon-string-alpha-list'
`mon-string-chop-spaces'
`mon-string-combine-and-quote'
`mon-string-csv-regexp'
`mon-string-csv-rotate'
`mon-string-fill-to-col'
`mon-string-from-hex-list'
`mon-string-from-sequence'
`mon-string-from-symbol'
`mon-string-has-suffix'
`mon-string-ify-current-line'
`mon-string-ify-list'
`mon-string-incr'
`mon-string-incr-padded'
`mon-string-index'
`mon-string-infix'
`mon-string-insert-string-at-idx'
`mon-string-justify-left'
`mon-string-or-null-and-zerop'
`mon-string-permute'
`mon-string-permute-line'
`mon-string-position'
`mon-string-read-match-string'
`mon-string-repeat'
`mon-string-replace-char'
`mon-string-rotate-name'
`mon-string-rotate-to-regexp'
`mon-string-set-char-at-idx'
`mon-string-sort-descending'
`mon-string-split-dir-recurse'
`mon-string-splice-sep'
`mon-string-split-and-unquote'
`mon-string-split-line'
`mon-string-split-on-regexp'
`mon-string-sub-old->new'
`mon-string-to-hex-list'
`mon-string-to-hex-string'
`mon-string-to-regexp'
`mon-string-to-sequence'
`mon-string-to-symbol'
`mon-string-upto-index'
`mon-string-wonkify'
`mon-string-canonical'

;; :MON-FUNCTIONS-LIST
`mon-assoc-replace'
`mon-combine'
`mon-deleql-dups'
`mon-delete-if'
`mon-delete-first'
`mon-delq-cons'
`mon-delq-dups'
`mon-elt-<'
`mon-elt-<elt'
`mon-elt->'
`mon-elt->elt'
`mon-flatten'
`mon-intersection'
`mon-list-last'
`mon-list-make-unique'
`mon-list-match-tails'
`mon-list-match-tails'
`mon-list-proper-p'
`mon-list-reorder'
`mon-list-nshuffle'
`mon-list-shuffle-safe'
`mon-maybe-cons'
`mon-mismatch'
`mon-moveq'
`mon-list-merge'
`mon-list-add-non-nil'
`mon-recursive-apply'
`mon-remove-dups'
`mon-remove-if'
`mon-sublist'
`mon-subseq'
`mon-sublist-gutted'
`mon-transpose'
`mon-list-proper-p'
`mon-list-filter'

;; :MON-FUNCTIONS-LIST-MAP
`mon-map1'
`mon-mapl'
`mon-maplist'
`mon-mapcar'
`mon-mapcan',
`mon-mapcon'
`mon-map-append'
`mon-maptree'
`mon-mapcar-mac'

;; MON-FUNCTION-ITERATORS
`mon-foreach'
`mon-for'
`mon-for-step'
`mon-loop'

;; :MON-FUNCTIONS-PLIST
`mon-alphabet-as-type'
`mon-help-permanent-locals-find'
`mon-plist-remove!'
`mon-plist-keys'
`mon-plist-remove-if'
`mon-map-obarray-symbol-plist-props'
`mon-plist-remove-consing'

:MON-FUNCTIONS-BIT-BYTE-BOOL
`mon-get-bit-table'
`mon-booleanp'
`mon-booleanp-to-binary'
`mon-one-or-zerop'
`mon-bool-vector-pp'

;; :MON-FUNCTIONS-VECTOR
`mon-nshuffle-vector'

;; :MON-FUNCTIONS-HASHTABLE
`mon-insert-naf-mode-faces-as-displayed'
`mon-hash-add-uniquify'
`mon-hash-all-keys'
`mon-hash-all-values'
`mon-hash-describe'
`mon-hash-describe-descend'
`mon-hash-get-items'
`mon-hash-get-keys'
`mon-hash-get-string-keys'
`mon-hash-get-symbol-keys'
`mon-hash-get-values'
`mon-hash-has-key'
`mon-dir-hash-images'
`mon-hash-make-size'
`mon-hash-put-CL'
`mon-hash-readlines-buffer'
`mon-hash-readlines-file'
`mon-hash-table-complete'
`mon-hash-to-list'
`mon-hash<-vector'

;; :MON-FUNCTIONS-RANDOMIZE
`mon-generate-prand-id'
`mon-generate-prand-seed'
`mon-string-wonkify'
`mon-make-random-state'
`mon-next-almost-prime'
`mon-gensym-counter-randomizer'

;; :MON-FUNCTIONS-SYMBOL-CREATE
`mon-quote-sexp'
`mon-with-gensyms'
`mon-gensym'
`defparameter'
`defconstant'
`mon-string-from-symbol'
`mon-symbol-to-string'

;; :MON-FUNCTIONS-SYMBOL-INSPECT
`mon-booleanp'
`mon-recover-nil-t-default-plist'
`mon-function-object-p'
`mon-macrop'

;; :MON-FUNCTIONS-ENVIRONMENT
`mon-get-env-vars-strings'
`mon-get-env-vars-symbols'
`mon-get-env-vars-emacs'
`mon-get-system-specs'
`mon-insert-system-type-cond'
`mon-help-emacs-introspect'

;; :MON-FUNCTIONS-FRAME
`mon-frame-live-visible-graphic-p'
`mon-dired-find-file-other-frame'

;; :MON-FUNCTIONS-WINDOW
`mon-map-windows->plist'

;; :MON-FUNCTIONS-FACE
`mon-face-bold->normal'
`mon-hexcolor-add-to-font-lock'
`mon-help-naf-mode-faces'

;; :MON-FUNCTIONS-OVERLAY
`mon-help-find-result-for-overlay'
`mon-help-overlay-for-example'
`mon-help-overlay-on-region'
`mon-help-overlay-result'
`mon-nuke-overlay-buffer'

;; :MON-FUNCTIONS-SYNTAX
`mon-get-syntax-class-at'

;; :MON-FUNCTIONS-TEXT-PROPERTY
`mon-get-all-face-property-change'
`mon-get-next-face-property-change'
`mon-get-next-face-property-change-if'
`mon-get-text-properties-region'
`mon-get-text-properties-region-to-kill-ring'
`mon-get-text-properties-print'
`mon-get-text-properties-read-temp'
`mon-get-text-properties-parse-buffer'
`mon-get-text-properties-parse-sym'
`mon-get-text-properties-parse-buffer-or-sym'
`mon-get-text-properties-elisp-string'
`mon-get-text-properties-elisp-string-pp'
`mon-list-all-properties-in-buffer'
`mon-nuke-text-properties-buffer'
`mon-nuke-text-properties-region'
`mon-remove-single-text-property'
`mon-remove-text-property'
`mon-get-text-properties-category'

;; :MON-FUNCTIONS-DIRED
`mon-abort-autosave-when-fucked'
`mon-dired-copy-files-to-list'
`mon-dired-copy-files-to-strings'
`mon-dired-find-file-other-frame'
`mon-dired-insert-dirs-recursive'
`mon-dired-kill-files-to-list'
`mon-dired-kill-files-to-strings'
`mon-dired-naf-artist-letter'
`mon-dired-naf-brand-letter'
`mon-dired-nef-dir'
`mon-dired-other-window'
`mon-dired-srt-alph'
`mon-dired-srt-chrn'
`mon-dired-srt-type'
`mon-dired-srt-type-alph'
`mon-dired-srt-type-chrn'
`mon-dired-uninsert-subdir'
`mon-dired-uninsert-subdir-all'
`mon-dired-unmark-elc'
`mon-dired-up-directory-this-buffer'
`mon-toggle-dired-dwim-target'

;; :MON-FUNCTIONS-FILE-DIRECTORY
`mon-add-subdirs-to-list'
`mon-async-du-dir'
`mon-build-path-for-load-path'
`mon-check-image-type'
`mon-cln-file-name-string'
`mon-copy-file-path'
`mon-dir-common-paths'
`mon-dir-save-current'
`mon-dir-save-current-to-file'
`mon-file-dir-attributes->plist'
`mon-file-ensure-extension-is-el'
`mon-file-map-elisp-fileset'
`mon-file-stamp'
`mon-file-stamp-buffer-filename'
`mon-file-stamp-minibuffer'
`mon-format-jg-file-for-write'
`mon-get-dir-name-absolute'
`mon-get-dir-size'
`mon-get-dir-subdir-default'
`mon-get-file-mod-times'
`mon-get-relative-w-absolute'
`mon-image-verify-type'
`mon-insert-dirs-in-path'
`mon-insert-file-in-dirs'
`mon-insert-naf-file-in-dirs'
`mon-insert-path'
`mon-insert-subdirs-in-buffer'
`mon-make-jg-dir-in-path'
`mon-rename-file-serial'
`mon-string-split-dir-recurse'
`mon-toggle-dired-dwim-target'
`mon-truncate-path-for-prompt'
`mon-write-jg-file-in-path'

;; :MON-FUNCTIONS-PROCESS
`mon-make-shell-buffer'
`mon-shell'
`mon-terminal'
`mon-cmd'
`mon-insert-sys-proc-list'
`mon-get-sys-proc-list'
`mon-get-proc-w-name'
`mon-get-process'

;; :MON-FUNCTIONS-INHIBIT
`mon-with-inhibit-buffer-read-only'
`mon-inhibit-read-only'
`mon-inhibit-point-motion-hooks'
`mon-inhibit-modification-hooks'

;; :MON-FUNCTIONS-TOGGLE
`mon-toggle-eval-length'
`mon-toggle-dired-dwim-target'
`mon-toggle-truncate-line'
`mon-toggle-read-only-point-motion'

;; :MON-FUNCTIONS-KEY-EVENT
`mon-read-keys-as-string'
`mon-test-keypresses'
`mon-abort-recursive-edit'
`mon-abort-autosave-when-fucked'

;; :MON-FUNCTIONS-INTERWEBS
`mon-firefox'
`mon-conkeror'
`mon-w3m-dired-file'
`mon-w3m-get-url-at-point'
`mon-w3m-get-url-at-point-maybe'
`mon-w3m-goto-url-at-point'
`mon-w3m-kill-url-at-point'
`mon-w3m-read-gnu-lists-nxt-prv'

;; :MON-FUNCTIONS-TEMPLATE
`mon-insert-drive-transfer-template'
`mon-insert-file-template'
`mon-insert-texi-template'
`mon-insert-lisp-CL-package-template'
`mon-insert-lisp-CL-mode-line-template'
`mon-insert-lisp-CL-file-template'
`mon-insert-defclass-template'
`mon-insert-ebay-template'
`mon-insert-hgignore-template'
`mon-insert-naf-mode-class-template'
`mon-insert-naf-mode-constant-template'
`mon-insert-naf-mode-face-template'
`mon-insert-naf-mode-file-template'
`mon-insert-naf-mode-var-const-templt'
`mon-insert-naf-mode-xref-template'
`mon-insert-smith-poster-template'


;; :MON-FUNCTIONS-REGION
`mon-decode-coding-region-utf-8-unix'
`mon-line-count-region'
`mon-line-number-region-incr'
`mon-line-strings-qt-region'
`mon-line-strings-region'
`mon-help-overlay-on-region'
`mon-get-text-properties-region'
`mon-get-text-properties-region-to-kill-ring'
`mon-nuke-text-properties-region'
`mon-word-reverse-region'
`mon-word-count-chars-region'
`mon-word-count-region'
`mon-region-position'
`mon-region-length'
`mon-region-unfill'
`mon-region-reverse'

;; :MON-FUNCTIONS-REGION-WRAP
`mon-wrap-selection'
`mon-wrap-with'
`mon-wrap-text'
`mon-wrap-url'
`mon-wrap-span'

;; :MON-FUNCTIONS-WORD
`mon-word-get-next'
`mon-word-get-list-in-buffer'
`mon-word-reverse-region'
`mon-word-iterate-over'
`mon-word-count-analysis'
`mon-word-count-chars-region'
`mon-word-count-region'
`mon-word-count-occurrences'

;; :MON-FUNCTIONS-WHITESPACE
`mon-spacep'
`mon-spacep-not-bol'
`mon-spacep-is-bol'
`mon-spacep-is-after-eol'
`mon-spacep-is-after-eol-then-graphic'
`mon-spacep-at-eol'
`mon-spacep-first'
`mon-line-bol-is-eol'
`mon-line-previous-bol-is-eol'
`mon-insert-whitespace'
`mon-cln-whitespace'
`mon-num-to-month-whitespace'
`mon-cln-tgm-xml-LF'
`mon-cln-spc-tab-eol'
`mon-cln-spc-tab-at-eol-in-region'
`mon-cln-blank-lines'
`mon-cln-BIG-whitespace'
`mon-cln-whitespace'
`mon-cln-trail-whitespace'
`mon-kill-whitespace'
`mon-num-to-month-whitespace'

;; :MON-FUNCTIONS-LINE-PIPED
`mon-cln-piped-list'
`mon-line-strings-pipe-to-col'
`mon-line-strings-pipe-bol'
`naf-backup-the-list'
`mon-delete-back-up-list'
`mon-line-pipe-lines'

;; :MON-FUNCTIONS-REPLACE
`mon-regexp-map-match'
`mon-regexp-map-match-in-region'
`mon-replace-char-in-string'
`mon-string-split-on-regexp'
`mon-string-csv-regexp'
`mon-string-rotate-to-regexp'
`mon-string-sub-old->new'
`mon-regexp-map-match'
`mon-replace-strings'
`mon-replace-regexp-while'
`mon-replace-string-while'
`mon-regexp-filter'
`mon-replace-region-regexp-lists'
`mon-replace-region-regexp-lists-nonint'
`mon-walk-regexps-in-file'
`mon-replace-regexps-in-file-list'
`replace-string-pairs-region-no-props'
`replace-string-pairs-region3'
`mon-replace-string-pairs-region-no-insert'
`mon-exchange-slash-and-backslash'
`mon-cln-control-M'
`mon-cln-csv-fields'
`mon-cln-file-name-string'
`mon-cln-html-chars'
`mon-cln-html-tags'
`mon-cln-iso-latin-1'
`mon-cln-mail-headers'
`mon-cln-up-colon'
`mon-cln-uniq-lines'
`mon-cln-whitespace'
`mon-cln-xml<-parsed'
`mon-cln-xml<-parsed-strip-nil'

;; MON-FUNCTIONS-REPLACE-NAF-MODE
`mon-cln-tgm-xml-LF'
`mon-cln-piped-list'
`mon-cln-philsp'
`mon-cln-ulan'
`mon-cln-imdb'
`mon-cln-loc'
`mon-cln-wiki'
`mon-cln-bib'
`mon-delete-back-up-list'
`mon-replace-common-abbrevs'

;; :MON-FUNCTIONS-REPLACE-DATES
`mon-ital-date-to-eng'
`mon-num-to-month'
`mon-num-to-month-whitespace'
`mon-month-to-num'
`mon-abr-to-month'
`mon-defranc-dates'

;; :MON-FUNCTIONS-REPLACE-TRANSLATE
`mon-defranc-places'
`mon-cln-benezit'
`mon-cln-benezit-fields'

;; :MON-FUNCTIONS-REPLACE-CHAR-ENCODING
`mon-decode-coding-region-utf-8-unix'
`mon-make-iso-latin-1-approximation'
`mon-trans-cp1252-to-latin1'
`mon-cln-iso-latin-1'
`deftransmogrify'
`mon-transmogrify'

;; :MON-FUNCTIONS-REPLACE-WHITESPACE
`mon-cln-tgm-xml-LF'
`mon-cln-spc-tab-eol'
`mon-cln-spc-tab-at-eol-in-region'
`mon-cln-blank-lines'
`mon-cln-BIG-whitespace'
`mon-cln-whitespace'
`mon-cln-trail-whitespace'
`mon-kill-whitespace'
`mon-num-to-month-whitespace'

;; :MON-FUNCTIONS-REPLACE-CASE
`mon-downcase-hex-values'
`mon-upcase-commented-lines'
`mon-toggle-case-regexp-region'
`mon-toggle-case-regexp'
`mon-downcase-regexp-region'
`mon-upcase-regexp-region'
`mon-downcase-regexp'
`mon-upcase-regexp'

;; :MON-FUNCTIONS-HEX
`mon-cln-img-magic-hex'
`mon-downcase-hex-values'
`mon-string-from-hex-list'
`mon-string-to-hex-list'
`mon-string-to-hex-string'
`mon-string-to-hex-list-cln-chars'
`mon-hexcolor-add-to-font-lock'

;; :MON-VARIABLES-HEX
`*css-color:hex-chars*'
`*regexp-rgb-hex*'
`*regexp-css-color-hex*'
`*regexp-hexcolor-keywords*'
`*regexp-hexcolor-keywords*'

;; :MON-FUNCTIONS-LOADTIME
`mon-utils-require-features-at-loadtime'
`mon-after-mon-utils-loadtime'
`mon-check-feature-for-loadtime'
`mon-help-utils-loadtime'
`mon-bind-nefs-photos-at-loadtime'
`mon-bind-cifs-vars-at-loadtime'
`mon-bind-doc-help-proprietery-vars-at-loadtime'
`mon-bind-iptables-vars-at-loadtime'
`mon-set-register-tags-loadtime'
`mon-CL-cln-colon-swap'

;; :MON-FUNCTIONS-TEST
`google-define-get-command-TEST'
`mon-build-copyright-string-TEST'
`mon-build-user-name-example-TEST'
`mon-drive-transfer-template-TEST'
`mon-file-stamp-buffer-filename-TEST'
`mon-gensym-counter-randomizer-TEST'
`mon-help-keys-wikify-TEST'
`mon-help-propertize-regexp-symbol-defs-TEST'
`mon-help-propertize-tags-TEST'
`mon-help-regexp-symbol-defs-TEST'
`mon-help-CL-wget-pkgs-TEST'
`mon-line-strings-bq-qt-sym-bol-TEST'
`mon-insert-lisp-testme'
`mon-insert-lisp-testme-fancy'
`mon-insert-test-cases'
`mon-line-dolines-setup-TEST'
`mon-line-dolines-TEST'
`mon-line-strings-to-list-TEST'
`mon-regexp-clean-ulan-dispatch-chars-TEST'
`mon-permute-combine-functions-TEST'
`mon-user-system-conditionals-TEST'
`mon-up/down-case-regexp-TEST'
`mon-wget-list-to-script-TEST'
`mon-with-inhibit-buffer-read-only-PP-TEST'
`mon-with-inhibit-buffer-read-only-TEST'
`mon-with-buffer-undo-disabled-TEST'

;; :MON-COMMNET

;; :MON-INSERT


:SEE-ALSO `mon-help-mon-help', `mon-help-emacs-introspect'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-ebay-template-mode "mon-doc-help-utils" "\
Functions and variables for use with `ebay-template-mode'.

;; :FILE ebay-template-tools.el
`mon-insert-ebay-template'
`mon-choose-ebay-delims'
`mon-choose-ebay-account'
`mon-make-html-tree'
`mon-insert-ebay-html-tree'
`mon-make-ebay-dir-list',
`mon-make-ebay-dir-list-2'
`mon-insert-ebay-dirs'
`mon-insert-ebay-dbc-file',
`mon-check-ebay-template-path'
`mon-insert-ebay-dbc-template'
`mon-ebay-field-trigger'
`mon-insert-ebay-field-trigger-l'
`mon-insert-ebay-field-trigger-r'
`mon-insert-ebay-field-trigger-l-and-r'
`mon-insert-ebay-photo-per-scan-descr'
`mon-ebay-image-linkify',
`mon-ebay-image-linkify-lite'

;; :FILE ebay-template-mode.el
`*mon-ebay-template-mode-version*' ;<CONSTANT>
`*mon-ebay-template-font-lock-keywords*'
`*mon-ebay-field-entry*',
`*mon-ebay-field-delims*'
`*mon-ebay-line-delims*',
`*mon-ebay-template-mode-map*'
`*mon-ebay-template-mode-hook*',
`*mon-ebay-template-mode-syntax-table*',
`ebay-template-mode-menu'
`ebay-template-mode'

;; :FILE mon-dir-locals-alist.el
`*mon-ebay-images-bmp-path*'
`*mon-ebay-images-jpg-path*'
`*mon-ebay-images-lookup-path*'
`*mon-ebay-images-temp-path*'

;; :FILE mon-make-html-tree.el
`xmlgen'                    ; :NOTE These are from xmlgen.el
`xmlgen-escapees'
`xmlgen-attr-to-string'
`xmlgen-extract-plist'
`xmlgen-string-escape'
`html-lite-doctype'          ; :NOTE These are from html-lite.el
`html-lite-doctype-alist'
`html-lite-define-elements'
`html-lite-make-element'
`with-html-lite-header'
`with-html-lite-header'
`html-doctype'
`html-lite-make-name'
`html-lite-write-tree'
`html-lite-browse-tree'

:SEE (URL `http://www.shellarchive.co.uk/content/emacs.html')
:SEE (URL `http://repo.or.cz/w/ShellArchive.git/blob_plain/master:/xmlgen.el')
:SEE (URL `http://www.emacswiki.org/cgi-bin/wiki/download/html-lite.el')

:SEE-ALSO `mon-help-xml-functions', `mon-help-mon-functions', `mon-help-mon-help'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-emacs-introspect "mon-doc-help-utils" "\
Variables and functions related to what this Emacs knows about this Emacs.

Unless indicated as a '<FUNCTION>' items listed are '<VARIABLE>'.

;; :EMACS-BUILD
`preloaded-file-list'
`emacs-build-system'
`emacs-build-time'
`emacs-major-version'
`emacs-minor-version'
`emacs-version'                        ;<FUNCTION>
`system-configuration'
`pure-space-overflow'

;; :EMACS-BUILD-PATH-DIR-FILE
`build-files'
`exec-directory'
`source-directory'
`installation-directory'

;; :EMACS-ENVIRONMENT
`initial-environment'
`getenv'
`setenv'
`system-shell'
`system-type'
`system-name'

;; :EMACS-ENVIRONMENT-DISPLAY
`x-get-resource'                       ;<FUNCTION>
`frame-initialize'                     ;<FUNCTION>
`frame-notice-user-settings'           ;<FUNCTION>
`emacs-basic-display'
`frame-initial-frame'
`handle-args-function-alist'
`initial-frame-alist'
`initial-window-system'
`tool-bar-originally-present'
`window-system-initialization-alist'

;; :EMACS-ENVIRONMENT-DOC
`Info-default-directory-list'
`configure-info-directory'
`doc-directory'
`find-function-C-source'               ;<FUNCTION>
`find-function-C-source-directory'
`internal-doc-file-name'
`load-force-doc-strings'
`tutorial-directory'

;; :EMACS-ENVIRONMENT-FEATURES
`advertised-signature-table'
`current-load-list'
`features'
`symbol-file-load-history-loaded'
`load-history'  ;; :NOTE Elements of return value have the format:
                ( <FILENAME>                             ;(and <ATOM> <STRING>)
                  { <VARIABLE>                           ;<ATOM>
                    (defface  . <FACE>)                  ;<CONS>
                    (defun    . <FUNCTION>)              ;<CONS>
                    (t        . <AUTOLOADED-FUNCTION>)   ;<CONS>
                    (autoload . <AUTOLOAD-FUNCTION>)     ;<CONS>
                    (require  . <FEATURE>)               ;<CONS>
                    (provide  . <FEATURE>)               ;<CONS>
                  }* )

;; :EMACS-ENVIRONMENT-FEATURES-CUSTOM
`custom-reevaluate-setting'            ;<FUNCTION>
`custom-delayed-init-variables'

;; :EMACS-ENVIRONMENT-CODING-SYSTEM
`coding-system-for-read'
`coding-system-for-write'
`file-coding-system-alist'
`process-coding-system-alist'
`network-coding-system-alist'

;; :EMACS-ENVIRONMENT-IN-OUT
`cannot-suspend'
`charset-list'
`global-map'
`glyph-table'
`initial-window-system'
`interprogram-cut-function'
`interprogram-paste-function'
`keyboard-type'
`null-device'

;; :EMACS-ENVIRONMENT-INIT-HOOKS
`after-init-hook'
`before-init-hook'
`emacs-startup-hook'
`term-setup-hook'
`window-setup-hook'

;; :EMACS-ENVIRONMENT-INIT-INHIBIT
`inhibit-x-resources'
`inhibit-startup-screen'
`inhibit-default-init'
`inhibit-startup-echo-area-message'
`inhibit-startup-hooks'
`inhibit-startup-buffer-menu'
;; :EMACS-ENVIRONMENT-INIT
`noninteractive'
`before-init-time'
`after-init-time'
`invocation-directory'
`invocation-name'
`emacs-init-time'
`init-file-debug'
`init-file-had-error'
`init-file-user'
`initial-scratch-message'
`initial-buffer-choice'

;; :EMACS-ENVIRONMENT-INIT-TOP-LEVEL
`top-level'
`normal-top-level'           
`normal-top-level-add-to-load-path'
`normal-top-level-add-subdirs-inode-list'

;; :EMACS-ENVIRONMENT-PATH-DIR-FILE
`term-file-prefix'
`site-run-file'
`abbreviated-home-dir'
`data-directory'
`exec-path'
`path-separator'
`temporary-file-directory'
`woman-path'
`load-path'
`get-load-suffixes'          ;<FUNCTION>
`load-suffixes'
`load-file-rep-suffixes'

;; :EMACS-ENVIRONMENT-PROCESS
`emacs-priority'
`emacs-pid'
`process-environment'
`server-process'
`server-name'
`daemon-initialized'
`daemonp'

;; :EMACS-ENVIRONMENT-PROCESS-COMMAND-LINE
`command-line'
`command-line-1'
`command-line-normalize-file-name'
`command-line-args'
`command-line-args-left'
`command-line-default-directory'
`command-switch-alist'
`command-line-ns-option-alist'
`command-line-x-option-alist'

;; :EMACS-ENVIRONMENT-SESSION
`emacs-save-session-functions'
`emacs-session-save'
`x-session-previous-id'
`emacs-session-restore'

;; :EMACS-ENVIRONMENT-STATE
`purify-flag'
`current-idle-time'
`emacs-uptime'                ;<FUNCTION>
`cons-cells-consed'
`floats-consed'
`intervals-consed'
`memory-limit'
`memory-use-counts'
`misc-objects-consed'
`strings-consed'
`string-chars-consed'
`vector-cells-consed'
`obarray'
`pure-space-overflow-message'
`memory-full'
`memory-signal-data'
`max-specpdl-size'
`garbage-collect'
`gc-cons-threshold'
`gc-cons-percentage'
`load-average'                 ;<FUNCTION>
`num-input-keys'
`num-nonmacro-input-events'
`max-lisp-eval-depth'
`recursion-depth'

;; :EMACS-ENVIRONMENT-STATE-COMMANDS
`read-expression-history'
`yes-or-no-p-history'
`extended-command-history'
`command-history'
`history-length'               ; :NOTE Also a <PROPERTY>
`last-command'
`real-last-command'
`this-command'
`this-command-keys'            ;<FUNCTION>
`this-command-keys-vector'     ;<FUNCTION>
`this-original-command'
`this-single-command-keys'     ;<FUNCTION>
`this-single-command-raw-keys' ;<FUNCTION>

;; :EMACS-ENVIRONMENT-USER
`abbreviated-home-dir'
`bookmark-default-file'
`custom-file'                ;<FUNCTION>
`locate-user-emacs-file'     ;<FUNCTION>
`user-emacs-directory'
`woman-man.conf-path'

;; :EMACS-ENVIRONMENT-MON-LOCAL
`mon-help-buffer-spc-*DOC*'
`mon-get-env-vars-strings'
`mon-get-env-vars-symbols'
`mon-get-env-vars-emacs'
`mon-get-system-specs'
`mon-help-emacs-introspect'

:SEE-ALSO `mon-help-load-functions', `mon-help-mon-help',
`mon-help-mon-functions', `mon-help-package-keywords'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-package-keywords "mon-doc-help-utils" "\
Find packages matching a given keyword using `finder-by-keyword'.

Keyword Search for Lisp Libraries with \\[finder-by-keyword] command
search the standard Emacs Lisp libraries by topic keywords.
:SEE info node `(emacs)Library Keywords'.

:EXAMPLE
\(finder-by-keyword)

Here is a partial list of keywords for use with finder-by-keyword:

abbrev        Abbreviation handling, typing shortcuts, macros.
alloc         Storage allocation and gc for GNU Emacs Lisp interpreter.
applications  Applications written in Emacs.
auto-save     Preventing accidental loss of data.
bib           Code related to the `bib' bibliography processor.
c             Support for the C language and related languages.
calendar      Calendar and time management support.
comm          Communications, networking, remote access to files.
convenience   Convenience features for faster editing.
data          Support for editing files of data.
development   Support for further development of Emacs.
dired         Directory \"Editor\"
display       How characters are displayed in buffers.
dnd           Handling data from drag and drop.
docs          Support for Emacs documentation.
editing       Basic text editing facilities.
emacs         Customization of the One True Editor.
emulations    Emulations of other editors.
environment   Fitting Emacs with its environment.
execute       Executing external commands.
extensions    Emacs Lisp language extensions.
external      Interfacing to external utilities.
faces         Support for multiple fonts.
files         Support for editing and manipulating files.
frames        Support for Emacs frames and window systems.
games         Games, jokes and amusements.
hardware      Support for interfacing with exotic hardware.
help          Support for on-line help systems and Help commands.
hypermedia    Support for links between text or other media types.
i18n          Internationalization and alternate character-set support.
installation  Emacs installation.
internal      Code for Emacs internals, build process, defaults.
keyboard      Input from the keyboard.
languages     Specialized modes for editing programming languages.
lisp          Lisp support, including Emacs Lisp.
local         Code local to your site.
mail          Modes for electronic-mail handling.
maint         Maintenance aids for the Emacs development group.
matching      Various sorts of searching and matching.
menu 	      Input from the menus.
mode-line     Content of the modeline.
mouse 	      Input from the mouse.
mule 	      MULE Emacs internationalization.
multimedia    Non-textual support, specifically images and sound.
news 	      Support for netnews reading and posting.
oop 	      Support for object-oriented programming.
outlines      Support for hierarchical outlining.
processes     Process, subshell, compilation, and job control support.
programming   Support for programming in other languages.
terminals     Support for terminal types.
tex           Supporting code related to the TeX formatter.
tools         Programming tools.
unix          Front-ends/assistants for, or emulators of, UNIX-like features.
windows       Windows within a frame.
wp            Word processing.
x 	      The X Window system.

;; :FINDER-FUNCTIONS
`finder-by-keyword'
`finder-commentary'
`finder-list-keywords'
`finder-commentary'
`finder-summary'
`finder-compile-keywords'
`finder-unknown-keywords'
;; :FINDER-VARIABLES
`finder-package-info'
`finder-known-keywords'
`generated-finder-keywords-file'

:ALIASED-BY `mon-help-finder-keywords'

:SEE :FILE finder.el finder-inf.el
:SEE-ALSO `mon-help-emacs-introspect', `mon-help-help-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-regexp-syntax "mon-doc-help-utils" "\
Regular Expression Syntax overview.

;; :REGEXP-SPECIAL-CHARS
.              -> match ANY
*              -> match Preceeding - ALL
+              -> match Preceeding - AT LEAST once.
?              -> match Preceeding - once OR not at all
*? +? ??       -> match Preceeding - NON-GREEDY
\\=[...]          -> Character ALTERNATIVE
\\=[^...]         -> COMPLEMENTed Character Alternative
^              -> match BOL
$              -> match EOL
\\              -> backslash QUOTE special chars

;; :REGEXP-BACKSLASH-CONSTRUCTS
\\|             -> ALTERNATIVE
\\\\={m\\}          -> REPEAT match exactly N times
\\\\={m,n\\}        -> REPEAT match n-N times
\\( ... \\)      -> GROUPING construct
\\(?: ... \\)    -> SHY Grouping construct
\\(?NUM: ... \\) -> Explicitly NUMBERED Group
\\digit         -> match DIGITH occurence
\\w             -> match any WORD CONSTITUENT char
\\W             -> match any char NOT a Word Constituent
\\Scode         -> match any char with SYNTAX code
\\Scode         -> match any char NOT with Syntax code
\\cc            -> match any char with CATEGORY
\\Cc            -> match any char NOT with Category
\\`             -> match EMPTY String
\\\\='             -> match Empty String only at EOB
\\\\==             -> match Empty String only at POINT
\\b             -> match Empty String only at BEGINNING OR END of Word
\\B             -> match Empty String NOT at beginning or end of Word
\\=\\<             -> match Empty String only at BEGINNING of Word
\\=\\>             -> match Empty String only at END of Word
\\_<            -> match Empty String only at BEGINNING of Symbol
\\_>            -> match Empty String only at END of Symbol

;; :REGEXP-CHARACTER-CLASSES
\\=[:ascii:] [:nonascii:]
\\=[:alnum:] [:digit:] [:xdigit:]
\\=[:alpha:] [:lower:] [:upper:]
\\=[:blank:] [:cntrl:] [:graph:]
\\=[:print:] [:punct:] [:space:] [:word:]
\\=[:multibyte:] [:unibyte:]

:SEE info node `(elisp)Syntax of Regexps'
:SEE info node `(elisp)Match Data'

:SEE-ALSO `mon-help-search-functions', `mon-help-syntax-class',
`mon-help-syntax-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-syntax-class "mon-doc-help-utils" "\
Syntax class mappings.

List one maps from Int->Class->Code-Char.
List two maps Syntax class code character arguments to SYNTAX.

:INT    :CLASS              :CODE-CHAR
0       whitespace         (designated by ` ' or `-')
1       punctuation        (designated by `.')
2       word               (designated by `w')
3       symbol             (designated by `_')
4       open parenthesis   (designated by `(')
5       close parenthesi   (designated by `)')
6       expression prefi   (designated by `'')
7       string quote       (designated by `\"')
8       paired delimiter   (designated by `$')
9       escape             (designated by `\\')
10      character quote    (designated by `/')
11      comment-start      (designated by `<')
12      comment-end        (designated by `>')
13      inherit            (designated by `@')
14      generic comment    (designated by `!')
15      generic string     (designated by `|')

;; :SYNTAX-CLASS-TABLE
              SYNTAX-CLASSCODE        CHARACTER-ARGUMENT
:SYNTAX-CLASS whitespace character; (designated by ` ' or `-')
:SYNTAX-CLASS word constituent; (designated by `w')
:SYNTAX-CLASS symbol constituent; (designated by `_')
:SYNTAX-CLASS punctuation character; (designated by `.')
:SYNTAX-CLASS open parenthesis character; (designated by `(')
:SYNTAX-CLASS close parenthesis character; (designated by `)')
:SYNTAX-CLASS string quote; (designated by `\"')
:SYNTAX-CLASS escape-syntax character: (designated by `\\')
:SYNTAX-CLASS character quote; (designated by `/')
:SYNTAX-CLASS paired delimiter; (designated by `$')
:SYNTAX-CLASS expression prefix; (designated by `'')
:SYNTAX-CLASS comment starter; (designated by `<')
:SYNTAX-CLASS comment ender; (designated by `>')
:SYNTAX-CLASS inherit standard syntax; (designated by `@')
:SYNTAX-CLASS generic comment delimiter; (designated by `!')
:SYNTAX-CLASS generic string delimiter; (designated by `|')

:NOTE To get the syntax class of the char after point do:
 (logand (car (syntax-after (point))) 65535)(

This is different from getting the char's syntax:
\(char-syntax (following-char))(

;; char-syntax
:SEE info node `(elisp)Syntax Table Internals'

:SEE `syntax_spec_code', `syntax_code_spec' in :FILE src/syntax.c

:SEE :FILE emacs-lisp/syntax.el

:SEE-ALSO `mon-help-syntax-functions', `mon-help-search-functions',
`mon-help-regexp-syntax'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-syntax-functions "mon-doc-help-utils" "\
Functions related to syntax and syntax tables.

;; :SYNTAX-FUNCTIONS-MOTION
`backward-prefix-chars' 
`forward-same-syntax'
`skip-syntax-forward'
`skip-syntax-backward'
`forward-comment'

;; :SYNTAX-FUNCTIONS-INSPECT
`internal-describe-syntax-value'
`char-syntax'
`get-char-char'
`property-syntax'
`describe-syntax'
`describe-vector'
`internal-describe-syntax-value'
`syntax-after'
`syntax-class'
`syntax-table'
`syntax-table-p'

;; :SYNTAX-FUNCTIONS-HANDLERS
`lisp-mode-variables'  ;; :NOTE Arg LISP-SYNTAX affects lisp-mode initialization
`copy-syntax-table'
`make-syntax-table'
`modify-syntax-entry'
`set-syntax-table'
`string-to-syntax'
`with-syntax-table'

;; :SYNTAX-FUNCTIONS-CASE
`set-case-syntax'
`set-case-syntax-pair'
`set-case-table'
`set-case-syntax-delims'
`standard-case-table'

;; :SYNTAX-FUNCTIONS-CATEGORY
`define-category'
`modify-category-entry'
`describe-categories'
`category-docstring'
`category-set-mnemonics'
`char-category-set'
`get-unused-category'
`category-table'
`category-table-p'
`make-category-table'
`make-category-set'
`modify-category-entry'
`set-category-table'
`standard-category-table'

;; :SYNTAX-FUNCTIONS-PARSE
`scan-lists'
`scan-sexps'
`parse-partial-sexp'
`beginning-of-defun'
`beginning-of-defun-raw'
`end-of-defun'
`parse-partial-sexp'
`matching-paren'
`syntax-ppss'
`syntax-ppss-after-change-function'
`syntax-ppss-context'
`syntax-ppss-debug'
`syntax-ppss-depth'
`syntax-ppss-flush-cache'
`syntax-ppss-stats'
`syntax-ppss-toplevel-pos'
`scan-error`

;; :SYNTAX-VARIABLES-PARSING
`comment-enter-backward'
`comment-use-syntax'
`comment-use-global-state'
`comment-add'                                     ; :NOTE Also a <FUNCTION>
`open-paren-in-column-0-is-defun-start'
`multibyte-syntax-as-symbol'
`defun-prompt-regexp'
`end-of-defun-function'
`beginning-of-defun-function'
`open-paren-in-column-0-is-defun-start'
`parse-sexp-ignore-comments'
`parse-sexp-lookup-properties'
`syntax-begin-function'
`syntax-ppss-last'
`syntax-ppss-max-span'
`syntax-ppss-stats'
`font-lock-beginning-of-syntax-function'
`font-lock-syntactic-keywords'

;; :SYNTAX-TABLES               
`standard-syntax-table'         ;<FUNCTION> 
`c-mode-syntax-table'           ; :NOTE A syntax-table is of type `char-table`:
`emacs-lisp-mode-syntax-table'  ;       (type-of emacs-lisp-mode-syntax-table)
`text-mode-syntax-table'

;; :SYNTAX-VARIABLES
`before-change-functions'
`find-word-boundary-function-table'
`words-include-escapes'

;; :SYNTAX-PROPERTY
`doc-string-elt`              ;<PROPERTY>
`syntax-table`                ;<PROPERTY>
`text-clone-syntax`           

;; :SYNTAX-MON-LOCAL
`mon-get-syntax-class-at'
`mon-line-test-content'

:SEE info node `(elisp)Syntax Tables'

:SEE :FILE emacs-lisp/syntax.el src/syntax.c

:SEE-ALSO `mon-help-syntax-class', `mon-help-regexp-syntax',
`mon-help-search-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-search-functions "mon-doc-help-utils" "\
Common functions, vars, commands for searching, replacing, substituting.

:SEE info node `(elisp)Regexp Search'.

;; :SEARCH
`search-forward'
`search-backward'
`search-forward-regexp'  ;-> `re-search-forward'  :SEE-ALSO `posix-search-forward'
`search-backward-regexp' ;-> `re-search-backward' :SEE-ALSO `posix-search-backward'
`word-search-forward'
`word-search-backward'
`word-search-backward-lax'
`word-search-forward-lax'
`apropos-words-to-regexp'
`apropos-parse-pattern'

;; :SEARCH-INSPECT
`looking-at-p'
`looking-at'             ; :SEE-ALSO `posix-looking-at'
`looking-back'
`subregexp-context-p'

;; :SEARCH-MATCH-DATA
`match-end'
`match-data'
`match-beginning'
`match-string'
`match-string-no-properties'
`match-substitute-replacement'
`replace-match'
`replace-match-data'
`replace-match-maybe-edit'
`replace-match-string-symbols'
`save-match-data'
`set-match-data'

;; :SEARCH-REPLACE-ACTIONS
`flush-lines'
`keep-lines'
`replace'
`replace-rectangle'
`replace-regexp'
`replace-string'
`replace-regexp-in-string'
`replace-eval-replacement'
`replace-loop-through-replacements'
`perform-replace'
`map-query-replace-regexp'
`filter-buffer-substring'

;; :SEARCH-STRINGS
`string-prefix-p'
`compare-strings'
`string-match'           ; :SEE-ALSO `posix-string-match'
`string-match-p'
`string-equal'
`string='

;; :SEARCH-CHARS
`search-unencodable-char'
`find-multibyte-characters'

;; :SEARCH-MODIFY
`regexp-opt'
`regexp-opt-depth'
`regexp-quote'

;; :SEARCH-SUBSTITUTION
`subst-char-in-region'
`subst-char-in-string'
`translate-region'

;; :SEARCH-DIRED
`dired-do-copy-regexp'
`dired-do-create-files'
`dired-do-create-files-regexp'
`dired-do-isearch'
`dired-do-isearch-regexp'
`dired-do-query-replace-regexp'
`dired-do-rename-regexp'
`dired-do-search'
`dired-flag-files-regexp'
`dired-glob-regexp'
`dired-mark-files-containing-regexp'
`dired-mark-files-regexp'
`dired-isearch-filenames'
`dired-isearch-filenames-regexp'

;; :SEARCH-TAGS
`tags-search'
`tags-query-replace'

;; :SEARCH-COUNT
`how-many'

;; :SEARCH-VARIABLES
`inhibit-changing-match-data'
`buffer-substring-filters'
`search-spaces-regexp'
`cache-long-line-scans'
`case-replace'
`case-fold-search'
`default-case-fold-search'
`page-delimiter'
`paragraph-separate'
`paragraph-start'
`regexp-search-ring'
`search-upper-case'
`search-invisible'
`search-ring'
`sentence-end'                  ; :NOTE Also a <FUNCTION>
`sentence-end-base'
`sentence-end-double-space'
`sentence-end-without-space'
`sentence-end-without-period'

;; :SEARCH-MON-LOCAL
`mon-looking-back-p'
`replace-in-string-mon'
`replace-char-in-string-mon'
`mon-walk-regexps-in-file'
`mon-replace-regexps-in-file-list'
`mon-string-split-on-regexp'
`mon-string-csv-regexp'
`mon-string-rotate-to-regexp'
`mon-string-sub-old->new'
`replace-string-pairs-region-no-props'
`replace-string-pairs-region3'

:NOTE The relatively un-advertised features `grep', `grep-find' and `locate'.
:SEE progmodes/grep.el and lisp/locate.el

:SEE-ALSO `mon-help-regexp-syntax', `mon-help-syntax-functions',
`mon-help-syntax-class'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-hooks "mon-doc-help-utils" "\
A list of common Emacs hooks.

;; :HOOK-FUNCTIONS
`add-hook'
`delay-mode-hooks'
`make-local-hook'
`remove-hook'
`run-hook-with-args'
`run-hook-with-args-until-failure'
`run-hook-with-args-until-success'
`run-hooks'
`run-mode-hooks'
`with-wrapper-hook'

;; :HOOKS
`abbrev-expand-functions'
`activate-mark-hook'
`activate-menubar-hook'
`after-change-functions'
`after-change-major-mode-hook'
`after-init-hook'
`after-insert-file-functions'
`after-make-frame-functions'
`after-revert-hook'
`after-save-hook'
`after-setting-font-hook'
`auto-fill-function'
`auto-save-hook'
`before-change-functions'
`before-hack-local-variables-hook'
`before-init-hook'
`before-make-frame-hook'
`before-revert-hook'
`before-save-hook'
`blink-paren-function'
`buffer-access-fontify-functions'
`bytecomp-load-hook'
`change-major-mode-hook'
`clone-buffer-hook'
`clone-indirect-buffer-hook'
`command-hook-internal'
`command-line-functions'
`comment-indent-function'
`compilation-start-hook'
`completion-setup-hook'
`custom-define-hook'
`deactivate-mark-hook'
`delay-mode-hooks'             ; :NOTE Also a <FUNCTION>
`delayed-mode-hooks'
`delete-frame-functions'
`delete-frame-hook'
`delete-terminal-functions'
`desktop-after-read-hook'
`desktop-no-desktop-file-hook'
`desktop-save-hook'
`dired-load-hook'
`disabled-command-function'
`disabled-command-hook'
`display-time-hook'
`echo-area-clear-hook'
`emacs-startup-hook'
`eshell-pre-command-hook'
`exit-language-environment-hook'
`find-file-hook'
`find-file-hooks'
`find-file-not-found-functions'
`find-file-not-found-hooks'
`find-function-after-hook'
`find-tag-hook'
`first-change-hook'
`font-lock-mode-hook'
`font-lock-beginning-of-syntax-function'
`font-lock-fontify-buffer-function'
`font-lock-fontify-region-function'
`font-lock-mark-block-function'
`font-lock-syntactic-face-function'
`font-lock-unfontify-region-function'
`grep-setup-hook'
`hack-local-variables-hook'
`insert-behind-hooks'
`insert-in-front-hooks'
`kbd-macro-termination-hook'
`kill-buffer-hook'
`kill-buffer-query-functions'
`kill-emacs-hook'
`kill-emacs-query-functions'
`lisp-indent-function'
`lisp-interaction-mode-hook'
`local-write-file-hooks'
`menu-bar-update-hook'
`message-mode-hook'
`minibuffer-exit-hook'
`minibuffer-setup-hook'
`mode-line-hook'
`modification-hooks'
`mouse-leave-buffer-hook'
`mouse-position-function'
`next-error-hook'
`post-command-hook'
`post-gc-hook'
`pre-abbrev-expand-hook'
`pre-command-hook'
`resume-tty-functions'
`set-language-environment-hook'
`special-mode-hook'
`suspend-hook'
`suspend-resume-hook'
`suspend-tty-functions'
`temp-buffer-setup-hook'
`temp-buffer-show-function'
`temp-buffer-show-hook'
`term-setup-hook'
`tooltip-hook'
`unload-feature-special-hooks'
`url-load-hook'
`window-configuration-change-hook'
`window-scroll-functions'
`window-setup-hook'
`window-size-change-functions'
`write-contents-functions'
`write-contents-hooks'
`write-file-functions'
`write-file-hooks'
`write-region-annotate-functions'

;; :HOOKS-MODE
`Info-mode-hook'
`apropos-mode-hook'
`change-log-mode-hook'
`compilation-mode-hook'
`completion-list-mode-hook'
`custom-mode-hook'
`diff-mode-hook'
`dired-mode-hook'
`emacs-lisp-mode-hook'
`help-mode-hook'
`lisp-mode-hook'
`text-mode-hook'
`view-mode-hook'

:SEE info node `(emacs)Hooks'
:SEE info node `(elisp)Hooks'
:SEE info node `(elisp)Standard Hooks'

:SEE-ALSO `mon-help-buffer-functions', `mon-help-file-dir-functions',
`mon-help-file-dir-functions-usage'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-file-dir-functions "mon-doc-help-utils" "\
List of functions related to files and directories.

;; :FILE-DIRECTORY-ACTION
`access-file'
`byte-compile-file'
`cd'
`cd-absolute'
`confirm-nonexistent-file-or-buffer'
`copy-file'
`file-local-copy'
`insert-file'
`load-file'
`make-temp-file'
`make-symbolic-link'
`process-file'
`start-file-process'
`view-file'

;; FILE-DIRECTORY-ACTION-DESTRUCTIVE
`append-to-file'
`delete-file'
`make-directory'
`rename-file'
`with-temp-file'                ; :NOTE Output to generated bufer \" *temp file*\"
`write-file'

;; :FILE-DIRECTORY-SETTERS
`set-buffer-file-coding-system'
`set-file-name-coding-system'
`set-default-file-modes'
`set-file-modes'
`set-file-times'
`set-visited-file-modtime'
`set-visited-file-name'

;; :FILE-DIRECTORY-READ
`desktop-read'
`file-readable-p'
`find-file-read-args'
`next-read-file-uses-dialog-p'
`read-abbrev-file'
`read-directory-name'
`read-file-modes'
`read-file-name'
`read-file-name-defaults'
`read-file-name-internal'
`read-filename-at-point'

;; :FILE-DIRECTORY-MODTIME
`buffer-modified-p'
`ask-user-about-supersession-threat'
`set-visited-file-modtime'
`visited-file-modtime'
`verify-visited-file-modtime'
`clear-visited-file-modtime'

;; :FILE-DIRECTORY-INSERT
`insert-directory'
`insert-directory-adj-pos'
`insert-directory-safely'
`insert-default-directory'     ;<VARIABLE>
`insert-directory-program'     ;<VARIABLE>

;; :FILE-DIRECTORY-INSPECT
`prune-directory-list'
`directory-files'
`directory-files-and-attributes'
`file-attributes'
`file-chase-links'
`file-modes'
`file-newest-backup'
`file-nlinks'
`file-set-intersect'               ; :SEE :FILE lisp/loadhist.el
`file-system-info'

;; :FILE-DIRECTORY-NAME-MODIFY
`abbreviate-file-name'
`add-name-to-file'
`convert-standard-filename'
`directory-file-name'
`expand-file-name'
`file-modes-char-to-right'
`file-modes-char-to-who'
`file-modes-rights-to-number'
`file-modes-symbolic-to-number'
`recode-file-name'
`substitute-in-file-name'
`unix-sync'
`unhandled-file-name-directory'

;; :FILE-DIRECTORY-NAME-INSPECT
`buffer-file-name'                   ; :NOTE Also a <VARIABLE>
`file-name-all-completions'
`file-name-as-directory'
`file-name-completion'
`file-name-directory'
`file-name-extension'
`file-name-handler-alist'
`file-name-non-special'
`file-name-nondirectory'
`file-name-sans-extension'
`file-name-sans-versions'
`file-relative-name'
`file-truename'
`minibuffer-completing-file-name'
`parse-colon-path'
`x-file-dialog'

;; :FILE-DIRECTORY-PREDICATE
`file-name-absolute-p'
`file-ownership-preserved-p'
`file-newer-than-file-p'
`file-readable-p'
`file-regular-p'
`file-remote-p'
`file-symlink-p'
`file-writable-p'
`file-accessible-directory-p'
`file-attributes-lessp'
`file-compressed-p'
`file-directory-p'
`file-executable-p'
`file-exists-p'
`file-locked-p'
`next-read-file-uses-dialog-p'

;; :FILE-DIRECTORY-FIND
`file-expand-wildcards'
`wildcard-to-regexp'
`ffap'
`find-library'
`find-library-name'
`find-file'
`find-file-at-point'
`find-file-binary'
`find-file-existing'
`find-file-literally'
`find-file-name-handler'
`find-file-noselect'
`find-file-noselect-1'
`find-file-not-found-set-buffer-file-coding-system'
`find-file-other-frame'
`find-file-other-window'
`find-file-read-args'
`find-file-read-only'
`find-file-read-only-other-frame' 	
`find-file-read-only-other-window'
`find-file-text'                        ; :FILE lisp/dos-w32.el
`find-dired'
`hexl-find-file'
`locate-dominating-file'
`locate-library'

;; :FILE-DIRECTORY-FIND-BUFFER
`create-file-buffer'
`find-buffer-visiting'
`find-buffer-file-type'                 ; :FILE lisp/files.el
`find-buffer-file-type-coding-system'   ; :FILE lisp/dos-w32.el
`find-buffer-file-type-match'           ; :FILE lisp/dos-w32.el
`find-library-suffixes'
`get-file-buffer'

;; :FILE-DIRECTORY-ELISP                ; :FILE lisp/loadhist.el
`file-dependents'
`file-loadhist-lookup'
`file-provides'
`file-requires'

;; :FILE-DIRECTORY-RECOVER
`after-find-file'
`recover-file'
`recover-this-file'

;; :FILE-DIRECTORY-RECOVER-AUTO-SAVE-FUNCTIONS
`make-auto-save-file-name'
`auto-save-mode'

;; :FILE-DIRECTORY-RECOVER-AUTO-SAVE-VARIABLES
`auto-save-default'
`auto-save-file-name-transforms'
`auto-save-hook'
`auto-save-include-big-deletions'
`auto-save-interval'
`auto-save-list-file-name'
`auto-save-list-file-prefix'
`auto-save-timeout'
`auto-save-visited-file-name'
`auto-save-file-name-p'

;; :FILE-DIRECTORY-URL
`browse-url-of-file'
`url-file-directory'
`url-file-extension'
`url-file-nondirectory'
`url-generate-unique-filename'
`url-make-private-file'
`url-insert-file-contents'

;; :FILE-DIRECTORY-W32
`w32-get-true-file-attributes'
`w32-long-file-name'
`w32-short-file-name'

;; :FILE-DIRECTORY-VARIABLES-BUFFER
`add-log-buffer-file-name-function'
`buffer-file-coding-system'
`buffer-file-coding-system-explicit'
`buffer-file-format'
`buffer-file-name'                   ; :NOTE Also a <FUNCTION>
`buffer-file-number'
`buffer-file-numbers-unique'
`buffer-file-read-only'
`buffer-file-truename'
`buffer-file-type'
`confirm-nonexistent-file-or-buffer' ; :NOTE Also a <FUNCTION>
`list-buffers-directory'

;; :FILE-DIRECTORY-VARIABLES
`abbreviated-home-dir'
`after-insert-file-functions'
`coding-system-for-read'
`coding-system-for-write'
`default-directory'
`default-directory-alist'
`directory-abbrev-alist'
`directory-free-space-program'
`file-coding-system-alist'
`file-local-variables-alist'
`file-name-coding-system'
`file-name-handler-alist'
`file-name-history'
`file-name-invalid-regexp'
`file-precious-flag'
`find-file-wildcards'
`find-file-visit-truename'
`find-file-existing-other-name'
`find-file-hook'
`find-file-not-found-functions'
`find-file-not-found-hooks'
`find-file-not-true-dirname-list'
`load-file-name'
`load-file-rep-suffixes'
`load-suffixes'
`inhibit-file-name-handlers'
`inhibit-file-name-operation'
`insert-default-directory'
`insert-directory-program'
`path-separator'
`temporary-file-directory'
`null-device'

;; :FILE-DIRECTORY-MON-LOCAL
`mon-file-reduce-name'
`mon-build-path'
`mon-buffer-written-p'
`mon-get-buffer-parent-dir'
`mon-truncate-path-for-prompt'
`mon-string-split-dir-recurse'
`mon-dir-common-paths'
`mon-add-subdirs-to-list'
`mon-insert-subdirs-in-buffer'
`mon-get-dir-subdir-default'
`mon-file-dir-attributes->plist'
`mon-file-stamp'
`mon-file-stamp-minibuffer'
`mon-file-stamp-buffer-filename'
`mon-get-file-mod-times'
`mon-insert-dirs-in-path'
`mon-insert-file-in-dirs'
`mon-insert-naf-file-in-dirs'
`mon-toggle-dired-dwim-target'
`mon-with-file-buffer'
`mon-copy-file-path'
`mon-copy-file-multiple'
`mon-file-truename-p'
`mon-file-dir-attributes->plist'


:SEE info node `(elisp)Files'

:SEE-ALSO `mon-help-file-dir-functions-usage', `mon-help-process-functions',
`mon-help-buffer-functions', `mon-help-hooks'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-file-dir-functions-usage "mon-doc-help-utils" "\
Examples of file/directory name related function usage.

:SEE info node `(elisp)Files'

:NOTE Indentation below is for readablility :).

;; :FILE-BUFFER-CONJUNCT-USAGE
`buffer-file-name'               ;<&optional BUFFER>
 (buffer-file-name)

`find-buffer-visiting'           ;<FILENAME &optional PREDICATE>
 (find-buffer-visiting
   (filename)

;; :FILE-DIRECTORY-ACTION-USAGE
`find-file'                      ;<FILENAME &optional WILDCARDS>
 (find-file
   (buffer-file-name))

;; :FILE-DIRECTORY-PREDICATE-USAGE
`file-directory-p'               ;<FILENAME>
 (file-directory-p
   doc-directory)

`file-executable-p'              ;<FILENAME>
 (file-executable-p
  (executable-find \"emacs\"))

`file-exists-p'                  ;<FILENAME>
 (file-exists-p
  (buffer-file-name))

`file-locked-p'                  ;<&rest IGNORE>
 (file-locked-p)

`file-name-absolute-p'           ;<FILENAME>
 (file-name-absolute-p
   (directory-file-name
     default-directory))

`file-newer-than-file-p'         ;<FILE1 FILE2>
 (file-newer-than-file-p
  (buffer-file-name)
     doc-directory)

`file-regular-p'                 ;<FILENAME>
 (file-regular-p doc-directory)

 (file-regular-p \"~/.emacs\")

`file-writable-p'                ;<FILENAME>
 (file-writable-p
   default-directory)

;; :FILE-DIRECTORY-NAME-INSPECT-USAGE
`expand-file-name'               ;<NAME &optional DEFAULT-DIRECTORY>
 (expand-file-name \"../\")
 (expand-file-name \"../../\")
 (expand-file-name \"../../../\")

`file-relative-name'             ;<FILENAME &optional DIRECTORY>
 (file-relative-name
    default-directory)

 (file-relative-name
   (buffer-file-name))

`file-expand-wildcards'          ;<PATTERN &optional FULL>
 (file-expand-wildcards
  (concat doc-directory
    \"nxml/*.el\"))

`file-truename'                  ;<FILENAME &optional COUNTER PREV-DIRS>
 (file-truename
   (getenv \"HOME\"))

`substitute-in-file-name'        ;<FILENAME>
 (substitute-in-file-name
   \"$HOME\\.emacs\")

`file-name-directory'            ;<FILENAME>
 (file-name-directory
   (buffer-file-name))

`file-name-nondirectory'         ;<FILENAME>
 (file-name-nondirectory 
   (directory-file-name
     default-directory))

`file-name-as-directory'         ;<FILE>
 (file-name-as-directory
    default-directory)

`file-name-nondirectory'         ;<FILENAME>
 (file-name-nondirectory
   (buffer-file-name))

`file-name-sans-extension'       ;<FILENAME>
 (file-name-sans-extension
   (buffer-file-name))

`directory-file-name'            ;<DIRECTORY>
 (directory-file-name
   default-directory)

 (directory-file-name
   (buffer-file-name))

;; :DIRECTORY-INSPECT-USAGE
`directory-files'                ;<DIRECTORY &optional FULL MATCH NOSORT>
 (directory-files
   default-directory)

 (directory-files
   (file-name-directory 
     (buffer-file-name)) nil \".el\")

`directory-files-and-attributes' ;<DIRECTORY &optional FULL MATCH NOSORT ID-FORMAT>
 (directory-files-and-attributes
   default-directory) 

;; :FILE-DIRECTORY-INSPECT-PROPERTY-USAGE
`set-visited-file-modtime'       ;<&optional TIME-LIST>

`file-attributes'                ;<FILENAME &optional ID-FORMAT>
 (file-attributes
    default-directory)

  List-returned consists of 12 elements:

  :IS-DIRECTORY-P      ;<- nth 0  t|nil
  :NUM-NAMES-OF-FILE   ;<- nth 1
  :UID                 ;<- nth 2
  :GID                 ;<- nth 3
  :LAST-ACCESSED       ;<- nth 4
  :LAST-MODIFIED       ;<- nth 5
  :LAST-STATUS-CHANGE  ;<- nth 6 
  :SIZE-IN-BYTES       ;<- nth 7 
  :FILES-MODES         ;<- nth 8 
  :GID-CHANGES-P       ;<- nth 9  :NOTE t if delete causes change on recreate.
  :FILE-INODE-NUMBER   ;<- nth 10
  :FILE-SYSTEM-NUMBER  ;<- nth 11

:NOTE `file-attributes' elts nth 4, 5, and 6 are as per `current-time'.

 (current-time) -> (HIGH LOW MICROSEC)

 (decode-time (current-time)) -> (SEC MINUTE HOUR DAY MONTH YEAR DOW DST ZONE)

 (decode-time (nth 5 (file-attributes default-directory)))

;; :FILE-DIRECTORY-W32-USAGE
`convert-standard-filename'      ;<FILENAME>
 (convert-standard-filename 
   (file-truename
    (getenv \"PROGRAMFILES\"))

`w32-get-true-file-attributes'   ;<VARIABLE>

`w32-long-file-name'             ;<FILENAME>
 (w32-long-file-name 
  (getenv \"HOME\"))

`w32-short-file-name'            ;<FILENAME>
 (w32-short-file-name 
   (getenv \"PROGRAMFILES\"))

;; :FILE-DIRECTORY-CONJUNCT-USAGE
`split-string'                   ;<STRING &optional SEPARATORS OMIT-NULLS>
 (split-string 
   (directory-file-name
     default-directory) \"/\")

`thing-at-point'                 ;<THING>
 (thing-at-point
   'filename)~/.emacs 

`bounds-of-thing-at-point'       ;<THING>
 (bounds-of-thing-at-point
   'filename)~/.emacs

`ffap'                           ;<&optional FILENAME>
 (ffap)~/.emacs

;; :FILE-DIRECTORY-MON-LOCAL-USAGE
`mon-toggle-dired-dwim-target'
 (mon-toggle-dired-dwim-target)

`mon-get-file-mod-times'         ;<FILE-OR-DIR>
 (mon-get-file-mod-times
   user-emacs-directory)

`mon-insert-dirs-in-path'        ;<DIR-LIST DIR-PATH>
 (mon-insert-dirs-in-path
   symbol path)

`mon-insert-file-in-dirs'        ;<MAKE-DIR-LIST INSERT-TEXT EXTENSION>
 (mon-insert-file-in-dirs
   (make-dir-list
     insert-text extension))

`mon-insert-naf-file-in-dirs'    ;<MAKE-DIR-LIST>
 (mon-insert-naf-file-in-dirs
   (make-dir-list))

:ALIASED-BY `mon-help-directory-file-functions-usage'

:SEE-ALSO `mon-help-file-dir-functions', `mon-help-buffer-functions',
`mon-help-hooks', `mon-help-process-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-process-functions "mon-doc-help-utils" "\
Process related functions.

;; :PROCESS-ACTIONS
`accept-process-output'
`call-process'
`call-process-shell-command'
`continue-process'
`delete-process'
`interrupt-process'
`kill-process'
`make-network-process'          :SEE `mon-help-make-network-process'
`process-coding-system'
`process-command'
`process-contact'
`process-file'
`process-file-shell-command'
`process-get'
`process-lines'
`process-put'
`process-send-eof'
`process-send-region'
`process-send-string'
`quit-process'
`set-process-buffer'
`set-process-coding-system'
`set-process-datagram-address'
`set-process-filter'
`set-process-plist'
`set-process-sentinel'
`shell-quote-argument'
`signal-process'
`start-file-process'
`start-file-process-shell-command'
`start-process-shell-command'
`stop-process'

;; :PROCESS-INSPECT
`process-datagram-address'
`process-mark'
`process-buffer'
`get-process'
`get-buffer-process'
`getenv-internal'
`process-exit-status'
`process-command'
`process-id'
`process-filter'
`process-plist'
`process-name'
`process-sentinel'
`process-status'
`process-tty-name'
`process-type'

;; :PROCESS-ENUMERATE
`list-processes'
`list-system-processes'
`process-attributes'
`process-list'
`system-process-attributes'

;; :PROCESS-FLAGS
`process-kill-without-query'
`set-network-process-option'
`set-process-query-on-exit-flag'
`process-query-on-exit-flag'
`process-inherit-coding-system-flag'

;; :PROCESS-PREDICATES
`process-filter-multibyte-p'
`process-running-child-p'
`processp'
`waiting-for-user-input-p'

;; :PROCESS-TRANSACTION-QUEUES
`tq-close'
`tq-create'
`tq-enqueue'

;; :PROCESS-VARIABLES
`delete-exited-processes'
`exec-path'
`exec-directory'
`exec-suffixes'
`mode-line-process'
`process-adaptive-read-buffering'
`process-connection-type'
`process-coding-system-alist'
`process-environment'
`process-file-side-effects'
`w32-quote-process-args'

;; :PROCESS-MON-LOCAL
`mon-get-proc-w-name'
`mon-get-sys-proc-list'
`mon-insert-sys-proc-list'

:SEE :FILE process.c
:SEE info node `(elisp)Processes'

:SEE-ALSO `mon-help-make-network-process', `mon-help-server-functions',
`mon-help-file-dir-functions', `mon-help-file-dir-functions',
`mon-help-buffer-functions', `mon-help-hooks'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-make-network-process "mon-doc-help-utils" "\
A short form enumeration of args for `make-network-process'.

;; :MAKE-NETWORK-PROCESS-ARGS

:name    <NAME>

:buffer  {<BUFFER>|<BUFFER-NAME>}

:type    {nil|datagram} ;When nil create a stream

:local   <ADDRESS> ;When non-nil overrides `:family', `:host', `:service' args

:remote  <ADDRESS> ;When non-nil overrides `:family', `:host', `:service' args

         ¦ IPv4-address -> <VECTOR> of five elts, four 8-bit one 16-bit e.g.:
         ¦                          [192 168 1 100 8080] -> 192.168.1.100:8080
         ¦ IPv6-address -> <VECTOR> of nine elts, each a 16-bit integer
         ¦ local-address      -> <STRING>
         ¦ unsupported-family -> <CONS> (F . AV) -> (<INTEGER> . <VECTOR>)

:family  {local|ipv4|ipv6|[address and protocol of service]}

:host    {local|[server-process-name{host-name|host-ip}]}

:service {name|ip|t[port{<STRING>|<INTEGER>}]}

:coding  {<SYMBOL>|<CONS>}

:nowait  {nil|t}

:noquery {nil|t}

:stop    {nil|t}

:filter  <FILTER>

:sentinel <SENTINEL>

:log      <FUNCTION> which accepts the args:
                    ¦ <SERVER>  ;<- A process
                    ¦ <CLIENT>  ;<- A process
                    ¦ <MESSAGE> ;<- A string

:plist  <PLIST>

:server When t <FAMILY>, <SERVICE>, connection type (a stream or datagram)
        When <INTEGER> length of connection queue

:filter-multibyte {nil|t}

;; :MAKE-NETWORK-PROCESS-CONNECTION-OPTIONS

:broadcast    <BOOLEAN>
:dontroute    <BOOLEAN>
:keepalive    <BOOLEAN>
:linger       <INTEGER>
:oobinline    <BOOLEAN>
:priority     <INTEGEER>
:reuseaddr    <BOOLEAN>
:bindtodevice <DEVICE-NAME>

;; :MAKE-NETWORK-PROCESS-CONNECTION-OPTIONS-TEST-KEY-VAL
Form1: (featurep 'make-network-process '(KEYWORD VALUE))
Return non-nil if make-network-process accepts <KEYWORD> with <VALUE>.

 (featurep 'make-network-process '(:nowait t))
 (featurep 'make-network-process '(:type datagram))
 (featurep 'make-network-process '(:family local))
 (featurep 'make-network-process '(:family ipv6))
 (featurep 'make-network-process '(:service t))

;; :MAKE-NETWORK-PROCESS-CONNECTION-OPTIONS-TEST-KEYWORD
Form2: (featurep 'make-network-process 'KEYWORD)
Return non-nil if `make-network-process' accepts network option arg <KEYWORD>.

 (featurep 'make-network-process :bindtodevice)
 (featurep 'make-network-process :broadcast)
 (featurep 'make-network-process :dontroute)
 (featurep 'make-network-process :keepalive)
 (featurep 'make-network-process :linger)
 (featurep 'make-network-process :oobinline)
 (featurep 'make-network-process :priority)
 (featurep 'make-network-process :reuseaddr)

;; :MAKE-NETWORK-PROCESS-INTERFACE
`process-datagram-address'
`set-process-datagram-address'
`format-network-address'
`network-interface-info'
`network-interface-list'
`set-network-process-option'

:ALIASED-BY `mon-help-network-process'

:SEE :FILE process.c

:SEE info node `(elisp)Network Processes'.

:SEE-ALSO `mon-help-process-functions', `mon-help-server-functions',
`mon-help-process-functions', `mon-help-hooks', `mon-help-file-dir-functions',
`mon-help-buffer-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-server-functions "mon-doc-help-utils" "\
List of Emacs server related functions and variables.

;; :SERVER-FUNCTIONS
`server-add-client'
`server-buffer-done'
`server-clients-with'
`server-create-tty-frame'
`server-create-window-system-frame'
`server-delete-client'
`server-done'
`server-edit'
`server-ensure-safe-dir'
`server-eval-and-print'
`server-execute'
`server-execute-continuation'
`server-force-delete'
`server-goto-line-column'
`server-goto-toplevel'
`server-handle-delete-frame'
`server-handle-suspend-tty'
`server-kill-buffer'
`server-kill-buffer-query-function'
`server-kill-emacs-query-function'
`server-log'
`server-mode'
`server-process-filter'
`server-quote-arg'
`server-return-error'
`server-running-p' 
`server-save-buffers-kill-terminal'
`server-select-display'
`server-send-string'
`server-sentinel'
`server-start'
`server-switch-buffer'
`server-temp-file-p'
`server-unload-function'
`server-unquote-arg'
`server-unselect-display'
`server-visit-files'
`server-with-environment'

;; :SERVER-VARIABLES
`server-auth-dir'
`server-buffer'
`server-buffer-clients'
`server-clients'
`server-done-hook'
`server-existing-buffer'
`server-host'
`server-kill-buffer-running'
`server-kill-new-buffers'
`server-log'
`server-log-time-function'
`server-mode'
`server-name'
`server-process'
`server-raise-frame'
`server-socket-dir'
`server-switch-hook'  
`server-temp-file-regexp'
`server-use-tcp'
`server-visit-hook'
`server-window'

;; :SERVER-FUNCTION-USAGE
\(featurep 'make-network-process)
\(locate-user-emacs-file \"server/\")

\\(getenv \"USERDOMAIN\")) ;<- W32
\(file-truename (getenv \"APPDATA\")) ;<- W32
\(getenv \"EMACS_SERVER_FILE\")
\(file-truename (getenv \"EMACS_SERVER_FILE\"))
\(getenv \"EMACSCLIENT_STARTING_SERVER\")
\(file-truename (getenv \"EMACSCLIENT_STARTING_SERVER\"))

:SEE info node `(emacs)Emacs Server'

:SEE-ALSO `mon-help-ipv4-header', `mon-help-process-functions',
`mon-help-make-network-process', `mon-help-file-dir-functions',
`mon-help-buffer-functions', `mon-help-hooks'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-inhibit-functions "mon-doc-help-utils" "\
List of functions and variables for temporary inhibition of Emacs behavior.

;; :INHIBIT-FUNCTIONS
`with-silent-modifications'
`with-local-quit'

;; :INHIBIT-VARIABLES
`inhibit-changing-match-data'
`inhibit-debug-on-entry'
`inhibit-default-init'
`inhibit-eol-conversion'
`inhibit-eval-during-redisplay'
`inhibit-field-text-motion'
`inhibit-file-name-handlers'
`inhibit-file-name-operation'
`inhibit-first-line-modes-regexps'
`inhibit-first-line-modes-suffixes'
`inhibit-frame-set-background-mode'
`inhibit-free-realized-faces'
`inhibit-iso-escape-detection'
`inhibit-load-charset-map'
`inhibit-local-menu-bar-menus'
`inhibit-menubar-update'
`inhibit-modification-hooks'
`inhibit-null-byte-detection'
`inhibit-point-motion-hooks'
`inhibit-quit'
`inhibit-read-only'
`inhibit-redisplay'
`inhibit-splash-screen'
`inhibit-startup-buffer-menu'
`inhibit-startup-echo-area-message'
`inhibit-startup-hooks'
`inhibit-startup-message'
`inhibit-startup-screen'
`inhibit-x-resources'

;; :INHIBIT-PROPERTIES
`apropos-inhibit` ;:NOTE (mon-map-obarray-symbol-plist-props 'apropos-inhibit)

;; :INHIBIT-FUNCTIONS-MON-LOCAL
`mon-with-inhibit-buffer-read-only'
`mon-inhibit-read-only'
`mon-with-inhibit-buffer-read-only'
`mon-inhibit-modification-hooks'
`mon-inhibit-point-motion-hooks'
`mon-toggle-read-only-point-motion'
`mon-with-inhibit-buffer-read-only-TEST'

:SEE-ALSO `mon-help-emacs-introspect'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-buffer-functions "mon-doc-help-utils" "\
Buffer related functions.

;; :BUFFER-ACTIONS-ON
`ispell-buffer'
`create-file-buffer'
`eval-buffer'
`eval-current-buffer'
`generate-new-buffer'
`generate-new-buffer-name'
`find-buffer-visiting'
`get-file-buffer'
`lock-buffer'
`rename-buffer'
`revert-buffer'
`save-buffer'
`save-current-buffer'
`unlock-buffer'
`view-buffer'

;; :BUFFER-ACTIONS-SETTERS
`set-buffer'
`set-buffer-auto-saved'
`set-buffer-major-mode'
`set-buffer-multibyte'
`set-buffer-modified-p'

;; :BUFFER-ACTIONS-MOVEMENT
`barf-if-buffer-read-only'
`bury-buffer'
`clone-buffer'
`clone-indirect-buffer'
`clone-indirect-buffer-other-window'
`display-buffer'
`fit-window-to-buffer'
`get-buffer'
`get-buffer-create'
`make-indirect-buffer'
`next-buffer'
`other-buffer'
`pop-to-buffer'
`previous-buffer'
`read-buffer'
`read-buffer-to-switch'
`replace-buffer-in-windows'
`set-buffer'
`switch-to-buffer'
`switch-to-buffer-other-frame'
`switch-to-buffer-other-window'
`unbury-buffer'
`view-buffer-other-frame'
`view-buffer-other-window'

;; :BUFFER-ACTIONS-ON-MULITPLE
`buffer-list'
`buffer-menu'
`buffer-menu-other-window'
`grep-buffers'
`list-buffers'
`save-some-buffers'

;; :BUFFER-CONTENTS
`compare-buffer-substrings'
`insert-buffer'
`prepend-to-buffer'
`buffer-string'
`buffer-substring'
`filter-buffer-substring'
`buffer-substring-filters'        ;<VARIABLE>
`buffer-substring-no-properties'
`buffer-swap-text'
`erase-buffer'
`append-to-buffer'
`copy-to-buffer'
`with-temp-buffer'
`with-output-to-temp-buffer'
`get-buffer'              ; :NOTE (read (get-buffer \"SOME-BUFFER-NAME\"))

;; :BUFFER-INSPECT
`buffer-base-buffer'
`buffer-chars-modified-tick'
`buffer-modified-tick'
`buffer-disable-undo'
`buffer-enable-undo'
`buffer-face-mode'
`buffer-face-set'
`buffer-face-toggle'
`buffer-file-name'
`buffer-has-markers-at'
`buffer-local-value'
`buffer-local-variables'
`buffer-name'
`overlay-buffer'
`buffer-size'
`current-buffer'
`gap-position'
`gap-size'
`get-buffer-process'
`get-buffer-window'
`get-buffer-window-list'
`internal-complete-buffer-except'
`internal-complete-buffer'
`list-buffers-directory'       ; :NOTE DVC's dvc-core.el sets this `permanent-local'
`process-buffer'
`verify-visited-file-modtime'
`window-buffer'

;; :BUFFER-FORMAT-AND-CODING
`format-encode-buffer'
`format-decode-buffer'
`buffer-file-format'              ;<VARIABLE>
`revert-buffer-with-coding-system'

;; :BUFFER-HOOKS
`buffer-save-hook'
`kill-buffer-hook'
`temp-buffer-setup-hook'
`temp-buffer-show-hook'

;; :BUFFER-KILLING
`kill-buffer'
`kill-buffer-and-window'
`kill-matching-buffers'
`kill-some-buffers'
`kill-this-buffer'
`kill-buffer-if-not-modified'

;; :BUFFFER-POSITIONS
`position-bytes'
`byte-to-position'
`mark-whole-buffer'
`beginning-of-buffer'
`beginning-of-buffer-other-window'
`end-of-buffer'
`end-of-buffer-other-window'
`eobp'
`buffer-end'
`point-min'
`point-max'
`point-max-marker'
`point-min-marker'

;; :BUFFER-TEMPORARY-FUNCTIONS
`completion-list-mode-finish'
`temp-buffer-resize-mode'
`resize-temp-buffer-window'
`with-output-to-temp-buffer'
`with-temp-buffer'                   : :NOTE Output to generated buffer \" *temp*\"

;; :BUFFER-TEMPORARY-VARIABLES
`temp-buffer-max-height'
`temp-buffer-resize-mode'
`temp-buffer-show-function'
`temp-buffer-setup-hook'
`temp-buffer-show-hook'

;; :BUFFER-PREDICATES
`buffer-live-p'
`buffer-modified-p'
`frame-or-buffer-changed-p'
`local-variable-p'         :SEE info node `(elisp)Creating Buffer-Local'
`local-variable-if-set-p'
`restore-buffer-modified-p'
`set-buffer-modified-p'

;; :BUFFER-WINDOWS
`display-buffer'
`get-buffer-window-list'
`kill-buffer-and-window'
`switch-to-buffer-other-window'
`window-buffer-height'
`window--display-buffer-1'
`window--display-buffer-2'

;; :BUFFER-FUNCTIONS-EXTERNAL
`bookmark-buffer-file-name'
`bookmark-buffer-name'
`with-buffer-modified-unmodified'    ;<MACRO>

;; :BUFFER-FUNCTIONS-MON-LOCAL
`mon-print-buffer-object-readably'
`mon-buffer-narrowed-p'
`mon-buffer-sub-no-prop'
`mon-buffer-sub-no-prop-check'
`mon-get-buffer-window-if'
`mon-get-buffer-hidden'
`mon-buffer-exists-so-kill'
`mon-buffer-exists-p'
`mon-get-buffer-w-mode'
`mon-with-file-buffer'
`mon-print-in-buffer-if-p'

;; :BUFFER-VARIABLES
`display-buffer-mark-dedicated'
`buffer-access-fontified-property'
`buffer-access-fontify-functions'
`buffer-auto-save-file-format'
`buffer-auto-save-file-name'
`buffer-backed-up'
`buffer-display-count'
`buffer-display-table'
`buffer-display-time'
`buffer-file-coding-system'
`buffer-file-coding-system-explicit'
`buffer-file-format'
`buffer-file-name'                    ; :NOTE Also a <FUNCTION>
`buffer-file-number'
`buffer-file-numbers-unique'
`buffer-file-read-only'
`buffer-file-truename'
`buffer-file-type'
`buffer-invisibility-spec'
`buffer-name-history'
`buffer-offer-save'
`buffer-quit-function'
`buffer-read-only'
`buffer-save-without-query'
`buffer-saved-size'
`buffer-substring-filters'
`buffer-stale-function'
`buffer-undo-list'
`clone-buffer-hook'
`indicate-buffer-boundaries'
`indicate-empty-lines'
`confirm-nonexistent-file-or-buffer'  ; :NOTE Also a <FUNCTION>
`read-buffer-function'
`save-some-buffers-action-alist'
`same-window-buffer-names'
`selective-display'
`selective-display-ellipses'
`special-display-function'
`special-display-buffer-names'
`temp-buffer-max-height'
`temp-buffer-resize-mode'
`temp-buffer-show-function'

:SEE info node `(elisp)Buffers and Windows'.

:SEE-ALSO `mon-help-window-functions', `mon-help-frame-functions',
`mon-help-file-dir-functions', `mon-help-hooks',
`mon-help-process-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-frame-functions "mon-doc-help-utils" "\
Functions for working with frames.

;; :FRAME-FILES
`find-file-other-frame'
`find-file-read-only-other-frame'

;; :FRAME-BUFFERS
`display-buffer-other-frame'
`switch-to-buffer-other-frame'
`view-buffer-other-frame'

;; :FRAME-FACES
`frame-set-background-mode'
`frame-face-alist'
`frame-update-face-colors'
`frame-update-faces'

;; :FRAME-WINDOWS
`frame-first-window'
`frame-root-window'
`frame-selected-window'
`next-multiframe-window'
`previous-multiframe-window'
`set-frame-selected-window'
`window--frame-usable-p'
`window-frame'

;; :FRAME-INSPECT-FRAMES
`filtered-frame-list'
`frame-list'
`frames-on-display-list'
`make-frame-names-alist'
`minibuffer-frame-list'
`selected-frame'
`tool-bar-lines-needed'
`visible-frame-list'

;; :FRAME-HANDLER-GET-SELECT
`trace-redisplay'
`trace-to-stderr'
`dump-tool-bar-row'
`dump-frame-glyph-matrix'
`with-selected-frame'
`get-other-frame'
`next-frame'
`other-frame'
`select-frame'
`select-frame-by-name'
`select-frame-set-input-focus'

;; :FRAME-HANDLER-CREATE-DESTROY
`delete-frame'
`delete-other-frames'
`frame-initialize'
`make-frame'
`make-frame-command'
`make-frame-on-display'
`make-frame-visible'
`make-initial-minibuffer-frame'

;; :FRAME-LOWER-RAISE-ICONIFY
`auto-lower-mode'
`auto-raise-mode'
`iconify-frame'
`iconify-or-deiconify-frame'
`lower-frame'
`raise-frame'
`suspend-frame'

;; :FRAME-PREDICATES
`filtered-frame-list'
`frame-configuration-p'
`frame-live-p'
`frame-or-buffer-changed-p'
`frame-visible-p'
`framep'
`framep-on-display'
`window--frame-usable-p'

;; :FRAME-HANDLERS-SERVER
`frame-focus'
`frame-terminal'
`get-device-terminal'
`handle-delete-frame'
`handle-switch-frame'
`modify-all-frames-parameters'
`modify-frame-parameters'
`redirect-frame-focus'
`redraw-frame'
`selected-terminal'
`server-create-tty-frame'
`server-create-window-system-frame'
`server-handle-delete-frame'
`server-raise-frame'

;; FRAME-DISPLAY
`close-display-connection'
`display-mouse-p'
`display-popup-menus-p'
`display-graphic-p'
`display-images-p'
`display-selections-p'
`display-screens'
`display-pixel-height'
`display-pixel-width'
`display-mm-height'
`display-mm-width'
`display-backing-store'
`display-save-under'
`display-planes'
`display-color-cells'
`display-visual-class'
`x-get-resource'

;; :FRAME-CONFIGURATIONS
`frame-configuration-to-register'
`window-configuration-frame'
`set-frame-configuration'
`current-frame-configuration'

;; :FRAME-PARAMETER-INSPECT
`frame-char-width'
`frame-current-scroll-bars'
`frame-geom-spec-cons'
`frame-geom-value-cons'
`frame-height'
`frame-notice-user-settings'    ; :NOTE Also a <VARIABLE>
`frame-parameter'
`frame-parameters'
`frame-pixel-height'
`frame-pixel-width'
`frame-remove-geometry-params'
`frame-width'

;; :FRAME-PARAMETER-SETTERS
`modify-frame-parameters'
`set-frame-name'
`set-frame-font'
`set-frame-parameter'
`set-background-color'
`set-foreground-color'
`set-cursor-color'
`set-mouse-color'
`set-border-color'
`set-frame-width'
`set-frame-height'

;; FRAME-PARAMAMETER-PARAMETERS
`alpha`
`auto-lower`
`auto-raise`
`background-color`
`background-mode`
`border-color`
`border-width`
`buffer-list`        ; :NOTE (assq 'buffer-list (frame-parameters (selected-frame)))
`buffer-predicate`   ; :NOTE (frame-parameter 'buried-buffer-list (selected-frame))
`buried-buffer-list`
`cursor-color`
`cursor-type`
`display-type`
`display`
`environment`
`explicit-name`
`font-backend`
`font-parameter`
`font`
`foreground-color`
`fullscreen`
`height`
`horizontal-scroll-bars`
`icon-name`
`icon-type`
`internal-border-width`
`left-fringe`
`left`
`line-spacing`
`menu-bar-lines`
`minibuffer`
`modeline`
`mouse-color`
`name`
`outer-window-id`
`parent-id`
`right-fringe`
`screen-gamma`
`scroll-bar-background`
`scroll-bar-foreground`
`scroll-bar-width`
`sticky`
`title`
`tool-bar-lines`
`top`
`unsplittable`
`vertical-scroll-bars`
`visibility`
`wait-for-wm`
`width`
`window-id`
`window-system`

;; :FRAME-HOOKS
`after-setting-font-hook'
`before-make-frame-hook'
`before-make-frame-hook'
`delete-frame-hook'

;; :FRAME-VARIABLES
`after-make-frame-functions'
`delete-frame-functions'
`frame-alpha-lower-limit'
`frame-background-mode'
`frame-creation-function-alist'
`frame-inherited-parameters'
`frame-initial-frame'
`frame-initial-frame-alist'
`frame-initial-geometry-arguments'
`frame-name-history'
`frame-notice-user-settings'       ; :NOTE also a <FUNCTION>
`frame-title-format'
`inhibit-frame-set-background-mode'
`initial-frame-alist'
`initial-frame-alist'
`last-event-frame'
`minibuffer-frame-alist'
`pop-up-frames'
`pop-up-frame-alist'
`pop-up-frame-function'
`special-display-frame-alist'
`special-display-popup-frame'
`window-system-default-frame-alist'
`x-display-name'

;; :FRAME-FUNCTIONS-MON-LOCAL
`mon-dired-find-file-other-frame'
`mon-frame-live-visible-graphic-p'

:SEE info node `(elisp)Frames'.

:SEE :FILE lisp/frame.el src/frame.c src/dispnew.c

:SEE-ALSO `mon-help-window-functions', `mon-help-buffer-functions',
`mon-help-emacs-introspect'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-window-functions "mon-doc-help-utils" "\
Functions for working with windows.

;; :WINDOW-BUFFERS
`display-buffer'
`display-buffer-other-frame'
`get-buffer-window'
`get-buffer-window-list'
`kill-buffer-and-window'
`replace-buffer-in-windows'
`set-window-buffer'
`switch-to-buffer-other-window'
`window-buffer'
`window-buffer-height'
`window--display-buffer-1'
`window--display-buffer-2'

;; :WINDOW-DEL-KILL-QUIT
`delete-window'
`delete-windows-on'
`delete-other-windows-vertically'
`kill-buffer-and-window'
`quit-window'

;; :WINDOW-GETTERS
`count-windows'
`get-buffer-window'
`get-buffer-window-list'
`get-largest-window'
`get-lru-window'
`get-window-with-predicate'
`minibuffer-window'
`next-window'
`previous-window'
`selected-window'
`walk-windows'
`window-list'
`window-tree'

;; :WINDOW-SETTERS
`set-window-buffer'
`set-window-dedicated-p'

;; :WINDOW-CONFIGURATION
`compare-window-configurations'
`current-window-configuration'
`window-configuration-frame'
`window-configuration-to-register'

;; :WINDOW-INSPECT
`window-buffer'
`window-current-scroll-bars'
`window-display-table'
`window-frame'
`window-system'                    ; :NOTE Also a <VARIABLE>
`window-parameter'
`window-parameters'
`window-redisplay-end-trigger'     ;<DEPRECATED>

;; :WINDOW-HANDLER-MOVEMENT
`save-selected-window'
`save-window-excursion'
`with-selected-window'
`handle-select-window'

;; :WINDOW-HANDLER-MOVEMENT-TO
`display-buffer'
`display-buffer-other-frame'
`find-file-other-window'
`move-to-window-line-top-bottom'
`switch-to-buffer-other-window'
`window--display-buffer-1'
`window--display-buffer-2'
`x-popup-menu'                  :SEE :FILE src/menu.c

;; :WINDOW-HANDLER-MOVEMENT-OF
`adjust-window-trailing-edge'
`balance-windows'
`balance-windows-area'
`enlarge-window'
`enlarge-window-horizontally'
`fit-window-to-buffer'
`recenter-top-bottom'
`shrink-window-horizontally'
`shrink-window-if-larger-than-buffer'
`split-window-sensibly'
`split-window-horizontally'
`split-window-vertically'
`window-hscroll'
`window-vscroll'
`window--try-to-split-window'
`window--even-window-heights'

;; :WINDOW-POSITION-IN
`posn-window'
`pos-visible-in-window-p'
`window-point'
`window-dot'                ;<DEPRECATED>

;; :WINDOW-POSITION-OF
`window-at'
`window-start'
`window-end'

;; :WINDOW-PREDICATES
`same-window-p'
`get-window-with-predicate'
`minibuffer-window-active-p'
`one-window-p'
`pos-visible-in-window-p'
`set-window-dedicated-p'
`special-display-p'
`truncated-partial-width-window-p'
`window--frame-usable-p'
`window-configuration-p'
`window-dedicated-p'
`window-fixed-size-p'
`window-full-width-p'
`window-live-p'
`window-minibuffer-p'
`window-safely-shrinkable-p'
`window-splittable-p'
`windowp'

;; :WINDOW-SIZE-PIXEL
`window-pixel-edges'        ; :RETURN <LIST> => (LEFT TOP RIGHT BOTTOM)
`window-inside-pixel-edges' ; :RETURN <LIST> => (LEFT TOP RIGHT BOTTOM)
`window-scroll-bars'        ; :RETURN <LIST> => (WIDTH COLS V-TYPE H-TYPE)
`window-line-height'        ; :RETURN <LIST> => (HEIGHT V-POS Y-POS OFFBOT)
`window-fringes'            ; :RETURN <LIST> => (LEFT-WIDTH RIGHT-WIDTH OUTSIDE-MARGINS)
`window-margins'            ; :RETURN <CONS> => (LEFT-WIDTH . RIGHT-WIDTH)

;; :WINDOW-SIZE-LINE-COLUMN
`count-screen-lines'
`set-window-text-height'
`window-buffer-height'
`window-edges'              ; :RETURN <LIST> => (LEFT TOP RIGHT BOTTOM)
`window-inside-edges'       ; :RETURN <LIST> => (LEFT TOP RIGHT BOTTOM)
`window-width'              ; :RETURN <COL(S)>
`window-height'             ; :RETURN <LINE(S)>
`window-text-height'        ; :RETURN <LINE(S)>
`window-body-height'        ; :RETURN <LINE(S)>

;; :WINDOW-VARIABLES
`special-display-buffer-names'
`display-buffer-mark-dedicated'
`even-window-heights'
`pop-up-windows'
`recenter-last-op'
`same-window-buffer-names'
`same-window-regexps'
`split-window-keep-point'
`split-window-preferred-function'
`split-height-threshold'
`split-width-threshold'
`window-area-factor'
`window-min-height'
`window-min-width'
`window-point-insertion-type'
`window-scroll-functions'
`window-size-change-functions'
`window-size-fixed'
`window-system'                      ; :NOTE Also a <FUNCTION>
`window-system-initialization-alist'
`window-system-version'
`window-text-change-functions'

;; :WINDOW-VARIABLES-HOOKS
`window-configuration-change-hook' ;<VARIABLE>
`window-setup-hook'                ;<VARIABLE>

;; :WINDOW-FUNCTIONS-MON-LOCAL
`mon-map-windows->plist'`n
:SEE info node `(elisp)Windows'.

:SEE :FILE lisp/window.el src/window.c

:SEE-ALSO `mon-help-frame-functions', `mon-help-buffer-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-mode-functions "mon-doc-help-utils" "\
A list regarding definition and access of major/minor modes (non-exhausitve).

;; :MODE-FUNCTIONS
`add-minor-mode'
`define-compilation-mode'
`define-derived-mode'
`define-generic-mode'
`define-globalized-minor-mode'
`define-minor-mode'
`describe-mode'
`generic-mode'
`generic-mode-internal'
`hack-local-variables'
`indent-line-function'
`kill-all-local-variables'
`make-local-variable'
`make-variable-buffer-local'
`modify-syntax-entry'
`set-auto-mode'
`set-buffer-major-mode'
`use-local-map'

;; :MODE-BASE-MAJOR-MODES
`normal-mode'
`fundamental-mode'

;; :MODE-MODE-LINE
`force-mode-line-update'
`format-mode-line'
`default-mode-line-format'
`global-mode-string'
`header-line-format'
`mode-line-modified'
`mode-line-format'
`mode-line-buffer-identification'
`mode-line-position'

;; :MODE-VARIABLES
`auto-mode-alist'
`auto-mode-interpreter-regexp'
`default-major-mode'
`enable-local-variables'
`inhibit-first-line-modes-regexps'
`inhibit-first-line-modes-suffixes'
`initial-major-mode'
`interpreter-mode-alist'
`local-enable-local-variables'
`magic-mode-alist'
`magic-fallback-mode-alist'
`minor-mode-map-alist'
`mode-name'
`mode-specific-map'
`standard-syntax-table'

;; :MODE-HOOKS
`after-change-major-mode-hook'
`before-hack-local-variables-hook'
`change-major-mode-hook'
`delay-mode-hooks'
`delayed-mode-hooks'
`hack-local-variables-hook'
`run-mode-hooks'

;; :MODE-PLIST-PROPERTIES
`:minor-mode-function`
`definition-name`
`mode-class`
`derived-mode-unmerged`

;; :MODE-MON-LOCAL
`mon-get-buffer-w-mode'

:SEE info node `(elisp)Modes'

:SEE-ALSO `mon-help-file-dir-functions', `mon-help-buffer-functions',
`mon-help-hooks', `mon-help-syntax-functions', `mon-help-faces',
`mon-help-faces-basic', `mon-help-faces-font-lock', `mon-help-font-lock',
`mon-help-key-functions', `mon-help-easy-menu', `mon-help-custom-keywords'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-xml-functions "mon-doc-help-utils" "\
XML related functions.

;; :XML-FILE.lisp.xml
`xml-get-children'
`xml-parse-attlist'
`xml-parse-dtd'
`xml-parse-elem-type'
`xml-parse-file'
`xml-parse-fragment'
`xml-parse-region'
`xml-parse-string'
`xml-parse-tag'
`xml-print'
`xml-debug-print'
`xml-escape-string'

;; :XML-FILE.nxml.xsd-regexp
`xsdre-translate'
`xsdre-parse-regexp'

;; :XML-FILE.nxml.xmltok
`xmltok-unicode-to-char'
`xmltok-forward'
`xmltok-forward-prolog'
`xmltok-forward-special'

;; :XML-FILE.nxml.nxml-parse
`nxml-parse-file'

;; :XML-FILE.eieio-xml
`eieio-xml-override-prin1'
`eieio-xml-list-prin1'
`object-write-xml'

:SEE-FILE xml.el nxml/xsd-regexp.el nxml/xmltok.el nxml/nxml-parse.el
:SEE-FILE json.el

:SEE-ALSO `mon-help-css-mode', `mon-help-css-color', `mon-help-css-complete',
`mon-help-css-check', `mon-help-ebay-template-mode', `mon-help-tidy'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-eieio-defclass "mon-doc-help-utils" "\
Routine eieio functions, specs, args, etc.
:SEE info node `(eieio)Top'
:SEE :FILE ./cedet-cvs/ede/ede.el for examples of defining big classes.

;; :EIEIO-CLASS-SLOT-KEYWORDS
:initarg                 {tag, string}
:initform                {expression}
:type                    {t, null, symbol, list, function, string, character,
                          integer, fixnum, number, real, float, boolean}
                         :SEE `typep'`type-of' `deftype' `typecase' `check-type'
                         :SEE info node `(cl)Type Predicates'
                         :SEE info node `(elisp)Type Predicates'
:allocation              {:instance, :class}
:documentation           {string}

;; :EIEIO-CLOS-NON-COMPLIANT
:accessor                {generic-function-name}
:writer                  {generic-function-name}
:reader                  {generic-function-name}

;; :EIEIO-EMACS-SPECIFIC
:custom                  {string}
:label                   {string}
:group                   {customization-group}
:custom-groups           {list}
:printer                 {function}
:protection              {:public, :protected, :private}
:allow-nil-initform      {boolean}
:abstarct                {boolean}
:method-invocation-order {:breadth-first, :depth-first}

;; :EIEIO-CLOS-NON-IMPLIMENTED
:metaclass
:default-initargs

;; Additional class tags are added with: `class-option'

;; :EIEIO-BASE-CLASSES
`eieio-persistent'         (file file-header-line) <CLASS>
`eieio-instance-inheritor' (parent-instance)       <CLASS>
`eieio-instance-tracker'   (tracker-symbol)        <CLASS>
`eieio-speedbar'           (buttontype buttonface) <CLASS>
`eieio-singleton'                                  <CLASS>
`eieio-named'                                      <CLASS>

:SEE-ALSO `mon-insert-defclass-template', `mon-help-eieio-functions',
`mon-help-eieio-methods', `mon-help-custom-keywords', `mon-help-faces-themes',
`mon-help-widgets'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-eieio-functions "mon-doc-help-utils" "\
List of interface functions for work with EIEIO system of CEDET.

:SEE info node `(eieio)Function Index'.

:NOTE Below right-hand column elts are a symbol signature unless prefixed by `;<'.

;; :EIEIO-CLASSES               :SEE `mon-help-eieio-defclass'
`defclass'                       NAME SUPERCLASS SLOTS &rest OPTIONS-AND-DOC
`eieio-hook'                    ;<VARIABLE>

;; :EIEIO-MAKING-OBJECTS
`make-instance'                  CLASS &rest INITARGS
`class-constructor'              OBJECT-NAME &rest SLOTS
`initialize-instance'            OBJ &rest SLOTS
`shared-initialize'              OBJ &rest SLOTS

;; :EIEIO-METHODS                :SEE `mon-help-eieio-methods'
`defgeneric'                     METHOD ARGLIST [DOC-STRING]
`call-next-method'               &rest REPLACEMENT-ARGS
`defmethod'                      METHOD [:before|:primary|:after|:static]

;; :EIEIO-BASIC-METHODS
`clone'                          OBJ &rest PARAMS
`constructor'                    ;<GENERIC-FUNCTION :STATIC>
`object-print'                   THIS &rest STRINGS
`object-write'                   OBJ &optional COMMENT
`slot-missing'                   AB &rest FOO
`slot-unbound'                   OBJECT CLASS SLOT-NAME FN
`no-applicable-method'           OBJECT METHOD &rest ARGS
`no-next-method'                 OBJECT &rest ARGS

`eieio-generic-call-arglst'        ;<VARIABLE>
`eieio-pre-method-execution-hooks' ;<VARIABLE>

;; :EIEIO-ACCESSING-SLOTS
`oset'                           OBJECT SLOT VALUE ;-> `eieio-oset'
`slot-value'                     OBJECT SLOT       ;-> `oref' -> `eieio-oref'
`set-slot-value'                 OBJECT SLOT VALUE ;-> `eieio-oset'
`oset-default'                   CLASS SLOT VALUE  ;-> `eieio-oset-default'
`oref-default'                   OBJ SLOT          ;-> `eieio-oref-default'
`slot-makeunbound'               OBJECT SLOT       ;-> is `slot-makunbound'
`with-slots'                     SPEC-LIST OBJECT &rest BODY
`object-add-to-list'             OBJECT SLOT ITEM &optional APPEND
`object-remove-from-list'        OBJECT SLOT ITEM

;; :EIEIO-ASSOCIATION-LISTS
`object-assoc'                   KEY SLOT LIST
`object-assoc-list'              SLOT LIST
`eieio-build-class-alist'        &optional BASE-CLASS

;; :EIEIO-PREDICATES
`child-of-class-p'               CHILD CLASS
`class-abstract-p'               CLASS
`class-p'                        CLASS
`eieio-slot-originating-class-p' START-CLASS SLOT
`generic-p'                      METHOD-SYMBOL
`generic-primary-only-p'         METHOD
`generic-primary-only-one-p'     METHOD
`next-method-p'
`object-of-class-p'              OBJ CLASS
`object-p'                       OBJ    ;-> `eieio-object-p'
`same-class-fast-p'              OBJ CLASS
`same-class-p'                   OBJ CLASS
`slot-boundp'                    OBJECT SLOT
`slot-exists-p'                  OBJECT-OR-CLASS SLOT

;; :EIEIO-UTILITY
`class-v'                        CLASS
`class-constructor'              CLASS
`class-direct-superclasses'      CLASS  ;-> `class-parents'
`class-direct-subclasses'        CLASS  ;-> `class-children'
`class-children-fast'            CLASS
`class-name'                     CLASS
`class-method-invocation-order'  CLSSS
`class-option'                   CLASS OPTION
`class-option-assoc'             LIST OPTION
`class-parents-fast'             CLASS
`class-parent'                   CLASS  ;<DEPRECATED>
`class-slot-initarg'             CLASS SLOT
`eieio-set-defaults'             OBJ &optional SET-ALL
`eieio-initarg-to-attribute'     CLASS INITARG
`find-class'                     SYMBOL &optional ERRORP
`object-class'                   OBJ    ;->`class-of'
`object-class-fast'              OBJ
`object-class-name'              OBJ
`object-name'                    OBJ &optional EXTRA
`object-slots'                   OBJ
`object-name-string'             OBJ
`object-set-name-string'         OBJ NAME

;; :EIEIO-INTROSPECTION
`describe-class'                 CLASS   ;-> `eieio-describe-class'
`describe-generic'               GENERIC ;-> `eieio-describe-generic'
`describe-method'                GENERIC ;-> `eieio-describe-generic'
`eieiodoc-class'                 CLASS INDEXSTRING &optional SKIPLIST
`eieio-all-generic-functions'    &optional CLASS
`eieio-browse'                   ROOT-CLASS
`eieio-class-tree'               &optional ROOT-CLAS
`eieio-class-slot-name-index'    CLASS SLOT
`eieio-slot-name-index'          CLASS OBJ SLOT
`eieio-default-superclass'       ;<VARIABLE> ;<- :ALIASED-BY `standard-class'
`eieio-describe-class-slots'     CLASS
`eieio-describe-constructor'     FCN
`eieio-lambda-arglist'           FUNC
`eieio-method-documentation'     GENERIC CLASS
`eieio-version'                  ;<VARIABLE> & <FUNCTION>

;; :EIEIO-SIGNALS
`invalid-slot-name'              OBJ-OR-CLASS SLOT
`no-method-definition'           METHOD ARGUMENTS
`no-next-method'                 CLASS ARGUMENTS
`invalid-slot-type'              SLOT SPEC VALUE
`unbound-slot'                   OBJECT CLASS SLOT

;; :EIEIO-PRINTERS
`object-print'                   THIS &rest STRINGS    ;<METHOD>
`object-write'                   OBJ &optional COMMENT ;<METHOD>
`eieio-override-prin1'           THING
`eieio-list-prin1'
`eieio-xml-override-prin1'       THING
`eieio-xml-list-prin1'           LIST
`eieio-edebug-prin1-to-string'   OBJECT &optional NOESCAPE
`eieio-display-method-list'
`object-write-xml'               ;<METHOD>

;; :EIEIO-ADVISED-FUNCTIONS
`eieio-describe-class' -> `describe-variable'
`eieio-describe-generic' -> `describe-function'

;; :EIEIO-CLOS-UNIMPLEMENTED    :SEE info node `(eieio)CLOS compatibility'
`change-class'
`describe-object'               :SEE `object-write'

;; :EIEIO-UNINMPLEMENTED
`destructor'
`eieio-read-xml'

;; :EIEIO-LOAD
`eieio-defclass-autoload`       ;<PROPERTY>

:SEE-ALSO `mon-help-eieio-methods', `mon-help-eieio-defclass',
`mon-insert-defclass-template', `mon-help-custom-keywords',
`mon-help-faces-themes', `mon-help-widgets'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-eieio-methods "mon-doc-help-utils" "\
Help interrogating eieio's generic functions and methods.

Following presents examples for examining the underlying `vector' and `obarray'
structures. To run throught the examples evaluate below:

 ===================
 :CREATE-TWO-CLASSES
 ===================

\(defclass tt--367 ()
  ((s-367-0
    :initarg  :s-367-0
    :initform nil
    :accessor acc-s367-0)
   (s-367-1
    :initarg  :s-367-1
    :initform nil
    :documentation \"doc s-367-1\"))
  \"Dummy class tt--367\")

\(defclass tt--367-sub (tt--367)
  ((s-367-sub-0
    :initarg  :s-367-sub-0
    :initform nil
    :accessor acc-s367-sub-0)
   (s-367-sub-1
    :initarg  :s-367-sub-1
    :initform nil
    :type list
    :documentation \"s-367-sub-1 w/ type 'list.\"))
  \"Dummy class tt--367-sub\")

 ==========================
 :INSTANTIATE-OBJECTS-SLOTS
 ==========================

\(setq test-tt--367
      (tt--367 \"test-tt--367\" :s-367-1 '(a list on second slot s-367-1)))

\(setf (acc-s367-0 test-tt--367) \"slot-value on s-367\")

\(acc-s367-0 test-tt--367)
;=> \"slot-value on s-367\"

\(slot-value test-tt--367 :s-367-0)
;=> \"slot-value on s-367\"

\(setq test-tt--367-sub (tt--367-sub \"test-tt--367-sub\"))
test-tt--367-sub
;=> [object tt--367-sub \"test-tt--367-sub\" nil nil nil]

\(set-slot-value test-tt--367-sub :s-367-sub-0 [vec on vec])
\(acc-s367-sub-0 test-tt--367-sub)
;=> [vec on vec]

\(setf (slot-value test-tt--367-sub :s-367-sub-1) \"This list should fail\") 

\(setf (slot-value test-tt--367-sub :s-367-sub-1) '(this-list should pass)) 

\(slot-value test-tt--367-sub :s-367-sub-1)
;=> (this-list should pass)

 ==============
 :CLASS-VECTORS
 ==============

By default an eieio class is instantiated as a vector.
To access this vector use `class-v':

:IDIOM (class-v '<SOME-CLASS>)

:EXAMPLE
\(class-v 'tt--367)

:NOTE Class vectors are intialized with respect to `eieio-default-superclass' when
defined without a parent class.
:SEE info node `(eieio)Default Superclass'.

The init value of eieio-default-superclass is hardwired at eieio build time as
a vector of 26 elements. It is bootstrapped from the values of 26 constants.
The 26th of these constants `class-num-slots' sets the vector size of eieio's
default superclass and the default vector size of all classes derived thereof.

:EXAMPLE
\(length (class-v 'eieio-default-superclass))
\(length (class-v 'tt--367))

25 other constants are also evaluated to generate eieio-default-superclass.
This happens at build time so that the default superclass has a value while it
is _itself_ being built.

Because present eieio sytems derive all other classes from eieio's default
superclass current standard eieio systems allow direct access to the individual
elements of a class using the values of those same constants defined to build
eieio's default superclass.

Access these `aref' elements with the macro `class-v' with expressions of the form:

:IDIOM (aref (class-v '<SOME-CLASS>) <CONSTANT>)

:EXAMPLE
\(aref (class-v 'tt--367) class-symbol)

Assuming the two example classes and instances above are initialized a full
class vector deconstructs as follows:

:EXAMPLE
\(class-v 'tt--367)

\[defclass               ;; 0  ;<- This determines if `class-p'
 tt--367                ;; 1  `class-symbol' ;<- This is the `class-constructor'
 nil                    ;; 2  `class-parent'
 (tt--367-sub)          ;; 3  `class-children'
 [0 s-367-0 s-367-1]    ;; 4  `class-symbol-obarray'
 (s-367-0 s-367-1)      ;; 5  `class-public-a'
 (nil nil)              ;; 6  `class-public-d'
 (nil \"doc :s-367-1\")   ;; 7  `class-public-doc'
 [t t]                  ;; 7  `class-public-doc'
 (nil nil)              ;; 8  `class-public-type'
 (nil nil)              ;; 9  `class-public-custom'
 ((default) (default))  ;; 10 `class-public-custom-label'
 (nil nil)              ;; 11 `class-public-custom-group'
 (nil nil)              ;; 12 `class-public-printer'

 ((:s-367-0 . s-367-0)
  (:s-367-1 . s-367-1)) ;; 14 `class-initarg-tuples'

 nil                    ;; 15 `class-class-allocation-a'
 nil                    ;; 16 `class-class-allocation-doc'
 []                     ;; 17 `class-class-allocation-type'
 nil                    ;; 18 `class-class-allocation-custom'
 nil                    ;; 19 `class-class-allocation-custom-label'
 nil                    ;; 20 `class-class-allocation-custom-group'
 nil                    ;; 21 `class-class-allocation-printer'
 nil                    ;; 22 `class-class-allocation-protection'
 []                     ;; 23 `class-class-allocation-values'

 [object tt--367 default-cache-object nil nil] ;; 24 `class-default-object-cache'

 (:custom-groups (default)
  :documentation \"Dummy class tt-367\")]        ;; 25 `class-options'

 ==================
 :EIEIO-METHOD-TREE
 ==================

eieio stores a generic function's methods in an eieio-method-tree. This is a
kind of property on the generic's 'base' method. It has the form:

\(eieio-method-tree . 
                   [BEFORE PRIMARY AFTER
                    genericBEFORE genericPRIMARY genericAFTER])

Examine a generic function's method-tree with its eieio-method-tree property.

:IDIOM (get <METHOD> 'eieio-method-tree)

:EXAMPLE
\(get 'acc-s367-0 'eieio-method-tree)

\[nil
 nil    ;<- :BEFORE
 ((tt--367 lambda (this)
           \"Retrieves the slot `s-367-0' from an object of class `tt--367'\"
           (if (slot-boundp this (quote s-367-0))
               (eieio-oref this (quote s-367-0)) nil)))
        ;^- :PRIMARY
 nil    ;<- :AFTER
 nil    ;<- genericBEFORE 
 nil    ;<- genericPRIMARY
 nil]   ;<- genericAFTER

 =====================
 :EIEIO-METHOD-OBARRAY
 =====================

eieio's method obarrays are stored as a property of a generic function on its
`eieio-method-obarray' property. This property is a vector which contains a list
of method bindings.

A generic function's eieio-method-obarray has the form:

\(eieio-method-obarray . [BEFORE PRIMARY AFTER
                        genericBEFORE genericPRIMARY genericAFTER])

:IDIOM (get <METHOD> 'eieio-method-obarray)

:EXAMPLE
\(get 'acc-s367-0 'eieio-method-obarray)

\[[0 0 0 0 0 0 0 0 0 0 0]     aref 0 - all static methods.
 [0 0 0 0 0 0 0 0 0 0 0]     aref 1 - all methods classified as :before
 [0 0 0 0 0 0 0 0 tt--367    aref 2 - all methods classified as :primary
  0 0 0 0 0 0 0 0 0                   aref 2 is a vector of length 41
  0 0 0 0 0 0 0 0 0          
  0 0 0 0 0 0 0 0 0          
  0 0 0 0 0]
 [0 0 0 0 0 0 0 0 0 0 0]     aref 3 - all methods classified as :after
 nil                         aref 4 -   a generic classified as :before
 nil                         aref 5 -   a generic classified as :primary
 nil]                        aref 6 -   a generic classified as :after

Examine a particular type or group of methods with a key lookup into
the 'obarray' (a vector) of a generic function.

To find primary methods of a generic function get the 2nd index of it's obarray.

:IDIOM (get <METHOD> 'eieio-method-tree)

:EXAMPLE
\(aref (get 'acc-s367-sub-0 'eieio-method-obarray) 2)

\(aref (get 'acc-s367-0 'eieio-method-obarray) 2)

A generic form can be interrogated with `eieio-generic-form':

:IDIOM (eieio-generic-form <METHOD> <KEY> <CLASS>)

:EXAMPLE
\(eieio-generic-form 'acc-s367 2 tt--367-sub)

\(tt--367 . tt--367) ;key 2
\(tt--367 . tt--367) ;key 4
\(tt--367 . tt--367) ;key 5
\(tt--367 . tt--367) ;key 6

:SEE-ALSO
`eieiomt-method-list'                  METHOD KEY CLASS
`eieiomt-install'                      METHOD-NAME
`eieiomt-add'                          METHOD-NAME METHOD KEY CLASS
`eieiomt-next'                         CLASS
`eieiomt-method-list'                  METHOD KEY CLASS
`eieiomt-sym-optimize'                 S
`eieio-unbind-method-implementations'  METHOD
`eieiomt-optimizing-obarray'          ;<VARIABLE>

 ===============================
 :METHODS-AND-GENERICS-EXAMINING
 ===============================

:EXAMPLE

\(eieio-describe-constructor 'tt--367) ; :NOTE A `constructor' is a 'static' method.

\(describe-variable 'test-tt--367)

\(describe-function 'acc-s367)

\(eieio-describe-generic 'acc-s367)

\(describe-method 'acc-s367-0)

\(eieio-describe-generic 'acc-s367-sub-0)

\(eieio-describe-method 'acc-s367-sub-0)

\(eieio-describe-method 'acc-s367-0)

\(describe-function 'acc-s367-sub-0)


:SEE-ALSO `mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-custom-keywords', `mon-help-faces-themes', `mon-help-widgets'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-type-predicates "mon-doc-help-utils" "\
List of predicate functions for interrogating elisp types.

      _______________________                                       70.
     |                       |                                        
     | :TYPE-PREDICATES-SEQS |                                        
 ____|_______________________|____________                            
|                               --------  |                           
| `sequencep'                  |`listp' ¦-¦--| `consp'                 
|              __________      |`nlistp'| |  .-+ `atom'                
|             |          |      --------  |                           
|  ___________| `arrayp' |______________  |                           
| |   _________           ___________   | |                           
| |  |         |         |           |  | |                           
| |  |`vectorp'|         | `stringp' ¦--¦-¦--| `string-or-null-p'     
| |  |_____¦___|         |___________|  | |  . `char-or-string-p'     
| |        ¦                            | |                           
| | `vector-or-char-table-p'            | |                           
| |  ______¦_______    _______________  | |                           
| | |      '       |  |               | | |                           
| | |`char-table-p'|  |`bool-vector-p'| | |                           
| | |_¦____________|  |_______________| | |  ___________________      
| |___¦_________________________________| | |                   |     
|_____¦___________________________________| | :NUMERICAL-SHOWER |     
      ¦                                  ___|___________________|_____
      |-+ `keymapp'                     |                             |
      .--+ `case-table-p'               |       `zerop'               |
      .--+ `syntax-table-p'             |          |     `booleanp'   |
      .--+ `display-table-p'            |      `numberp'              |
            ____________                |          |                  |
           |            |               |        +-¦-+                |
           | `type-of'  |               | `floatp' | | `natnump'      |
   ________|____________|___________    |          | .-+ `wholenump'  |
  |                                 |   |          | .--+ `integerp'. |
  | bool-vector  <- `bool-vector-p' |   |          | .---+ `oddp'   | |
  | buffer       <- `bufferp'       |   |          | .---+ `evenp'  | |
  | char-table   <- `char-table-p'  |   |          |                | |
  | cons         <- `consp'         |   | `plusp'+-¦-+`minusp'      | |
  | float        <- `floatp'        |   |___________________________¦_|
  | font-entity  <- `fontp'         |                               ¦ 
  | font-object  <- `fontp'         |        `number-or-marker-p' +-| 
  | font-spec    <- `fontp'         |       `integer-or-marker-p' +-. 
  | frame        <- `framep'        |                                 
  | hash-table   <- `hash-table-p'  |                                 
  | integer      <- `integerp',     |                                 
  | marker       <- `markerp'       |                                 
  | overlay      <- `overlayp'      |                                 
  | process      <- `processp'      |                                 
  | string       <- `stringp'       |                                 
  | subr         <- `subrp'         |                                 
  | symbol       <- `symbolp'       |                                 
  | vector       <- `vectorp'       |                                 
  | window       <- `windowp'       |                                 
  | compiled-function               |
  |   ^-- `byte-code-function-p'    |
  |                                 |
  |_________________________________|                               70^

;; :TYPE-PREDICATE-FUNCTIONS
`typep'
`deftype'
`etypecase'
`typecase'
`check-type'
`widget-type'
`buttontype'
`button-has-type-p'
`button-type-subtype-p'

;; :TYPE-PREDICATE-FUNCTION
`functionp'
`mon-function-object-p'
`apropos-macrop'
`keywordp'
`commandp'
`byte-code-function-p' 
:NOTE Interrogation of an Emacs function objects foo can be tricky because we
may need to know any one or more of the following before we can effectively make
the query:
 - Is foo a symbol;
 - Is foo bound;
 - Does the symbol foo have a value in its function cell;
 - What is the type of value in foo's function cell
   -- Is foo: 
      --- a lambda or macro
          ---- is the lambda or macro a byte compiled function
      --- an autoload
      --- a subr

 (defun tt--foo-eg (foo-arg)
  (+ foo-arg foo-arg))

  (indirect-function 'tt--foo-eg)
  ;=> (lambda (foo-arg) (+ foo-arg foo-arg))

 (byte-compile 'tt--foo-eg)

 (indirect-function 'tt--foo-eg)
 ;=> #[(foo-arg) \"\\211\\\\\207\" [foo-arg] 2]

 (defun tt--foo-eg (foo-arg)
   (+ foo-arg foo-arg))

Testing if a function is byte compiled:

 (subrp (indirect-function 'byte-code-function-p))

Using type:

\(type-of (indirect-function 'find-file))

:ALIASED-BY `mon-help-types'

:SEE info node `(elisp)Type Predicates'
:SEE info node `(elisp)Programming Types'
:SEE info node `(CL)Type Predicates'

:SEE-ALSO `mon-help-predicate-functions', `mon-help-symbol-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-predicate-functions "mon-doc-help-utils" "\
List of predicates functions.

These may not have an `type-of' accessor and/or might otherwise be independent
of those predicates enumerated with `mon-help-type-predicates'.

;; :PREDICATE-FUNCTIONS-SEQUENCE
`anot-head-p'
`arrayp'
`atom'
`bool-vector-p'
`char-table-p'
`consp'
`hash-table-p'
`listp'
`nested-alist-p'
`nlistp'
`null'
`sequencep'
`vector-or-char-table-p'
`vectorp'

;; :PREDICATE-FUNCTIONS-STRING
`compare-strings'
`string-prefix-p'
`char-or-string-p'
`stringp'
`string-prefix-p'
`string-or-null-p'

;; :PREDICATE-FUNCTIONS-STRING-MATCHING
`looking-at-p'
`subregexp-context-p'
`string-match-p'

;; :PREDICATE-FUNCTIONS-NUMBERS
`booleanp'
`evenp'
`floatp'
`floatp-safe'
`integer-or-marker-p'
`integerp'
`markerp'
`minusp'
`natnump'
`number-or-marker-p'
`numberp'
`oddp'
`plusp'
`wholenump'
`zerop'

;; :PREDICATE-FUNCTIONS-CHAR
`case-table-p'
`multibyte-string-p'
`lgstring-shaped-p'
`char-table-p'
`charsetp'
`char-equal'
`char-displayable-p'
`char-valid-p'
`charsetp'
`char-table-p'
`characterp'
`char-or-string-p'
`buffer-chars-modified-tick'
`syntax-table-p'
`category-table-p'

;; :PREDICATE-FUNCTIONS-FILE-DIRECTORY
`auto-save-file-name-p'

`file-name-absolute-p'
`file-ownership-preserved-p'
`file-newer-than-file-p'
`file-readable-p'
`file-regular-p'
`file-remote-p'
`file-symlink-p'
`file-writable-p'
`file-accessible-directory-p'
`file-attributes-lessp'
`file-compressed-p'
`file-directory-p'
`file-executable-p'
`file-exists-p'
`file-locked-p'
`next-read-file-uses-dialog-p'

;; :PREDICATE-FUNCTIONS-BUFFER
`buffer-modified-p'
`buffer-modified-p'
`bufferp'
`eobp'
`frame-or-buffer-changed-p'
`local-variable-if-set-p'
`local-variable-p'               :SEE info node `(elisp)Creating Buffer-Local'
`restore-buffer-modified-p'
`set-buffer-modified-p'

;; :PREDICATE-FUNCTIONS-WINDOW
`same-window-p'
`get-window-with-predicate'
`minibuffer-window-active-p'
`one-window-p'
`set-window-dedicated-p'
`special-display-p'
`truncated-partial-width-window-p'
`window--frame-usable-p'
`window-configuration-p'
`window-dedicated-p'
`window-fixed-size-p'
`window-full-width-p'
`window-live-p'
`window-minibuffer-p'
`window-safely-shrinkable-p'
`window-splittable-p'
`windowp'
`window--frame-usable-p'
`pos-visible-in-window-p'
`w32-window-exists-p'

;; :PREDICATE-FUNCTIONS-FRAME
`filtered-frame-list'
`frame-configuration-p'
`frame-live-p'
`frame-or-buffer-changed-p'
`frame-visible-p'
`framep'
`framep-on-display'
`window--frame-usable-p'

;; :PREDICATE-FUNCTIONS-FACE
`facep'
`face-differs-from-default-p'
`face-attribute-relative-p'
`face-bold-p'
`face-italic-p'
`face-underline-p'
`face-inverse-video-p'
`bitmap-spec-p'
`internal-lisp-face-empty-p'
`internal-lisp-face-equal-p'
`internal-lisp-face-p'

;; :PREDICATE-FUNCTIONS-DISPLAY
`display-table-p'
`display-grayscale-p'
`display-mouse-p'
`display-popup-menus-p'
`display-graphic-p'
`display-images-p'
`display-selections-p'

;; :PREDICATE-FUNCTIONS-COLOR
`color-defined-p'
`xw-color-defined-p'
`xw-display-color-p'
`tty-display-color-p'
`display-color-p'
`display-graphic-p'
`display-grayscale-p'
`x-display-grayscale-p'

;; :PREDICATE-FUNCTIONS-SERVER
`server-running-p' 
`server-temp-file-p'

;; :PREDICATE-FUNCTIONS-PROCESS
`daemonp'
`process-filter-multibyte-p'
`process-running-child-p'
`processp'

;; :PREDICATE-FUNCTIONS-EVENT
`waiting-for-user-input-p'

`called-interactively-p'
`interactive-p'
`eventp'
`input-pending-p'
`keymapp'
;; :PREDICATE-FUNCTIONS-TIME
`date-leap-year-p'
`time-less-p'
`timezone-leap-year-p'
`bookmark-time-to-save-p'

;; :PREDICATES-FUNCTIONS-EIEIO
`child-of-class-p'
`class-abstract-p'
`class-p'
`eieio-slot-originating-class-p'
`generic-p'
`generic-primary-only-p'
`generic-primary-only-one-p'
`next-method-p'
`object-of-class-p'
`object-p'
`same-class-fast-p'
`same-class-p'
`slot-boundp'
`slot-exists-p'

;; :PREDICATE-FUNCTIONS-SYMBOL
`apropos-macrop'
`bound-and-true-p'
`boundp'
`byte-code-function-p'
`commandp'
`custom-theme-p'
`custom-variable-p'
`default-boundp'
`fboundp'
`featurep'
`functionp'                                   ;:NOTE C-Primitive in lexbind branch.
`keywordp'
`local-variable-if-set-p'
`local-variable-p'
`null'
`risky-local-variable-p'
`safe-local-variable-p'
`subrp'
`symbolp'
`user-variable-p'
`special-variable-p'                          ;<LEXBIND-FUCTION>

;; :PREDICATE-FUNCTIONS-BYTE-COMPILE
`byte-optimize-featurep'
`byte-optimize-all-constp'
`byte-compile-trueconstp'
`byte-compile-warning-enabled-p'
`byte-compile-const-symbol-p'
`byte-compile-arglist-signatures-congruent-p' 
`byte-compile-cl-file-p'
`byte-compile-const-symbol-p'            ;<DEFSUBST>
`byte-compile-constp'                    ;<MACRO>
`byte-optimize-all-constp'
`byte-compile-constp'
`byte-code-function-p'

;; :PREDICATE-FUNCTIONS-UNSAFEP
`unsafep'
`unsafep-function'
`unsafep-variable'
`unsafep-progn' 
`unsafep-let'
`unsafep-vars'

;; :PREDICATE-FUNCTIONS-CL-EXPR
`cl-simple-exprs-p'
`cl-simple-expr-p'
`cl-const-expr-p'
`cl-const-exprs-p'
`cl-safe-expr-p'

;; :PREDICATE-FUNCTIONS-TEXT-PROPERTY
`invisible-p'
`overlayp'

;; :PREDICATE-FUNCTIONS-BUTTON
`button-has-type-p'
`button-type-subtype-p'

;; :PREDICATE-FUNCTIONS-WIDGET
`widgetp'
`widget-type'

;; :PREDICATE-FUNCTIONS-RING
`ring-p'
`ring-empty-p'

;; :PREDICATE-FUNCTIONS-USER
`custom-theme-p'
`user-variable-p'

;; :PREDICATE-FUNCTIONS-MON-LOCAL
`mon-booleanp'
`mon-buffer-exists-p'
`mon-buffer-narrowed-p'
`mon-buffer-written-p'
`mon-file-older-than-file-p'
`mon-frame-live-visible-graphic-p'
`mon-function-object-p'
`mon-list-proper-p'
`mon-looking-back-p'
`mon-print-in-buffer-if-p'
`mon-string-or-null-and-zerop'

:SEE-ALSO `mon-help-type-predicates', `mon-help-CL-sequence-predicates'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-sequence-functions "mon-doc-help-utils" "\
List of functions related to sequences list, alist, array, vector, ring, etc.

;; :SEQUENCE-ALIST
`assoc'
`rassoc'
`assoc-string'
`assq'
`rassq'
`assoc-default'
`copy-alist'
`assq-delete-all'
`rassq-delete-all'

;; :SEQUENCE-ALIST-FILE.lisp.emacs-lisp.assoc
`asort'
`aelement'
`aheadsym'
`anot-head-p'
`aput'
`adelete'
`aget'
`amake'

;; :SEQUENCE-ALIST-FILE.lisp.international.mule-util
`lookup-nested-alist'
`set-nested-alist'
`nested-alist-p'

;; :SEQUENCE-ARRAY  :NOTE char-tables are arrays :SEE `mon-help-char-functions'
`arrayp'
`aset'
`aref'
`fillarray'
`clear-string'
`substring'         :NOTE (concat (substring (vconcat \"substring\") 3))

;; :SEQUENCE-STRING :NOTE A string is an array so most will work w/ arrays too.
`compare-strings'
`string-equal'
`concat'
`subst-char-in-string'
`string-prefix-p'
`substring'
`string-to-vector'
`string-to-list'

;; :SEQUENCE-BUILD
`cons'
`copy-sequence'
`copy-tree'
`append'
`list'
`make-list'

;; :SEQUCENCE-DESTROY
`butlast'
`nbutlast'
`pop'
`delq'
`remq'
`remove'
`delete'
`delete-dups'

;; :SEQUENCE-MAP
`do'
`dolist'
`dotimes'
`mapatoms'
`mapcar'
`mapconcat'
`mapc'

;; :SEQUENCE-MEMBER
`memq'
`memql'
`member'
`member-ignore-case'

;; :SEQUENCE-MODIFY
`setcar'
`setcdr'
`push'
`nconc'
`add-to-list'

;; :SEQUENCE-ORDER
`length'
`safe-length'
`nthcdr'
`nreverse'
`reverse'
`add-to-ordered-list'
`sort'
`sort-subr'
`number-sequence'

;; :SEQUENCE-PLACE
`elt'
`nth'
`car-safe'
`cdr-safe'
`last'

;; :SEQUENCE-PREDICATE
`consp'
`atom'
`sequencep'
`null'
`nlistp'
`listp'

;; :SEQUENCE-RING
`make-ring'
`ring-p'
`ring-size'
`ring-length'
`ring-elements'
`ring-copy'
`ring-empty-p'
`ring-ref'
`ring-insert'
`ring-remove'
`ring-insert-at-beginning'

;; :SEQUENCE-STRING
`string<'
`string'
`string-bytes'
`string-to-vector'
`string-to-list'
`concat'

;; :SEQUENCE-VECTOR
`vector'
`describe-vector'
`vconcat'
`vectorp'
`string-to-vector'
`make-vector'
`vector-or-char-table-p'

;; :SEQUENCE-VECTOR-BOOLEAN
`make-bool-vector'
`bool-vector-p'
`string-bytes'
`clear-string'

;; :SEQUENCE-VECTOR-CHAR-TABLE
`char-table-extra-slot'
`char-table-p'
`char-table-parent'
`char-table-range'
`char-table-subtype'
`make-char-table'
`map-char-table'
`set-char-table-extra-slot'
`set-char-table-parent'

:SEE info node `(elisp)Sequences Arrays Vectors'
:SEE info node (elisp)Lists'.

:SEE-ALSO `mon-help-hash-functions', `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-type-predicates'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-key-functions "mon-doc-help-utils" "\
List of keyboard and key related functions, variables, keymaps.

;; :KEY-FUNCTIONS-INSPECT
`describe-bindings'
`key-binding'
`local-key-binding'
`lookup-key'
`minor-mode-key-binding'
`where-is'
`where-is-internal'
`suggest-key-bindings'

;; :KEY-FUNCTIONS-EVENT-READ
`edmacro-parse-keys'
`edmacro-sanitize-for-string'
`event-basic-type'
`event-convert-list'
`event-modifiers'
`eventp'
`event-start'
`event-end'
`extended-command-history'
`kbd'
`make-command-summary'
`listify-key-sequence'
`prefix-numeric-value'
`read-char-exclusive'
`read-event'
`read-kbd-macro'
`read-key-sequence'
`read-key-sequence-vector'
`redirect-frame-focus'
`this-command-keys'
`this-command-keys-vector'
`track-mouse'
`unread-command-events'
`unread-input-method-events'
`unread-post-input-method-events'
`x-dnd-handle-drag-n-drop-event'

;; :KEY-FUNCTIONS-EVENT-MODIFIER
`char-resolve-modifiers'
`event-modifiers'
`event-apply-modifier'
`event-apply-control-modifier'
`event-apply-super-modifier'
`event-apply-shift-modifier'
`event-apply-alt-modifier'  
`event-apply-meta-modifier'
`event-apply-hyper-modifier'
`internal-event-symbol-parse-modifiers'
`event-symbol-elements`         ;<PROPERTY> 
                                ; :USAGE (get (event-basic-type (read-event))
                                           'event-symbol-elements)

;; :KEY-VARIABLES-EVENT
`last-input-event'
`input-method-function'
`input-method-previous-message'
`input-method-use-echo-area'
`input-method-exit-on-first-char'
`input-method-verbose-flag'
`last-nonmenu-event'
`last-event-frame'
`last-command-event'
`special-event-map'

;; :KEY-FUNCTIONS-STATE
`cannot-suspend'
`global-disable-point-adjustment'
`disable-point-adjustment'
`clear-this-command-keys'
`discard-input'
`input-pending-p'
`keyboard-quit'
`open-dribble-file'
`recent-keys'
`reset-this-command-lengths'
`this-command-keys-vector'
`this-command-keys'
`this-single-command-keys'
`this-single-command-raw-keys'
`key-description'
`recursion-depth'
`single-key-description' (mapconcat 'single-key-description (this-command-keys) \" \")

;; :KEY-FUNCTIONS-UNIVERSAL-ARGS
`negative-argument'
`digit-argument'
`universal-argument'
`universal-argument-other-key'
`universal-argument-minus'
`universal-argument-more'

;; :KEY-VARIABLES-INTERRUPT
`set-quit-char'
`set-input-interrupt-mode'
`command-error-function'
`inhibit-quit'
`throw-on-input'
`quit-flag'
`input-pending-p'
`while-no-input'           ;<MACRO>
`with-local-quit'          ;<MACRO>

;; :KEY-VARIABLES-STATE
`deferred-action-function'
`deferred-action-list'
`last-command'
`real-last-command'
`last-repeatable-command'
`last-prefix-arg'
`this-command'
`this-original-command'
`this-command-keys-shift-translated'
`num-input-keys'
`prefix-arg'
`current-prefix-arg'
`key-substitution-in-progress'

;; :KEY-VARIABLES-HOOK
`command-hook-internal'
`deferred-action-function'
`deferred-action-list'
`echo-area-clear-hook'
`pre-command-hook'
`post-command-hook'

;; :KEY-VARIABLES-KEYBOARD
`keyboard-type'
`extra-keyboard-modifiers'
`keyboard-coding-system'
`keyboard-translate-table'
`system-key-alist'

;; :KEY-VARIABLES-HELP
`show-help-function'
`help-char'
`help-event-list'
`help-form'
`prefix-help-command'

;; :KEY-VARIABLES-TIMING
`timer-list'
`timer-idle-list'
`timer-event-last'
`timer-event-last-1'
`timer-event-last-2'
`timer-event-handler'
`timer-duration-words'
`timer-max-repeats'
`echo-keystrokes'
`polling-period'
`double-click-time'
`double-click-fuzz'

;; :KEY-FUNCTIONS-BIND
`command-remapping'
`define-key'
`define-key-after'
`define-prefix-command'
`global-key-binding'
`global-set-key'
`global-unset-key'
`keypad-setup'
`local-set-key'
`local-unset-key'
`undefined'
`set-keyboard-coding-system'

;; :KEY-FUNCTIONS-MAP-HANDLERS
`copy-keymap'
`keyboard-translate'
`keymap-canonicalize'
`make-keymap'
`make-sparse-keymap'
`map-keymap'
`map-keymap-sorted'
`set-keymap-parent'
`substitute-command-keys'
`substitute-key-definition'      ; :NOTE Undocumented optional arg PREFIX
`substitute-key-definition-key'
`suppress-keymap'
`use-global-map'
`use-local-map'

;; :KEY-FUNCTIONS-MAP-INSPECT
`accessible-keymaps'
`command-remapping'
`current-active-maps'
`current-global-map'
`current-local-map'
`current-minor-mode-maps'
`keymap-parent'
`keymapp'

;; :KEY-VARIABLES-INPUT-MOD
`listify-key-sequence-1'          ; :NOTE (logxor <key> (logior 128 ?\\M-\\C-@))
`extra-keyboard-modifiers'
`input-decode-map'
`keyboard-translate-table'
`keyboard-type'
`keypad-numlock-setup'
`keypad-numlock-shifted-setup'
`keypad-shifted-setup'
`meta-prefix-char'
`special-event-map'
`translation-table-for-input'
`where-is-preferred-modifier'

;; :KEY-VARIABLES-MODE-MAPS
`emulation-mode-map-alists'
`minor-mode-map-alist'
`minor-mode-overriding-map-alist'
`overriding-local-map'
`overriding-local-map-menu-flag'
`overriding-terminal-local-map'

;; :KEY-KEYMAPS                   :SEE info node `(elisp)Standard Keymaps'
`Buffer-menu-mode-map'
`Helper-help-map'
`Info-edit-map'
`Info-mode-map'
`apropos-mode-map'
`c-mode-map'
`command-history-map'
`ctl-x-map'
`ctl-x-4-map'
`ctl-x-5-map'
`custom-mode-map'
`debugger-mode-map'
`dired-mode-map'
`edit-abbrevs-map'
`edit-tab-stops-map'
`electric-buffer-menu-mode-map'
`electric-history-map'
`emacs-lisp-mode-map'
`esc-map'
`facemenu-background-menu'
`facemenu-face-menu'
`facemenu-foreground-menu'
`facemenu-indentation-menu'
`facemenu-justification-menu'
`facemenu-menu'
`facemenu-special-menu'
`function-key-map'
`fundamental-mode-map'
`global-map'
`grep-mode-map'
`help-map'
`help-mode-map'
`input-decode-map'
`isearch-mode-map'
`key-translation-map'
`kmacro-map'
`lisp-interaction-mode-map'
`lisp-mode-map'
`local-function-key-map'
`menu-bar-edit-menu'
`menu-bar-files-menu'
`menu-bar-help-menu'
`menu-bar-mule-menu'
`menu-bar-search-menu'
`menu-bar-tools-menu'
`mode-specific-map'
`multi-query-replace-map'
`occur-mode-map'
`printable-chars'
`query-replace-map'
`read-key-empty-map'
`search-map'
`splash-screen-keymap'
`text-mode-map'
`tool-bar-map'
`view-mode-map'

;; :KEY-FUNCTIONS-W32
`w32-register-hot-key'
`w32-unregister-hot-key'
`w32-registered-hot-keys'
`w32-reconstruct-hot-key'
`w32-toggle-lock-key'

;; :KEY-VARIABLES-W32
`w32-alt-is-meta'
`w32-pass-alt-to-system'
`w32-quit-key'
`w32-phantom-key-code'
`w32-enable-num-loc'
`w32-enable-caps-lock'
`w32-scroll-lock-modifier'
`w32-apps-modifier'
`w32-mouse-button-tolerance'
`w32-mouse-move-interval'
`w32-pass-extra-mouse-buttons-to-system'
`w32-pass-multimedia-buttons-to-system'
`w32-pass-rwindow-to-system'
`w32-pass-lwindow-to-system'
`w32-rwindow-modifier'
`w32-pass-multimedia-buttons-to-system'

;; :KEYS-THAT-ARE-EASY-TO-NOT-FIND
<rwindow>
<lwindow>
<C-backspace>
<S-backspace>
<tab> <backtab> [backtab] <S-iso-lefttab> [(shift tab)] 
`x-alt-keysym'
`x-meta-keysym'
`x-hyper-keysym'
`x-super-keysym'

;; :KEY-FUNCTIONS-MON-LOCAL
`mon-read-keys-as-string'
`mon-test-keypresses'

:KEYBINDING-HOOK-IDIOM
 
 ( [ add-hook | remove-hook ] 
  '<SOME-HOOK-TO-ADD/REMOVE>
  (function     ;; :NOTE Using `function' or \"#'\" (sharpquote) w/ `add-hook'
   (lambda ()   ;; allows later `remove-hook' removal of anonymous lambda forms.
    (define-key '<SOME-MODE-MAP> { (kbd <\"KEY-STR*\">) |
                                    <[VECTOR-OF-KEY-CHARS]> |
                                    <\"KEY-STR*\"> }
                                   '<SOME-FUNCTION-NAME>))))

:KEY-EVENT-CONVERT-IDIOM

\(kbd \"<S-SPC>\") => [33554464]

\(event-basic-type 33554464)
 => 32

\(event-modifiers 33554464)
  => (shift)

\(event-convert-list '(shift 32))
  => 33554464

\(event-apply-modifier 32 'shift 25 \"S-\")
 => 33554464

\(let ((rnd-trp (event-apply-modifier 32 'shift 25 \"<S-\")))
  (event-convert-list
   `(,@(event-modifiers rnd-trp) ,(event-basic-type rnd-trp))))
 => 33554464

:SEE info node `(emacs)Key Bindings'
:SEE info node `(elisp)Keymaps'
:SEE :FILE src/keymap.c lisp/bindings.el
:SEE-ALSO `mon-help-keys', `mon-help-diacritics', `mon-help-w32-functions',
`mon-help-CL-slime-keys'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-load-functions "mon-doc-help-utils" "\
List of functions related to loading elisp files.

;; :LOAD-FUNCTIONS
`autoload'
`load'
`load-file'
`load-library'
`load-theme'
`load-with-code-conversion'

`provide'
`require'
`intern'
`intern-soft'

;; :LOAD-DECLARE
`declare'                       :SEE info node `(elisp)Declaring Functions'
`declare-function'
`check-declare'
`check-declare-file'
`check-declare-directory'
`byte-compile-declare-function'

;; :LOAD-EVAL
`eval'
`eval-and-compile'
`eval-buffer'
`eval-current-buffer'
`eval-when'
`eval-when-compile'
`eval-after-load'
`load-time-value'

;; :LOAD-FILE-DIRECTORY
`get-load-suffixes'
`locate-library'
`symbol-file'

\(getenv \"EMACSLOADPATH\")
`load-path'                     ;<VARIABLE> 
`path-separator'                ;<VARIABLE>

;; :LOAD-HISTORY
`load-history-regexp'
`load-history-filename-element'
`featurep'
`preloaded-file-list'           ;<VARIABLE>
`features'                      ;<VARIABLE>
`current-load-list'             ;<VARIABLE>
`load-history'                  ;<VARIABLE>

;; :LOAD-UNLOAD
`unload-feature'
`makunbound'
`unintern'
`unload-feature-special-hooks' ;<VARIABLE>

;; :LOAD-VARIABLES
`obarray'
`byte-compile-dynamic-docstrings'
`after-load-alist'
`force-load-messages'
`load-in-progress'
`load-force-doc-strings'
`load-file-rep-suffixes'
`load-read-function'
`load-source-file-function'
`load-suffixes'
`read-symbol-positions-list'
`read-with-symbol-positions'
`byte-compile-insert-header'

:SEE info node `elisp(Loading)'.

:SEE :FILE lread.c loaddefs.el 
:SEE-ALSO `mon-help-emacs-introspect', `mon-help-read-functions', `mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-read-functions "mon-doc-help-utils" "\
List of functions for reading.

      _______                       ____________________  60.
     |       |                     |                    |   
     | :READ |                     | :STANDARD-READERS  |   
   __|_______|_______________     _|____________________|_  
  |                          |   |                        | 
  | `read'                   |   | `read-color'           | 
  | `read-from-string'       |   | `read-kbd-macro'       | 
  | `read-from-whole-string' |   | `read-number'          | 
  |__________________________|   | `read-passwd'          | 
        _________________        | `read-regexp'          | 
       |                 |       | `read-string'          | 
       | :STANDARD-INPUT |       | `read-shell-command'   | 
       | :READ-STREAMS   |       |________________________| 
   ____|_________________|________________________________  
  |                                                       | 
  |  `standard-input'--+ <VARIABLE>                       | 
  |    |                 ______________________________   | 
  |    .-+ <BUFFER>     |                              |  | 
  |    .-+ <MARKER>     | `read-circle'                |  | 
  |    .-+ <STRING>     |  |-+ <VARIABLE>              |  | 
  |    .-+ <FUNCTION>   | `read-with-symbol-positions' |  | 
  |    .-+ <SYMBOL>     |  |-+ <VARIABLE>              |  | 
  |    .-+ t            | `read-symbol-positions-list' |  | 
  |    .-+ nil          |  |-+ <VARIABLE>              |  | 
  |                     |______________________________|  | 
  |_______________________________________________________| 
     ______________                          __________     
    |              |                        |          |    
    | :MINI-BUFFER |                        | :BUFFERS |    
   _|______________|_______      ___________|__________|__  
  |                        |    |                         | 
  | `read-minibuffer'      |    | `read-buffer'           | 
  | `read-from-minibuffer' |    | `read-buffer-function'  | 
  | `read-no-blanks-input' |    | `read-buffer-to-switch' | 
  |________________________|    |_________________________|   
     ________                                  ________      
    |        |                                |        |     
    | :FILES |                                | :CHARS |     
   _|________|________________    ____________|________|____ 
  |                           |  |                          |
  | `read-file-name'          |  | `read-char'              |
  | `read-directory-name'     |  | `read-char-by-name'      |
  | `read-file-name-internal' |  | `read-char-excvusive'    |
  | `read-file-modes'         |  | `read-charset'           |
  | `file-readable-p'         |  | `read-quoted-char'       |
  | `desktop-read'            |  | `read-quoted-char-radix' |
  | `read-abbrev-file'        |  |  |-+ <VARIABLE>          |
  |___________________________|  |__________________________|
    _______________                            ________
   |               |                          |        |
   | :KEY-EVENTS   |                          | :FACES |
 __|_______________|_________   ______________|________|____
|                            | |                            |
| `read-event'               | | `read-face-font'           |
| `read-key-sequence'        | | `read-face-name'           |
| `read-key-sequence-vector' | | `read-face-attribute'      |
| `read-command'             | | `read-all-face-attributes' |
| `unread-command-events'    | | `read-face-and-attribute'  |
|                            | |____________________________|
|____________________________|          ______________       
                                       |              |      
                                       | :ENVIRONMENT |      
                              _________|______________|_____ 
                             |                              |
                             | `coding-system-for-read'     |
                             | `read-coding-system'         |
                             | `read-expression-history'    |
                             | `read-expression-map'        |
                             | `read-envvar-name'           |
                             | `read-non-nil-coding-system' |
                             | `read-input-method-name'     |
                             | `read-multilinlual-string'   |
                             | `read-language-name'         |
                             | `read-with-symbol-positions' |
                             | `read-symbol-positions-list' |
                             |______________________________|
                                                          60^

:SEE info node `(elisp)Read and Print'.

:SEE :FILE `lread.c'
:SEE-ALSO `mon-help-print-functions', `mon-help-load-functions',
`mon-help-key-functions', `mon-help-char-representation'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-print-functions "mon-doc-help-utils" "\
Print related functions and variables which affect their output.

;; :PRINT-FUNCTIONS
`eval-print-last-sexp'
`message'
`prin1'
`prin1-char'
`prin1-to-string'
`princ'
`princ-list'
`print'
`terpri'
`with-output-to-string'     ; :NOTE Output to generated buffer \" *string-output*\"
`write-char'
`write-region'

;; :PRINT-FUNCTIONS-FORMAT
`format-mode-line'
`format'
`format-time-string'
`format-seconds'
`mode-line-format'         ;<VARIABLE>

;; :PRINT-FUNCTIONS-INSERT
`insert'
`insert-byte'
`insert-string'
`insert-tab'
`insert-char'
`insert-rectangle'
`insert-register'
`insert-kbd-macro'

;; :PRINT-FUNCTIONS-INSERT-BUFFER
`insert-buffer'
`insert-buffer-substring'
`insert-buffer-substring-no-properties'

;; :PRINT-FUNCTIONS-MARKER
`marker-insertion-type'
`make-marker'
`set-marker'
`set-marker-insertion-type'

;; :PRINT-FUNCTIONS-INSERT-YANK
`insert-buffer-substring-as-yank'
`insert-for-yank'
`insert-for-yank-1'

;; :PRINT-FUNCTIONS-INSERT-FILE-DIR
`insert-directory'
`insert-directory-adj-pos'
`insert-directory-safely'
`insert-file'
`insert-file-1'
`insert-file-contents'
`insert-file-contents-literally'
`insert-file-literally'

;; :PRINT-FUNCTIONS-INSERT-IMAGE
`insert-image'
`insert-image-file'
`insert-sliced-image'

;; :PRINT-FUNCTIONS-INSERT-BUTTON
`insert-button'
`insert-text-button'

;; :PRINT-FUNCTIONS-INSERT-STICKY
`insert-and-inherit'
`insert-before-markers'
`insert-before-markers-and-inherit'

;; :PRINT-FUNCTIONS-IO-STREAM
`message-box'
`message-or-box'
`external-debugging-output'
`redirect-debugging-output'
`send-string-to-terminal'
`standard-output'
`standard-input'

;; :PRINT-FUNCTIONS-PRETTY  :SEE :FILE emacs-lisp/pp.el
`pp'                        ; :NOTE Output to named stream or `standard-output'
`pp-buffer'
`pp-display-expression'     ; :NOTE Buffer output is `with-output-to-temp-buffer'
`pp-eval-expression'        ; :NOTE Output to buffer \"*Pp Eval Output*\"
`pp-eval-last-sexp'
`pp-last-sexp'
`pp-macroexpand-expression' ; :NOTE Output to buffer \"*Pp Macroexpand Output*\"
`pp-macroexpand-last-sexp'
`pp-to-string'              ; :NOTE Output to generated buffer \" pp-to-string\"
`pp-escape-newlines'        ;<VARIABLE>

;; :PRINT-FUNCTIONS-MULTI/UNIBYTE
`set-buffer-multibyte'
`enable-multibyte-characters'

;; :PRINT-VARIABLES
`eval-expression-print-length'
`eval-expression-print-level'
`float-output-format'
`use-dialog-box'
`printable-chars'
`print-charset-text-property'
`print-circle'
`print-continuous-numbering'
`print-escape-multibyte'
`print-escape-newlines'
`print-escape-nonascii'
`print-length'
`print-level'
`print-number-table'
`print-quoted'
`print-gensym'

\(let ((print-gensym t)
       (my-bubba (make-symbol \"bubba\")))
   (princ my-bubba (current-buffer)))
 ;=> #:bubba

:SEE info node `(elisp)Inserting Text'
:SEE info node `(elisp)Output Functions'
:SEE info node `(elisp)Output Variables'
:SEE info node `(elisp)Printed Representation'
:SEE info node `(elisp)Read and Print'
:SEE info node `(elisp)Streams Intro'

:SEE-ALSO `mon-help-read-functions', `mon-help-marker-functions',
`mon-help-load-functions', `mon-help-char-representation',
`mon-help-format-width', `gnus-bind-print-variables'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-marker-functions "mon-doc-help-utils" "\
List of marker related functions and variables.

;; :MARKER-FUNCTIONS
`buffer-has-markers-at'
`copy-marker'
`make-marker'
`mark-marker'
`marker-buffer'
`marker-position'
`move-marker'
`point-marker'
`point-max-marker'
`point-min-marker'
`set-marker'

;; :MARKER-INSERTION
`marker-insertion-type'
`set-marker-insertion-type'
`insert-before-markers'
`insert-before-markers-and-inherit' ; :NOTE Also a <PROPERTY>

;; :MARKER-PREDICATES
`markerp'
`integer-or-marker-p'
`number-or-marker-p'

;; :MARKER-FUNCTIONS-SLIME
`slime-output-target-marker'
`slime-reset-repl-markers'
`slime-save-marker'

;; :MARK-FUNCTIONS
`mark'
`push-mark'
`pop-mark'
`set-mark'
`mark-paragraph'
`mark-whole-buffer'
`mark-word'
`mark-sexp'
`mark-page'
`mark-defun'

;; :MARK-FUNCTIONS-SLIME
`slime-mark-input-start'
`slime-mark-output-end'
`slime-mark-output-start'
`slime-mark-presentation-start'
`slime-mark-presentation-start-handler'
`slime-mark-presentation-end-handler'
`slime-mark-presentation'
`slime-mark-presentation-end'

;; :MARKER-VARIABLES
`help-window-point-marker'

:SEE info node `(elisp)Markers'

:SEE-ALSO `mon-help-print-functions', `mon-help-print-functions',
`mon-help-read-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-hash-functions "mon-doc-help-utils" "\
Hash table related functions.

;; :HASH-TABLE-EMACS
`clrhash'
`copy-hash-table',    
`define-hash-table-test'
`gethash'
`hash-table-count'
`hash-table-p'
`hash-table-rehash-size'
`hash-table-rehash-threshold'
`hash-table-size'
`hash-table-test'
`hash-table-weakness'
`make-hash-table'
`maphash'
`puthash'
`remhash'
`sxhash'
`hash-table-test`                 ;<PROPERTY>

;; :HASH-TABLE-EMACS-CL
`cl-not-hash-table'
:ALIASED-BY `cl-make-hash-table'  <- `make-hash-table'
:ALIASED-BY `cl-hash-table-p'     <- `hash-table-p'
:ALIASED-BY `cl-hash-table-count' <- `hash-table-count'
:ALIASED-BY `cl-gethash'          <- `gethash'
:ALIASED-BY `cl-puthash'          <- `puthash'
:ALIASED-BY `cl-remhash'          <- `remhash'
:ALIASED-BY `cl-clrhash'          <- `clrhash'
:ALIASED-BY `cl-maphash'          <- `maphash'

;; :HASH-TABLE-FUNCTIONS-MON-LOCAL
`mon-hash-add-uniquify'
`mon-hash-all-keys'
`mon-hash-all-values'
`mon-hash-describe'
`mon-hash-describe-descend'
`mon-hash-make-size'               :SEE-ALSO `sxhash'
`mon-hash-readlines-buffer'
`mon-hash-readlines-file'
`mon-hash-to-list'

;; :HASH-TABLE-MACROS-MON-LOCAL
`mon-hash-add-uniquify'
`mon-hash-all-keys'
`mon-hash-all-values'
`mon-hash-describe'
`mon-hash-describe-descend'
`mon-hash-get-items'
`mon-hash-get-keys'
`mon-hash-get-string-keys'
`mon-hash-get-symbol-keys'
`mon-hash-get-values'
`mon-hash-has-key'
`mon-dir-hash-images'
`mon-hash-make-size'
`mon-hash-put-CL'
`mon-hash-readlines-buffer'
`mon-hash-readlines-file'
`mon-hash-table-complete'
`mon-hash-to-list'
`mon-hash<-vector'

;; HASH-TABLE-CONSTRUCTION
`make-hash-table' <&rest KEYWORD-ARGS>
                 [ :rehash-size { integer | float } ]
                 [ :rehash-threshold float ] ;<- (and (<= F 1) (floatp F))
                 [ :size integer ] 
                 [ :test { eq | eql | equal } ]
                 [ :weakness  { nil | key | value
                                | key-or-value | key-and-value } ]

;; :HASH-TABLE-EXAMPLE

\(let ((super-hash (make-hash-table :test 'equal))
        hotness)
  (dolist (S '((\"Christie Brinkley\" . 8)
               (\"Kim Alexis\" . 7)
               (\"Paulina Porizkova\" . 10)
               (\"Elle Macpherson\" . 9))
           (progn
             (maphash #'(lambda (N R) 
                          (push (format \"SUPERMODEL %s is a %d\" N R) hotness))
                      super-hash)
             (setq hotness (mapconcat #'(lambda (H) (identity H)) hotness \"\\n\"))))
    (puthash (car S) (cdr S) super-hash)))

;; :HASH-TABLE-TEST-PROPERTY
\(define-hash-table-test 'tt-htt 'eq 'eql)
\(boundp  'tt-htt)
\(fboundp 'tt-htt)
\(symbol-plist 'tt-htt)
\(get 'tt-htt 'hash-table-test)

:NOTE As of `emacs-version' 23.2 hashtables have a read-syntax `#s'. 
The Lisp reader can read this printed representation, provided each element in
the specified hash table has a valid read syntax as illustrated with follwing:

\(setq bubbas-hash #s(hash-table size 30 data (key1 val1 key2 300)))
;=> #s(hash-table {...} ))

bubbas-hash
;=> #s(hash-table {...} ))=

\(gethash 'key1 bubbas-hash)
;=> val1

\(type-of (symbol-value 'bubbas-hash))
;=> hash-table

\(unintern \"bubbas-hash\" obarray)
\(intern-soft \"bubbas-hash\")

:SEE info node `(elisp)hash functions'.
:SEE info node `(elisp)Hash Tables'.

:SEE-ALSO `mon-help-sequence-functions', `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-type-predicates'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-plist-functions "mon-doc-help-utils" "\
Help for plist and property list related functions.

;; :PLIST-FUNCTIONS-GETTERS
`get'
`plist-get'
`lax-plist-get'

;; :PLIST-FUNCTIONS-SETTERS
`setplist'
`put'
`plist-put'
`lax-plist-put'

;; :PLIST-FUNCTIONS-CL
`remf'
`setf'                 ; :USAGE (setf (get tt--plist :foo) '(new-foo))
`getf'
`get*'
`cl-set-getf'
`cl-do-remf'
`cl-remprop'
`remprop'

;; :PLIST-FUNCTION-INSPECT
`equal-including-properties'
`documentation-property'
`symbol-plist'
`plist-member'

;; :PLIST-FUNCTION-INSPECT-APROPOS
`apropos-property-face'
`apropos-format-plist'
`apropos-describe-plist'

;; :PLIST-FUNCTION-PROCESS
`process-plist'
`process-put'
`process-get'

;; :PLIST-FUNCTION-WIDGET
`widget-put'
`widget-get'
`widget-apply'

;; :PLIST-FUNCTION-CHARACTER        :SEE info node `(elisp)Character Properties'
`char-category-set'
`charset-plist'
`define-char-code-property'
`get-char-code-property'
`get-char-property-and-overlay'
`put-char-code-property'

;; :PLIST-FUNCTIONS-MON-LOCAL
`mon-plist-keys'
`mon-plist-remove!'
`mon-plist-remove-consing'
`mon-plist-remove-if'

:NOTE the docstring of `plist-put' has the odd phraseology:
 \"use `(setq x (plist-put x prop val))' to be sure to use the new value.\"
plist-put 
the plist could be empty in the first place.

 (setq tt--plist nil)
 (plist-put tt--plist :foo :bar) ; => (:foo :bar)
 tt--plist ; => nil
:SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg01001.html')

:SEE info node `(elisp)Property Lists'
:SEE info node `(elisp)Symbol Plists'
:SEE info node `(elisp)Other Plists'

:SEE-ALSO `mon-help-plist-properties', `mon-help-text-property-functions',
`mon-help-hash-functions', `mon-help-sequence-functions', `mon-help-plist-functions',
`mon-help-type-predicates'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-plist-properties "mon-doc-help-utils" "\
List of common Emacs elisp ``built-in'' properties appearing on plists.

Unless indicated otherwise, following list enumerates properties.
When a property-name is not also symbol-name it is distinguished as:

  `<PROPERTY-NAMM>` vs `<SYMBOL-NAME>'

;; :PLIST-PROPERTIES
`buffer-access-fontified-property' ; :NOTE Also a <FUNCTION>
;; :PLIST-PROPERTIES-FUNCTION
`interactive-form`
`lisp-indent-function`             ; :NOTE Also a <FUNCTION>

;; :PLIST-PROPERTIES-VARIABLE
`permanent-local`
`saved-value`
`saved-variable-comment`
`safe-local-variable`
`risky-local-variable`
`variable-interactive`              :SEE `set-variable'
`variable-comment`

;; :PLIST-PROPERTIES-CUSTOM
`custom-get`
`custom-set`
`custom-autoload`
`custom-dependencies`
`custom-group`
`custom-links`
`custom-loads`
`custom-mode-group`
`custom-options`
`custom-prefix`
`custom-requests`
`custom-tag`
`custom-type`
`custom-version`
`customized-value`
`custom-package-version`
`customized-variable-comment`
`force-value`
`standard-value`

;; :PLIST-PROPERTIES-THEME
`theme-documentation`
`theme-face`
`theme-feature`
`theme-settings`
`theme-value`

;; :PLIST-PROPERTIES-DOC
`apropos-inhibit`
`documentation`
`doc-string-elt`
`lisp-doc-string-elt-property'
`char-code-property-documentation`
`face-documentation'               ; :NOTE Also a <FUNCTION>
`group-documentation`
`setf-documentation`               ; :NOTE :SEE `define-setf-method'
`function-documentation`
`theme-documentation`
`theme-settings`
`variable-documentation`
`lisp-doc-string-elt-property'     ;<VARIABLE>

;; :PLIST-PROPERTIES-FACE
`customized-face`
`face-comment`
`face-alias`
`face-defface-spec`
`face-override-spec`
`face-modified`
`face-documentation'               ; :NOTE Also a <FUNCTION>
`obsolete-face`
`saved-face`
`saved-face-comment`
`theme-face`

;; :PLIST-PROPERTIES-KEYS
`event-symbol-element-mask`
`event-symbol-elements`
`modifier-cache`
`suppress-keymap
`:advertised-binding`  ;`dired-find-file' `widget-backward' `undo' `proced-mark'`

;; :PLIST-PROPERTIES-EIEIO
`protection`
`eieio-class-definition`
`eieio-method-obarray`
`eieio-method-tree`

;; :PLIST-PROPERTIES-MENU
`menu-enable`
`menu-prop`

;; :PLIST-PROPERTIES-MODE
`:minor-mode-function`
`definition-name`
`mode-class`
`derived-mode-unmerged`

;; :PLIST-PROPERTIES-BYTE-COMPILE
`byte-code-vector`
`byte-compile`
`byte-compile-format-like`
'byte-compile-inline-expand      ; <PVAL>
`byte-compile-negated-op`
`byte-hunk-handler`
`byte-obsolete-info`
`byte-obsolete-variable`
`byte-opcode-invert`
`byte-optimizer`
`byte-stack+-info`
`cl-compiler-macro`
`compiler-macro-file`
`cl-byte-compile-compiler-macro`   ;<PVAL>

;; :PLIST-PROPERTIES-ADVICE
`ad-advice-info`
`ad-subr-arglist`

;; :PLIST-THING-AT-POINT
`beginning-op`
`bounds-of-thing-at-point`
`end-op`
`thing-at-point`

;; :PLIST-PROPERTIES-HASH
`hash-table-test'                           ; :NOTE Also a <FUNCTION>
;; :PLIST-PROPERTIES-LISP
`disabled`
`find-tag-default-function`
`lisp-indent-function`
`lisp-indent-hook`
`list-order`
`no-self-insert`
`pure`
`safe-function`
;; :PLIST-PROPERTIES-LISP-CL
`cl-deftype-handler`
`setf-method`
`side-effect-free`
`compiler-macro-file`
`cl-byte-compile-compiler-macro`  ; <PVAL>
`error-free`                      ; <PVAL>
`cl-byte-compile-block`           ; <PVAL>
`cl-byte-compile-throw`           ; <PVAL>
`setf-documentation`              ; <PVAL>

;; :PLIST-PROPERTIES-EDEBUG
`debug`
`edebug`
`edebug-coverage`
`edebug-dependents`
`edebug-form-spec`
`edebug-freq-count`
`edebug-initial-mode`
`edebug-on-entry`

;; :PLIST-PROPERTIES-OVERLAY
`after-string`
`before-string`
`evaporate`
`isearch-open-invisible`
`isearch-open-invisible-temporary`
`overlay-arrow-string`
`priority`
`window`

;; :PLIST-PROPERTIES-MINIBUFFER
`history-length`                  ; :NOTE Also a <FUNCTION>
;; :PLIST-PROPERTIES-BUFFER
`no-clone-indirect`

;; :PLIST-PROPERTIES-SYNTAX
`syntax-table'                     ; :NOTE Also a <FUNCTION>
`text-clone-syntax`

;; :PLIST-PROPERTIES-EVENT
`event-kind`

;; :PLIST-PROPERTIES-WIDGET
`pr-widget-list`
`pr-widget`
`widget-keyword-printer`
`widget-type`
`widget-documentation`

;; :PLIST-PROPERTIES-CHAR
`ascii-character`
`bidi-class`
`canonical-combining-class`
`char-table-extra-slots`
`char-code-property-documentation`
`composition`
`decimal-digit-value`
`decomposition`
`digit`
`general-category`
`iso-10646-comment`
`lowercase`
`mirrored`
`name`
`numeric-value`  
`old-name`
`titlecase`
`uppercase`

;; :PLIST-PROPERTIES-ERROR
`error'                               :SEE info node `(elisp)Standard Errors'
       <PLIST> (symbol-plist 'error)
      ¦ `error-conditions`
      ¦ `error-message`
      ¦ `byte-compile-format-like`

;; :PLIST-PROPERTIES-TEXT-PROPERTIES-SPECIAL
:SEE `mon-help-text-property-properties'

:SEE-ALSO `mon-help-plist-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-faces-themes "mon-doc-help-utils" "\
Functions for handling themes and their faces.

;; :THEME-FUNCTIONS
`deftheme'                    ;<MACRO>
`load-theme'
`provide-theme'
`enable-theme'
`disable-theme'

;; :FACE-CUSTOM
`custom-set-faces'
`custom-reset-faces'
`custom-declare-face'
`custom-face-attributes-get'

;; :FACE-CUSTOM-THEME
`custom-declare-theme'
`customize-create-theme'
`custom-push-theme'
`custom-make-theme-feature'
`custom-check-theme'
`custom-variable-theme-value'
`custom-theme-recalc-variable'
`custom-theme-p'
`custom-theme-set-faces'
`custom-theme-reset-faces'
`custom-theme-recalc-face'
`custom-theme-set-variables'

;; :FACE-CUSTOM-VARIABLES
`custom-face-attributes'      ;<CONSTANT>
`custom-enabled-themes'
`custom-enabling-themes'
`custom-theme-directory'
`custom-known-themes'

:SEE :FILE `cus-face.el', `custom.el', `cus-edit.el'.

;; :THEME-CUSTOM
Custom themes are collections of settings that can be enabled or
disabled as a unit.

Each Custom theme is defined by a symbol, called the theme name.
The `theme-settings' property of the theme name records the
variable and face settings of the theme.  This property is a list
of elements, each of the form:

    (PROP SYMBOL THEME VALUE)

- PROP is either `theme-value' or `theme-face'
- SYMBOL is the face or variable name
- THEME is the theme name (redundant, but simplifies the code)
- VALUE is an expression that gives the theme's setting for SYMBOL.

The theme name also has a `theme-feature' property, whose value is
specified when the theme is defined (see `custom-declare-theme').
Usually, this is just a symbol named THEME-theme.  This lets
external libraries call (require 'foo-theme).

In addition, each symbol (either a variable or a face) affected by
an *enabled* theme has a `theme-value' or `theme-face' property,
which is a list of elements each of the form:

    (THEME VALUE)

which have the same meanings as in `theme-settings'.

The `theme-value' and `theme-face' lists are ordered by decreasing
theme precedence.  Thus, the first element is always the one that
is in effect.

Each theme is stored in a theme file, with filename THEME-theme.el.
Loading a theme basically involves calling (load \"THEME-theme\")
This is done by the function `load-theme'.  Loading a theme
automatically enables it.

When a theme is enabled, the `theme-value' and `theme-face'
properties for the affected symbols are set.  When a theme is
disabled, its settings are removed from the `theme-value' and
`theme-face' properties, but the theme's own `theme-settings'
property remains unchanged.

;; :THEME-DEFINING
A theme file should be named `THEME-theme.el' (where THEME is the theme
name), and found in either `custom-theme-directory' or the load path.
It has the following format:

\(deftheme THEME DOCSTRING)
\(custom-theme-set-variables 'THEME  [THEME-VARIABLES])
\(custom-theme-set-faces 'THEME [THEME-FACES])
\(provide-theme 'THEME)

;; :THEME-EXAMPLE :SEE :FILE forest-theme.el

\(deftheme forest \"Created 2009-08-09.\")

\(custom-theme-set-faces 'forest

 '(default ((t (:foreground \"wheat\" :background \"black\"))))

 '(font-lock-comment-face ((((class color) (min-colors 88))
                            (:foreground  \"medium sea green\"))))

 '(font-lock-constant-face ((((class color) (min-colors 88))
                             (:foreground \"turquoise\"))))

 '(font-lock-function-name-face ((((class color) (min-colors 88))
                                  (:foreground \"pale green\"))))

 '(font-lock-keyword-face ((((class color) (min-colors 88))
                            (:foreground \"white\"))))


 '(font-lock-string-face ((((class color) (min-colors 88))
                           (:foreground \"dark khaki\"))))

 '(font-lock-type-face ((((class color) (min-colors 88))
                         (:foreground \"medium aquamarine\"))))

 '(font-lock-variable-name-face ((((class color) (min-colors 88))
                                  (:foreground \"yellow green\"))))

 '(font-lock-warning-face ((((class color) (min-colors 88))
                            (:foreground \"salmon1\"))))

 '(font-lock-builtin-face ((((class color) (min-colors 88))
                            (:foreground \"LightSteelBlue\"))))

 '(region ((((class color) (min-colors 88))
            (:foreground \"white\" :background \"dark green\"))))

 '(highlight ((((class color) (min-colors 88))
               (:foreground \"white\" :background \"dark green\")))))

\(provide-theme 'forest)

;;;; end forest-theme.el

:SEE info node `(elisp)Defining Faces'.
:SEE info node `(elisp)Face Attributes'.
:SEE-ALSO `mon-help-custom-keywords', `mon-help-faces', `mon-help-faces-basic',
`mon-help-color-chart' `mon-help-font-lock-functions', `mon-help-font-lock',
`mon-help-custom-keywords', `mon-help-widgets', `mon-help-easy-menu',
`mon-help-plist-functions',`mon-help-eieio-defclass',
`mon-help-eieio-functions', `mon-help-eieio-methods'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-faces "mon-doc-help-utils" "\
Functions, Variables, Properties, etc. for defining faces.

    _________________                                 
   |                 | :SEE info node `(elisp)Defining Faces'            
   | :FACE-DEFINING  | :SEE info node `(elisp)Face Functions'                             
 __|_________________|_________________________________________________73.
|                                         |                              |
| `defface' <MACRO>                       |   :FACE-DEFINING-FUNCTIONS   |
|  :SPEC                                  |______________________________|
|  | :DISPLAY                             |                              |
|  | |-+ defalut                          | `make-face'                  |
|  | |-+ t                                | `face-list'                  |
|  | |-+ <LIST> -> of form: (Key Value)   | `copy-face'                  |
|  |   ¦ (type {graphic, x, pc, w32, tty})| `face-id'                    |
|  |   ¦ (class [color|grayscale|mono})   | `face-documentation'         |
|  |   ¦ (background [light|dark])        | `face-equal'                 |
|  |   ¦ (min-colors <INTEGER>)           | `face-differs-from-default-p'|
|  |   ¦ (supports   <VALUE>)             |______________________________|
|  |                                                                     |
|  `---------------------.                                               |
|                         \\                                              |
|                          \\     :SEE info node `(elisp)Face Attributes' |
|__________________________ \\    ________________________________________|
|                          | `->|                                        |
| :FACE-ATTRIBUTE-KEYWORDS |    | :family - <STRING>                     |
|__________________________|__  |  { Fontset name, Font family }         |
|                             | |  :NOTE `*' and `?' wildcards allowed.  |
|  :family :foundry           | |  :SEE `font-family-list'               |
|  :font   :fontset           | |________________________________________|
|  :height                    | |                                        |
|  :width :weight :slant      | | :foundry - <STRING>                    |
|  :foreground :background    | | :NOTE `*' and `?' wildcards allowed.   |
|  :underline  :overline      | |________________________________________|
|  :strike-through            | |                                        |
|  :box                       | | :font - (a font object)                |
|  :inverse-video             | | :SEE info node `(elisp)Font Selection' |
|  :stipple                   | | :SEE info node `(elisp)Fontsets'       |
| `face-attribute-name-alist' | |________________________________________|
|_____________________________| |                                        |
|                             | | :height - [<INTEGER>|<FLOAT>]          |
| :FACE-ATTRIBUTE-FUNCTIONS   | |  { 1/10 point, float }                 |
|                             | |________________________________________|
|-----------------------------| |                                        |
|                             | | :width - <SYMBOL>                      |
| `font-family-list'          | |  { normal, condensed, expanded         |
| `face-attribute'            | |    semi-condensed, semi-expanded       |
| `set-face-attribute'        | |    extra-condensed, extra-expanded     |
| `face-all-attributes'       | |    ultra-condensed, ultra-expanded }   |
| `merge-face-attribute'      | |________________________________________|
| `face-attribute-relative-p' | |                                        |
| `invert-face'               | | :weight - <SYMBOL>                     |
| `face-foreground'           | |  { normal, bold, light                 |
| `face-background'           | |    semi-bold, semi-light               |
| `face-stipple'              | |    extra-bold, extra-light             |
| `face-font'                 | |    ultra-bold, utltra-light }          |
| `face-bold-p'               | |________________________________________|
| `face-italic-p'             | |                                        |
| `face-underline-p'          | | :slant - <SYMBOL>                      |
| `face-inverse-video-p'      | |  { normal, italic, oblique,            |
|                             | |   reverse-italic, reverse-oblique }    |
|_____________________________| |________________________________________|
|                             | |                                        |
| :FACE-ATTRIBUTE-VARIABLES   | | :foreground - [<STRING>|<HEX-VAL>]     |
|                             | | :background - [<STRING>|<HEX-VAL>]     |
|-----------------------------| | :SEE info node `(elisp)Color Names'    |
|                             | |             `mon-help-color-chart'     |
| `bitmap-spec-p'             | |         `mon-help-color-functions'     |
| `face-attribute-name-alist' | |________________________________________|
| `custom-face-attributes'    | |                                        |
| `frame-background-mode'     | | :underline - [<BOOLEAN>|<STRING>]      |
| `underline-minimum-offset'  | | :overline  - [<BOOLEAN>|<STRING>]      |
| `x-bitmap-file-path'        | | :strike-through - [<BOOLEAN>|<STRING>] |
|                             | |  { t - using face's color              |
|_____________________________| |    <STRING> - Using specified <COLOR>  |
|                             | |    nil - do not apply effect }         |
| :FACE-PROPERTY-ATTRIBUTES   | |________________________________________|
|  (face symbol properties)   | |                                        |
|                             | | :box - [<BOOLEAN>|<STRING>|<LIST>]     |
|-----------------------------| |  { nil - no box                        |
|                             | |   t - linewidth in :foreground <COLOR> |
| `face-alias`                | |   color - box w/ line width in <COLOR> |
| `face-defface-spec`         | |   ( :line-width <WIDTH>                |
| `customized-face`           | |     :color <COLOR>                     |
| `face-documentation'        | |     :style <STYLE> ) }                 |
| `saved-face`                | |________________________________________|
| `obsolete-face`             | |                                        |
|_____________________________| | :inverse-video - <BOOLEAN>             |
                                |  { t   - yes                           |
                                |    nil - no }                          |
 _____________________________  |________________________________________|
|                             | |                                        |
|      :FACE-READERS          | | :stipple - [<BOOLEAN>|<STRING>]        |
|_____________________________| |  { <BITMAP> :SEE `x-bitmap-file-path'  |
|                             | |   ,----                                |
| `read-face-font'            | |   | <WIDTH>  - Width in pixels         |
| `read-face-name'            | |   | <HEIGHT> - Height in pixels        |
| `read-face-attribute'       | |   | <DATA>   - Data string of raw bits |
| `read-all-face-attributes'  | |   `----                                |
| `read-face-and-attribute'   | |  nil - no stipple }                    |
|_____________________________| |________________________________________|
                                |                                        |
                                | :inherit - [ <STRING> | <LIST> ]       |
 _____________________________  |  { face name, or list of face names }  |
|                             | |________________________________________|
|       :FACE-INTERNAL        |                                           
|_____________________________|_________     _________________            
|                                       |   |                 |           
| `internal-face-x-get-resource'        |   | :FACE-VARIABLES |            
| `internal-lisp-face-empty-p'          |  _|_________________|__________ 
| `internal-lisp-face-equal-p'          | |                              | 
| `internal-lisp-face-p'                | | `inhibit-free-realized-faces'| 
| `internal-make-lisp-face'             | |______________________________|  
| `internal-merge-in-global-face'       |                                 
| `internal-get-lisp-face-attribute'    | 
| `internal-lisp-face-attribute-values' |                                 
| `inhibit-free-realized-faces'         |
| `clear-face-cache'                    |
| `define-obsolete-face-alias'          |
|_______________________________________|                              73^

:ALIASED-BY `mon-help-face-functions'

:SEE-ALSO `mon-help-faces-basic', `mon-help-font-lock', `mon-help-faces-themes',
`mon-help-color-chart', `mon-help-custom-keywords', `mon-help-widgets',
`mon-help-easy-menu', `mon-help-plist-functions', `mon-help-plist-properties',
`mon-help-color-chart', `mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-faces-basic "mon-doc-help-utils" "\
The custom-group `basic-faces' is utilized for inheriting faces.

These are the standard Emacs faces are defined in :FILE faces.el

:NOTE As of 23.1 there is no _formal_ indication that newly defined faces must
inherit from one of the basic-faces this practice is encouraged.

:SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2009-08/msg00525.html').
▶▶▶
;; :FACE-BASIC
\(describe-face 'default)
\(describe-face 'bold)
\(describe-face 'italic)
\(describe-face 'underline)
\(describe-face 'bold-italic)
\(describe-face 'fixed-pitch)
\(describe-face 'variable-pitch)
\(describe-face 'shadow)
\(describe-face 'link)
\(describe-face 'link-visited)
\(describe-face 'highlight)
\(describe-face 'region)
\(describe-face 'mode-line)
\(describe-face 'header-line)
\(describe-face 'secondary-selection)
\(describe-face 'trailing-whitespace)
\(describe-face 'escape-glyph)
\(describe-face 'nobreak-space)
\(describe-face 'mode-line-inactive)
\(describe-face 'mode-line-highlight)
\(describe-face 'mode-line-emphasis)
\(describe-face 'mode-line-buffer-id)
\(describe-face 'vertical-border)
\(describe-face 'minibuffer-prompt)
\(describe-face 'minibuffer-noticeable-prompt)
\(describe-face 'fringe)
\(describe-face 'scroll-bar)
\(describe-face 'border)
\(describe-face 'cursor)
\(describe-face 'mouse)
\(describe-face 'tool-bar)
\(describe-face 'menu)
\(describe-face 'glyphless-char)

:SEE-ALSO `mon-help-faces-basic', `mon-help-font-lock', `mon-help-faces-themes', 
`mon-help-font-lock-functions', `mon-help-naf-mode-faces'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-faces-font-lock "mon-doc-help-utils" "\
List of faces defined specifically for Font Lock mode.

:SEE info node `(elisp)Faces for Font Lock'.

;; :FACE-FONT-LOCK
\(describe-face 'font-lock-comment-face)
\(describe-face 'font-lock-comment-delimiter-face)
\(describe-face 'font-lock-doc-face)
\(describe-face 'font-lock-string-face)
\(describe-face 'font-lock-keyword-face)
\(describe-face 'font-lock-builtin-face)
\(describe-face 'font-lock-function-name-face)
\(describe-face 'font-lock-variable-name-face)
\(describe-face 'font-lock-type-face)
\(describe-face 'font-lock-constant-face)
\(describe-face 'font-lock-preprocessor-face)
\(describe-face 'font-lock-negation-char-face)
\(describe-face 'font-lock-warning-face)

;; :FACE-FONT-LOCK-VARIABLES
`font-lock-builtin-face'
`font-lock-comment-delimiter-face'
`font-lock-constant-face'
`font-lock-doc-face'
`font-lock-function-name-face'
`font-lock-keyword-face'
`font-lock-negation-char-face'
`font-lock-preprocessor-face'
`font-lock-reference-face'
`font-lock-string-face'
`font-lock-type-face'
`font-lock-variable-name-face'
`font-lock-warning-face'

:SEE-ALSO `mon-help-font-lock', `mon-help-font-lock-functions',
`mon-help-faces', `mon-help-faces-themes', `mon-help-faces-basic'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-font-lock-functions "mon-doc-help-utils" "\
List of font-lock and jit-lock related functions.

:SEE info node `(elisp)Font Lock Basics'.

:FONT-LOCK-FUNCTIONS
`font-lock-add-keywords'
`font-lock-after-change-function'
`font-lock-after-fontify-buffer'
`font-lock-after-unfontify-buffer'
`font-lock-append-text-property'
`font-lock-apply-highlight'
`font-lock-apply-syntactic-highlight'
`font-lock-change-mode'
`font-lock-choose-keywords'
`font-lock-compile-keywords'
`font-lock-default-fontify-buffer'
`font-lock-default-fontify-region'
`font-lock-default-function'
`font-lock-default-unfontify-buffer'
`font-lock-default-unfontify-region'
`font-lock-defontify'
`font-lock-eval-keywords'
`font-lock-extend-jit-lock-region-after-change'
`font-lock-extend-region-multiline'
`font-lock-extend-region-wholelines'
`font-lock-fillin-text-property'
`font-lock-fontify-anchored-keywords'
`font-lock-fontify-block'
`font-lock-fontify-buffer'
`font-lock-fontify-keywords-region'
`font-lock-fontify-region'
`font-lock-fontify-syntactic-anchored-keywords'
`font-lock-fontify-syntactic-keywords-region'
`font-lock-fontify-syntactically-region'
`font-lock-match-c-style-declaration-item-and-skip-to-next'
`font-lock-mode'
`font-lock-mode-internal'
`font-lock-prepend-text-property'
`font-lock-remove-keywords'
`font-lock-set-defaults'
`font-lock-turn-off-thing-lock'
`font-lock-turn-on-thing-lock'
`font-lock-unfontify-buffer'
`font-lock-unfontify-region'
`font-lock-update-removed-keyword-alist'
`font-lock-value-in-major-mode'

;; :FONT-LOCK-JIT-LOCK-FUNCTIONS
`jit-lock-after-change'
`jit-lock-context-fontify'
`jit-lock-deferred-fontify'
`jit-lock-fontify-now'
`jit-lock-force-redisplay'
`jit-lock-function'
`jit-lock-mode'
`jit-lock-refontify'
`jit-lock-register'
`jit-lock-stealth-chunk-start'
`jit-lock-stealth-fontify'
`jit-lock-unregister'

;; :FONT-LOCK-VARIABLES
`fontification-functions'
`font-lock-keywords'
`font-lock-keywords-alist'
`font-lock-keywords-case-fold-search'
`font-lock-keywords-only'
`font-lock-mark-block-function'
`font-lock-maximum-decoration'
`font-lock-maximum-size'
`font-lock-mode'
`font-lock-mode-major-mode'
`font-lock-multiline'
`font-lock-removed-keywords-alist'
`font-lock-set-defaults'
`font-lock-support-mode'
`font-lock-syntactic-face-function'
`font-lock-syntactic-keywords'
`font-lock-syntactically-fontified'
`font-lock-syntax-table'
`font-lock-unfontify-buffer-function'
`font-lock-unfontify-region-function'
`font-lock-verbose'

;; :FONT-LOCK-JIT-LOCK-VARIABLES
`jit-lock-after-change-extend-region-functions'
`jit-lock-chunk-size'
`jit-lock-context-time'
`jit-lock-context-timer'
`jit-lock-context-unfontify-pos'
`jit-lock-contextually'
`jit-lock-defer-buffers'
`jit-lock-defer-contextually'
`jit-lock-defer-time'
`jit-lock-defer-timer'
`jit-lock-functions'
`jit-lock-mode'
`jit-lock-stealth-buffers'
`jit-lock-stealth-load'
`jit-lock-stealth-nice'
`jit-lock-stealth-repeat-timer'
`jit-lock-stealth-time'
`jit-lock-stealth-timer'
`jit-lock-stealth-verbose'

;; :FONT-LOCK-VARIABLES-NAMING-FACES
`font-lock-negation-char-face'
`font-lock-variable-name-face'
`font-lock-preprocessor-face'
`font-lock-reference-face'
`font-lock-string-face'
`font-lock-type-face'
`font-lock-warning-face'

:SEE :FILE font-lock.el :FILE jit-lock.el

:SEE info node `(elsip)Search-based Fontification'.

:SEE-ALSO `mon-help-font-lock', `mon-help-faces-font-lock', `mon-help-faces',
`mon-help-faces-basic', `mon-help-faces-themes', `mon-help-custom-keywords',
`mon-help-widgets', `mon-help-easy-menu', `mon-help-plist-functions',
`mon-help-color-chart', `mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-font-lock "mon-doc-help-utils" "\
Display `font-lock-keywords' usage patterns.

A `font-lock-keywords' is either of the types: \"user-level\" or \"compiled\".

A \"user-level\" keywords list is specified as a list of font-locking \"rules\".

Typically such \"rules\" are compiled internally by by `font-lock-compile-keywords'
in which case these rules become a compiled keywords list which starts with `t'.

User-level \"rules\" in a `font-lock-keywords' list are elements with one of the
following formats:

 ( eval      . <FORM> )
 ( <MATCHER> . <SUBEXP> )
 ( <MATCHER> . <FACENAME> )
 ( <MATCHER> . <HIGHLIGHT> )
 ( <MATCHER> <HIGHLIGHT> {...} )

\(eval . <FORM>)
<FORM>  --  An expression which when evaluated returns a keyword element,
            e.g. for dynamic keyword generation at `font-lock-mode' activation.

When a \"rule\" is not of the format ( eval . <FORM> ) it is a list or cons.

When a cons, the pair is comprised of <MATCHER> and one of the elements:

 <SUBEXP> <FACENAME> <HIGHLIGHT>

When a list, it is comprised of a <MATCHER> and one or more <HIGHLIGHT> elements
this may include nested \"anchored\" <HIGHLIGHT> elts when <MATCH-HIGHLIGHT>
elts are specified.

Following enumeration of elt/\"rule\" patterns is _not_ a formal grammar:

<MATCHER> =: { <FUNCTION> | <REGEXP> }

<FUNCTION> ;; :ARG a bounds-limit 
           ;; :RETURN non-nil 
           ;; :DO move-point 
           ;; :SET `match-data' on success

<REGEXP>   -- A regexp possibly extended/generated with `regexp-opt'.

<HIGHLIGHT> =: { <MATCH-HIGHLIGHT> | <MATCH-ANCHORED> }

<MATCH-HIGHLIGHT> =: ( <SUBEXP> <FACENAME> [ <OVERRIDE> [ <LAXMATCH> ]] )

<SUBEXP>  -- <INTEGER> specifying the subexpression of <MATCHER> to highlight.

<FACENAME> -- Expression which either:
              a) evaluates to a value naming <FACE>.
              b) evaluates to a property list of the form:
                (face <FACE> PROP1 VAL1 PROP2 VAL2 { ... } )
                :NOTE Variant b affects/affected by: 
                `font-lock-extra-managed-props' `font-lock-unfontify-region-function'

<OVERRIDE> =: { t | keep | append | prepend }
                t -- When `t' overide existing fontification.
                keep --  non-fontified parts of a match highlighted are kept
                append -- existing fontification is merged with _old_ taking precedence.
                prepend -- existing fontification is merged with _new_ taking precedence.

<LAXMATCH>  =: <BOOLEAN> 
               `non-nil' -- ignore-errors when a <SUBEXP> in <MATCHER> fails to match.

<MATCH-ANCHORED> =: ( <MATCHER> <PRE-MATCH-FORM> <POST-MATCH-FORM> <MATCH-HIGHLIGHT> {...} )

<MATCHER> =: <REGEXP> ;; Bounds conditioned by <PRE-MATCH-FORM> <POST-MATCH-FORM>

<PRE-MATCH-FORM>  =: Expression evaluated _before_ <MATCH-ANCHORED>'s <MATCHER>

<POST-MATCH-FORM> =: Expression evaluated _after_ <MATCH-ANCHORED>'s <MATCHER>

:SEE info node `(elsip)Search-based Fontification'.

:SEE-ALSO `mon-help-font-lock-functions', `mon-help-faces-font-lock',
`mon-help-faces-basic', `mon-help-font-lock', `mon-help-faces-themes',
`mon-help-naf-mode-faces', `mon-help-overlay-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-overlay-functions "mon-doc-help-utils" "\
List of functions, variables, and properties related to overlays.

;; :OVERLAY-FUNCTIONS
`cl-map-overlays' 
`copy-overlay'
`delete-overlay'
`make-overlay'
`move-overlay'
`remove-overlays'
`overlay-put'
`overlay-recenter'

;; :OVERLAY-FUNCTIONS-GETTERS
`get-char-property'
`get-char-property-and-overlay'
`overlay-get'
`overlay-properties'
;; :OVERLAY-FUNCTIONS-POSITION
`overlay-buffer'
`next-overlay-change'
`overlay-end'
`overlay-lists'
`overlay-start'
`overlayp'
`overlays-at'
`overlays-in'
`previous-overlay-change'
;; :OVERLAY-FUNCTIONS-MODIFY-NOTIFY
`restore-buffer-modified-p'
`set-buffer-modified-p'
`inhibit-modification-hooks'

;; :OVERLAY-FUNCTIONS-TEXT-CLONE
`text-clone-maintain'
`text-clone-create'

;; :OVERLAY-VARIABLES
`overlay-arrow-position'
`overlay-arrow-string'
`overlay-arrow-variable-list'

;; :OVERLAY-PROPERTIES            :NOTE These are in addition to the 'special' text props:
`after-string`                    :SEE info node `(elisp)Special Properties'
`before-string`                   :SEE info node `(elisp)Overlay Properties'
`evaporate`
`isearch-open-invisible`
`isearch-open-invisible-temporary`
`priority`
`window`
`text-clone-spreadp`
`text-clone-syntax`
`text-clones`

;; :OVERLAY-FUNCTIONS-MON-LOCAL
`mon-help-find-result-for-overlay'
`mon-help-overlay-for-example'
`mon-help-overlay-on-region'
`mon-help-overlay-result'
`mon-nuke-overlay-buffer'
`mon-get-overlays-map-props'
`mon-get-overlays-region'
`mon-get-overlays-region-map-props'
`mon-get-overlays-buffer'

:SEE info node `(elisp) Overlays'.
:SEE info node `(elisp)Special Properties'
:SEE info node `(elisp)Overlay Properties'

:SEE :FILE buffer.c :FILE textprop.c

:SEE-ALSO `mon-help-faces', `mon-help-font-lock',
`mon-help-font-lock-functions', `mon-help-text-property-functions',
`mon-help-text-property-properties', `mon-help-text-property-functions-ext',
`mon-help-text-property-stickyness', `mon-help-plist-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-text-property-functions "mon-doc-help-utils" "\
List of text-property related functions and variables.

   ________________________                           ______________________79.  
  |                        |                         |                        |
  | :TEXT-PROPERTY-GETTERS |                         | :TEXT-PROPERTY-SETTERS |
 _|________________________|_______              ____|________________________|
|                                  |            |                             |
| `get-text-property'              |            | `propertize'                |
| `get-char-property'              |            | `add-text-properties'       |
| `get-char-property-and-overlay'  |            | `put-text-property'         |
|__________________________________|            | `set-text-properties'       |
   _______________________                      |_____________________________|
  |                       |                        _________________________    
  | :TEXT-PROPERTY-SEARCH |                       |                         |   
 _|_______________________|______________         | :TEXT-PROPERTY-DESCRIBE |   
|                                        |      __|_________________________|_ 
| `next-property-change'                 |     |                              |
| `next-single-property-change'          |     | `describe-text-sexp'         |
| `next-char-property-change'            |     | `describe-text-widget'       |
| `next-single-char-property-change'     |     | `describe-property-list'     |
| `previous-property-change'             |     | `describe-text-category'     |
| `previous-single-property-change'      |     | `describe-text-properties'   |
| `previous-char-property-change'        |     | `describe-text-properties-1' |
| `previous-single-char-property-change' |     |______________________________|
| `text-properties-at'                   |        __________________________      
| `text-property-any'                    |       |                          |  
| `text-property-not-all'                |       | :TEXT-PROPERTY-FONT-LOCK |  
|________________________________________| ______|__________________________|_ 
   _______________________                |                                   |
  |                       |               | `font-lock-append-text-property'  |
  | :TEXT-PROPERTY-FIELDS |               | `font-lock-extra-managed-props'   |
 _|_______________________|____           | `font-lock-fillin-text-property'  |
|                              |          | `font-lock-prepend-text-property' |
| `constrain-to-field'         |          | `last-sexp-setup-props'           |
| `delete-field'               |          |___________________________________|
| `field-beginning'            |                   _________________________   
| `field-end'                  |                  |                         |  
| `field-string'               |                  |  :TEXT-PROPERTY-REMOVE  |  
| `field-string-no-properties' |     _____________|_________________________|_ 
|______________________________|    |                                         |
   _________________________        | `filter-buffer-substring'               |
  |                         |       | `buffer-substring-no-properties'        |
  | :TEXT-PROPERTY-INHIBIT  |       | `remove-list-of-text-properties'        |
 _|_________________________|__     | `remove-text-properties'                |
|                              |    | `remove-yank-excluded-properties'       |
| `with-silent-modifications'  |    | `insert-buffer-substring-no-properties' |
| `inhibit-point-motion-hooks' |    |_________________________________________|
| `inhibit-field-text-motion'  |                     _______________________            
|______________________________|                    |                       |         
   _________________________________                | :TEXT-PROPERTY-STICKY |         
  |                                 |    ___________|_______________________|_
  | :TEXT-PROPERTY-STICKY-VARIABLES |   |                                     |
 _|_________________________________|_  | `insert-and-inherit'                |
|                                     | | `insert-before-markers'             |
| `text-property-default-nonsticky'   | | `insert-before-markers-and-inherit' |
| `buffer-access-fontified-property'  | |_____________________________________|
|_____________________________________|     ________________________________                                            
   __________________________              |                                |   
  |                          |             | :TEXT-PROPERTY-STICKY-PROPERTY |   
  | :TEXT-PROPERTY-VARIABLES |           __|________________________________|_  
 _|__________________________|________  |                                     | 
|                                     | | `front-sticky'                      | 
|  `buffer-access-fontify-functions'  | | `rear-nonsticky'                    | 
|  `buffer-substring-filters'         | | `insert-and-inherit`                | 
|  `char-property-alias-alist'        | | `insert-before-markers-and-inherit` | 
|  `default-text-properties'          | | `insert-in-front-hooks`             | 
|  `inhibit-read-only'                | | `insert-behind-hooks`               | 
|  `minibuffer-allow-text-properties' | |___________________________________79^
|  `show-help-function'               |                                        
|  `use-hard-newlines'                | :SEE info node `(elisp)Text Properties'
|  `yank-excluded-properties'         | :SEE :FILE buffer.c :FILE textprop.c   
|_____________________________________|                                        


:TEXT-PROPERTY-PRIDCATES
`invisible-p'


:SEE-ALSO `mon-help-text-property-properties',
`mon-help-text-property-stickyness', `mon-help-text-property-functions-ext',
`mon-help-overlay-functions', `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-widgets'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-text-property-properties "mon-doc-help-utils" "\
List of standard and \"special\" text-property properties.

     __________________________       
    |                          |      
    | :TEXT-PROPERTIES-SPECIAL |  :SEE info node `(elisp)Special Properties'     
 ___|__________________________|______________________________________________80. 
|                                                                               |
| `keymap` `local-map`                                                          |
| `syntax-table` `syntax-multiline` `font-lock-multiline`                       |
| `category` `field`                                                            |
| `face` `font-lock-face` `fontified`                                           |
| `pointer` `mouse-face`                                                        |
| `insert-in-front-hooks` `insert-behind-hooks` `modification-hooks`            |
| `isearch-open-invisible` `isearch-open-invisible-temporary`                   |
| `line-height` `line-spacing`                                                  |
| `line-prefix` `wrap-prefix`                                                   |
| `point-entered` `point-left`                                                  |
| `before-string` `after-string`                                                |
| `read-only`                            :NOTE On error sigals `text-read-only` |
| `composition` `intangible` `invisible` :NOTE These and `display` move point.  |
|            ____________________________________                               |
|           |                                    |                              |
|           | :TEXT-PROPERTIES-SPECIAL-HELP-ECHO |                              |
|  _________|____________________________________|____________________________  |
| |                                                                           | |
| | `help-echo` [ <STRING> | <FUNCTION> | <FORM> ]                            | |
| |             ¦ <FUNCTION> with args <WINDOW>, <OJBECT>, <POSITION>         | |
| |             ¦ <WINDOW>   <-  <WINDOW-NAME>  ;e.g. (selected-window)       | |
| |             ¦ <OBJECT>   <- [<BUFFER-NAME>|<OVERLAY-SYMBOL>|<STRING>]     | |
| |             ¦ <POSITION> <- [<BUFFER-POSN>|<OVERLAY-POSN>|<STRING-POSN>]  | |
| |___________________________________________________________________________| |
| :SEE info node `(emacs)Tooltips'                                              |
|            __________________________________      _________________________  |
|           |                                  |    |                         | |
|           | :TEXT-PROPERTIES-SPECIAL-DISPLAY |    | :TEXT-PROPERTIES-STICKY | |
|  _________|__________________________________|__  |_________________________| |
| |                                               | |                         | |
| | `display`  <STRING>                           | |      `front-sticky`     | |
| |           ¦ (image . <IMAGE-PROPS>)           | |     `rear-nonsticky`    | |
| |           ¦ (slice X Y <WIDTH> <HEIGHT>)      | |_________________________| |
| |           ¦ ((margin nil) <STRING>)           |  _________________________  |
| |           ¦ (space-width <FACTOR>)            | |                         | |
| |           ¦ (height [(+ N)|(- N)|             | | :TEXT-PROPERTIES-FORMAT | |
| |           ¦        <NUMBER>|<SYMBOL>|<FORM>]) | |_________________________| |
| |           ¦ (raise <FACTOR>                   | |                         | |
| |_______________________________________________| |        `hard`           | |
|  :SEE info node `(elisp)Display Property'         |   `right-margin`        | |
|            __________________________________     |    `left-margin`        | |   
|           |                                  |    |   `justification`       | |  
|           | :TEXT-PROPERTIES-BUTTON-DEFAULT  |    |_________________________| |  
|  _________|__________________________________|__                              |
| |                                               |                             |
| | `action`        <FUNCTION>                    |                             |
| | `mouse-action`  <FUNCTION>                    |                             |
| | `help-echo`     { <STRING>  | <FUNCTION> }    |                             |
| | `face`          <FACE>                        |                             |
| | `mouse-face`    <FACE>                        |                             |
| | `keymap`        <KEYMAP>                      |                             |
| | `type`          { :type :supertype }          |                             |
| | `follow-link`   <BOOLEAN>                     |                             |
| | `button`        <BOOLEAN>                     |                             |
| | `evaporate`     <BOOLEAN>                     |                             |
| | `rear-nonsticky <BOOLEAN>                     |                             |
| | `button-category-symbol`                      |                             |
| | :NOTE (symbol-plist 'default-button)        |                             |
| |_______________________________________________|                             |
| :SEE info node `(elisp)Buttons'                                               |
| :SEE info node (elisp)Defining Clickable Text'                                |
|_______________________________________________________________________________|                                                                                                                                           80^

:SEE-FILE mon-text-property-utils.el src/textprop.c
:SEE-ALSO `mon-help-text-property-functions', `mon-help-overlay-functions',
`mon-help-text-property-functions-ext', `mon-help-text-property-stickyness',
`mon-help-widgets', `mon-help-button-functions' `mon-help-plist-functions',
`mon-help-plist-properties', `mon-help-face-functions', `mon-help-faces-basic',
`mon-help-faces-font-lock', `mon-help-faces-themes',
`mon-help-font-lock-functions', `mon-help-syntax-functions',
`mon-help-syntax-class'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-text-property-stickyness "mon-doc-help-utils" "\
List of text property stickyness functions, variables, and their usage.

;; :TEXT-PROPERTY-STICKYNESS-USAGE

Any property might be front-sticky on the left, rear-sticky on the left,
front-sticky on the right, or rear-sticky on the right; the 16 combinations
can be arranged in a matrix with rows denoting the left conditions and
columns denoting the right conditions:
      _  __  _
_     FR FR FR FR
FR__   0  1  2  3
 _FR   4  5  6  7
FR     8  9  A  B
  FR   C  D  E  F

:LEFT-PROPS  = '(front-sticky (p8 p9 pa pb pc pd pe pf)
                rear-nonsticky (p4 p5 p6 p7 p8 p9 pa pb)
                p0 L p1 L p2 L p3 L p4 L p5 L p6 L p7 L
                p8 L p9 L pa L pb L pc L pd L pe L pf L)

:RIGHT-PROPS = '(front-sticky (p2 p3 p6 p7 pa pb pe pf)
                rear-nonsticky (p1 p2 p5 p6 p9 pa pd pe)
                p0 R p1 R p2 R p3 R p4 R p5 R p6 R p7 R
                p8 R p9 R pa R pb R pc R pd R pe R pf R)

We inherit from whoever has a sticky side facing us.  If both sides
do (cases 2, 3, E, and F), then we inherit from whichever side has a
non-nil value for the current property.  If both sides do, then we take
from the left.

When we inherit a property, we get its stickiness as well as its value.
So, when we merge the above two lists, we expect to get this:

:RESULT      = '(front-sticky (p6 p7 pa pb pc pd pe pf)
     	        rear-nonsticky (p6 pa)
                p0 L p1 L p2 L p3 L p6 R p7 R
                pa R pb R pc L pd L pe L pf L)

The optimizable special cases are:
    left rear-nonsticky = nil, right front-sticky = nil (inherit left)
    left rear-nonsticky = t,   right front-sticky = t   (inherit right)
    left rear-nonsticky = t,   right front-sticky = nil (inherit none)

:NOTE `insert-char's optional arg INHERIT which allows inheriting
text-properties of adjoining text with sticky properties.

:SEE :FILE buffer.c textprop.c

:SEE-ALSO `mon-help-text-property-functions', `mon-help-text-property-functions-ext',
`mon-help-overlay-functions', `mon-help-plist-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-text-property-functions-ext "mon-doc-help-utils" "\
Text property related functions that are either not C level builtins,
provided in Emacs packages outside of lisp/emacs-lisp, and 3rd party packages.

;; :TEXT-PROPERTY-FUNCTIONS-FILE.lisp.font-lock
`font-lock-prepend-text-property'
`font-lock-append-text-property'
`font-lock-fillin-text-property'

;; :TEXT-PROPERTY-FUNCTIONS-FILE.composite.el
`compose-char'
`compose-string'
`compose-string-internal'
`decompose-string'

;; :TEXT-PROPERTY-FUNCTIONS-FILE.lisp.gnus
`gnus-put-text-property'
`gnus-put-text-property-excluding-characters-with-faces'
`gnus-put-text-property-excluding-newlines'
`gnus-remove-text-with-property'
`gnus-add-text-properties-when'
`gnus-remove-text-properties-when'
`gnus-string-remove-all-properties'

;; :TEXT-PROPERTY-FUNCTIONS-FILE.*.slime
`slime-property-bounds'
`slime-propertize-region'

;; :TEXT-PROPERTY-FUNCTIONS-FILE.lisp.erc

;; :TEXT-PROPERTY-FUNCTIONS-FILE.*.w3m

;; :TEXT-PROPERTY-FUNCTIONS-MON-LOCAL
`mon-get-all-face-property-change'
`mon-get-next-face-property-change'
`mon-get-next-face-property-change-if'
`mon-get-text-properties-region-to-kill-ring'
`mon-line-test-content'
`mon-list-all-properties-in-buffer'
`mon-nuke-text-properties-buffer'
`mon-nuke-text-properties-region'
`mon-remove-single-text-property'
`mon-remove-text-property'
`mon-get-text-properties-category'

:SEE-ALSO `mon-help-text-property-functions',
`mon-help-text-property-stickyness', `mon-help-overlay-functions',
`mon-help-plist-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-color-functions "mon-doc-help-utils" "\
Color related functions.

;; :COLOR-FUNCTIONS
`color-distance'
`color-values'
`xw-color-values'
`tty-color-values'
`ansi-color-apply'
`ansi-color-make-color-map'

;; :COLOR-READERS
`read-color'
`facemenu-read-color'
`background-color-at-point'
`foreground-color-at-point'

;; :COLOR-SETTERS
`set-cursor-color'
`set-border-color'
`set-background-color'
`set-foreground-color'
`set-mouse-color'

;; :COLOR-LIST
`defined-colors'
`xw-defined-colors'
`list-colors-display'
`list-colors-duplicates'
`list-colors-print'
`x-colors'                ;<VARIABLE>
`color-name-rgb-alist'    ;<CONSTANT>
`ansi-color-map'          ;<VARIABLE>

;; :COLOR-ON-DISPLAY
`display-backing-store'
`display-color-cells'
`display-planes'
`display-visual-class'
`x-display-planes'
`x-display-visual-class'
`x-display-backing-store'

;; :COLOR-PREDICATES
`color-defined-p'
`xw-color-defined-p'
`xw-display-color-p'
`tty-display-color-p'
`display-color-p'
`display-graphic-p'
`display-grayscale-p'
`x-display-grayscale-p'

;; :COLOR-FILE.lisp.term.tty-colors
`tty-color-off-gray-diag'
`tty-color-approximate'
`tty-color-standard-values' 
`tty-color-values'
`tty-defined-color-alist' ;<VARIABLE>
;; :COLOR-W32
`w32-color-map'
;; :COLOR-MON-LOCAL
`mon-color-mix'
`mon-defined-colors-without-duplicates'
`mon-rgb-to-hsv'
`mon-list-colors-key'
`mon-get-ebay-css-pp'
`mon-get-ebay-css-pp-region-to-file'
`mon-get-ebay-img-css'
`mon-insert-css-colors'
`mon-cln-img-magic-hex'


:NOTE Following from commented code for `color-distance' in: :FILE xfaces.c

 This formula is from a paper title `Colour metric' by Thiadmer Riemersma.
 Quoting from that paper:

   This formula has results that are very close to L*u*v* (with the
   modified lightness curve) and, more importantly, it is a more
   even algorithm: it does not have a range of colours where it
   suddenly gives far from optimal results.
:SEE (URL `http://www.compuphase.com/cmetric.htm')

:SEE :FILE xfaces.c xfns.c etc/rgb.txt lisp/term/common-win.el
:SEE :FILE w23fns.c struct colormap_t w32_color_map.

:SEE-ALSO `mon-help-color-chart', `mon-help-css-color'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-color-chart "mon-doc-help-utils" "\
Chart of Netscape Color Names with their Color Values.

       ______________
      |              |                                                          
      | :COLOR-CHART |                                                          
 _____|______________|_______________________________________________________80.
|                                                                              |
| ,-+ :NETSCAPE-NAME                                                           |
| |                   ,-+ :HEX-TRIPLET                                         |
| |                   |       ,-+ :RGB-VALUE                                   |
| |                   |       |            ,-+ :DIRECTOR-MAC-SYS-APPROX        |
| |                   |       |            |    ,-+ :DIRECTOR-WIN-SYS-APPROX   |
| |                   |       |            |    |    ,-+ :SUPERCARD-APPROX     |
| |                   |       |            |    |    |    ,-+ :HEX-APPROX      |
| |                   |       |            |    |    |    |        :RGB-APPROX |
| |                   |       |            |    |    |    |       |            |
| aliceblue           F0F8FF  240,248,255  000  000  001  FFFFFF  255,255,255  |
| antiquewhite        FAEBD7  250,235,215  001  -    002  FFFFCC  255,255,204  |
| aquamarine          7FFFD4  127,255,212  009  016  110  66FFCC  102,255,204  |
| azure               F0FFFF  240,255,255  000  000  001  FFFFFF  255,255,255  |
| beige               F5F5DC  245,245,220  001  -    002  FFFFCC  255,255,204  |
| bisque              FFE4C4  255,228,196  001  -    002  FFFFCC  255,255,204  |
| black               000000  0,0,0        255  255  256  000000  0,0,0        |
| blanchedalmond      FFEBCD  255,235,205  001  -    002  FFFFCC  255,255,204  |
| blue                0000FF  0,0,255      210  003  211  0000FF  0,0,255      |
| blueviolet          8A2BE2  138,43,226   097  097  098  9933CC  153,51,204   |
| brown               A52A2A  165,42,42    100  100  101  993333  153,51,51    |
| burlywood           DEB887  222,184,135  44   44   045  CCCC99  204,204,153  |
| cadetblue           5F9EA0  95,158,160   122  122  123  669999  102,153,153  |
| chartreuse          7FFF00  127,255,0    113  113  114  66FF00  102,255,0    |
| chocolate           D2691E  210,105,30   058  058  059  CC6633  204,102,51   |
| coral               FF7F50  255,127,80   021  023  022  FF6666  255,102,102  |
| cornflowerblue      6495ED  100,149,237  120  120  121  6699FF  102,153,255  |
| cornsilk            FFF8DC  255,248,220  001  -    002  FFFFCC  255,255,204  |
| cyan                00FFFF  0,255,255    180  001  181  00FFFF  0,255,255    |
| darkgoldenrod       B8860B  184,134,11   053  053  054  CC9900  204,153,0    |
| darkgreen           006400  0,100,0      203  201  204  006600  0,102,0      |
| darkkhaki           BDB76B  189,183,107  045  045  046  CCCC66  204,204,102  |
| darkolivegreen      556B2F  85,107,47    130  130  131  666633  102,102,51   |
| darkorange          FF8C00  255,140,0    017  019  018  FF9900  255,153,0    |
| darkorchid          9932CC  153,50,204   097  097  098  9933CC  153,51,204   |
| darksalmon          E9967A  233,150,122  015  -    016  FF9966  255,153,102  |
| darkseagreen        8FBC8F  143,188,143  080  080  081  99CC99  153,204,153  |
| darkslateblue       483D8B  72,61,139    170  170  171  333399  51,51,153    |
| darkslategray       2F4F4F  47,79,79     165  165  166  336666  51,102,102   |
| darkturquoise       00CED1  0,206,209    187  185  188  00CCCC  0,204,204    |
| darkviolet          9400D3  148,0,211    103  103  104  9900CC  153,0,204    |
| deeppink            FF1493  255,20,147   032  033  033  FF0099  255,0,153    |
| deepskyblue         00BFFF  0,191,255    186  184  187  00CCFF  0,204,255    |
| dimgray             696969  105,105,105  129  129  130  666666  102,102,102  |
| dodgerblue          1E90FF  30,144,255   156  156  157  3399FF  51,153,255   |
| firebrick           B22222  178,34,34    100  100  101  993333  153,51,51    |
| floralwhite         FFFAF0  255,250,240  000  000  001  FFFFFF  255,255,255  |
| forestgreen         228B22  34,139,34    160  160  161  339933  51,153,51    |
| gainsboro           DCDCDC  220,220,220  043  043  044  CCCCCC  204,204,204  |
| ghostwhite          F8F8FF  248,248,255  000  000  001  FFFFFF  255,255,255  |
| gold                FFD700  255,215,0    011  -    012  FFCC00  255,204,0    |
| goldenrod           DAA520  218,165,32   052  052  053  CC9933  204,153,51   |
| gray                808080  128,128,128  086  086  087  999999  153,153,153  |
| green               008000  0,128,0      197  195  198  009900  0,153,0      |
| greenyellow         ADFF2F  173,255,47   076  076  077  99FF33  153,255,51   |
| honeydew            F0FFF0  240,255,240  000  000  001  FFFFFF  255,255,255  |
| hotpink             FF69B4  255,105,180  019  021  020  FF66CC  255,102,204  |
| indianred           CD5C5C  205,92,92    057  057  058  CC6666  204,102,102  |
| ivory               FFFFF0  255,255,240  000  000  001  FFFFFF  255,255,255  |
| khaki               F0E68C  240,230,140  002  244  003  FFFF99  255,255,153  |
| lavender            E6E6FA  230,230,250  000  000  001  FFFFFF  255,255,255  |
| lavenderblush       FFF0F5  255,240,245  000  000  001  FFFFFF  255,255,255  |
| lawngreen           7CFC00  124,252,0    113  113  114  66FF00  102,255,0    |
| lemonchiffon        FFFACD  255,250,205  001  -    002  FFFFCC  255,255,204  |
| lightblue           ADD8E6  173,216,230  078  078  079  99CCFF  153,204,255  |
| lightcoral          F08080  240,128,128  014  240  015  FF9999  255,153,153  |
| lightcyan           E0FFFF  224,255,255  036  036  037  CCFFFF  204,255,255  |
| lightgoldenrod      EEDD82  238,221,130  008  -    009  FFCC99  255,204,153  |
| lightgldnrodyellow  FAFAD2  250,250,210  001  -    002  FFFFCC  255,255,204  |
| lightgray           D3D3D3  211,211,211  043  043  044  CCCCCC  204,204,204  |
| lightpink           FFB6C1  255,182,193  007  -    008  FFCCCC  255,204,204  |
| lightsalmon         FFA07A  255,160,122  015  -    016  FF9966  255,153,102  |
| lightseagreen       20B2AA  32,178,170   160  160  161  339933  51,153,153   |
| lightskyblue        87CEFA  135,206,250  078  078  079  99CCFF  153,204,255  |
| lightslate          8470FF  132,112,255  090  090  091  9966FF  153,102,255  |
| lightslategray      778899  119,136,153  122  122  123  669999  102,153,153  |
| lightsteelblue      B0C4DE  176,196,222  078  078  079  99CCFF  153,204,255  |
| lightyellow         FFFFE0  255,255,224  000  000  001  FFFFFF  255,255,255  |
| limegreen           32CD32  50,205,50    154  154  155  33CC33  51,204,51    |
| linen               FAF0E6  250,240,230  000  000  001  FFFFFF  255,255,255  |
| magenta             FF00FF  255,0,255    030  031  031  FF00FF  255,0,255    |
| maroon              B03060  176,48,96    107  107  108  990000  153,0,0      |
| mediumaquamarine    66CDAA  102,205,170  116  116  117  66CC99  102,204,153  |
| mediumblue          0000CD  0,0,205      211  208  212  0000CC  0,0,204      |
| mediumorchid        BA55D3  186,85,211   055  055  056  CC66CC  204,102,204  |
| mediumpurple        9370DB  147,112,219  091  091  092  9966CC  153,102,204  |
| mediumseagreen      3CB371  60,179,113   153  153  154  33CC66  51,204,102   |
| mediumslateblue     7B68EE  123,104,238  11126126  127  6666FF  102,102,255  |
| mediumspringgreen   00FA9A  0,250,154    182  181  183  00FF99  0,255,153    |
| mediumturquoise     48D1CC  72,209,204   15   151  152  33CCCC  51,204,204   |
| mediumviolet        C71585  199,21,133   068  068  069  CC0099  204,0,153    |
| midnightblue        191970  25,25,112    213  210  214  000066  0,0,102      |
| mintcream           F5FFFA  245,255,250  000  000  001  FFFFFF  255,255,255  |
| mistyrose           FFE4E1  255,228,225  000  000  001  FFFFFF  255,255,255  |
| moccasin            FFE4B5  255,228,181  007  -    008  FFCCCC  255,204,204  |
| navajowhite         FFDEAD  255,222,173  009  -    009  FFCC99  255,204,153  |
| navy                000080  0,0,128      212  209  213  000099  0,0,153      |
| oldlace             FDF5E6  253,245,230  000  000  001  FFFFFF  255,255,255  |
| olivedrab           6B8E23  107,142,35   124  124  125  669933  102,153,51   |
| orange              FFA500  255,165,0    017  019  018  FF9900  255,153,0    |
| orangered           FF4500  255,69,0     029  002  030  FF3300  255,51,0     |
| orchid              DA70D6  218,112,214  055  055  056  CC66CC  204,102,204  |
| palegoldenrod       EEE8AA  238,232,170  002  244  003  FFFF99  255,255,153  |
| palegreen           98FB98  152,251,152  074  074  075  99FF99  153,255,153  |
| paleturquoise       AFEEEE  175,238,238  072  072  073  99FFFF  153,255,255  |
| palevioletred       DB7093  219,112,147  056  056  057  CC6699  204,102,153  |
| papayawhip          FFEFD5  255,239,213  001  -    002  FFFFCC  255,255,204  |
| peachpuff           FFDAB9  255,218,185  007  -    008  FFCCCC  255,204,204  |
| peru                CD853F  205,133,63   052  052  053  CC9933  204,153,51   |
| pink                FFC0CB  255,192,203  007  -    008  FFCCCC  255,204,204  |
| plum                DDA0DD  221,160,221  049  049  050  CC99CC  204,153,204  |
| powderblue          B0E0E6  176,224,230  078  078  079  99CCFF  153,204,255  |
| purple              A020F0  160,32,240   096  096  097  9933FF  153,51,255   |
| red                 FF0000  255,0,0      035  035  036  FF0000  255,0,0      |
| rosybrown           BC8F8F  188,143,143  050  050  051  CC9999  204,153,153  |
| royalblue           4169E1  65,105,225   163  163  164  3366CC  51,102,204   |
| saddlebrown         8B4513  139,69,19    101  101  102  993300  153,51,0     |
| salmon              FA8072  250,128,114  015  -    016  FF9966  255,153,102  |
| sandybrown          F4A460  244,164,96   015  -    016  FF9966  255,153,102  |
| seagreen            2E8B57  46,139,87    159  159  160  339966  51,153,102   |
| seashell            FFF5EE  255,245,238  000  000  001  FFFFFF  255,255,255  |
| sienna              A0522D  160,82,45    094  094  095  996633  153,102,51   |
| skyblue             87CEEB  135,206,235  078  078  079  99CCFF  153,204,255  |
| slateblue           6A5ACD  106,90,205   127  127  128  6666CC  102,102,204  |
| slategray           708090  112,128,144  086  086  087  999999  153,153,153  |
| snow                FFFAFA  255,250,250  000  000  001  FFFFFF  255,255,255  |
| springgreen         00FF7F  0,255,127    183  182  184  00FF66  0,255,102    |
| steelblue           4682B4  70,130,180   157  157  158  3399CC  51,153,204   |
| tan                 D2B48C  210,180,140  044  044  045  CCCC99  204,204,153  |
| thistle             D8BFD8  216,191,216  043  043  044  CCCCCC  204,204,204  |
| tomato              FF6347  255,99,71    022  024  023  FF6633  255,102,51   |
| turquoise           40E0D0  64,224,208   151  151  152  33CCCC  51,204,204   |
| violet              EE82EE  238,130,238  012  -    013  FF99FF  255,153,255  |
| violetred           D02090  208,32,144   062  062  063  CC3399  204,51,153   |
| wheat               F5DEB3  245,222,179  007  -    008  FFCCCC  255,204,204  |
| white               FFFFFF  255,255,255  000  000  001  FFFFFF  255,255,255  |
| whitesmoke          F5F5F5  245,245,245  000  000  001  FFFFFF  255,255,255  |
| yellow              FFFF00  255,255,0    005  004  006  FFFF00  255,255,0    |
| yellowgreen         9ACD32  154,205,50   082  082  083  99CC33  153,204,51   |
|____________________________________________________________________________80^

:COURTESY Tay Vaughan, July, 1996. Timestream, Inc.

:SEE (URL `http://www.timestream.com/mmedia/graphics/colors/ns3names.txt').
:SEE :FILE w23fns.c struct colormap_t w32_color_map.

:SEE-ALSO `mon-help-color-functions',`mon-help-css-color'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-easy-menu "mon-doc-help-utils" "\
Following is a mapping for building a menu with easy-menu's `easy-menu-define'.

    ____________
   |            |                                                              
   | :EASY-MENU |          :SEE info node `(elisp)Defining Menus'               
 __|____________|____________________________________________________________79.
|                                                                              |
|                      ,-+ :MENU-ROOT                                          |
| [SYMBOL MAPS DOC MENU                                                        |
.                  |                      ,-+ :MENU-CHILD                      |
.                  + (NAME CALLBACK ENABLE                                     |
.                  | ...... NAME ;string                                       |
.                  | ...... CALLBACK ;command|List                             |
.                  | ...... ENABLE ;Expression                                 |
.                  :        | ... :filter . FUNCTION ;Function                 |
.                  :        | ... :visible . INCLUDE ;Expression               |
.                  :        | ... :active . ENABLE ;Expression                 |
.                  |  )                                                        |
.                  :__________.                      ,-+ :MENU-CHILD-ELEMENTS  |
.                             | [NAME CALLBACK ENABLE                          |
.                             |___.                                            |
.                             :   | ... :filter . FUNCTION ;Function           |
.                             :   | ... :visible . INCLUDE ;Expression         |
.                             :   | ... :active . ENABLE ;Expression           |
.                             :   | ... :label . FORM ;Expression              |
.                             :   | ... :keys . KEYS ;String                   |
.                             :   | ... :key-sequence . KEYS ;String|Vector    |
.                             :   | ... :help . HELP ;String                   |
.                             :   | ... :selected . SELECTED ;Expression       |
.                             :   | ... :style . STYLE ;SYMBOL                 |
.                             :   :            |... toggle: radio: button:     |
.                             | ]                                              |
| ]                                                                            |
|____________________________________________________________________________79.

:SEE-ALSO `mon-help-custom-keywords', `mon-help-widgets',
`mon-help-plist-functions', `mon-help-color-chart',
`mon-help-faces', `mon-help-faces-basic', `mon-help-faces-themes',
`mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-widgets "mon-doc-help-utils" "\
Help table for the widget interface.

 __________________________                                                  
|                          | :SEE info node `(widget)Introduction'           
| :WIDGET-TYPE-SYNTAX-OF   | :SEE info node `(elisp)Abstract Display'        
|__________________________|______________________________________________77.
|                                                                           |
| NAME ::= (NAME [KEYWORD ARGUMENT] ... ARGS)                               |
|            |       |        |          |                                  |
|      widget-name   |        |          + widget-specific                  |
|                    |        + prop-val                                    |
|                    |                                                      |
|    .---------------+ prop-key                                             |
|    |                                                                      |
|    |--+ format                                                            |
|    |                                                                      |
|    |   `%[  %]' | `%{  %}' |  `%v',   `%d', `%h', `%t', `%%'              |
|    |      ^          ^                  ^     ^     ^                     |
|    |......¦..........¦..................¦.....¦.....¦                     |
|           |          |                  |     |     |                     |
|           |          |--+ :sample-face  ._____.     |-+ :tag | :tag-glyph |
|           |                                |                              |
|           |--+ :button-face                |--+ :doc                      |
|                                            |                              |
|                                            |--+ :documentation-property   |
|--+ :value          ;init-arg                                              |
|                                                                           |
|--+ :button-prefix  ;nil | <STRING> | <SYMBOL>                             |
|                                                                           |
|--+ :button-suffix  ;nil | <STRING> | <SYMBOL>                             |
|                                                                           |
|--+ :help-echo      ; <STRING> | [ <FUNCTION> Arg ] | [ widget <STRING> ]  |
|                                                                           |
|--+ :follow-link    ;<mouse-1>                                             |
|                                                                           |
|--+ :indent         ;<INTEGER>                                             |
|                                                                           |
|--+ :offset         ;<INTEGER>                                             |
|                                                                           |
|--+ :extra-offset   ;<INTEGER>                                             |
|                                                                           |
|--+ :notify         ; [ <FUNCTION> arg1 &optional arg2 ]                   |
|                                                                           |
|--+ :menu-tag       ; :tag                                                 |
|                                                                           |
|--+ :menu-tag-get   ;[ <FUNCTION> ( :menu-tag | :tag | :value ) ]          |
|                                                                           |
|--+ :match          ;[ widget value ]                                      |
|                                                                           |
|--+ :validate       ;widget _._ `widget-children-validate'_                |
|                             |                             |               |
|                             |                             |--+ :children  |
|                             |--+ :error ;<STRING>                         |
|                                                                           |
|--+ :tab-order      ;{ `widget-forward' | `widget-backward' }              |
|                                                                           |
|--+ :parent         ;{ menu-choice item | editable-list element }          |
|                                                                           |
|--+ :sibling-args   ;{ radio-button-choice checklist }                     |
|___________________________________________________________________________|
|  __________________   ___________________       ____________________      |
| |                  | |                   |     |                    |     |
| | :WIDGET-BUTTONS  | | :WIDGET-FUNCTIONS |     | :WIDGET-NAVIGATION |     |
| |__________________| |___________________|  ___|____________________|___  |
| |                  | |                   | |                            | |
| | Option | Field   | | `widget-value'    | | <TAB> | M-<TAB> | S-<TAB>  | |
| |                  | | `widget-create'   | |    -------------------     | |
| |  [INS] | [DEL]   | | `widget-delete'   | |     `widget-forward'       | |
| |                  | | `widget-insert'   | |     `widget-backward'      | |
| |    [ ] | [X]     | | `widget-setup'    | |    -------------------     | |
| |                  | | `widget-get'      | |____________________________| |
| |    Embedded      | | `widget-put'      |        ____________________    |
| |                  | |___________________|       |                    |   |
| |    ( ) | (*)     |     _______________         | :WIDGET-BUTTON-ACT |   |
| |                  |    |               |      __|____________________|_  |
| |  [Apply Form]    |    | :WIDGET-FACES |     |                         | |
| |                  |   _|_______________|__   |     <RET> | Mouse-2     | |
| |  [Reset Form]    |  |                    |  |  ---------------------  | |
| |__________________|  | widget-mouse-face  |  |  `widget-button-press'  | |
|  ___________________  | widget-field-face  |  |  `widget-button-click'  | |
| |                   | | widget-button-face |  |  ---------------------  | |
| | :WIDGET-VARIABLES | |____________________|  |_________________________| |
| |___________________|______________________      _______________          |
| |                                          |    |               |         |
| |  `widget-keymap'                         |    | :WIDGET-LIKE  |         |
| |  `widget-global-map'                     |   _|_______________|__       |
| |  `widget-glyph-directory'  ;<DIRECTORY>  |  |                    |      |
| |  `widget-glyph-enable'     ;<BOOLEAN>    |  |   `x-popup-menu'   |      |
| |  `widget-button-prefix'    ;<STRING>     |  |      `imenu'       |      |
| |  `widget-button-suffix'    ;<STRING>     |  |     `speedbar'     |      |
| |__________________________________________|  |____________________|      |
|  _______________________________                                          |
| |                               |                                         |
| | :WIDGET-PLIST-PROP-ARGS-OTHER |                                         |
| |_______________________________|__________                               |
| |                                          |                              |
| | :action              :activate           |                              |
| | :active              :inline             |                              |
| | :always-active       :match              |                              |
| | :args                :match-inline       |                              |
| | :button-face-get     :menu-tag           |                              |
| | :buttons             :mouse-down-action  |                              |
| | :complete            :mouse-face         |                              |
| | :complete-function   :mouse-face-get     |                              |
| | :convert-widget      :mouse-face-get     |                              |
| | :copy                :notify             |                              |
| | :create              :prompt-value       |                              |
| | :deactivate          :sample-face-get    |                              |
| | :default-get         :sample-overlay     |                              |
| | :delete              :to                 |                              |
| | :doc                 :type               |                              |
| | :doc-overlay         :validate           |                              |
| | :field-overlay       :value-create       |                              |
| | :format              :value-delete       |                              |
| | :format-handler      :value-inline       |                              |
| | :from                :value-set          |                              |
| | :inactive            :value-to-external  |                              |
| | :indent              :value-to-internal  |                              |
| |__________________________________________|                              |
|_________________________________________________________________________77^

:SEE :FILE wid-edit.el button.el
:SEE-ALSO `mon-help-easy-menu', `mon-help-key-functions',
`mon-help-custom-keywords', `mon-help-plist-functions', `mon-help-color-chart',
`mon-help-faces', `mon-help-faces-basic', `mon-help-faces-themes',
`mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-custom-keywords "mon-doc-help-utils" "\
Keywords used with defcustom, degroup, customize facilities.

;; :CUSTOM-COMMON-KEYWORDS
:link 
                 ¦ (custom-manual        \"(info-node)Section\")
                 ¦ (info-link            \"(info-node)Section\")
                 ¦ (url-link              <STRING>)
                 ¦ (emacs-commentary-link <STRING>)
                 ¦ (emacs-library-link    <STRING>)
                 ¦ (file-link             <STRING>)
                 ¦ (function-link         <STRING>)
                 ¦ (file-link             <STRING>)
                 ¦ (variable-link         <VARIABLE>)
                 ¦ (custom-group-link     <SYMBOL>)

:tag             <STRING>
:group           <SYMBOL>
:load            <STRING>
:require         <SYMBOL>
:version         <STRING>
:prefix          <STRING>              ; :NOTE `defgroup' only
:package-version (<SYMBOL> . <STRING>)

;; :DEFCUSTOM-KEYWORDS
:options         <LIST>
:set             <SYMBOL>
:get             <SYMBOL>
:risky           <PROPERTY-VALUE>
:safe            <PROPERTY-VALUE>
:set-after       <SYMBOL>
:intialize       <SYMBOL>
                 ¦ `custom-initialize-set'
                 ¦ `custom-initialize-default'
                 ¦ `custom-initialize-reset'
                 ¦ `custom-initialize-changed'
                 ¦ `custom-initialize-safe-set'
                 ¦ `custom-initialize-safe-default'

;; :CUSTOM-TYPES-SIMPLE
:type            <TYPE>
                 ¦ sexp           <FORM>
                 ¦ integer        <INTEGER>
                 ¦ number         <NUMBER> 
                 ¦ float          <FLOAT>
                 ¦ symbol         <SYMBOL>
                 ¦ string         <STRING>
                 ¦ regexp         <STRING>
                 ¦ character      <CHAR-CODE>
                 ¦ file           <STRING>
                 ¦ directory      <STRING>
                 ¦ hook           <LIST>
                 ¦ alist          <CONSED-LIST>
                 ¦ plist          <KEY-VALUE-PAIR>
                 ¦ function       <SYMBOL>
                 ¦ variable       <SYMBOL>
                 ¦ face           <SYMBOL>
                 ¦ boolean        <T-OR-NIL>
                 ¦ coding-system  <SYMBOL>
                 ¦ color          <STRING>|<RGB-HEX-VALUE>

;; :CUSTOM-TYPES-CONSTRUCTORS
list             <ELT-TYPES>
group            <ELT-TYPES>
vector           <ELT-TYPES>
radio            <ELT-TYPES>
choice           <ALT-TYPES>
const            <VAL-TYPEs>
other            <VAL-TYPES>
function-item    <FUNCTION>
cons             (<CAR-TYPE> <CDR-TYPE>)

;; :CUTSOM-USAGE
An alist of conses uses this form:

 :type '(alist :key-type integer :value-type string)

An alist that is not a cons uses one of the forms:

 :type '(repeat (group integer string))

 :type '(repeat (list integer string))

To link to a URL do:

 :link '(url-link :tag \"A search-engine\" \"http://www.google.com\")

To link to a file do:
 :link '(file-link :tag \"an interesting file\" \"~/.emacs\")

To link to an existing file of emacs lisp source code do:
 
 :link '(emacs-library-link  \"subr.el\")


:SEE info node `(elisp)Common Keywords'

:SEE info node `(elisp)Customization Types'

:SEE-ALSO `mon-help-widgets', `mon-help-easy-menu', `mon-help-plist-functions',
`mon-help-color-chart', `mon-help-key-functions', `mon-help-package-keywords',
`mon-help-faces', `mon-help-faces-basic', `mon-help-faces-themes',
`mon-help-eieio-defclass', `mon-help-eieio-functions',
`mon-help-eieio-methods'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-functions "mon-doc-help-utils" "\
A list of functions and vars related to chars and their properties.

;; :CHAR-CONVERSION
`char-to-string'
`clear-string'
`decode-char'
`encode-char'
`get-byte'
`make-char'
`multibyte-char-to-unibyte'
`split-char'
`string-to-char'             
`string-to-multibyte'
`subst-char-in-region'
`subst-char-in-string'
`unibyte-char-to-multibyte'

;; :CHAR-PREDICATES
`char-equal'
`char-displayable-p'
`char-valid-p'
`charsetp'
`char-table-p'
`characterp'
`char-or-string-p'
`buffer-chars-modified-tick'

;; :CHAR-POSITION-MOTION
`skip-chars-forward'
`skip-chars-backward'
`insert-char'
`get-file-char'
`backward-char'
`forward-char'
`following-char'
`preceding-char'
`char-before'
`char-after'

;; :CHAR-READERS                    
`read-char'
`read-char-exclusive'
`read-char-by-name'
`read-quoted-char'                 
`read-quoted-char-radix' ;<VARIABLE>
`quoted-insert'
`ucs-insert'

;; :CHAR-DESCRIPTORS
`decode-char'
`split-char'
`max-char'                          
`text-char-description'     
`single-key-description'
`describe-char'
`describe-char-categories'
`describe-char-unicode-data' ;<DEPRECATED> :FILE descr-text.el
`describe-char-display'
`describe-char-padded-string'
`internal-describe-syntax-value'

;; :CHAR-ENCODING            :SEE `mon-help-char-coding-functions'
`auto-coding-alist'
`find-file-literally'
`recode-file-name'
`insert-file-contents-literally'
`insert-file-literally'

;; :CHAR-SEARCHING
`internal-char-font'
`search-unencodable-char'
`unencodable-char-position'
`find-multibyte-characters'
`find-auto-coding'

;; :CHAR-PROPERTY-FUNCTIONS 
`char-category-set'         ; :NOTE (describe-char-categories (char-category-set 33))
`charset-plist'
`char-code-property-description'
`compose-chars'
`compose-string'
`compose-string-internal'
`decompose-string'
`define-char-code-property'
`get-char-code-property'
`get-char-property'
`get-char-property-and-overlay'
`put-char-code-property'
`char-code-property-alist'         ;<VARIABLE>
`char-code-property-documentation` ;<PROPERTY>

;; :CHAR-PROPERTIES-OF         
`bidi-class`                ; `mon-help-char-unidata-table' :BIDI-CLASS 
`canonical-combining-class` ; `mon-help-char-unidata-table' :CANONICAL-COMBINING-CLASS
`general-category`          ; `mon-help-char-unidata-table' :GENERAL-CATEGORY
`decimal-digit-value`       ; :SEE :FILE lisp/international/uni-decimal.el
`lowercase`                 ; :SEE :FILE lisp/international/uni-lowercase.el
`mirrored`                  ; :SEE :FILE lisp/international/uni-mirrored.el
`titlecase`                 ; :SEE :FILE lisp/international/uni-titlecase.el
`uppercase`                 ; :SEE :FILE lisp/international/uni-uppercase.el
`decomposition`
`digit`
`iso-10646-comment`
`name`
`numeric-value`
`old-name`

:SEE info node `(elisp)Character Properties'

:SEE info node `(elisp)Basic Char Syntax'

:SEE :FILE src/chartab.c src/charset.c admin/unidata-gen.el

:SEE-ALSO `mon-help-char-coding-functions', `mon-help-char-charset-functions',
`mon-help-display-table-functions', `mon-help-char-table-functions',
`mon-help-char-representation', `mon-help-binary-representation',
`mon-help-char-raw-bytes', `mon-help-char-composition', `mon-help-diacritics',
`mon-help-char-ascii', `mon-help-char-iso-8859-1', `mon-help-char-ecma-35',
`mon-help-char-ecma-48', `mon-help-read-functions', `mon-help-print-functions',
`mon-help-key-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-charset-functions "mon-doc-help-utils" "\
A list of functions for working with Emacs characters and charsets.

;; :CHAR-CHARSET-HANDLERS-CHAR
`make-char'
`decode-char'
`encode-char'
`split-char'
`map-charset-chars'

;; :CHAR-CHARSET-HANDLERS-CHARSET
`set-charset-priority'
`define-charset'
`clear-charset-maps'
`declare-equiv-charset'
`define-charset-alias'
`define-charset-internal'

;; :CHAR-CHARSET-HANDLERS-PROPERTY
`unify-charset'
`charset-plist'
`set-charset-plist'
`put-charset-property'
`get-charset-property'

;; :CHAR-CHARSET-INSPECT
`charsetp'
`charset-description'
`charset-dimension'
`charset-info'
`charset-long-name'
`charset-short-name'
`charset-chars'
`charset-id'
`charset-id-internal'
`charset-priority-list'
`char-charset'
`describe-character-set'
`list-charset-chars'

;; :CHAR-CHARSET-INSPECT-CHARSET-FINAL
`get-unused-iso-final-char'
`charset-iso-final-char'
`iso-charset'

;; :CHAR-CHARSET-INSPECT-BUFFER
`char-width'
`charset-after'
`find-charset-region'
`find-charset-string'
`tab-width'

;; :CHAR-CHARSET-PROPERTIES
`:code-offset`
`:map`
`:subset` 
`:superset`
`:dimension`
`:long-name`
`:short--name`
`:code-space`
`:min-code`
`:max-code`
`:iso-final-char`
`:iso-revision-number`
`:emacs-mule-id`
`:ascii-compatible-p`
`:supplementary-p`
`:invalid-code`
`:map`
`:subset`
`:superset`
`:unify-map`

;; :CHAR-CHARSET-VARIABLES
`unibyte-display-via-language-environment'
`charset-map-path'
`charset-list'
`charset-revision-table'
`inhibit-load-charset-map'
`current-iso639-language'
`emacs-mule-charset-table'

;; :CHAR-CHARSETS
eight-bit-graphic
eight-bit-control
eight-bit
unicode-bmp
;; :CHAR-CHARSET-USAGE
\(charset-id-internal 'eight-bit)
;=> 4

\(charset-id-internal 'eight-bit-control)
;=> 7

\(charset-id-internal 'eight-bit-graphic)
;=> 8

\(charset-id-internal 'unicode-bmp)
;=> 144 ;(#o220, #x90)

\(char-charset #x3fffff)
;=> eight-bit

\(decode-char 'eight-bit 255)
;=> 4194303 ;(#o17777777, #x3fffff)

\(split-char #x3fffff)
;=> (eight-bit 255)

\(split-char #xff)
;=> (unicode-bmp 0 232)

:SEE info node `(elisp)Character Sets'

:SEE :FILE charset.c mule.el

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-coding-functions "mon-doc-help-utils" "\
A list of functions for working with Emacs character coding-systems.

;; :CODING-SYSTEM-DESCRIPTORS
`terminal-coding-system'
`list-coding-systems'
`print-designation'

;; :CODING-SYSTEM-GETTERS
`find-operation-coding-system'
`coding-system-list'

;; :CODING-SYSTEM-SETTERS
`set-selection-coding-system'
`set-next-selection-coding-system'
`set-buffer-process-coding-system'
`set-buffer-file-coding-system'
`set-coding-priority'
`set-file-name-coding-system'
`set-terminal-coding-system'
`set-language-environment'
`set-keyboard-coding-system'
`merge-coding-systems'
`autoload-coding-system'
`after-insert-file-set-coding'
`revert-buffer-with-coding-system'
`define-coding-system' (<NAME> <DOCSTRING> [<PROPERTY> <PVAL>]*)
 <PROPERTY>              <PVAL>
 -----------------------------
:mneumonic               <CHAR>
:coding-type             { charset utf-8 utf-16 iso-2022 emacs-mule
                           shift-jis ccl raw-text undecided }
                       ;; :CODING-TYPE-DEPENDENT-PROPERTIES
                          :flags <LIST> ;iso-2022 `coding-system-iso-2022-flags'
                          :designation <VECTOR>  ;iso-2022
                          :bom <BOOLEAN>|<CONS>  ;utf-16, utf-8
                          :endian { big little } ;utf-16
                          :ccl-encoder <SYMBOL>  ;ccl
                          :ccl-decoder <SYMBOL>  ;ccl
:eol-type                  { unix dos mac }
:charset-list              <LIST>
:ascii-compatible-p        <BOOLEAN>
:decode-translation-table  <TRANSLATION-TABLE>
:encode-translation-table  <TRANSLATION-TABLE>
:post-read-conversion      <FUNCTION>
:pre-write-conversion      <FUNCTION>
:default-char              <CHAR>
:for-unibyte               <BOOLEAN>
:mime-charset              <SYMBOL>
:mime-text-unsuitable      <SYMBOL>

;; :CODING-SYTEM-VARIABLES
`keyboard-coding-system'
`default-keyboard-coding-system'
`buffer-file-coding-system-explicit'
`buffer-file-coding-system'
`auto-coding-alist'
`file-coding-system-alist'
`process-coding-system-alist'
`network-coding-system-alist'
`current-language-environment'

:SEE info node `(elisp)Non-ASCII Characters in Strings'

:SEE info node `(elisp)Coding Systems'
:SEE info node `(emacs)Coding Systems'
:SEE info node `(elisp)Character Sets'
:SEE info node `(emacs)Charsets'

:SEE info node `(elisp)Character Properties'
:SEE info node `(elisp)Character Type'
:SEE info node `(elisp)Text Representations'

:ALIASED-BY `mon-help-charset-coding-functions'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-table-functions "mon-doc-help-utils" "\
A list of functions for working with Emacs character char-tables.

;; :CHAR-TABLE-FUNCTIONS
`modify-category-entry'
`define-category-entry'
`map-charset-chars'
`make-char-table'
`char-table-subtype'
`char-table-parent'
`char-table-p'
`char-table-extra-slot'
`optimize-char-table'
`map-char-table'
`set-char-table-default'
`set-char-table-parent'
`set-char-table-range'
`set-char-table-extra-slot'
`build-unicode-category-table'
`unify-charset'
`update-glyphless-char-display'

;; :CHAR-TABLE-FUNCTIONS-CASE
`get-upcase-table'
`copy-case-table'
`set-case-table'
`set-case-syntax'
`set-case-syntax-delims'
`set-case-syntax-pair'
`set-downcase-syntax'
`set-upcase-syntax'
`set-standard-case-table'
`with-case-table'

;; :CHAR-TABLES
`char-acronym-table'
`char-code-property-alist'
`char-code-property-table'  ; :NOTE (get 'char-code-property-table 'char-table-extra-slots)
`char-script-table'
`char-width-table'
`composition-function-table'
`find-word-boundary-function-table'

`keyboard-translate-table'
`printable-chars'
`standard-case-table'
`standard-category-table'
`standard-syntax-table'
`translate-region-internal'
`unicode-category-table'
`word-combining-categories'
`word-separating-categories'

;; :CHAR-TABLE-FUNCTIONS-DESCRIBE
`describe-vector'
`internal-describe-syntax-value'
`describe-buffer-case-table'
`help-describe-category-set'
`describe-categories'

;; :CHAR-TABLE-VARIABLES
`glyphless-char-control'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-display-table-functions "mon-doc-help-utils" "\
A list of functions for working with Emacs character display-tables.

;; :DISPLAY-TABLE-HANDLERS
`lookup-image-map'
`make-display-table'
`display-table-slot'       ; :NOTE Also a <PROPERTY>
`set-display-table-slot'
`set-window-display-table'
`window-display-table'

;; :DISPLAY-TABLE-DESCRIBE
`describe-current-display-table'
`describe-display-table'

;; :DISPLAY-TABLE-STANDARD-DISPLAY
`standard-display-8bit'
`standard-display-ascii'
`standard-display-default'
`standard-display-european'
`standard-display-european-internal'
`standard-display-g1'
`standard-display-graphic'
`standard-display-underline'

;; :DISPLAY-TABLE-FUNCTIONS-GLYPH
`dump-glyph-matrix'
`dump-frame-glyph-matrix'
`dump-glyph-row'
`create-glyph'
`make-glyph-code'
`glyph-char'
`glyph-face'

;; :DISPLAY-TABLE-PROPERTIES
`display-table-slot` ;:NOTE Also a <FUNCTION>

;; :DISPLAY-TABLE-VARIABLES
`glyph-table'
`standard-display-table'
`buffer-display-table'
;; :DISPLAY-VARIABLES
`redisplay-end-trigger-functions'
`display-pixels-per-inch'
`scroll-step'
`scroll-margins'
`scroll-conservatively'
`show-trailing-whitespace'
`nobreak-char-display'
`void-text-area-pointer'

:SEE :FILE lisp/disp-table.el src/dispnew.c

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-unidata-table "mon-doc-help-utils" "\
Table mapping certain sub-tables in `char-code-property-alist'.

;; :GENERAL-CATEGORY
`unidata-describe-general-category' ; :SEE :FILE uni-category.el
Lu <- Letter, Uppercase
Ll <- Letter, Lowercase
Lt <- Letter, Titlecase
Lm <- Letter, Modifier
Lo <- Letter, Other
Mn <- Mark, Nonspacing
Mc <- Mark, Spacing Combining
Me <- Mark, Enclosing
Nd <- Number, Decimal Digit
Nl <- Number, Letter
No <- Number, Other
Pc <- Punctuation, Connector
Pd <- Punctuation, Dash
Ps <- Punctuation, Open
Pe <- Punctuation, Close
Pi <- Punctuation, Initial quote
Pf <- Punctuation, Final quote
Po <- Punctuation, Other
Sm <- Symbol, Math
Sc <- Symbol, Currency
Sk <- Symbol, Modifier
So <- Symbol, Other              ; (get-char-code-property 9658 'general-category)
Zs <- Separator, Space
Zl <- Separator, Line
Zp <- Separator, Paragraph
Cc <- Other, Control
Cf <- Other, Format
Cs <- Other, Surrogate
Co <- Other, Private Use
Cn <- Other, Not Assigned

;; :BIDI-CLASS
L   <- Left-to-Right
LRE <- Left-to-Right Embedding
LRO <- Left-to-Right Override
R   <- Right-to-Left            ; (get-char-code-property 1488 'bidi-class)
AL  <- Right-to-Left Arabic
RLE <- Right-to-Left Embedding
RLO <- Right-to-Left Override
PDF <- Pop Directional Format
EN  <- European Number
ES  <- European Number Separator
ET  <- European Number Terminator
AN  <- Arabic Number
CS  <- Common Number Separator
NSM <- Non-Spacing Mark
BN  <- Boundary Neutral
B   <- Paragraph Separator
S   <- Segment Separator
WS  <- Whitespace
ON  <- Other Neutrals
`unidata-describe-bidi-class'    ; :SEE :FILE uni-bidi.el

;; :CANONICAL-COMBINING-CLASS
0   <- Spacing, split, enclosing, reordrant, and Tibetan subjoined
1   <- Overlays and interior
7   <- Nuktas
8   <- Hiragana/Katakana voicing marks
9   <- Viramas
10  <- Start of fixed position classes
199 <- End of fixed position classes
200 <- Below left attached
202 <- Below attached
204 <- Below right attached
208 <- Left attached (reordrant around single base character)
210 <- Right attached
212 <- Above left attached
214 <- Above attached
216 <- Above right attached
218 <- Below left
220 <- Below          ; (get-char-code-property 804 'canonical-combining-class)
222 <- Below right
224 <- Left (reordrant around single base character)
226 <- Right
228 <- Above left
230 <- Above
232 <- Above right
233 <- Double below
234 <- Double above
240 <- Below (iota subscript)
`unidata-describe-canonical-combining-class' ; :SEE :FILE uni-combining.el
`reference-point-alist'

;; :UNIDATA-TABLE-GENERATION
The unidata table generated when Emacs is dumped isn't really directly
accessible. This is because some of the functions call `byte-compile' when
building portions of the table to save space and improve efficient char related
lookups. These include:
`unidata-gen-table' 
`unidata-gen-table-character'
`unidata-gen-table-symbol'
`unidata-gen-table-integer'
`unidata-gen-table-numeric'
`unidata-gen-table-name'
`unidata-gen-table-decomposition'

;; :UNIDATA-FILE-GENERATION
`unidata-gen-files'
:SEE :FILE charprop.el
:SEE :FILE uni-combining.el
:SEE :FILE uni-bidi.el
:SEE :FILE uni-category.el
:SEE :FILE uni-name.el
:SEE :FILE uni-decomposition.el
:SEE :FILE uni-decimal.el
:SEE :FILE uni-digit.el
:SEE :FILE uni-numeric.el
:SEE :FILE uni-mirrored.el
:SEE :FILE uni-old-name.el
:SEE :FILE uni-comment.el
:SEE :FILE uni-uppercase.el
:SEE :FILE uni-lowercase.el
:SEE :FILE uni-titlecase.el

:SEE :FILE admin/unidata-gen.el

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-composition "mon-doc-help-utils" "\
List of functions related to char composition and glyphs.

;; :CHAR-COMPOSITION
`auto-compose-chars'
`compose-chars'
`compose-chars-after'
`compose-last-chars'
`compose-gstring-for-terminal'
`compose-gstring-for-graphic'
`compose-glyph-string'
`compose-glyph-string-relative'
`compose-region'
`compose-region-internal'
`compose-string'
`compose-string-internal'
`composition-get-gstring'
`decompose-composite-char'
`decode-composition-rule'
`decode-composition-components'
`decompose-region'
`decompose-string'
`encode-composition-components'
`encode-composition-rule'
`find-composition'
`find-composition-internal'

;; :CHAR-COMPOSITION-LG
`lglyph-adjustment'
`lglyph-ascent'
`lglyph-char'
`lglyph-code'
`lglyph-copy'
`lglyph-descent'
`lglyph-from'
`lglyph-lbearing'
`lglyph-rbearing'
`lglyph-set-adjustment'
`lglyph-set-char'
`lglyph-set-code'
`lglyph-set-from-to'
`lglyph-set-width'
`lglyph-to'
`lglyph-width'
`lgstring-char'
`lgstring-char-len'
`lgstring-font'
`lgstring-glyph'
`lgstring-glyph-len'
`lgstring-header'
`lgstring-insert-glyph'
`lgstring-set-glyph'
`lgstring-set-header'
`lgstring-set-id'
`lgstring-shaped-p'

;; :CHAR-GLYPH-FUNCTIONS
`create-glyph'
`make-glyph-code'
`glyph-char'
`glyph-face'

;; :CHAR-COMPOSITION-GLYPH-VARIABLES
`auto-composition-mode'
`glyph-table'
`compose-chars-after-function'
`composition-function-table'
`reference-point-alist'        ;<CONSTANT>

;; :CHAR-COMPOSITION-DISCUSSION
Emacs uses special text property `composition' to support character
composition.  A sequence of characters that have the same (i.e. eq)
`composition' property value is treated as a single composite
sequence (we call it just `composition' here after).  Characters in
a composition are all composed somehow on the screen.
The property value has this form when the composition is made:

     ((LENGTH . COMPONENTS) . MODIFICATION-FUNC)

then turns to this form:

     (COMPOSITION-ID . (LENGTH COMPONENTS-VEC . MODIFICATION-FUNC))

when the composition is registered in composition_hash_table and
composition_table.  These rather peculiar structures were designed
to make it easy to distinguish them quickly (we can do that by
checking only the first element) and to extract LENGTH (from the
former form) and COMPOSITION-ID (from the latter form).

We register a composition when it is displayed, or when the width
is required (for instance, to calculate columns).

LENGTH -- Length of the composition.  This information is used to
     check the validity of the composition.

COMPONENTS --  Character, string, vector, list, or nil.

     If it is nil, characters in the text are composed relatively
     according to their metrics in font glyphs.

     If it is a character or a string, the character or characters
     in the string are composed relatively.

     If it is a vector or list of integers, the element is a
     character or an encoded composition rule.  The characters are
     composed according to the rules.  (2N)th elements are
     characters to be composed and (2N+1)th elements are
     composition rules to tell how to compose (2N+2)th element with
     the previously composed 2N glyphs.

COMPONENTS-VEC -- Vector of integers.  In a relative composition,
     the elements are the characters to be composed.  In a rule-base
     composition, the elements are characters or encoded
     composition rules.

MODIFICATION-FUNC -- If non nil, it is a function to call when the
     composition gets invalid after a modification in a buffer.  If
     it is nil, a function in `composition-function-table' of the
     first character in the sequence is called.

COMPOSITION-ID --Identification number of the composition.  It is
     used as an index to composition_table for the composition.

When Emacs has to display a composition or has to know its
displaying width, the function get_composition_id is called.  It
returns COMPOSITION-ID so that the caller can access the
information about the composition through composition_table.  If a
COMPOSITION-ID has not yet been assigned to the composition,
get_composition_id checks the validity of `composition' property,
and, if valid, assigns a new ID, registers the information in
composition_hash_table and composition_table, and changes the form
of the property value.  If the property is invalid,
get_composition_id returns -1 without changing the property value.

We use two tables to keep the information about composition;
composition_hash_table and composition_table.

The former is a hash table whose keys are COMPONENTS-VECs and
values are the corresponding COMPOSITION-IDs.  This hash table is
weak, but as each key (COMPONENTS-VEC) is also kept as a value of the
`composition' property, it won't be collected as garbage until all
bits of text that have the same COMPONENTS-VEC are deleted.

The latter is a table of pointers to `struct composition' indexed
by COMPOSITION-ID.  This structure keeps the other information.

In general, a text property holds information about individual
characters.  But, a `composition' property holds information about
a sequence of characters (in this sense, it is like the `intangible'
property).  That means that we should not share the property value
in adjacent compositions -- we can't distinguish them if they have the
same property.  So, after any changes, we call
`update_compositions' and change a property of one of adjacent
compositions to a copy of it.  This function also runs a proper
composition modification function to make a composition that gets
invalid by the change valid again.

As the value of the `composition' property holds information about a
specific range of text, the value gets invalid if we change the
text in the range.  We treat the `composition' property as always
rear-nonsticky (currently by setting default-text-properties to
\(rear-nonsticky (composition))) and we never make properties of
adjacent compositions identical.  Thus, any such changes make the
range just shorter.  So, we can check the validity of the `composition'
property by comparing LENGTH information with the actual length of
the composition.

:SOURCE src/composite.c -- Comments at header of file.

:SEE info node `(elisp)Special Properties'
:SEE info node `(elisp)Glyphs'
:SEE-FILE lisp/composite.el src/font.h src/composite.c src/composite.h
:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-ascii "mon-doc-help-utils" "\
ASCII Character Tables.

    _____________
   |             |                                                      
   | :CHAR-ASCII |                                                      
 __|_____________|______________________________________________67.
|                                                                 |
| 000 NUL|001 SOH|002 STX|003 ETX|004 EOT|005 ENQ|006 ACK|007 BEL |
| 010 BS |011 HT |012 NL |013 VT |014 NP |015 CR |016 SO |017 SI  |
| 020 DLE|021 DC1|022 DC2|023 DC3|024 DC4|025 NAK|026 SYN|027 ETB |
| 030 CAN|031 EM |032 SUB|033 ESC|034 FS |035 GS |036 RS |037 US  |
| 040 SP |041  ! |042  \" |043  # |044  $ |045  % |046  & |047  '  |
| 050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  /  |
| 060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7  |
| 070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ?  |
| 100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G  |
| 110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O  |
| 120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W  |
| 130  X |131  Y |132  Z |133  [ |134  \\ |135  ] |136  ^ |137  _  |
| 140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g  |
| 150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o  |
| 160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w  |
| 170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 DEL |
|_________________________________________________________________|
|                                                                 |
| 00 NUL| 01 SOH| 02 STX| 03 ETX| 04 EOT| 05 ENQ| 06 ACK| 07 BEL  |
| 08 BS | 09 HT | 0A NL | 0B VT | 0C NP | 0D CR | 0E SO | 0F SI   |
| 10 DLE| 11 DC1| 12 DC2| 13 DC3| 14 DC4| 15 NAK| 16 SYN| 17 ETB  |
| 18 CAN| 19 EM | 1A SUB| 1B ESC| 1C FS | 1D GS | 1E RS | 1F US   |
| 20 SP | 21  ! | 22  \" | 23  # | 24  $ | 25  % | 26  & | 27  '   |
| 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  /   |
| 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7   |
| 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ?   |
| 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G   |
| 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O   |
| 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W   |
| 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \\ | 5d  ] | 5e  ^ | 5f  _   |
| 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g   |
| 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o   |
| 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w   |
| 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f DEL  |
|_________________________________________________________________|
|                                                                 |
|  0 NUL|  1 SOH|  2 STX|  3 ETX|  4 EOT|  5 ENQ|  6 ACK|  7 BEL  |
|  8 BS |  9 HT | 10 NL | 11 VT | 12 NP | 13 CR | 14 SO | 15 SI   |
| 16 DLE| 17 DC1| 18 DC2| 19 DC3| 20 DC4| 21 NAK| 22 SYN| 23 ETB  |
| 24 CAN| 25 EM | 26 SUB| 27 ESC| 28 FS | 29 GS | 30 RS | 31 US   |
| 32 SP | 33  ! | 34  \" | 35  # | 36  $ | 37  % | 38  & | 39  '   |
| 40  ( | 41  ) | 42  * | 43  + | 44  , | 45  - | 46  . | 47  /   |
| 48  0 | 49  1 | 50  2 | 51  3 | 52  4 | 53  5 | 54  6 | 55  7   |
| 56  8 | 57  9 | 58  : | 59  ; | 60  < | 61  = | 62  > | 63  ?   |
| 64  @ | 65  A | 66  B | 67  C | 68  D | 69  E | 70  F | 71  G   |
| 72  H | 73  I | 74  J | 75  K | 76  L | 77  M | 78  N | 79  O   |
| 80  P | 81  Q | 82  R | 83  S | 84  T | 85  U | 86  V | 87  W   |
| 88  X | 89  Y | 90  Z | 91  [ | 92  \\ | 93  ] | 94  ^ | 95  _   |
| 96  ` | 97  a | 98  b | 99  c |100  d |101  e |102  f |103  g   |
|104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o   |
|112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w   |
|120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 DEL  |
|_______________________________________________________________67.

:ALIASED-BY `mon-help-ascii-chars'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-iso-8859-1 "mon-doc-help-utils" "\
ISO-8859-1 Character Table.

                      __________________                                  
                     |                  |                                 
                     | :CHAR-ISO-8859-1 |                                 
 ____________________|__________________|______________________________73.
|                                                                        |
|   0 NU    16 DL     32 SP    48 0     64 At   80 P      96 '!   112 p  |
|   1 SH    17 D1     33 !     49 1     65 A    81 Q      97 a    113 q  |
|   2 SX    18 D2     34 \"     50 2     66 B    82 R      98 b    114 r  |
|   3 EX    19 D3     35 Nb    51 3     67 C    83 S      99 c    115 s  |
|   4 ET    20 D4     36 DO    52 4     68 D    84 T     100 d    116 t  |
|   5 EQ    21 NK     37 %     53 5     69 E    85 U     101 e    117 u  |
|   6 AK    22 SY     38 &     54 6     70 F    86 V     102 f    118 v  |
|   7 BL    23 EB     39 '     55 7     71 G    87 W     103 g    119 w  |
|   8 BS    24 CN     40 (     56 8     72 H    88 X     104 h    120 x  |
|   9 HT    25 EM     41 )     57 9     73 I    89 Y     105 i    121 y  |
|  10 LF    26 SB     42 *     58 :     74 J    90 Z     106 j    122 z  |
|  11 VT    27 EC     43 +     59 ;     75 K    91 <(    107 k    123 (! |
|  12 FF    28 FS     44 ,     60 <     76 L    92 //    108 l    124 !! |
|  13 CR    29 GS     45 -     61 =     77 M    93 )>    109 m    125 !) |
|  14 SO    30 RS     46 .     62 >     78 N    94 '>    110 n    126 '? |
|  15 SI    31 US     47 /     63 ?     79 O    95 _     111 o    127 DT |
|________________________________________________________________________|
|                                                                        |
| 128 PA   144 DC   160 NS   176 DG   192 A!   208 D-   224 a!   240 d-  |
| 129 HO   145 P1   161 !I   177 +-   193 A'   209 N?   225 a'   241 n?  |
| 130 BH   146 P2   162 Ct   178 2S   194 A>   210 O!   226 a>   242 o!  |
| 131 NH   147 TS   163 Pd   179 3S   195 A?   211 O'   227 a?   243 o'  |
| 132 IN   148 CC   164 Cu   180 ''   196 A:   212 O>   228 a:   244 o>  |
| 133 NL   149 MW   165 Ye   181 My   197 AA   213 O?   229 aa   245 o?  |
| 134 SA   150 SG   166 BB   182 PI   198 AE   214 O:   230 ae   246 o:  |
| 135 ES   151 EG   167 SE   183 .M   199 C,   215 *X   231 c,   247 -:  |
| 136 HS   152 SS   168 ':   184 ',   200 E!   216 O/   232 e!   248 o/  |
| 137 HJ   153 GC   169 Co   185 1S   201 E'   217 U!   233 e'   249 u!  |
| 138 VS   154 SC   170 -a   186 -o   202 E>   218 U'   234 e>   250 u'  |
| 139 PD   155 CI   171 <<   187 >>   203 E:   219 U>   235 e:   251 u>  |
| 140 PU   156 ST   172 NO   188 14   204 I!   220 U:   236 i!   252 u:  |
| 141 RI   157 OC   173 --   189 12   205 I'   221 Y'   237 i'   253 y'  |
| 142 S2   158 PM   174 Rg   190 34   206 I>   222 TH   238 i>   254 th  |
| 143 S3   159 AC   175 'm   191 ?I   207 I:   223 ss   239 i:   255 y:  |
|______________________________________________________________________73.

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-ecma-48 "mon-doc-help-utils" "\
For reference, here's a table of the control characters (plus DEL). It
is based on the information from Table 1 of ECMA-48 /ISO/IEC 6429 
\(the control-key representation has been added).

                       _______________                
                      |               |               
                      | :CHAR-ECMA-48 |               
 _____________________|_______________|____________53.
|                                                    |
| :HEX   :KEY    :NAME          :HEX    :KEY   :NAME |
|____________________________________________________|
|                                                    |
| x00     ^@      NUL            x10     ^P      DLE |
| x01     ^A      SOH            x11     ^Q      DC1 |
| x02     ^B      STX            x12     ^R      DC2 |
| x03     ^C      ETX            x13     ^S      DC3 |
| x04     ^D      EOT            x14     ^T      DC4 |
| x05     ^E      ENQ            x15     ^U      NAK |
| x06     ^F      ACK            x16     ^V      SYN |
| x07     ^G      BEL            x17     ^W      ETB |
| x08     ^H      BS             x18     ^X      CAN |
| x09     ^I      TAB            x19     ^Y      EM  |
| x0A     ^J      LF             x1A     ^Z      SUB |
| x0B     ^K      VT             x1B     ^[      ESC |
| x0C     ^L      FF             x1C     ^\\      IS4 |
| x0D     ^M      CR             x1D     ^]      IS3 |
| x0E     ^N      SO             x1E     ^^      IS2 |
| x0F     ^O      SI             x1F     ^_      IS1 |
| x7F     ^?      DEL                                |
|__________________________________________________53.

:ALIASED-BY `mon-help-ecma-48-chars-cntl->hex'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-ecma-35 "mon-doc-help-utils" "\
The ECMA-35/ISO/IEC 2200 standard defines an escape sequence to be a
sequence of characters beginning with ESC, with a final byte in the
range 'x30'-'x7E', and any number (including zero) of intermediate
bytes in the range 'x20'-'x2F'.  The following table has been provided
as a reference for finding which characters match which codes.

               _______________                
              |               |               
              | :CHAR-ECMA-35 |               
 _____________|_______________|____________45.
|      |                                     |
|      |  x2X   x3X   x4X   x5X   x6X   x7X  |
|______|_____________________________________|
|      |                                     |
| xX0  |  SPC    0     @     P     `     p   |
| xX1  |   !     1     A     Q     a     q   |
| xX2  |   \"     2     B     R     b     r   |
| xX3  |   #     3     C     S     c     s   |
| xX4  |   $     4     D     T     d     t   |
| xX5  |   %     5     E     U     e     u   |
| xX6  |   &     6     F     V     f     v   |
| xX7  |   '     7     G     W     g     w   |
| xX8  |   (     8     H     X     h     x   |
| xX9  |   )     9     I     Y     i     y   |
| xXA  |   *     :     J     Z     j     z   |
| xXB  |   +     ;     K     [     k     {   |
| xXC  |   ,     <     L     \\     l     |   |
| xXD  |   -     =     M     ]     m     }   |
| xXE  |   .     >     N     ^     n     ~   |
| xXF  |   /     ?     O     _     o    DEL  |
|__________________________________________45.

:ALIASED-BY `mon-help-cntl->hex->ecma-35'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-diacritics "mon-doc-help-utils" "\
Insert commonly used diacritics and their keymaps at point.
▶▶▶

;; :CX8-DIACRITIC-SYMBOLS-E

à À - C-x 8 ` a
á Á - C-x 8 ' a
ã Ã - C-x 8 ~ a
å Å - C-x 8 / a
â Â - C-x 8 ^ a
ä Ä - C-x 8 \" a
ă Ă - (ucs-insert \"103\") (ucs-insert \"102\")
æ Æ - C-x 8 / e

;; :CX8-DIACRITIC-SYMBOLS-E
è È - C-x 8 ` e
é É - C-x 8 ' e
ë Ë - C-x 8 \" e
ê Ê - C-x 8 ^ e
ĕ Ĕ - (ucs-insert \"115\") (ucs-insert \"114\")

;; :CX8-DIACRITIC-SYMBOLS-I
í Í - C-x 8 ' i
ì Ì - C-x 8 ` i
ï Ï - C-x 8 \" i
î Î - C-x 8 ^ i
ĭ Ĭ - (ucs-insert \"12D\") (ucs-insert \"12C\")

;; :CX8-DIACRITIC-SYMBOLS-O
ó Ó - C-x 8 ' o
ò Ò - C-x 8 ` o
ø Ø - C-x 8 / o
ö Ö - C-x 8 \" o
ô Ô - C-x 8 ^ o
õ Õ - C-x 8 ~ o
ŏ Ŏ - (ucs-insert \"14F\") (ucs-insert \"14E\")
œ Œ - (ucs-insert \"153\") (ucs-insert \"152\")

;; :CX8-DIACRITIC-SYMBOLS-U
ú Ú - C-x 8 ' u
ù Ù - C-x 8 ` u
ü Ü - C-x 8 \" u
û Û - C-x 8 ^ u
ů Ů - (ucs-insert \"16F\") (ucs-insert \"16E\")
ŭ Ŭ - (ucs-insert \"16D\") (ucs-insert \"16C\")

;; :CX8-DIACRITIC-SYMBOLS-NON-VOWEL
ý Ý - C-x 8 ' y
ÿ   - C-x 8 \" y
ç Ç - C-x 8 , c
č Č - (ucs-insert \"10D\") (ucs-insert \"10C\")
ñ Ñ - C-x 8 ~ n
ň Ň - (ucs-insert \"148\") (ucs-insert \"147\")
ß   - C-x 8 \" s
ř Ř - (ucs-insert \"159\") (ucs-insert \"158\")
š Š - (ucs-insert \"161\") (ucs-insert \"160\")
ź Ź - (ucs-insert \"17A\") (ucs-insert \"179\")
ž Ž - (ucs-insert \"17E\") (ucs-insert \"17D\")
þ Þ - C-x 8 ~ t
ð Ð - C-x 8 ~ d

;; :CX8-DIACRITIC-SYMBOLS-CURRENCY
£ - C-x 8 L
¶ - C-x 8 P
§ - C-x 8 S
¥ - C-x 8 Y
¢ - C-x 8 c

;; :CX8-DIACRITIC-SYMBOLS-MATH
÷ - C-x 8 / /
¬ - C-x 8 ~ ~
× - C-x 8 x
¤ - C-x 8 $
± - C-x 8 +
{ - C-x 8    ;SOFT-HYPHEN
· - C-x 8 .
¯ - C-x 8 =
µ - C-x 8 m
° - C-x 8 o     ; DEGREE
º - C-x 8 _ o   ; ORDINAL
µ - C-x 8 u
¾ - C-x 8 3 / 4
½ - C-x 8 1 / 2
¼ - C-x 8 1 / 4
¹ - C-x 8 ^ 1   ; SUPERSCRIPT-1
² - C-x 8 ^ 2   ; SUPERSCRIPT-2
³ - C-x 8 ^ 3   ; SUPERSCRIPT-3

;; :CX8-DIACRITIC-SYMBOLS
 « - C-x 8 <
 » - C-x 8 >
© - C-x 8 C
® - C-x 8 R
¡ - C-x 8 !
¿ - C-x 8 ?
¦ - C-x 8 |
ª - C-x 8 _ a
' - C-x 8 ' SPC
´ - C-x 8 ' '
¨ - C-x 8 \" \"
¸ - C-x 8 , ,
\240 - C-x 8 * SPC ; NO-BREAK-SPACE
▶ - (ucs-insert \"25BA\")

:NOTE C-x 8 RTN is bound to `ucs-insert'


;; :UCS-NAMES
`ucs-insert'
`ucs-names'
`ucs-completions'
`describe-char-unidata-list'
`describe-char-unicodedata-file'
`*mon-unidata-file-list*'
`mon-wget-unicodedata-files'

;;; ==============================

The Unicode data list can be found at:
:SEE (URL `http://www.unicode.org/Public/UNIDATA/UnicodeData.txt').
The Unicode latin scripts are found in several Unicode-Blocks, namely:
U+0000 - U+007F -> Controls and Basic Latin;
:SEE (URL `http://www.decodeunicode.org/en/basic_latin')

U+0080 - U+009F -> Controls and Latin-1;
:SEE (URL `http://www.decodeunicode.org/en/latin-1_supplement')

U+0100 - U+017F -> Latin Extended-A;
:SEE (URL `http://www.decodeunicode.org/en/latin_extended-a')

U+0180 - U+024F -> Latin Extended-B;
:SEE (URL `http://www.decodeunicode.org/en/latin_extended-b')

Character table for reverting ISO_8859-1 bytes -> UTF-8
:SEE (URL `http://en.wikipedia.org/wiki/ISO_8859-1')

:SEE (URL `http://en.wikipedia.org/wiki/ISO/IEC_8859')

:SEE (URL `http://unicode.coeurlumiere.com/').

Unicode Entity Codes for Phonetic/vowel Diacritics:
:SEE (URL `http://tlt.its.psu.edu/suggestions/international/bylanguage/ipavowels.html')

:SEE (URL `http://www.alanwood.net/demos/ent4_frame.html')

HTML - Special Entity Codes:
:SEE (URL `http://tlt.its.psu.edu/suggestions/international/web/codehtml.html')
XML Entity Definitions for Characters - W3C
:SEE (URL `http://www.w3.org/TR/xml-entity-names/')

:NOTE In particular the sources section, \"Section D\":
:SEE (URL `http://www.w3.org/TR/xml-entity-names/#source')
:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-logic "mon-doc-help-utils" "\
Some commonly used characters in propsitional, description, boolean logics.

∧ And
∨ Or
∩ Intersection - Conjunction
⊻ XOR Exclusive Disjunction
⊼ NAND 
∪ Union - Disjunction
∀ For All - Universal Restriction
∃ There Exists - Existential Restriction 
⊂ Subset Of
⊃ Superset Of
¬ Not - Negation - Complement
→ Implication
⊥ Contradiction
⊤ Tautology
⊢ Inference
↔ Material Equivalence
≣ Equivalence

:NOTE I'm not a logician, the table exists in order to help read logics.

:SEE-ALSO `mon-help-CL-bit-byte-bool-logic', `mon-help-CL-sequence-predicates'
`mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-representation "mon-doc-help-utils" "\
Help for working with Emacs character representations.

:SEE info node `(elisp)Basic Char Syntax'

;; :CHAR-REPRESNTATION-DECIMAL
225
?\\á
\"\\341\"
\(identity ?\\á)        ;=> 225
\(identity \"\\341\")     ;=> \"á\"
\(char-to-string ?\\á)  ;=> \"á\"
\(char-to-string 225)  ;=> \"á\"

;; :CHAR-REPRESENTATION-OCTAL
#o341 
?\\341
\(identity #o341)       ;=> 225
\(identity ?\\341)       ;=> 225
\(char-to-string ?\\341) ;=> á
 
;; :CHAR-REPRESENTATION-HEX
#xe1 
\"\\xe1\" 
?\\xe1
\(identity \"\\xe1\")      ;=> \"á\"
\(identity #xe1)        ;=> 225
\(identity ?\\xe1)       ;=> 225
\(char-to-string ?\\xe1) ;=> \"á\"

;; :CHAR-REPESENTATION-UNICODE
\"\\u25BA\"
?\\u25BA
\(identity ?\\u25BA)       ;=> 9658
\(identity \"\\u25BA\")      ;=> \"▶\"
\(char-to-string ?\\u25BA) ;=> \"▶\"

;; :CHAR-REPESENTATION-BINARY             :SEE info node `(elisp)Integer Basics'
#b000 -> 0
#b001 -> 1
#b010 -> 2 
#b011 -> 3
#b100 -> 4

;; :CHAR-REPESENTATION-RADIX
#2r101010 ;=> 42          ; Radix  2 - Binary in #2r<INTEGER> notation
#b101010  ;=> 42          ; Radix  2 - Binary in #b<INTEGER> notation
#8r52     ;=> 42          ; Radix  8 - Octal in #8r<INTEGER> notation
#o52      ;=> 42          ; Radix  8 - Octal in #o<INTEGER> noatation
#16r2A    ;=> 42          ; Radix 16 - Hexadecimal in #16r<INTEGER> notation
#x2a      ;=> 42          ; Radix 16 - Hexadecimal in #x<INTEGER> notation
#28r1E    ;=> 42          ; Radix 28 - Ocotovigesimal in #28r<INTEGER> notation
#32r1A    ;=> 42          ; Radix 32 - Duotrigesimal in #32r<INTEGER> notation 
#36r16    ;=> 42          ; Radix 36 - Hexatrigesimal in #36r<INTEGER> notation

;; :CHAR-CONVERSION-IDIOMS
`format'
\(format (concat \"\\x09 <- HERE BE A `%s'\\n\"
                  \"And which be control char: `%s'\\n\"
                  \"And which be decimal char: `%s'\\n\"
                  \"And which be octal char: `#o%o'\\nWhich is also being hex char: `#x%x'\")
        (single-key-description ?\\x09)
        (text-char-description ?\\x09)
        (string-to-char (format \"%s\" \"\\x09\")) ?\\x9 ?\\11)

`string'
\(apply 'string `(?/ ?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o ?p ?q ?r ?s ?t
                 ?u ?v ?w ?x ?y ?z ?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L ?M ?N ?O
                 ?P ?Q ?R ?S ?T ?U ?V ?W ?X ?Y ?Z ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9
                 ?- ?_ ?. ?! ?~ ?* ?' ?( ?)))
 ;=> \"/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.!~*'()\"

;; :EMACS-CODESPACE
Emacs codespace extends well beyond that of the Unicode codepoint codespace.
In particular, Emacs exposes a range of integers which it terms 8-bit raw-bytes.
These are in the so called `octal range' 0255-0377. Though this `0NNN' notation is
widely by programmers the Emacs elisp reader doesn't understand it; however,
confusingly, when asked to `insert-byte', Emacs will insert a codepoint that is
visually similiar to the afforementioned `octal 0NNN' notation.  Thus, it is
important to understand that a codepoint is not the same thing as a character
and a character is not the same thing as the integer value Emacs uses internally
to represent it. This is an important distinction which can (at times) become
unclear when manipulating characters across different the coding sytems of
buffers, processes, environments, etc.

The decimal value 4194303 represents the uppermost of Emacs' internal
`codespace'.  Where this `codespace' is understood as the range of the set of
characters which may be represented by the positive numerical range of the
22-bit number corresponding to the integer return value of `max-char', e.g.:

 (max-char) => 4194303 (#o17777777, #x3fffff)

Such that `max-char's numerical value (and lesser positive values
therof) may be presented to the Emacs lisp readers in various ways
including -- and in addition to decimal (base 10) notation -- those
integer values represented with the reader syntax:

  #<radix>N and #<R>rN 

in any number of radix in incluing 10, 8, 16, and 2 as follows:

 decimal value     4194303    or #10r4194303

 octal value       #o17777777 or #8r17777777

 hexidecimal value #x3fffff   or #16r3fffff

 binary value      #b01111111111111111111111
                or #2r01111111111111111111111


Where the particular numeric value 4194303 is more widely understood as:
`raw-byte' 255 and equivalenlty (and more generally) being understood
as the uppermost in the so called `octal range': 0200-0377

Emacs displays the `octal range' and otherwise represents this range internally
at the upper bounds of its codespace  as the final range of 127 numeric
character values beginning from the code offset 4194176 (inclusive).
Such that the range of raw-bytes 127-255 beginning with the codespace's integer
value 4194176 and extendingto 4194303 e.g.:

 (cons 4194176 (+ 4194176 (- 255 128)))

And may more generally be represented in Emacs as:

 - decimal range:     4194176 - 4194303

 - octal range:       #o17777600 - #o17777777

 - hexidecimal range: #x3fff80   - #x3fffff

 - binary range:      #b01111111111111110000000 - #b01111111111111111111111

 - code-point range:  0x80 - 0xFF

:UNICODE-CODESPACE-RANGE
\(cons 0 1114111) ;;  #o4177777 #x10FFFF

:EMACS-CODESPACE-EXTENDED
 (cons  1114112  ;; #o4200000, #x110000
        4194175) ;; #o17777577 #x3fff7f

:EMACS-CODESPACE-RAW-BYTE-8-BIT
\(cons 4194176 ;; #o17777600 #x3fff80
      4194303) ;; #o17777777 #x3fffff

\(let ((raw-cons (cons (get-byte nil (char-to-string #x3fff80))
                      (get-byte nil (char-to-string #o17777777)))))
  (cons (unibyte-char-to-multibyte (car raw-cons))
        (+ (unibyte-char-to-multibyte (car raw-cons))
           (- (cdr raw-cons) (car raw-cons)))))

\(cons 4194176 (+ 4194176 (- 255 128)))

\(eq (max-char) #x3fffff)

\(eq (max-char) (1- (expt 2 22)))

\(eq (max-char) (1- (lsh (expt 2 21) 1)))

\(multibyte-char-to-unibyte #x3fffff)

;; :CHAR-REPESENTATION-BYTE-CODE
`decode-char'
`encode-char'
`get-byte'
`make-bool-vector'
`set-buffer-multibyte'
`enable-multibyte-characters'
`multibyte-syntax-as-symbol'

;; :CHAR-REPESENTATION-BYTE-MON
`mon-get-bit-table'
`mon-bool-vector-pp'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-char-raw-bytes "mon-doc-help-utils" "\
Return raw-bytes 200-377 in buffer named \"*RAW-BYTES*\".

The char 4194303 of return value is `max-char'.

:EXAMPLE

\(mon-help-char-raw-bytes)

:NOTE Regexps w/ raw-bytes are funky; from info node `(elisp)Syntax of Regexps'

 You cannot always match all non-ASCII characters with the regular expression
 `\"[\\200-\\377]\"'.  This works when searching a unibyte buffer or string
 (:SEE info node `(elisp)Text Representations'), but not in a multibyte
 buffer or string, because many non-ASCII characters have codes above octal
 0377.  However, the regular expression `\"[^\\000-\\177]\"' does match all
 non-ASCII characters (see below regarding `^'), in both multibyte and unibyte
 representations, because only the ASCII characters are excluded.

;; :CHAR-RAW-BYTE-COERCE
`decode-char'
`encode-char'
`string-to-unibyte'
`string-as-unibyte'
`unibyte-char-to-multibyte'
`multibyte-char-to-unibyte'
`string-to-multibyte'
`string-as-multibyte'
`unibyte-string'
`load-convert-to-unibyte'

;; :CHAR-RAW-BYTE-FUNCTIONS
`insert-byte'
`get-byte'
`find-multibyte-characters'
`multibyte-string-p'
`string-bytes'
`byteorder'
`make-bool-vector'
`bool-vector-p'
`make-byte-code'

;; :BYTE-FUNCTIONS-POSITION
`position-bytes'
`byte-to-position'
`search-unencodable-char'

;; :BYTE-FUNCTIONS-MULTI/UNIBYTE
`set-buffer-multibyte'
`enable-multibyte-characters'

;; :MON-CHAR-RAW-BYTE-FUNCTIONS
`mon-cln-eight-bit-raw'

:SEE info node `(elisp)Text Representations'
:SEE info node `(elisp)Coding Systems'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INTRP)" t nil)

(autoload 'mon-help-binary-representation "mon-doc-help-utils" "\
Table enumerating binary representations and bitwise operations.

;; :BIT1-TO-BIT9
 ----------------------------------- 
¦256¦128¦ 64¦ 32¦ 16¦ 8 ¦ 4 ¦ 2 ¦ 1 ¦
 ----------------------------------- 
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 0   #b000000000 #x0   #o0 (lsh (lognot 0) -29)
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ ;=> 1   #b000000001 #x1   #o1   (lsh 1 0)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ ;=> 2   #b000000010 #x2   #o2   (lsh 1 1)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ ;=> 4   #b000000100 #x4   #o4   (lsh 2 1)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 8   #b000001000 #x8   #o10  (lsh 4 1)  
¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 16  #b000010000 #x10  #o20  (lsh 8 1)  
¦ 0 ¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 32  #b000100000 #x20  #o40  (lsh 16 1) 
¦ 0 ¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 64  #b001000000 #x40  #o100 (lsh 32 1) 
¦ 0 ¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 128 #b010000000 #x80  #o200 (lsh 64 1) 
¦ 1 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ 0 ¦ ;=> 256 #b100000000 #x100 #o400 (lsh 128 1)
 -----------------------------------
 
;; :BIT-BYTE-WORD
 ------------------------------------------------------------
¦                      16-Bit-Word                           ¦
 ------------------------------------------------------------
¦byte-2   (short int)                    ¦byte-1             ¦ (8 bits per byte)
 ------------------------------------------------------------
¦bit 13-16            ¦bit 9-12          ¦bit 5-8    ¦bit 1-4¦
 ------------------------------------------------------------
¦32768¦16384¦8192¦4096¦2048¦1024¦512¦256¦128¦64¦32¦16¦8¦4¦2¦1¦
¦    0¦    0¦   0¦   0¦   0¦   0¦  0¦  0¦  0¦ 0¦ 0¦ 0¦0¦0¦0¦0¦
 ------------------------------------------------------------

;; :BIT-HEX-BIN-OCT
 --------------------------------------                                        
¦ HEX ¦ DEC  ¦ BINARY ¦ OCTAL ¦ BINARY ¦                                       
¦--------------------------------------¦                                       
¦  0  ¦  0   ¦  0000  ¦   0   ¦  000   ¦  :OCTAL->BINARY                       
¦  1  ¦  1   ¦  0001  ¦   1   ¦  001   ¦  #o17 => #10r15                       
¦  2  ¦  2   ¦  0010  ¦   2   ¦  010   ¦     1 -> 001                          
¦  3  ¦  3   ¦  0011  ¦   3   ¦  011   ¦              \\__ #b001111            
¦  4  ¦  4   ¦  0100  ¦   4   ¦  100   ¦              /   (eq #b001111 #o17)   
¦  5  ¦  5   ¦  0101  ¦   5   ¦  101   ¦     7 -> 111                                                              
¦  6  ¦  6   ¦  0110  ¦   6   ¦  110   ¦                                       
¦  7  ¦  7   ¦  0111  ¦   7   ¦  111   ¦                                       
¦  8  ¦  8   ¦  1000  ¦       ¦        ¦                                       
¦  9  ¦  9   ¦  1001  ¦       ¦        ¦  :HEX->BINARY                         
¦  A  ¦  10  ¦  1010  ¦       ¦        ¦  #xA7 => #10r167                      
¦  B  ¦  11  ¦  1011  ¦       ¦        ¦     A -> 1010                         
¦  C  ¦  12  ¦  1100  ¦       ¦        ¦               \\__ #b10100111          
¦  D  ¦  13  ¦  1101  ¦       ¦        ¦               /   (eq #b10100111 #xA7)
¦  E  ¦  14  ¦  1110  ¦       ¦        ¦     7 -> 0111                         
¦  F  ¦  15  ¦  1111  ¦       ¦        ¦                                       
 --------------------------------------

;; :BITWISE-LOGICAL-AND-TABLE
`logand'
 ___________________________ 
|        |        |         |
| :VAL-1 | :VAL-2 | :RESULT |
|________|________|_________|
|        |        |         |
|   0    |   0    |    0    | (logand 0 0)
|   0    |   1    |    0    | (logand 0 1)
|   1    |   0    |    0    | (logand 1 0)
|   1    |   1    |    1    | (logand 1 1)
|________|________|_________|

;; :BITWISE-LOGICAL-OR-TABLE
`logior'
 ___________________________
|        |        |         |
| :VAL-1 | :VAL-2 | :RESULT |
|________|________|_________|
|        |        |         |
|   0    |    0   |     0   | (logior 0 0)
|   0    |    1   |     1   | (logior 0 1)
|   1    |    0   |     1   | (logior 1 0)
|   1    |    1   |     1   | (logior 1 1)
|________|________|_________|

;; :BITWISE-LOGICAL-EXCLUISVE-OR-TABLE
`logxor'
 ___________________________
|        |        |         |
| :VAL-1 | :VAL-2 | :RESULT |
|________|________|_________|
|        |        |         |
|   0    |    0   |     0   | (logxor 0 0) 
|   0    |    1   |     1   | (logxor 0 1)
|   1    |    0   |     1   | (logxor 1 0)
|   1    |    1   |     0   | (logxor 1 1)
|________|________|_________|

;; :BITWISE-LOGICAL-NOT
`lognot'                     ; complement
#b00000000000000000000000000101
 ;=> 5

\(lognot #b00000000000000000000000000101)
 ;=> -6

;; :BIT-SHIFT-LOGICAL-TABLE
 128  64  32  16  8   4   2   1
 -------------------------------
| 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |  =  6
 -------------------------------
                    __! __!
                 __/ __/ 
               ./  ./
 128  64  32  16  8   4   2   1
 -------------------------------
| 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |  =  24
 -------------------------------

;; :BIT-SHIFT
`lsh'                       ; Logical shift
`ash'                       ; arithmetic shift

\(lsh     6    2)
 ;=> 24

\(lsh #b110 #b10)
 ;=> 24

\(lsh      24           -2)
 ;=> 6

\(lsh #b11000 (lognot #b01))
 ;=> 6

\(ash     4      1)
 ;=> 8

\(lsh     4      1)
 ;=> 8

\(ash #b100   #b01)
 ;=> 8

\(lsh           -8                  -1)
 ;=>536870908

\(ash           -8                  -1)
 ;=> -4

\(ash (lognot #b111)       (lognot #b0))
;=> -4

;; :BIT-29
`most-positive-fixnum'
`most-negative-fixnum'

most-negative-fixnum
 ;=> ;=> -536870912 (#o4000000000, #x20000000)

most-positive-fixnum
 ;=> 536870911 (#o3777777777, #x1fffffff)

#b11111111111111111111111111111
 ;=> 536870911
\(eq #b11111111111111111111111111111 most-positive-fixnum)
 ;=> t

\(eq (lsh #b11111111111111111111111111111 29) most-negative-fixnum) ;=> t
\(1- (expt 2 29))
 ;=> -536870912

\(1+ #b11111111111111111111111111111)
 ;=> -536870912

\(lsh #b11111111111111111111111111111 29)
 ;=> -536870912

\(lognot #b11111111111111111111111111111)
 ;=> -536870912

\(lognot most-positive-fixnum)
 ;=> -53687091

\(lognot (lsh most-positive-fixnum 29))
 ;=> 536870911

\(eq (lognot most-positive-fixnum) most-negative-fixnum)
 ;=> t

\(lognot most-negative-fixnum)
 ;=> 536870911

\(eq (lognot most-negative-fixnum) most-positive-fixnum)
 ;=> t

\(lsh most-negative-fixnum -1)
 ;=>268435456

\(ash most-negative-fixnum -1)
 ;=> -268435456

\(lsh (lognot #b11111111111111111111111111111) -29) ;=> 1

\(ash (lognot #b11111111111111111111111111111) -29) ;=> -1

;; BIT-BOUNDARIES
\(let ((gthr '(1)))
  (dotimes (i 28 (setq gthr (nreverse gthr)))
    (push (* (car gthr) 2) gthr))
  (setq gthr `(,@gthr (,(length gthr) ,(reduce '+ gthr)))))


;; BIT-VECTOR-BOOLEAN
`make-bool-vector'
`bool-vector-p'
`mon-bool-vector-pp'

:ALIASED-BY `mon-help-bitwise-functions'

:SEE info node `(elisp)Bool-vectors'
:SEE info node `(elisp)Bitwise Operations'

:SEE-ALSO `mon-help-char-functions', `mon-help-char-charset-functions',
`mon-help-char-coding-functions', `mon-help-char-composition',
`mon-help-char-table-functions', `mon-help-display-table-functions',
`mon-help-char-unidata-table', `mon-help-char-raw-bytes',
`mon-help-binary-representation', `mon-help-char-representation',
`mon-help-diacritics', `mon-help-char-ascii', `mon-help-char-iso-8859-1',
`mon-help-char-ecma-35', `mon-help-char-ecma-48', `mon-help-char-logic',
`mon-help-key-functions', `mon-help-read-functions',
`mon-help-print-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-symbol-functions "mon-doc-help-utils" "\
List of functions and variables related to Emacs symbol identity.

Enumerates functions, variables, and special forms, and C primitives related
symbol construction, (un)intermment, binding, unbinding, byte compiling,
evaling, interrogation, deconstructing, etc.

;; :SYMBOL-CONSTRUCTORS-LISP
`defconst'                                   ;<SPECIAL-OPERATOR>
`defun'                                      ;<SPECIAL-OPERATOR>
`defmacro'                                   ;<SPECIAL-OPERATOR>
`defsubst'
`defvar'                                     ;<SPECIAL-OPERATOR>

`&rest'                                      ; :NOTE (symbol-plist '&rest)
`&optional'                                  ; :NOTE (symbol-plist '&optional)
;; :SYMBOL-CONSTRUCTORS-LISP-CL
`defmacro*'
`defsubst*'
`defun*'
`define-compiler-macro' 
`defstruct'
`deftype'
`&key'                                       ; :NOTE (symbol-plist '&optional)

;; :SYMBOL-CONSTRUCTORS-LISP-EIEIO         ; :NOTE API, additional magic occurs.
`defclass'                                   :SEE `mon-help-eieio-defclass'
`defmethod'                                  :SEE `mon-help-eieio-methods'
`defgeneric'

;; :SYMBOL-CONSTRUCTORS-LISP-EMACS
`autoload'
`deftheme'
`defcustom'
`custom-declare-variable'
`defgroup'
`defface'
`define-prefix-command'

;; :SYMBOL-CONSTRUCTORS-INLINE 
`inline'                                   ; :NOTE (get 'inline 'byte-optimizer)
`defsubst'                                 ; :NOTE (get 'defsubst 'byte-hunk-handler)

`defsubst*'
:NOTE Following forms are evaluated by bytecomp.el and/or associated libraries.
 (fset 'inline 'progn)
 (byte-defop-compiler-1 inline byte-compile-progn)

;; :SYMBOL-CONSTRUCTORS-MACRO-COMPILER
`compiler-macroexpand'
`byte-compile-initial-macro-environment'     ;<CONSTANT>
`byte-compile-macro-environment'             :<VARIABLE>
`cl-compiler-macro`                          ;<PROPERTY>

;; :SYMBOL-CONSTRUCTORS-SET-EMACS
`setq'                                       ;<SPECIAL-OPERATOR>
`psetq'
`set'
`fset'
`set-variable'

;; :SYMBOL-CONSTRUCTORS-SET-CL-GENERALIZED
`defsetf'
`define-modify-macro'
`define-setf-expander'
`define-setf-method'
`setf'
`psetf'

;; :SYMBOL-CONSTRUCTORS-TEMPORARY
`internal-interpreter-environment'           ;<LEXBIND-VARIABLE>
`gensym'
`gentemp'                                    ; :NOTE Misnomer, interns a symbol
`gensym-counter'                             ;<VARIABLE>
`make-symbol'

;; :SYMBOL-CONSTRUCTORS-LOCAL
`lambda'
`let'                                        ;<SPECIAL-OPERATOR>
`let*'                                       ;<SPECIAL-OPERATOR>
`flet'
`labels'
`macroloet'
`symbol-macrolet'
`condition-case'                              ; :NOTE VAR arg is a local environ
`purify-flag'                                 ;<VARIABLE>
`max-specpdl-size'                            ;<VARIABLE>

;; :SYMBOL-CONSTRUCTORS-EMACS-OBJECT-LOCAL
`set-default'
`setq-default'                                ;<SPECIAL-OPERATOR>
`make-local-variable'
`make-variable-buffer-local'
`make-variable-frame-local'                   ;<DEPRECATED>

;; :SYMBOL-PREDICATES
`bound-and-true-p'
`boundp'
`byte-code-function-p'
`commandp'
`fboundp'
`featurep'
`functionp'                                   ;:NOTE C-Primitive in lexbind branch.
`keywordp'
`null'
`subrp'
`symbolp'
`apropos-macrop'
`user-variable-p'
`custom-variable-p'

;; :SYMBOL-PREDICATES-EMACS-OBJECT-LOCAL
`default-boundp'
`local-variable-if-set-p'
`local-variable-p'
`risky-local-variable-p'
`safe-local-variable-p'

;; :SYMBOL-GETTERS
`type-of'
`identity'
`indirect-variable'
`indirect-function'
`interactive-form'
`symbol-function'
`symbol-name'
`symbol-value'
`symbol-file'
`symbol-plist'
`subr-arity'   ; :NOTE Return ( <MIN-ARG> . { <MAX-ARG> | many | unevalled } )
                              (subr-arity (indirect-function 'signal))
                              (subr-arity (indirect-function 'apply))
                              (subr-arity (indirect-function 'unwind-protect))

;; :SYMBOL-GETTERS-EMACS-OBJECT-LOCAL
`kill-local-variable'
`kill-all-local-variables'
`hack-local-variables'
`buffer-local-variables'
`default-value'
`buffer-local-value'

;; :SYMBOL-TABLE
`intern'
`unintern'
`obarray'
`intern-soft'
`mapatoms' 
`makunbound'
`fmakunbound'
`set-advertised-calling-convention'
`advertised-signature-table'

;; :SYMBOL-INDIRECTION
`fset' 
`defalias'
`defvaralias'
`indirect-variable'
`indirect-function'

;; :SYMBOL-OBSOLETE
`define-obsolete-function-alias'
`define-obsolete-variable-alias'
`define-obsolete-face-alias'
`make-obsolete-variable'
`make-obsolete'

;; :SYMBOL-SPECIAL-FORMS   ; :SEE info node `(elisp)Special Forms'
`and'                      ; :NOTE Excluding those tagged \"<SPECIAL-OPERATOR>\"
`catch'
`cond'
`condition-case'
`if'
`interactive'
`or'
`prog1'
`prog2'
`progn'
`save-current-buffer'
`save-excursion'
`save-restriction'
`save-window-excursion'
`track-mouse'
`unwind-protect'
`while'
`with-output-to-temp-buffer'

;; :SYMBOL-SYNTAX-MODIFIERS
`function'                                   ;<SPECIAL-OPERATOR>
`quote'                                      ;<SPECIAL-OPERATOR>
`backquote'
`backquote-backquote-symbol'                 ;<CONSTANT>
`backquote-unquote-symbol'                   ;<CONSTANT>
`backquote-splice-symbol'                    ;<CONSTANT> 
\"`\" \",\" \",@\"                           ; :NOTE lread.c's \",.\" Qcomma_dot
\"'\" 
\"#'\"
\":\"
\"#s\"
\"#N=\" \"#N#\"
\"#:\"
\"#&\"
\"#@<COUNT>\"
\"#$\"
\"#\" \"#b\" \"#x\" \"#o\" \"#r<N>\" \"\\\\?\"

;; :SYMBOL-EVAL
`dont-compile'
`eval-and-compile'
`eval-when-compile'
`eval-when'
`eval-after-load'
`eval'
`funcall'
`apply'
`load-time-value'
`read'

;; :SYMBOL-EMACS-OBJECT-LOCAL-VARIABLES
`before-hack-local-variables-hook'
`hack-local-variables-hook'
`file-local-variables-alist'
`safe-local-variable-values'
`risky-local-variable-p'
`safe-local-variable-p'
`ignored-local-variables'
`enable-local-eval'
`enable-local-variables'
`safe-local-eval-forms'

;; :SYMBOL-PROPERTIES-EMACS-OBJECT-LOCAL
`safe-local-variable-values`
`risky-local-variable`
`safe-local-eval-function`                   ;<PROPERTY>
`permanent-local`                            ;<PROPERTY>

;; SYMBOL-PROPERTIES-EMACS-OBJECT-LOCAL-RISKY
-command
-frame-alist
-function
-functions
-hook
-hooks
-form
-forms
-map
-map-alist
-mode-alist
-program
-predicate

;; :SYMBOL-PRINTING-VARIABLES
`read-circle'
`printable-chars'
`print-circle'
`print-gensym'
`print-continuous-numbering'
`print-number-table'

;; :SYMBOL-BYTE
`byte-code-function-p'
`fetch-bytecode'                             :SEE :FILE eval.c
`byte-code'                                  :SEE :FILE bytecode.c
`make-byte-code'                             :SEE :FILE alloc.c
`make-bool-vector'
`string-bytes'

;; :SYMBOL-COMPILE-OPCODES                   :SEE :FILE bytecomp.el bytecomp.c 
`byte-defop'                                 ;<MACRO>
`byte-code-vector' 
`byte-stack+-info'
`byte-constant-limit'
`byte-goto-ops'

;; :SYMBOL-COMPILE
`byte-code'
`byte-compile'
`byte-compile-constp'
`byte-compile-file'
`byte-compile-lambda'
`byte-compile-lambda-form' 
`byte-compile-output-as-comment'
`byte-compile-output-docform'
`byte-compile-dynamic'                       ;<VARIABLE>
`byte-compile-warnings'                      ;<VARIABLE>
`byte-optimize-log'                          ;<VARIABLE>
`compile-defun'
`declare-function'
`disassemble'
`make-byte-code'
`macro-declaration-function'

;; :SYMBOL-C-PRIMITIVE-VARS
DEFVAR_BOOL
DEFVAR_INT
DEFVAR_LISP
`byte-boolean-vars'
`byte-optimize-log'
 
;; :SYMBOL-LEXBIND
`special-variable-p'                          ;<LEXBIND-FUCTION>
`functionp'                                   ;:NOTE C-Primitive in lexbind branch.
`curry'                                       ;<LEXBIND-FUNCTION>
`lexical-binding'                             ;<LEXBIND-VARIABLE>

;; :SYMBOL-VALUES-MON-LOCAL
`mon-help-byte-code-vector-symbols'
`mon-help-permanent-locals-find'
`mon-help-byte-optimizer-find'
`mon-map-obarray-symbol-plist-props'
`*mon-help-permanent-locals*'
`*mon-help-byte-optimizer-vals*'
`*mon-help-autoload-vars*'
`*mon-help-pure-functions*'
`*mon-help-side-effect-free*'
`*mon-help-side-effect-and-error-free*'
`*mon-help-subrs*'
`*mon-help-subrs-false*'

;; :SYMBOL-COMPONENTS
Print name            :SEE info node `(elisp)Creating Symbols'
Value                 :SEE info node `(elisp)Accessing Variables'
Function              :SEE info node `(elisp)Function Cells'
Property list         :SEE info node `(elisp)Property Lists'

:NOTE Following is an example of the byte-compiler's gernation of \"#@LENGTH\"
as per `byte-compile-output-as-comment':

\(byte-compile-lambda (lambda (x y) \"some lambda form\" (+ x y)))

\(let ((bytecomp-outbuffer (current-buffer)))
  (byte-compile-output-as-comment
   (byte-compile-lambda (lambda (x y) \"some lambda form\" (+ x y))) t))

\(let ((cf (byte-compile-lambda (lambda (x y) \"some lambda form\" (+ x y)))))
 (type-of  cf))

;; `position-bytes' is the index into the file as a byte ind
:SEE info node `(elisp)Byte-Code Objects'
:SEE info node `(elisp)Byte Compilation'
:SEE info node `(elisp)Declaring Functions'
:SEE info node `(elisp)Circular Objects'
:SEE :FILE eval.c bytecode.c alloc.c lread.c
:SEE :FILE `byte-run.el', `bytecomp.el', `byte-opt.el'

:SEE-ALSO `mon-help-byte-compile-functions' .
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-byte-compile-functions "mon-doc-help-utils" "\
List of funcitons and variables related to byte-compiling Emacs lisp.

;; :BYTE-COMPILE-BYTE-CODE
`byte-code'
`make-byte-code'
`fetch-bytecode'
`gnus-byte-code'
`binary-overwrite-mode'

;; :BYTE-COMPILE
`byte-compile'
`byte-compile-eval'
`byte-compile-eval-before-compile'
`byte-compile-file'
`byte-compile-cl-file-p'
`byte-compile-const-symbol-p'            ;<DEFSUBST>
`byte-compile-constp'                    ;<MACRO>
`byte-compile-set-symbol-position'
`byte-compile-obsolete'
`byte-compile-fdefinition'
`byte-compile-arglist-signature'
`byte-compile-arglist-signatures-congruent-p'
`byte-compile-print-syms'
`byte-compile-progn'
`byte-compile-close-variables'           ;<MACRO>
`byte-force-recompile'
`compile-defun'

`byte-compile-from-buffer'
`byte-compile-fix-header'
`byte-compile-insert-header'
`byte-compile-output-file-form'
`byte-compile-output-docform'
`byte-compile-keep-pending'
`byte-compile-flush-pending'
`byte-compile-const-symbol-p'

`macro-declaration-function'
`byte-compile-defmacro-declaration'
`byte-compile-sexp'
`byte-compile-byte-code-maker'
`byte-compile-byte-code-unmake'

;; :BYTE-COMPILE-BYTE-HUNK-HANDLERS
`byte-compile-file-form'
`byte-compile-file-form-defmumble'
`byte-compile-file-form-defsubst'
`byte-compile-file-form-autoload'
`byte-compile-file-form-defvar'
`byte-compile-file-form-define-abbrev-table'
`byte-compile-file-form-custom-declare-variable'
`byte-compile-file-form-require'
`byte-compile-file-form-progn'
`byte-compile-file-form-with-no-warnings'
`byte-compile-file-form-eval'
`byte-compile-file-form-defun'
`byte-compile-file-form-defmacro'

;; :BYTE-COMPILE-CL
`byte-compile-find-cl-functions'
`byte-compile-cl-functions'
`byte-compile-cl-warn'            ; <- Fucker that investigates forms for cl symbols.
`byte-compile-file-form-require'  ; <- Fucker that voices CL runtime warnings:
                                        (byte-compile-warn \"cl package required at runtime\")
                                       As per return value of:     
                                        (byte-compile-warning-enabled-p 'cl-functions)

:NOTE These don't have warnings because have \"suitable\" compiler macros:
 (remq nil (delete-dups
  (mapcar #'(lambda (cl-s)
             (when (eq (get cl-s 'byte-compile) 'cl-byte-compile-compiler-macro) cl-s))
        byte-compile-cl-functions)))

:NOTE These are the byte-compiled during a macroexpansion:
 (mon-map-obarray-symbol-plist-props 'cl-compiler-macro)

;; :BYTE-COMPILE-WARNING
`byte-compile-print-syms'
`byte-compile-warning-enabled-p'
`byte-compile-arglist-warn'
`byte-compile-callargs-warn'
`byte-compile-cl-warn'
`byte-compile-format-warn'
`byte-compile-nogroup-warn'
`byte-compile-report-error'
`byte-compile-warn'
`byte-compile-warn-about-unresolved-functions'
`byte-compile-warn-obsolete'
`byte-compile-warning-series'                   ;<NOOP>
`displaying-byte-compile-warnings'              ;<MACRO>
`warning-series'
`byte-compile-warning-types'                    ;<CONSTANT>

;; :BYTE-COMPILE-OPCODE
`byte-defop'
`byte-defop-compiler-1'
`byte-extrude-byte-code-vectors'

;; :BYTE-COMPILE-OPTIMIZER
`byte-compile-butlast'
`byte-compile-inline-expand'
`byte-compile-log-lap'                          ;<MACRO>
`byte-compile-log-lap-1'
`byte-compile-nilconstp'
`byte-compile-splice-in-already-compiled-code'
`byte-compile-trueconstp'
`byte-compile-unfold-lambda'
`byte-compile-unfold-lambda'
`byte-decompile-bytecode'
`byte-decompile-bytecode-1'
`byte-inline-lapcode'
`byte-inline-lapcode'
`byte-optimize-all-constp'
`byte-optimize-and'
`byte-optimize-apply'
`byte-optimize-approx-equal'
`byte-optimize-associative-math'
`byte-optimize-binary-predicate'
`byte-optimize-body'
`byte-optimize-cond'
`byte-optimize-delay-constants-math'
`byte-optimize-divide'
`byte-optimize-featurep'
`byte-optimize-form'
`byte-optimize-form-code-walker'
`byte-optimize-funcall'
`byte-optimize-identity'
`byte-optimize-if'
`byte-optimize-inline-handler'
`byte-optimize-lapcode'
`byte-optimize-letX'
`byte-optimize-logmumble'
`byte-optimize-minus'
`byte-optimize-multiply'
`byte-optimize-nonassociative-math'
`byte-optimize-nth'
`byte-optimize-nthcdr'
`byte-optimize-or'
`byte-optimize-plus'
`byte-optimize-predicate'
`byte-optimize-quote'
`byte-optimize-set'
`byte-optimize-while'
`byte-optimize-zerop'

;; :BYTE-COMPILE-INSPECT-LOG
`byte-compile-log'                              ;<MACRO>
`byte-compile-log-file'
`byte-compile-log-1'
`byte-compile-log-warning'

;; :BYTE-COMPILE-INSPECT-DISASSEMBLE
`disassemble'
`disassemble-internal'
`disassemble-1'
`disassemble-offset'                         ; :NOTE Dynamic-scope magic here.

;; :BYTE-COMPILE-INSPECT
`byte-decompile-bytecode'
`byte-decompile-bytecode-1'
`byte-code-meter'                            ; :NOTE non-functional since circa 1991/2
`display-call-tree'
`byte-compile-generate-call-tree'
`byte-compile-dest-file'                     ;:NOTE Also a <VARIABLE>

;; :BYTE-COMPILE-VARIABLES-OPTIMIZE-OPCODE
`byte-code-vector'
`byte-boolean-vars'                          ; :NOTE DEFVAR_BOOL updates automatically
`byte-stack+-info'
`byte-goto-ops'
`byte-constant-limit'
`byte-tagref-ops'
`byte-conditional-ops'
`byte-after-unbind-ops'
`byte-compile-side-effect-and-error-free-ops'
`byte-compile-side-effect-free-ops'
`byte-after-unbind-ops'
`byte-compile-splice-in-already-compiled-code'
`byte-conditional-ops'
`byte-constref-ops'
`byte-tagref-ops'

;; :BYTE-CODE-COMPILE-VARIABLES
`bytecomp-version-regexp'
`no-byte-compile'
`byte-compile-delete-errors'
`byte-compile-noruntime-functions'
`old-style-backquotes'
`byte-compile-dynamic-docstrings'

;; :BYTE-CODE-COMPILE-VARIABLES-ENVIRONMENT
`byte-compile-initial-macro-environment'
`byte-compile-macro-environment'
`byte-compile-function-environment'

;; :BYTE-CODE-COMPILE-VARIABLES-STATEFUL
`print-gensym-alist'
`bytecomp-outbuffer'                            ; :NOTE :FILE cl.el binds this
`byte-compile-last-warned-form'
`byte-compile-last-logged-file'
`byte-compile-last-position'
`byte-compile-read-position'
`byte-compile-output'
`byte-compile-tag-number'  
`byte-compile-depth'
`byte-compile-maxdepth'
`byte-compile-unresolved-functions'
`byte-compiler-error-flag'
`byte-compile-free-references'
`byte-compile-free-assignments'
`byte-compile-constants'
`byte-compile-variables'

:BYTE-COMPILE-VARIABLES-INSPECT
`disassemble-column-1-indent'
`disassemble-column-2-indent'
`disassemble-recursive-indent'
`byte-compile-generate-call-tree'
`byte-compile-call-tree-sort'
`byte-compile-call-tree'

;; :BYTE-COMPILE-VARIABLES-INSPECT-LOG
`byte-compile-current-form'                  ; :NOTE Somtimes a keyword arg :end
`byte-compile-dest-file'                     ; :NOTE also a <FUNCTION>
`byte-compile-current-file'
`byte-compile-current-group'
`byte-compile-current-buffer'
`byte-optimize-log'

;; :BYTE-COMPILE-PROPERTIES
`byte-compile`                               ; :NOTE Also a <FUNCTION>
`byte-code-vector`
`byte-compile-format-like`
`byte-compile-negated-op`
`byte-hunk-handler`
`byte-obsolete-info`
`byte-obsolete-variable`
`byte-opcode-invert`
`byte-optimizer`
`byte-stack+-info`
`byte-hunk-handler`

;; :BYTE-COMPILE-PROPERTY-VALUES
`byte-compile-splice-in-already-compiled-code`
`byte-compile-file-form-defsubst`
`byte-compile-file-form-autoload`             
`byte-compile-file-form-defvar`
`byte-compile-file-form-define-abbrev-table`
`byte-compile-file-form-custom-declare-variable`
`byte-compile-file-form-require`
`byte-compile-file-form-progn`
`byte-compile-file-form-eval`
`byte-compile-file-form-with-no-warnings`
`byte-compile-file-form-defun`
`byte-compile-file-form-defmacro`
:NOTE (get 'byte-code 'byte-compile) 
      (get 'no-byte-compile 'safe-local-variable)
      (mapcar #'(lambda (bhh)
                  `(,bhh . ,(get bhh 'byte-hunk-handler)))
              '(defsubst autoload defvar defconst define-abbrev-table
                 custom-declare-variable require progn prog1 prog2
                 with-no-warnings defun eval defmacro))
;; :BYTE-COMPILE-WARNING-TYPES
`callargs`
`cl-functions`
`constants`
`free-vars`
`interactive-only`
`lexical`
`make-local`
`mapcar`
`noruntime`
`obsolete`
`redefine`
`suspicious`
`unresolved`

;; BYTE-COMPILE-LOCAL-VARIABLES
,----
| The `bytecomp-' prefix is applied to all local variables with
| otherwise common names in this and similar functions for the sake
| of the boundp test in byte-compile-variable-ref.
| :SEE (URL `http://lists.gnu.org/archive/html/emacs-devel/2008-01/msg00237.html')
| :SEE (URL `http://lists.gnu.org/archive/html/bug-gnu-emacs/2008-02/msg00134.html')
| :NOTE Similar considerations apply to command-line-1 in startup.el.
| 
| `byte-compile-from-buffer', `byte-compile-file', `byte-recompile-directory',
| `byte-compile-keep-pending', `byte-compile-file-form-defmumble'
|
`----
`bytecomp-handler`
`bytecomp-arg` 
`bytecomp-dest`
`bytecomp-directories`
`bytecomp-directory`
`bytecomp-file`
`bytecomp-file-dir`
`bytecomp-filename`
`bytecomp-force`
`bytecomp-outbuffer`
`bytecomp-inbuffer`
`bytecomp-res`
`bytecomp-source`
`bytecomp-this-one`
`bytecomp-that-one`
`bytecomp-this-kind`
`bytecomp-that-kind`
`bytecomp-name`

;; :NOTE `cl-compiling-file' checks the value of `bytecomp-outbuffer` which
`byte-compile-from-buffer' binds locally.  Also, `load-time-value' leverages
this value to trigger loadtime evaluation of its FORM arg.
;; BYTE-COMPILE-BUFFER-ENVIRONMENT
;; (setq buffer-file-coding-system nil)
;; (set-buffer-multibyte t)
;; (float-output-format nil)
;; (print-length nil)
;; (case-fold-search nil)
;; (print-level nil)
;; (setq overwrite-mode 'overwrite-mode-binary)
;; (enable-local-variables :safe)
;; (enable-local-eval nil)
;; (default-value 'major-mode) 'emacs-lisp-mode 
;; (normal-mode t)
;;
;; :BYTE-COMPILE-LOAD-MAGIC  
,---- :SEE `byte-compile-insert-header'
| The magic number of .elc files is \";ELC\", or 0x3B454C43.  After
| that is the file-format version number (18, 19, 20, or 23) as a
| byte, followed by some nulls.  The primary motivation for doing
| this is to get some binary characters up in the first line of
| the file so that `diff' will simply say \"Binary files differ\"
| instead of actually doing a diff of two .elc files.  An extra
| benefit is that you can add this to /etc/magic:
|
|  0	string		;ELC		GNU Emacs Lisp compiled file,
|  >4	byte		x		version %d
`----
 ; => #x3b (char-to-string #x3B)
 E => #x45 (char-to-string #x45)
 L => #x4c (char-to-string #x4C)
 C => #x43 (char-to-string #x43)
 ;ELC => #x3B454C43


;; :BYTE-COMPILE-BYTE-CODE-OBJECTS
Following are the types of objects that `indirect-function' may return.

;; :COMPILED-FUNCTION
#[ ( <ARG-LIST> ) 
     <BYTE-STR> 
   [ <CONSTANTS>* ]  
     <CONST-CNT-INT>  ;; :NOTE 0 indexed
     ( <PATHNAME-FILE> . <OFFSET>) ]

;; :COMPILED-MACRO
\(macro . 
       #[ ( <ARG-LIST> ) 
            <BYTE-STR> 
          [ <CONSTANTS>* ]  
            <CONST-CNT-INT>  ;; :NOTE 0 indexed
          ( <PATHNAME-FILE> . <OFFSET>) ] )

;; :SUBR-PRIMITIVE 
#<subr `SYMBOL-NAME`>

;; :INTERPRETED-FUNCTION
\(lambda ( <ARG-LIST> ) <DOCSTR> ( <FUNCTION-BODY> ))

;; :INTERPRETED-MACRO
\(macro lambda ( <ARG-LIST> ) <DOCSTR> ( <MACRO-BODY> ))

;; :AUTOLOAD-SYMBOL  ;:NOTE <TYPE> <- macro | keymap
\(autoload  <FILENAME> <DOCSTRING-OFFSET> <INTERACTIVE> <TYPE> )


:NOTE Interestingly bytecomp.el makes use of `letf' :)
:SEE :FILE disass.el bytecomp.el byte-opt.el byte-run.el bytecode.c 
:SEE-ALSO `mon-help-byte-optimizer-find', `mon-help-symbol-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-ipv4-header "mon-doc-help-utils" "\
The IPv4 header as per RFC-791 (more or less).
:SEE (URL `http://tools.ietf.org/rfc/rfc791.txt')

:BYTE-OFFSET                                                                 80.
`--> |0      ¦       ¦    1          ¦        2      ¦            3  |          
     |-------¦-------¦---------------¦---------------¦---------------|========  
  00 |VERSION|  :IHL |  :TOS         |         :TOTAL-LENGTH         |  ¦    ¦  
     |-------¦---------------------------------------¦---------------|  20   ¦    
  04 |       |  :IDENTIFICATION      |:FLAG|   :FRAGMENT-OFFSET      | Bytes ¦  
     |-------¦-------¦---------------¦---------------¦---------------|  ¦    ¦  
  08 | :TIME-TO-LIVE |  :PROTOCOL    |         :HEADR-CHECKSUM       |  ¦ IHL¦  
     |-------¦-------¦---------------¦---------------¦---------------|  ¦ Intrnt
  12 |       ¦       |  :SOURCE-ROUTE-LOCATOR        |               |  ¦ Header
     |-------¦-------¦---------------¦---------------¦---------------|  ¦ Length
  16 |       ¦       |  :DESTINATION-ROUTING-LOCATOR |               |  ¦    ¦  
     |-------¦-------¦---------------¦---------------¦---------------|====   ¦  
  20 |       ¦       |  :OPTIONS     |               |   :PADDING    |       ¦  
     |-------¦-------¦---------------¦---------------¦---------------|========  
:BIT |0 1 2 3¦4 5 6 7¦8 9 0 1 2 3 4 5¦6 7 8 9 0 1 2 3¦4 5 6 7 8 9 0 1|          
     |  Nib  ¦ Byte  ¦                     Word                      |          
                                                                             80^
:VERSION                      -> 4-bit. Version field.

:IHL (Internet Header Length) -> 4-bit. Number of 32-bit words in header.

:DS  (Differentiated Service) -> :SEE RFC-2474 & RFC-3168

:TOS (Type of Service)        -> 8-bit.

           0     1     2     3     4     5     6     7
        +-----+-----+-----+-----+-----+-----+-----+-----+
        |                 |     |     |     |     |     |
        |   :PRECEDENCE   |  D  |  T  |  R  |  0  |  0  |
        |                 |     |     |     |     |     |
        +-----+-----+-----+-----+-----+-----+-----+-----+

        o bits_0–2 -> :TOS-PRECEDENCE
                      111 -> Network Control 
                      110 -> Internetwork Control
                      101 -> CRITIC/ECP
                      100 -> Flash Override
                      011 -> Flash
                      010 -> Immediate
                      001 -> Priority
                      000 -> Routine

        o bit-3         0 -> Normal Delay
                        1 -> Low Delay

        o bit-4         0 -> Normal Throughput
                        1 -> High Throughput

        o bit-5         0 -> Normal Reliability 
                        1 -> High Reliability

        o bit-6         0 -> Normal Cost 
                        1 -> Minimize Monetary Cost :SEE RFC-1349

        o bit-7           -> undefined

:TOTAL-LENGTH   -> 16-bit. Define datagram size.

:IDENTIFICATION -> Identify fragments of original IP datagram.

:FLAG           -> 3-bit. Control or identify fragments.

                     0   1   2
                   +---+---+---+
                   |   | D | M |
                   | 0 | F | F |
                   +---+---+---+

                   :FLAG-ORDER-HIGH->LOW

                   bit-0 -> Reserved, must be zero.

                   bit-1 -> :DF-DO-NOT-FRAGMENT 
                             0 -> May Fragment
                             1 -> Don't Fragment

                   bit-2 -> :MF-MORE-FRAGMENTS
                             0 -> Last Fragment
                             1 -> More Fragments

:FRAGMENT-OFFSET    -> 13-bit in 8-byte blocks. 
                       Fragment offset rel. orig. unfragmented IP datagram.

:TTL (Time to Live) -> 8-bit. Limit datagram lifetime.

:PROTOCOL           -> Define protocol of IP datagram's data.

:HEADER-CHECKSUM    -> 16-bit. Checksum.

:SOURCE-ROUTING-LOCATOR -> 32-bit as 4-octet group. IPv4 address packet source.

:DESTINATION-ROUTING-LOCATOR -> As above, IPv4 packet reciever.

:SEE (URL `http://tools.ietf.org/rfc/rfc1349.txt')
:SEE (URL `http://tools.ietf.org/html/rfc2474.txt')
:SEE (URL `http://tools.ietf.org/rfc/rfc3168.txt')
:SEE (URL `http://en.wikipedia.org/wiki/IPv4')

:SEE-ALSO `*mon-iptables-alst*'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-nclose-functions "mon-doc-help-utils" "\
Functions for working with nclosemacs.
:SEE info node `(nclosemacs)Top'
▶▶▶

;; :NCLOSE-KNOWCESSING
`*nclose-suggest*'
`*nclose-volunteer*'
`*nclose-knowcess*'
`*nclose-reset-session*'
`*nclose-reset-globales*'
`*nclose-reset-signs*'

;; :NCLOSE-PRINT-OBJECTS-ENCYCLOPAEDIA
`*nclose-print-wm*'
`*nclose-print-hypos*'
`*nclose-print-object*'
`*nclose-print-instances*'

;; :NCLOSE-ADD-TO-KB-MACRO
 (`add-to-kb'
   (`@LHS'= <PATTERN-LISP-FORM>)
   (`@hypo' <HYPOTHESIS>)
  [(`@RHS'= [*RHS-lisp-form*]+) *string-documentation*])               

<PATTERN-LISP-FORM> - (form which yields a boolean)
  ,---------.
  |`all-in' |
  |`some-in'|>----<'CLASS-NAME INTEGER 'AND-OR-ELISP-FORM>
  |`oone-in'|                           |  ,-------------------------.
  |`none-in'|                           |  | string= string< string> |
  `---------'                           `--| eq eql equal            |
                                           | < > = /= >= <= + - * /  |
                                           | and or not null '()     |
                                           | memq memql member       |
                                           | yes no                  |
                                           `------------------------70
<HYPOTHESIS> - an hypothesis for the rule.

<RHS-LISP-FORM> - right-hand side actions+
  ,----
  | `@SET'
  |  |--+ `prop-in'
  |  |    (OBJECT-NAME PROPERTY-NAME [SCALAR-VALUE|LISP-FORM])
  |  |
  |  |--+ `member-in'
  |       (CLASS-NAME INTEGER PROPERTY-NAME [SCALAR-VALUE|LISP-FORM])
  `----

<STRING-DOCUMENTATION>

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-iso-8601 "mon-doc-help-utils" "\
The full, extended format of ISO 8601 is as follows:

    1999-10-11T11:10:30,5-07:00

;; :ISO-8601-ELEMENTS

   1. the year with four digits
   2. a hyphen (omitted in the basic format)
   3. the month with two digits
   4. a hyphen (omitted in the basic format)
   5. the day of month with two digits
   6. the letter T to separate date and time
   7. the hour in the 24-hour system with two digits
   8. a colon (omitted in the basic format)
   9. the minute with two digits
  10. a colon (omitted in the basic format)
  11. the second with two digits
  12. a comma
  13. the fraction of the second with unlimited precision
  14. a plus sign or hyphen (minus) to indicate sign of time zone
  15. the hours of the time zone with two digits
  16. a colon (omitted in the basic format)
  17. the minutes of the time zone with two digits

:EXAMPLE

------------------------------
      2  4  6  8 10 12 14 16
      |  |  |  |  |  | |  |
      |  |  |  |  |  | |  |
  1999-10-11T11:10:30,5-07:00
   |    |  |  |  |  | |  |  |
   |    |  |  |  |  | |  |  |
   1    3  5  7  9 1113  15 17
------------------------------

;; :ISO-8601-OMISSION-RULES
The rules for omission of elements are quite simple. Elements from the time of
day may be omitted from the right and take their immediately preceding delimiter
with them. Elements from the date may be omitted from the left, but leave the
immediately following delimiter behind. When the year is omitted, it is replaced
by a hyphen. Elements of the date may also be omitted from the left, provided no
other elements follow, in which case they take their immediately preceding
delimiter with them. The letter T is omitted if the whole of the time of day or
the whole of the date are omitted. If an element is omitted from the left, it is
assumed to be the current value. (In other words, omitting the century is really
dangerous, so I have even omitted the possibility of doing so.) If an element is
omitted from the right, it is assumed to cover the whole range of values and
thus be indeterminate.

Every element in the time specification needs to be within the normal
bounds. There is no special consideration for leap seconds, although some might
want to express them using this standard.

A duration of time has a separate notation entirely, as follows:

    P1Y2M3DT4H5M6S>
    P7W

;; :ISO-8601-DURATION-ELEMENTS

   1. the letter P to indicate a duration
   2. the number of years
   3. the letter Y to indicate years
   4. the number of months
   5. the letter M to indicate months
   6. the number of days
   7. the letter D to indicate days
   8. the letter T to separate dates from times
   9. the number of hours
  10. the letter H to indicate hours
  11. the number of minutes
  12. the letter M to indicate minutes
  13. the number of seconds
  14. the letter S to indicate seconds

Or, for the second form, usually used alone

   1. the letter P to indicate a duration
   2. the number of weeks
   3. the letter W to indicate weeks

Any element (number) may be omitted from this specification and if so takes its
following delimited with it. Unlike the absolute time format, there is no
requirement on the number of digits, and thus no requirement for leading zeros.

A period of time is indicated by two time specifications, at least one of which
has to be absolute, separated by a single solidus (slash), and has the general
forms as follows:

:EXAMPLE
    start/end
    start/duration
    duration/end

the end form may have elements of the date omitted from the left with the
assumption that the default is the corresponding value of the element from the
start form. Omissions in the start form follow the normal rules.

The standard also has specifications for weeks of the year and days of the week,
but these are used so rarely and are aesthetically displeasing so are gracefully
elided from the presentation.

:SOURCE Erik Naggum's \"The Long, Painful History of Time:ALIASED-BY `mon-help-time-iso-8601'
:SEE (URL `http://naggum.no/lugm-time.html')
:SEE info node `(coreutils)Date input formats'

:SEE (URL `http://tools.ietf.org/rfc/rfc3339.txt')

:SEE-ALSO `mon-format-iso-8601-time', `mon-help-CL-local-time', 
`mon-help-time-functions', `mon-help-mon-time-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-time-functions "mon-doc-help-utils" "\
List of functions and variables related to time calculation conversion.

;; :TIME-FUNCTIONS
`current-time'
`current-time-zone'
`decode-time'
`encode-time'
`format-time-string'
`format-seconds'
`float-time'
`seconds-to-time'
`date-to-day'
`date-leap-year-p'
`date-to-time'
`safe-date-to-time'
`days-to-time'
`days-between'
`time-less-p'
`time-since'
`time-subtract'
`time-add'
`time-to-day-in-year'
`time-to-days'
`url-get-normalized-date'
`encode-time-value'
`with-decoded-time-value'

;; :TIME-FUNCTIONS-ISO
`diary-iso-date-forms'
`calendar-iso-to-absolute'
`calendar-iso-from-absolute'
`calendar-iso-date-string'
`calendar-iso-print-date'
`calendar-iso-read-date'
`diary-iso-date'

;; :TIMEZONE-FUNCTIONS
`timezone-time-from-absolute'
`timezone-time-zone-from-absolute'
`timezone-fix-time'
`timezone-last-day-of-month'
`timezone-leap-year-p'
`timezone-day-number'
`timezone-absolute-from-gregorian'
`timezone-parse-date'
`timezone-parse-time'
`timezone-zone-to-minute'
`timezone-make-date-arpa-standard';
`timezone-make-date-sortable'
`timezone-make-arpa-date'
`timezone-make-sortable-date'
`timezone-make-time-string'

;; :TIMEZONE-VARIABLES
`timezone-world-timezones'
`timezone-months-assoc'

;; :DATE-VARIABLES
`diary-european-date-forms'
`url-monthabbrev-alist'
`url-weekday-alist'
`parse-time-months'
`parse-time-weekdays'

:SEE info node `(coreutils)Date input formats'
:SEE :FILE calendar/parse-time.el calendar/time-date.el
:SEE-ALSO `mon-help-CL-local-time', `mon-help-time-functions',
`mon-help-mon-time-functions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-mon-time-functions "mon-doc-help-utils" "\
List `mon-*' fncns and variables to convert, match, and insert time values.

;; :MON-TIME-FUNCTIONS
`mon-get-current-year'
`mon-format-iso-8601-time'
`mon-conv-time-flt-pnt'
`mon-comp-times-flt-pnt'

;; MON-TIME-FUNCTION-FILE
`mon-file-older-than-file-p'
`mon-get-file-mod-times'

;; MON-TIME-FUNCTION-STAMP
`mon-accessed-stamp',
`mon-accessed-time-stamp'
`mon-date-stamp'
`mon-file-stamp'
`mon-file-stamp-buffer-filename' 
`mon-file-stamp-minibuffer'
`mon-lisp-stamp' 
`mon-stamp'
`mon-stamp-in-context'

;; MON-TIME-FUNCTION-REPLACE
`mon-num-to-month'
`mon-abr-to-month'
`mon-month-to-num'
`mon-num-to-month-whitespace'

;; MON-TIME-FUNCTION-EBAY
`mon-cln-ebay-time-string'
`mon-calculate-ebay-timezone-diff'
`mon-convert-ebay-time'
`mon-convert-ebay-time-mvb'

;; MON-TIME-FUNCTION-INTNL
`mon-ital-date-to-eng'
`mon-defranc-dates'

;; :MON-TIME-REGEXPS
`*regexp-MM->month*'
`*regexp-month->MM*'
`*regexp-month->canonical-ws*' 
`*regexp-bound-month->canonical*'
`*regexp-abrv-dotted-month->canonical*'
`*regexp-simple-abrv-month->canonical*'
`*regexp-MM->month-whitespace-aware*'
`*regexp-simple-abrv-month->canonical*'

;; :MON-TIME-REGEXP-CLEAN-PHILSP
`*regexp-philsp-apos*'
`*regexp-philsp-months*'
`*regexp-philsp-fix-month-dates*'

;; :MON-TIME-REGEXP-CLEAN-EBAY
`*regexp-clean-ebay-time-chars*'
`*regexp-clean-ebay-month->canonical-style1*'
`*regexp-clean-ebay-month->canonical-style2*'
`*regexp-clean-ebay-month->canonical-style3*'

;; :MON-TIME-REGEXP-INTNL
`*regexp-ital-to-eng*'
`*regexp-defranc-dates*'

;; :MON-TIME-VARIABLES
`*mon-timestamp-cond*'

;; :NAF-MODE-DATE-REGEXPS
`*naf-mode-db-flags-xrefs*'
`*naf-mode-date-xrefs*'
`*regexp-french-date-prefix*'
`*regexp-french-date-siecle*'
`naf-active-date-flags'
`naf-active-date-flags-paren'
`naf-active-date-flags-solo'
`naf-mode-accessed-by-flag'
`naf-mode-active-date'
`naf-mode-active-date-flags-paren'
`naf-mode-active-date-flags-solo'
`naf-mode-benezit-date'
`naf-mode-circa-dates'
`naf-mode-date-string'
`naf-mode-english-dates'
`naf-mode-english-days'
`naf-mode-french-dates'
`naf-mode-french-days'
`naf-mode-french-months'
`naf-mode-lifespan'
`naf-mode-simple-date'
`naf-mode-timestamp-flag'
`naf-mode-year-range'
`naf-month-abbrev-alist'
`naf-weekday-alist'

:SEE :FILE mon-time-utils.el mon-regexp-symbols.el naf-mode-dates.el naf-mode-db-flags.el

:SEE-ALSO `mon-help-time-functions', `mon-help-iso-8601', `mon-help-CL-local-time'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-bookmark-functions "mon-doc-help-utils" "\
List of the bookmark package's functions and variables.

;; :BOOKMARK-FUNCTIONS
`bookmark--jump-via'
`bookmark-alist-from-buffer'
`bookmark-all-names'
`bookmark-buffer-file-name'
`bookmark-buffer-name'
`bookmark-completing-read'
`bookmark-default-annotation-text'
`bookmark-default-handler'
`bookmark-delete'
`bookmark-edit-annotation'
`bookmark-edit-annotation-mode'
`bookmark-exit-hook-internal'
`bookmark-get-annotation'
`bookmark-get-bookmark'
`bookmark-get-bookmark-record'
`bookmark-get-filename'
`bookmark-get-front-context-string'
`bookmark-get-handler'
`bookmark-get-position'
`bookmark-get-rear-context-string'
`bookmark-grok-file-format-version'
`bookmark-handle-bookmark'
`bookmark-import-new-list'
`bookmark-insert'
`bookmark-insert-current-bookmark'
`bookmark-insert-file-format-version-stamp'
`bookmark-insert-location'
`bookmark-jump'
`bookmark-jump-noselect'
`bookmark-jump-other-window'
`bookmark-kill-line'
`bookmark-load'
`bookmark-locate'
`bookmark-location'
`bookmark-make-record'
`bookmark-make-record-default'
`bookmark-maybe-historicize-string'
`bookmark-maybe-load-default-file'
`bookmark-maybe-message'
`bookmark-maybe-rename'
`bookmark-maybe-sort-alist'
`bookmark-maybe-upgrade-file-format'
`bookmark-menu-popup-paned-menu'
`bookmark-name-from-full-record'
`bookmark-prop-get'
`bookmark-prop-set'
`bookmark-read-search-input'
`bookmark-relocate'
`bookmark-rename'
`bookmark-save'
`bookmark-send-edited-annotation'
`bookmark-set'
`bookmark-set-annotation'
`bookmark-set-filename'
`bookmark-set-front-context-string'
`bookmark-set-name'
`bookmark-set-position'
`bookmark-set-rear-context-string'
`bookmark-show-all-annotations'
`bookmark-show-annotation'
`bookmark-store'
`bookmark-time-to-save-p'
`bookmark-unload-function'
`bookmark-upgrade-file-format-from-0'
`bookmark-upgrade-version-0-alist'
`bookmark-write'
`bookmark-write-file'
`bookmark-yank-word'

;; :BOOKMARK-VARIABLES
`bookmark-map'
`bookmark-use-annotations'
`bookmark-save-flag'
`bookmark-default-file'
`bookmark-old-default-file'
`bookmark-file'
`bookmark-version-control'
`bookmark-completion-ignore-case'
`bookmark-sort-flag'
`bookmark-automatically-show-annotations'
`bookmark-bmenu-header-height'
`bookmark-bmenu-marks-width'
`bookmark-bmenu-file-column'
`bookmark-bmenu-toggle-filenames'
`bookmark-menu-length'
`bookmark-search-delay'
`bookmark-menu-heading'

;; :BOOKMARK-BMENU
`bookmark-bmenu-1-window'
`bookmark-bmenu-2-window'
`bookmark-bmenu-any-marks'
`bookmark-bmenu-backup-unmark'
`bookmark-bmenu-bookmark'
`bookmark-bmenu-delete'
`bookmark-bmenu-delete-backwards'
`bookmark-bmenu-edit-annotation'
`bookmark-bmenu-ensure-position'
`bookmark-bmenu-execute-deletions'
`bookmark-bmenu-filter-alist-by-regexp'
`bookmark-bmenu-goto-bookmark'
`bookmark-bmenu-hide-filenames'
`bookmark-bmenu-list'
`bookmark-bmenu-load'
`bookmark-bmenu-locate'
`bookmark-bmenu-mark'
`bookmark-bmenu-mode'
`bookmark-bmenu-other-window'
`bookmark-bmenu-other-window-with-mouse'
`bookmark-bmenu-relocate'
`bookmark-bmenu-rename'
`bookmark-bmenu-save'
`bookmark-bmenu-search'
`bookmark-bmenu-select'
`bookmark-bmenu-show-all-annotations'
`bookmark-bmenu-show-annotation'
`bookmark-bmenu-show-filenames'
`bookmark-bmenu-surreptitiously-rebuild-list'
`bookmark-bmenu-switch-other-window'
`bookmark-bmenu-this-window'
`bookmark-bmenu-toggle-filenames'
`bookmark-bmenu-unmark'

:SEE :FILE bookmark.el
:SEE-ALSO .
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-info-incantation "mon-doc-help-utils" "\
To reference an info node in a docstring use the idiom:

\"info node `(elisp)Documentation Tips'\" <- Without the \"_\" dbl-quotes.

To jump to an info node with an elisp expression:
\(info \"(elisp)Documentation Tips\") <- With the \" \" dbl-quotes!.
:SEE-ALSO `mon-help-tar-incantation', `mon-help-rename-incantation',
`mon-help-unix-commands', `mon-help-crontab', `mon-help-permissions'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-tar-incantation "mon-doc-help-utils" "\
To help me remember how to do a tar.gz on a directory.
Because I never can remember tar's flags.
:NOTE
On w32 with gnuwin32 to unzip use `gzip.exe -d'
On w32 with gnuwin32 to pipe a tar to gz on w32 use `bsdtar.exe xvzf'.


:TAR-INCANTATION

 tar -czvf dir-name.tar.gz dir-name

Make an exclude file list, and get tar to use it:

 find ./<SOME-PATH>/<THING(S)-TO-FIND> > what-we-found
 tar -cvf <SOME-PATH-TARRED>.tar ./<SOME-PATH> -X what-we-found

Move the entire directory as an archive do:

 (cd <PATH-FROM> && tar Scpf <PATH-TO><TAR-FILE-NAME>.tar .)

Or, if you prefer, following is equivalent to above:
 tar -C <from-mount-point> -Scpvf <to-mount-point><TAR-FILE-NAME>.tar .

:SEE-ALSO `mon-help-rename-incantation', `mon-help-info-incantation',
`mon-help-du-incantation', `mon-help-unix-commands', `mon-help-permissions',
`mon-help-crontab'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-rename-incantation "mon-doc-help-utils" "\
Insert the rename idiom for BASH renaming.
# :RENAME-IDIOM
# for f in *FILENAME; do
#  base=`basename $f *FILENAME` #<-- note backtick!
# mv $f $base.NEWNAME
# done

# :EXAMPLE
for f in *.html.tmp; do
 base=`basename $f .html.tmp`
 mv $f $base.html
done 

:SEE-ALSO `mon-help-info-incantation',`mon-help-du-incantation',
`mon-help-unix-commands', `mon-help-permissions', `mon-help-crontab'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-install-info-incantation "mon-doc-help-utils" "\
Insert the install-info incantation.
Esp. needed on w32 as I can never remember it.
M-x cygwin-shellinstall-info  info-file  /\\\"Program Files\\\"/Emacs/emacs/info/dir
M-x shellinstall-info  info-file  \"/usr/info/dir\"

:SEE-ALSO `mon-help-rename-incantation', `mon-help-info-incantation',
`mon-help-du-incantation', `mon-help-unix-commands', `mon-help-permissions',
`mon-help-crontab'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-hg-archive "mon-doc-help-utils" "\
Idiom for creating an HG archive of a specific revision.
Lifted straight from the `hg' man page.

hg archive [OPTION]... DEST

By default, the revision used is the parent of the working directory.
Use -r/--rev to specify a different revision.

To specify the type of archive to create, use -t/--type.

;; :VALID-TYPES

\"files\" (default): a directory full of files
\"tar\": tar archive, uncompressed
\"tbz2\": tar archive, compressed using bzip2
\"tgz\": tar archive, compressed using gzip
\"uzip\": zip archive, uncompressed
\"zip\": zip archive, compressed using deflate

The exact name of the destination archive or directory is given using a format
string; :SEE 'hg help export' for details.

Each member added to an archive file has a directory prefix prepended.
Use -p/--prefix to specify a format string for the prefix.
The default is the basename of the archive, with suffixes removed.

;; :HG-ARCHIVE-OPTIONS
--no-decode 	do not pass files through decoders
-p, --prefix 	directory prefix for files in archive
-r, --rev 	revision to distribute
-t, --type 	type of distribution to create
-I, --include 	include names matching the given patterns
-X, --exclude 	exclude names matching the given patterns

:SEE (man \"hg\")
:SEE (URL `http://mercurial.selenic.com/quickstart/')
:SEE (URL `http://mercurial.selenic.com/guide/')
:SEE (URL `http://hgbook.red-bean.com/read/')

:SEE-ALSO `mon-help-rename-incantation', `mon-help-info-incantation',
`mon-help-du-incantation', `mon-help-unix-commands', `mon-help-permissions',
`mon-help-crontab'.
▶▶▶

\(fn INSERTP INTRP)" t nil)

(autoload 'mon-help-crontab "mon-doc-help-utils" "\
Help for the crontab tool.

;; :CRONTAB-ELEMENTS
MINUTE HOUR DOM MONTH DOW USER CMD

minute  This controls what minute of the hour the command will run on,
        and is between '0' and '59'

hour    This controls what hour the command will run on, and is specified in
        the 24 hour clock, values must be between 0 and 23 (0 is midnight)

dom     This is the Day of Month, that you want the command run on, e.g. to
        run a command on the 19th of each month, the dom would be 19.

month   This is the month a specified command will run on, it may be specified
        numerically (0-12), or as the name of the month (e.g. May)

dow     This is the Day of Week that you want a command to be run on, it can
        also be numeric (0-7) or as the name of the day (e.g. sun).

user    This is the user who runs the command.
        :NOTE User is not needed when editing your own user crontab.

cmd     This is the command that you want run. This field may contain
        multiple words or spaces.

 __________________________
|                          |
|  :FIELD         :VALUES  |
|   -----          ------  |
|  minute          0-59    |
|  hour            0-23    |
|  day of month    0-31    |
|  month           0-12    |
|  day of week     0-7     |
|__________________________|

 _________________________________________________________________
|                                                                 |
|  *     *     *     *     *    :COMMAND-TO-BE-EXECUTED           |
|  |     |     |     |     |                                      |
|  |     |     |     |     `----- day of week (0 - 6) (Sunday=0)  |
|  |     |     |     `------- month (1 - 12)                      |
|  |     |     `--------- day of month (1 - 31)                   |
|  |     `----------- hour (0 - 23)                               |
|  `------------- min (0 - 59)                                    |
|_________________________________________________________________|

 _____________________________________________________________________________
|                                                                             |
| :MIN | :HR | :DAY | :DOM | :DOW | :EXECUTION-TIME                           |
| 30      0     1    1,6,12   *   -> 00:30 Hrs on 1st of Jan, June & Dec.     |
| 0       20    *     10      1-5 -> 8.00 PM weekdays (Mon-Fri) in Oct.       |
| 0       0    1,15   *       *   -> Midnight on 1st & 15th of month.         |
| 5,10    0     10    *       1   -> 12.05,12.10 every Mon & 10th each month. |
|_____________________________________________________________________________|

 _____________________________________________________________________________
|                                                                             |
| $> crontab -e  ;Edit your crontab file, or create if doesn't already exist. |
| $> crontab -l  ;Display your crontab file.                                  |
| $> crontab -d  ;Remove crontab file :NOTE vcron, bcron, fcron use -r flag.  |
| $> crontab -v  ;Display the last time you edited your crontab file.         |
|_____________________________________________________________________________|


:EXAMPLE

 $> touch ~/test-cron

 $> crontab -e 

 Add the following line to your crontab:

 * * * * * /bin/echo \"foobar\" >> ~/test-cron

 If the file grows steadily over the next few minutes crond is working.

 $> rm ~/test-cron

The default system crontab usually stashes files under /var/spool/cron/*
:NOTE It is _VERY_IMPORTANT_ to make sure your .bashrc has the following:

  export EDITOR=emacs

Some users mistakenly put `export EDITOR=vi'. Never do this. It causes headaches,
user-error, and may even make your CPU to stop working! (Hint just use `:q')

:SEE (woman \"crond\") (woman \"crontab\")
:SEE (URL `http://www.gentoo.org/doc/en/cron-guide.xml')

:SEE (URL `http://wiki.archlinux.org/index.php/Cron')
:SEE-ALSO `mon-help-unix-commands', `mon-help-permissions',
`mon-help-tar-incantation', `mon-help-info-incantation'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-permissions "mon-doc-help-utils" "\
Emacs permission functions and tables for chown, chmod, chattr, umask, etc.

;; :EMACS-PERMISSIONS-FUNCTIONS
`file-attributes'
`file-modes-symbolic-to-number'
`file-modes-char-to-who'
`file-modes-char-to-right'
`file-modes-rights-to-number'
`mon-help-unix-commands'
`read-file-modes'
`set-file-modes'
`set-default-file-modes'

 _____________________  __________________________________________________77.
|                     ||                                                    | 
|     :UGOA           ||              :TRIPLET                              |
|_____________________||____________________________________________________|         
|                     ||                                                    |
| U - First  - Owner  || First        Second       Third                    |
| G - Second - Group  || r: readable  w: writable  x: executable            |
| O - Third  - Others ||                           s: executable + setuid   |
| A -        - All    ||                           S: setuid not executable |
|_____________________||____________________________________________________|
                                                                             
          _____________                      _________________________       
         |             |                    |                         |      
         | :OPERATORS  |                    | :TRIPLES-SYM->OCT->BIN  |      
 ________|_____________|_____________   ____|_________________________|_____ 
|                                    | |                                    |
|  ugoa  :WHO   usr grp other all    | |  --- --- --- : 000 : 000 000 000   |
|  +     :DO    Add permission       | |  --x --x --x : 111 : 001 001 001   |
|  -     :DO    Remove permission    | |  -w- -w- -w- : 222 : 010 010 010   |
|  =     :DO    Permission equal to  | |  -wx -wx -wx : 333 : 011 011 011   |
|  r     :SET   Read                 | |  r-- r-- r-- : 444 : 100 100 100   |
|  w     :SET   Write                | |  r-x r-x r-x : 555 : 101 101 101   |
|  x     :SET   Exectute             | |  rw- rw- r-w : 666 : 110 110 110   |
|  t     :SET   Sticky bit           | |  rwx rwx rwx : 777 : 111 111 111   |
|  s     :SET   UID or GID           | |                                    |
|____________________________________| |____________________________________|
                                                                              
             ___________________________________________________             
            |         |                           |             |            
            | :OCTAL  |        :SYMBOLIC          |   :BINARY   |            
            |_________|___________________________|_____________|            
            |                                                   |            
            |  0       --- no permission               0: 000   |            
            |  1       --x execute                     1: 001   |            
            |  2       -w- write                       2: 010   |            
            |  3       -wx write and execute           3: 011   |            
            |  4       r-- read                        4: 100   |            
            |  5       r-x read and execute            5: 101   |            
            |  6       rw- read and write              6: 110   |            
            |  7       rwx read, write and execute     7: 111   |            
            |___________________________________________________|            
                                                                             
                             _________________                               
                            |                 |                              
                            |  :USER-7-TABLE  |                              
 ___________________________|_________________|____________________________ 
|                                                                          | 
|  rwx rwx rwx :777                                                        | 
|  rwx rwx rw- :776  rwx rw- rw- :766                                      | 
|  rwx rwx r-x :775  rwx rw- r-x :765  rwx r-x r-x :755                    | 
|  rwx rwx r-- :774  rwx rwx r-- :764  rwx r-x r-- :754  rwx r-- r-- :744  | 
|  rwx rwx -wx :773  rwx rwx -wx :763  rwx r-x -wx :753  rwx r-- -wx :743  | 
|  rwx rwx -w- :772  rwx rwx -w- :762  rwx r-x -w- :752  rwx r-- -w- :742  | 
|  rwx rwx --x :771  rwx rwx --x :761  rwx r-x --x :751  rwx r-- --x :741  | 
|  rwx rwx --- :770  rwx rwx --- :760  rwx r-x --- :750  rwx r-- --- :740  | 
|                                                                          | 
|  rwx -wx -wx :733                                                        | 
|  rwx -wx -w- :732  rwx -w- -w- :722                                      | 
|  rwx -wx --x :731  rwx -w- --x :721  rwx --x --x :711                    | 
|  rwx -wx --- :730  rwx -w- --- :720  rwx --x --- :710  rwx --- --- :700  | 
|__________________________________________________________________________| 
                                                                          77^
:SEE info node `(coreutils)File permissions'

:SEE-ALSO `mon-help-unix-commands', `mon-help-permissions',
`mon-help-tar-incantation', `mon-help-info-incantation'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-unix-commands "mon-doc-help-utils" "\
Unix command line programs and builtins.

;; :FILE-SYSTEM-INFO-MAN-NODES
cd        ; :SEE info node `(coreutils)cp invocation'
chattr    ;
cksum     ; :SEE info node `(coreutils)cksum invocation'
cmp       ; :SEE info node `(coreutils) '
cp        ; :SEE info node `(coreutils)cp invocation'
cpio      ; :SEE info node `(cpio)'
dd        ; :SEE info node `(coreutils)dd invocation'
df        ; :SEE info node `(coreutils)df invocation'
dir       ; :SEE info node `(coreutils)dir invocation'
dircolors ; :SEE info node `(coreutils)dircolors invocation'
du        ; :SEE info node `(coreutils)du invocation'
find      ; :SEE info node `(find)'
fsck      ; :SEE info node `(coreutils) '
fuser     ; :SEE info node `(coreutils) '
gzip      ; :SEE info node `(gzip)'
install   ; :SEE info node `(coreutils)install invocation'
ln        ; :SEE info node `(coreutils)ln invocation'
ls        ; :SEE info node `(coreutils)'
lsattr    ; :SEE info node `(coreutils) '
lsof      ; :SEE info node `(coreutils) '
md5sum    ; :SEE info node `(coreutils)md5sum invocation'
mkdir     ; :SEE info node `(coreutils)mkdir invocation'
mknod     ; :SEE info node `(coreutils)mknod invocation'
mkfifo    ; :SEE info node `(coreutils)mkfifo invocation'
mount     ; :SEE info node `(coreutils) '
mv        ; :SEE info node `(coreutils)mv invocation'
pwd       ; :SEE info node `(coreutils)pwd invocation'
readlink  ; :SEE info node `(coreutils)readlink invocation'
rm        ; :SEE info node `(coreutils)rm invocation'
rmdir     ; :SEE info node `(coreutils)rmdir invocation'
shred     ; :SEE info node `(coreutils)shred invocation'
size      ; :SEE info node `(binutils)size'
sync      ; :SEE info node `(coreutils)sync invocation'
stat      ; :SEE info node `(coreutils)stat invocation'
sum       ; :SEE info node `(coreutils)sum invocation'
tar       ; :SEE info node `(tar)'
touch     ; :SEE info node `(coreutils)touch invocation'
unlink    ; :SEE info node `(coreutils)unlink invocation'
umask     ; :SEE info node `(coreutils)'
updatedb  ; :SEE info node `(find)Invoking updatedb'
vdir      ; :SEE info node `(coreutils)vdir invocation'

;; :PROCESSES-INFO-MAN-NODES
at        ; (woman \"at\")
chroot    ; :SEE info node `(coreutils)chroot invocation'
cron      ; :SEE (woman \"crontab\") :SEE-ALSO `mon-help-crontab'
exit      ; :SEE info node `(coreutils) '
kill      ; :SEE info node `(coreutils)kill invocation'
killall   ; :SEE info node `(coreutils) '
nice      ; :SEE info node `(coreutils)nice invocation'
nohup     ; :SEE info node `(coreutils)nohup invocation'
tty       ; :SEE info node `(coreutils)tty invocation'
ps        ; :SEE (woman \"ps\")
sleep     ; :SEE info node `(coreutils)sleep invocation'
stty      ; :SEE info node `(coreutils)stty invocation'
tee       ; :SEE info node `(coreutils)tee invocation'
time      ; :SEE info node `(coreutils)'
top       ; :SEE (woman \"top\")
wait

;; :USER-ENVIRONMENT-INFO-MAN-NODES
chmod     ; :SEE info node `(coreutils)chmod invocation' :SEE-ALSO `mon-help-permissions'
chown     ; :SEE info node `(coreutils)chown invocation'
chgrp     ; :SEE info node `(coreutils)chgrp invocation'
env       ; :SEE info node `(coreutils)env invocation'
finger
hostid    ; :SEE info node `(coreutils)hostid invocation'
id        ; :SEE info node `(coreutils)id invocation'
logname   ; :SEE info node `(coreutils)logname invocation'
printenv  ; :SEE info node `(coreutils)printenv invocation'
mesg
passwd
su        ; :SEE info node `(coreutils) '
sudo      ; :SEE (woman \"sudo\")
uptime
w
wall
write
uname     ; :SEE info node `(coreutils)uname invocation'
groups    ; :SEE info node `(coreutils)groups invocation'
users     ; :SEE info node `(coreutils)users invocation'
who       ; :SEE info node `(coreutils)who invocation'
whoami    ; :SEE info node `(coreutils)whoami invocation'

;; :TEXT-PROCESSING-INFO-MAN-NODES
awk      ; :SEE info node `(gawk)Invoking Gawk'
cmp      ; :SEE info node `(diff)Invoking cmp'
comm     ; :SEE info node `(coreutils)comm invocation'
cat      ; :SEE info node `(coreutils)cat invocation'
cut      ; :SEE info node `(coreutils)cut invocation'
csplit   ; :SEE info node `(coreutils)csplit invocation'
diff     ; :SEE info node `(diff)'
ex
expand   ; :SEE info node `(coreutils)expand invocation'
fmt      ; :SEE info node `(coreutils)fmt invocation'
fold     ; :SEE info node `(coreutils)fold invocation'
head     ; :SEE info node `(coreutils)head invocation'
iconv    ; :SEE info node `() '
join     ; :SEE info node `(coreutils)join invocation'
less
more
nl       ; :SEE info node `(coreutils)nl invocation'
objdump  ; :SEE info node `(binutils)objdump'
od       ; :SEE info node `(coreutils)od invocation'
patch    ; :SEE info node `(diff)Invoking patch'
paste    ; :SEE info node `(coreutils)paste invocation'
ptx      ; :SEE info node `(coreutils)ptx invocation'
ed       ; :SEE info node `(ed)'
sed      ; :SEE info node `(sed)'
sort     ; :SEE info node `(coreutils)sort invocation'
split    ; :SEE info node `(coreutils)split invocation'
strings  ; :SEE info node `(binutils)strings'
strip    ; :SEE info node `(binutils)strip'
tsort    ; :SEE info node `(coreutils)tsort invocation'
tac      ; :SEE info node `(coreutils)tac invocation'
tail     ; :SEE info node `(coreutils)tail invocation'
tr       ; :SEE info node `(coreutils)tr invocation'
unexpand ; :SEE info node `(coreutils)unexpand'
uniq     ; :SEE info node `(coreutils)uniq invocation'
wc       ; :SEE info node `(coreutils)wc invocation'

;; :SHELL-PROGRAMMING-INFO-MAN-NODES
alias
bash      ; :SEE info node `(bash)'
basename  ; :SEE info node `(coreutils)basename invocation'
dirname   ; :SEE info node `(coreutils)dirname invocation'
pathchk   ; :SEE info node `(coreutils) pathchk invocation'
unset     ; :SEE info node `(coreutils)'
echo      ; :SEE info node `(coreutils)echo invocation'
printf    ; :SEE info node `(coreutils)printf invocation'
yes       ; :SEE info node `(coreutils)yes invocation'
expr      ; :SEE info node `(coreutils)expr invocation'
false     ; :SEE info node `(coreutils)false invocation'
test      ; :SEE info node `(coreutils)test invocation'
true      ; :SEE info node `(coreutils)true invocation'
xargs     ; :SEE info node `(find)Multiple Files'

;; :NETWORKING-INFO-MAN-NODES
host
netstat
ping      ; :SEE (woman \"ping\")
netcat    ; :SEE (woman \"netcat\")
traceroute ; :SEE (woman \"traceroute\")
;; :SEARCHING-INFO-MAN-NODES
find      ; :SEE info node `(find)Invoking find'
grep      ; :SEE info node `(grep)'
locate    ; :SEE info node `(find)Invoking locate'
whereis   ; :SEE (woman \"whereis\")
which     ; :SEE (woman \"which\")

;; :MISCELLANEOUS-INFO-MAN-NODES
apropos   ; :SEE (woman \"apropos\")
banner    ; :SEE (woman \"\")
bc
cal
clear     ; :SEE (woman \"clear\")
date      ; :SEE info node `(coreutils)date invocation'
file
help
history   ; :SEE info node `(bash)Bash History Builtins'
info      ; :SEE info node `(info)'
lp
man       ; :SEE (woman \"man\")
pax
size      ; :SEE (woman \"size\")
tput
type
uname     ; :SEE info node `(coreutils)uname invocation'
whatis
:SEE-ALSO `mon-help-permissions', `mon-help-crontab', `mon-help-tar-incantation', 
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-help-format-width "mon-doc-help-utils" "\
Invoking `format' control string to specify padding using the width flag.

:SEE info node `(elisp)Formatting Strings'

:EXAMPLE
  (let ((x 'test) (y \"\"))
     (format \"This is a %-9s.\\nThis is a %9s.\\nThis is a %s %4s.\" x x x y))

 =>This is a test     .
   This is a      test.
   This is a test     .

\(format \"%4c%s%4cbubba2\" 32 'bubba1 32)

 =>    bubba1    bubba2

:SEE-ALSO `mon-help-read-functions', `mon-help-print-functions',
`mon-help-char-representation', `format', `mon-string-justify-left',
`mon-string-fill-to-col', `mon-line-indent-from-to-col',
`mon-line-strings-pipe-to-col'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-index-elisp-symbol "mon-doc-help-utils" "\
Find TOPIC in the indices of the Emacs Lisp Reference Manual.

:EXAMPLE
\(elisp-index-search \"setq\")

:ALIASED-BY `mon-help-elisp-info'

:SEE-ALSO `finder-by-keyword', `mon-help-unix-commands', 
`Info-virtual-index-find-node', `Info-virtual-index'.
▶▶▶

\(fn)" t nil)

(autoload 'mon-help-w32-functions "mon-doc-help-utils" "\
A list of W32 related functions and variables.
  
;; :W32-DISPLAY-FUNCTIONS
`w32-define-rgb-color'
`w32-default-color-map'
`w32-window-exists-p'

;; :W32-DISPLAY-VARIABLES
`w32-strict-painting'
`w32-enable-palette'
`w32-enable-synthesized-fonts'
`w32-bdf-filename-alist'
`w32-strict-fontnames'

;; :W32-SYSTEM
`w32-shell-execute'
`w32-send-sys-command'
`w32-battery-status'

;; :W32-KEYS-FUNCTIONS
`w32-register-hot-key'
`w32-unregister-hot-key'
`w32-registered-hot-keys'
`w32-reconstruct-hot-key'
`w32-toggle-lock-key'

;; :W32-KEYS-VARIABLES
`w32-alt-is-meta'
`w32-pass-alt-to-system'
`w32-quit-key'
`w32-phantom-key-code'
`w32-enable-num-loc'
`w32-enable-caps-lock'
`w32-scroll-lock-modifier'
`w32-apps-modifier'
`w32-mouse-button-tolerance'
`w32-mouse-move-interval'
`w32-pass-extra-mouse-buttons-to-system'
`w32-pass-multimedia-buttons-to-system'
`w32-pass-rwindow-to-system'
`w32-pass-lwindow-to-system'
`w32-rwindow-modifier'
`w32-pass-multimedia-buttons-to-system'
`x-cut-buffer-max'                     ;<VARIABLE>

:SEE-ALSO `*w32-env-variables-alist*', `mon-help-w32-cmd-commands',
`mon-help-w32-env', `mon-help-w32-shell-execute', `mon-help-key-functions'.

\(fn &optional INSERTP INTRP)" t nil)

;;;***

;;;### (autoloads (mon-format-jg-file-for-write mon-write-jg-file-in-path
;;;;;;  mon-make-jg-dir-in-path) "mon-jg-directory-creator" "mon-jg-directory-creator.el"
;;;;;;  "5eb5cbc97ee76fc5a42b7f15af2d6633")
;;; Generated autoloads from mon-jg-directory-creator.el

(autoload 'mon-make-jg-dir-in-path "mon-jg-directory-creator" "\
Create a directory tree IN-DIR with FOLDER-CNT.

IN-DIR names an existing dir to create directory tree under.

FOLDER-CNT specifies the number of directories to create. 
It is an integer multiple of 1000.

When key NO-WRITE is non-nil do not make directories do not
write files. Default is t.

When keyword args FL-PFX and FL-SFX are non-nil these name file-name prefix and
suffiexes per `mon-write-jg-file-in-path' to prepend and append to files created
in bottom most directories.

Return a log of the files directory created in buffer named:
 *MON-JG-FILE-DIR-LOG*

When keyword arg NO-WRITE is non-nil also write the log to the file named:

 <IN-DIR>-YYYY-MM-DD

:EXAMPLE

\(mon-make-jg-dir-in-path 
 \"/some-path/phylum-root\" 2000 
 :no-write t :fl-pfx \"bubba-\" :fl-sfx \".umf\")

¦ 0000
¦ 0000/0000
¦ 0000/0000/0000
¦ 0000/0000/0000/0000
¦ 0000/0000/0000/0001
¦ 0000/0000/0000/0002
¦ 0000/0000/0000/0003
¦
¦  { ... LOTS OF DIRECTORIES ELIDED ... }
¦
¦ 0000/0000/0000/0000/bubba-0000.umf
¦ 0000/0000/0000/0001/bubba-0001.umf
¦ 0000/0000/0000/0002/bubba-0002.umf
¦ 0000/0000/0000/0003/bubba-0003.umf
¦
¦  { ... LOTS OF FILES ELIDED ... }

:SEE-ALSO `mon-write-jg-file-in-path', `mon-make-jg-dir-in-path',
`mon-format-jg-file-for-write', `*mon-jg-file-template*',
`mon-insert-file-in-dirs', `mon-insert-dirs-in-path'.
▶▶▶

\(fn IN-DIR FOLDER-CNT &key NO-WRITE FL-PFX FL-SFX)" nil nil)

(autoload 'mon-write-jg-file-in-path "mon-jg-directory-creator" "\
Write a JG file template to FL-PTH. Return name of file written.

FL-PTH is a string of 19 chars from which to extract a file name for
`write-file'.

File content inserted wit `mon-format-jg-file-for-write' which maps the list
of variable `*mon-jg-file-template*'.

FL-PREFIX is a string to prepend to generated file-name. Default is \"jg-photo-\".

FL-SUFFIX is a string to append to generated file-name, Default is \".txt\"

When optional arg NO-WRITE-FILE is non-nil do not write file.

:CALLED-BY `mon-make-jg-dir-in-path'

:SEE-ALSO `mon-insert-file-in-dirs', `mon-insert-dirs-in-path'
▶▶▶

\(fn FL-PTH &optional FL-PREFIX FL-SUFFIX NO-WRITE-FILE)" nil nil)

(autoload 'mon-format-jg-file-for-write "mon-jg-directory-creator" "\
Map newlines across value of variable `*mon-jg-file-template*'.

Return formatted string and insert in buffer at point. Moves point.

:CALLED-BY `mon-write-jg-file-in-path'

:SEE-ALSO `mon-make-jg-dir-in-path', `mon-insert-file-in-dirs',
`mon-insert-dirs-in-path'.
▶▶▶

\(fn FNAME-TO-WRITE)" nil nil)

;;;***

;;;### (autoloads (mon-build-user-name-example-TEST mon-user-system-conditionals-TEST
;;;;;;  mon-build-user-name-example mon-build-misc-path-example mon-build-mon-emacsd-example
;;;;;;  mon-drive-transfer-template-TEST mon-help-keys-wikify-TEST
;;;;;;  mon-help-propertize-tags-TEST mon-help-regexp-symbol-defs-TEST
;;;;;;  mon-help-propertize-regexp-symbol-defs-TEST mon-plist-values-TEST
;;;;;;  mon-plist-keys-TEST mon-set-buffer-substring-no-properties-TEST
;;;;;;  mon-regexp-clean-ulan-dispatch-chars-TEST mon-list-reorder-TEST
;;;;;;  mon-line-string-insert-chars-under-TEST mon-line-strings-pipe-to-col-TEST
;;;;;;  mon-line-indent-from-to-col-TEST mon-line-string-rotate-name-TEST
;;;;;;  mon-error-protect-PP-EXPAND-TEST mon-string-or-null-and-zerop-TEST
;;;;;;  mon-sequence-all-booleanp-TEST mon-booleanp-to-binary-TEST
;;;;;;  naf-mode-state-to-postal-TEST mon-region-capitalize-TEST
;;;;;;  mon-write-string-reset-bind-TEST mon-permute-combine-functions-TEST
;;;;;;  google-define-get-command-TEST mon-build-copyright-string-TEST
;;;;;;  mon-help-CL-wget-pkgs-TEST mon-line-strings-bq-qt-sym-bol-TEST
;;;;;;  mon-string-split-TEST mon-with-buffer-undo-disabled-TEST
;;;;;;  mon-line-dolines-TEST mon-line-dolines-setup-TEST mon-with-inhibit-buffer-read-only-TEST
;;;;;;  mon-with-inhibit-buffer-read-only-PP-TEST mon-line-strings-to-list-TEST
;;;;;;  mon-list-nshuffle-TEST mon-gensym-counter-randomizer-TEST
;;;;;;  mon-insert-test-cases) "mon-testme-utils" "mon-testme-utils.el"
;;;;;;  "bbd92f2f8c50c7fa9726505718cab75b")
;;; Generated autoloads from mon-testme-utils.el

(autoload 'mon-insert-test-cases "mon-testme-utils" "\
Easily identified tracing vars for debugging `mon-*' and `naf-mode-*' functions.
Unbinds all previously bound variables:
 test-aaa, test-bbb, test-ccc, test-ddd,
 test-aa, test-AA, test-ag, test-AG, test-a4, test-A4

Rebinds vars 'default values'.  Called-interactively or INSERTP non-nil insert
test-cases at point.

:EXAMPLE
\(mon-insert-test-cases)
:SEE-ALSO `mon-insert-lisp-testme'.
▶▶▶

\(fn &optional INSERTP INTRP)" t nil)

(autoload 'mon-gensym-counter-randomizer-TEST "mon-testme-utils" "\
Test function for `mon-gensym-counter-randomizer'.

Return results in buffer named \"*MON-GENSYM-COUNTER-RANDOMIZER-TEST*\".

Arg W-TEST-STR/SYM is a string or symbol to build results with.

ARG GENERATE-N-RESULTS is the number of results to generate.

:EXAMPLE

\(mon-gensym-counter-randomizer-TEST \"bubba\" 10000)

:SEE-ALSO `mon-gensym', `with-gensyms', `mon-gensym-counter-randomizer'.
▶▶▶

\(fn W-TEST-STR/SYM GENERATE-N-RESULTS)" nil nil)

(autoload 'mon-list-nshuffle-TEST "mon-testme-utils" "\
Test function for `mon-list-nshuffle'

Return results of applying `mon-list-nshuffle'W-TEST-TIMES in buffer
named \"*MON-LIST-NSHUFFLE-TEST*\"

:EXAMPLE

\(mon-list-nshuffle-TEST '(a b c d) 100)

\(mon-list-nshuffle '(\"a\" \"b\" \"c\" \"d\") 100)

:SEE-ALSO `mon-nshuffle-vector', `mon-list-shuffle-safe'.
▶▶▶

\(fn W-TEST-TIMES)" nil nil)

(autoload 'mon-line-strings-to-list-TEST "mon-testme-utils" "\
Test function for `mon-line-strings-to-list'.

:SEE-ALSO `mon-build-copyright-string-TEST', `mon-help-regexp-symbol-defs-TEST', 
`mon-help-propertize-regexp-symbol-defs-TEST', 
`mon-help-regexp-symbol-defs-TEST', `mon-help-CL-wget-pkgs-TEST', 
`mon-help-propertize-tags-TEST', `mon-insert-test-cases'.
▶▶▶

\(fn &optional WITH-CDR WITH-WRAP INSRTP)" nil nil)

(autoload 'mon-with-inhibit-buffer-read-only-PP-TEST "mon-testme-utils" "\
Test function for `mon-with-inhibit-buffer-read-only'.
:EXAMPLE

\(mon-with-inhibit-buffer-read-only-PP-TEST)

\(mon-with-inhibit-buffer-read-only-TEST t)

:SEE-ALSO `mon-with-inhibit-buffer-read-only-TEST',
`mon-build-copyright-string-TEST', `mon-help-keys-wikify-TEST',
`mon-help-propertize-regexp-symbol-defs-TEST', `mon-help-propertize-tags-TEST',
`mon-help-regexp-symbol-defs-TEST', `mon-help-CL-wget-pkgs-TEST',
`mon-inhibit-read-only-TEST', `mon-line-strings-to-list-TEST',
`mon-user-system-conditionals-TEST', `mon-wget-list-to-script-TEST'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-with-inhibit-buffer-read-only-TEST "mon-testme-utils" "\
Test function for `mon-with-inhibit-buffer-read-only'.
:EXAMPLE

\(mon-with-inhibit-buffer-read-only-TEST)

\(mon-with-inhibit-buffer-read-only-TEST t)

:SEE-ALSO `mon-with-inhibit-buffer-read-only-PP-TEST',
`mon-build-copyright-string-TEST', `mon-help-keys-wikify-TEST',
`mon-help-propertize-regexp-symbol-defs-TEST', `mon-help-propertize-tags-TEST',
`mon-help-regexp-symbol-defs-TEST', `mon-help-CL-wget-pkgs-TEST',
`mon-inhibit-read-only-TEST', `mon-line-strings-to-list-TEST',
`mon-user-system-conditionals-TEST', `mon-wget-list-to-script-TEST'.
▶▶▶

\(fn &optional W-DISPLAY-BUFFER)" nil nil)

(autoload 'mon-line-dolines-setup-TEST "mon-testme-utils" "\
Helper for `mon-line-dolines' macro's test function `mon-line-dolines-TEST'.

:SEE (URL `http://lists.gnu.org/archive/html/help-gnu-emacs/2009-12/msg00614.html')

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-line-dolines-TEST "mon-testme-utils" "\
Test function for `mon-line-dolines' macro.

Return the output of that macro as per its original intended use.

Values returned in 3 (or 4) seperate buffers named:

 \"*GOT-YEARS*\" \"*GOT-MONTHS*\" \"*GOT-DAYS*\"

When current-buffer does not have a display or is read-only return additional
details in buffer named \"*MON-LINE-DOLINES-TEST*\".

:EXAMPLE

\(mon-line-dolines-TEST)

:SEE (URL `http://lists.gnu.org/archive/html/help-gnu-emacs/2009-12/msg00614.html')

:SEE-ALSO `mon-line-dolines-setup-TEST'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-with-buffer-undo-disabled-TEST "mon-testme-utils" "\
Test function for `mon-with-buffer-undo-disabled' macro.

When optional arg FORCE-FAIL is non-nil force test failure.

:EXAMPLE

\(mon-with-buffer-undo-disabled-TEST)

\(mon-with-buffer-undo-disabled-TEST 'force-fail)

:SEE-ALSO `buffer-undo-list'.
▶▶▶

\(fn &optional FORCE-FAIL)" nil nil)

(autoload 'mon-string-split-TEST "mon-testme-utils" "\
Test function for `mon-string-split'.

:EXAMPLE

\(mon-string-split-TEST)

:SEE-ALSO .
▶▶▶

\(fn &optional W-MSG-USR)" nil nil)

(autoload 'mon-line-strings-bq-qt-sym-bol-TEST "mon-testme-utils" "\
Test function for `mon-line-strings-bq-qt-sym-bol'.

Return restults to buffer named \"*mon-line-strings-bq-qt-sym-bol-TEST*\".

:EXAMPLE

\(mon-line-strings-bq-qt-sym-bol-TEST)

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-help-CL-wget-pkgs-TEST "mon-testme-utils" "\
Helper function to verify `mon-help-CL-wget-pkgs' is functioning as expected.

Performs the following checks:

./ Writes a temp file with output from mon-help-CL-wget-pkgs;
./ Return inserted contents of temp file in a temporary buffer;
./ Display that buffer with `file-attributes' in header;
./ Kills temp-buffer and file on exit;

:EXAMPLE

\(mon-help-CL-wget-pkgs-TEST)

:NOTE On exit this function should cleanup the temp file/buffer objects below:

./ A temp file written to:
   /PATH/TO/`default-directory'/tmp-wget-YY-MM-DD

./  A temp-buffer with the name *SHOW-WGET-TEMP*.

:SEE-ALSO `mon-help-CL-pkgs', `*mon-help-CL-cmu-ai-repo*', `*mon-help-CL-ext-pkg-map*'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-build-copyright-string-TEST "mon-testme-utils" "\
Test function for `mon-build-copyright-string'.

:EXAMPLE

\(mon-build-copyright-string-TEST)

:SEE-ALSO `mon-build-copyright-string-license', `mon-build-copyright-string',
`mon-insert-gnu-licence-gfdl', `mon-insert-gnu-licence',
`mon-insert-file-template', `*mon-mit-license-header*',
`*mon-bsd-license-header*', `*mon-gnu-license-header-gfdl*',
`*mon-gnu-license-header*', `mon-build-copyright-string-TEST',
`mon-help-propertize-regexp-symbol-defs-TEST', `mon-help-propertize-tags-TEST',
`mon-help-regexp-symbol-defs-TEST', `mon-help-CL-wget-pkgs-TEST',
`mon-line-strings-to-list-TEST'.
▶▶▶

\(fn)" t nil)

(autoload 'google-define-get-command-TEST "mon-testme-utils" "\
Test function for `google-define-get-command'.

Return the raw html for the gg definition of `snarf'.
display results in buffer named \"*google-define-get-command-TEST*\"
kill the leftover buffer `*google-define-get-buffer*'.

:EXAMPLE

\(google-define-get-command-TEST)

:SEE-ALSO `google-define', `google-define-kill-def-buffers'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-permute-combine-functions-TEST "mon-testme-utils" "\
Assure functional equivalence of permute/combine functionss.

Return test-case results in buffer named \"*MON-PERMUTE-COMBINE-TEST*\".

Test equivalence of return values of following procedures:

 `mon-permute-combine', `mon-permute-combine-1', 

:EXAMPLE

\(mon-permute-combine-functions-TEST)

:SEE-ALSO `mon-list-variant-forms', `mon-list-permute-variants', `mon-list-permute-1'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-write-string-reset-bind-TEST "mon-testme-utils" "\
Test function for `mon-write-string' w/ keyword arg :RESET-BIND.

Return and display results in buffer named \"*MON-WRITE-STRING-TEST*\".

:EXAMPLE

\(mon-write-string-reset-bind-TEST)

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-region-capitalize-TEST "mon-testme-utils" "\
Test function for `mon-region-capitalize'.

:EXAMPLE

\(mon-region-capitalize-TEST)

:SEE-ALSO .

\(fn)" nil nil)

(autoload 'naf-mode-state-to-postal-TEST "mon-testme-utils" "\
Test associations forward/backward in variable `*naf-mode-state-to-postal*'.

:EXAMPLE

\(naf-mode-state-to-postal-TEST)

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-booleanp-to-binary-TEST "mon-testme-utils" "\
Test function for `mon-booleanp-to-binary'.

Returns list with format:

 (:all-tests-passed <BOOLEAN>
  (:passed <BOOLEAN> 
   :with-args ( <TEST-FNCN> <ARG-1> <ARG-2> <TEST-VALUE> )

Key :all-tests-passed is non-nil when all values of :passed are non-nil.

Key :passed is non-nil when <TEST-FNCN> passed.

Key :with-args indicates test evaulated predicate <TEST-FNCN> with results of
invoking `mon-booleanp-to-binary' with <ARG-1> <ARG-2> to satisfy <TEST-VALUE>.

:EXAMPLE

\(mon-booleanp-to-binary-TEST)

:SEE-ALSO `mon-sequence-all-booleanp-TEST'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-sequence-all-booleanp-TEST "mon-testme-utils" "\
Test function for `mon-sequence-all-booleanp'.

Key :all-tests-passed-p is non-nil if so.

When optional arg W-DISPLAY-BUFFER is non-nil return and display results in
buffer with name \"*MON-SEQUENCE-ALL-BOOLEANP-TEST*\"

:EXAMPLE

\(mon-sequence-all-booleanp-TEST t)

:SEE-ALSO `mon-booleanp-to-binary-TEST'.
▶▶▶

\(fn &optional W-DISPLAY-BUFFER)" nil nil)

(autoload 'mon-string-or-null-and-zerop-TEST "mon-testme-utils" "\
Test function for `mon-string-or-null-and-zerop'.

Tests evauluation with args as:

 - zero length string 
 - string with length not `zerop'
 - null value -- :NOTE There is not a way to verify an emtpy list, so doesn't.
 - integer 0  -- Fails successfully

Return value has the format:

\(:all-tests-passed-p <BOOLEAN> 
  (:test-passed-p <BOOLEAN> :w-sym <LOCAL-SYM> :w-arg <ARG-EVALUATED>)* ... )

Key :all-tests-passed-p is non-nil if all tests succeeded.

Key :test-passed-p is non-nil if individual test suceeded.
 
:EXAMPLE

\(mon-string-or-null-and-zerop-TEST)

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-error-protect-PP-EXPAND-TEST "mon-testme-utils" "\
Debugging function for macro `mon-error-protect'.

Return and display results to buffer named \"*PP-EXPAND-ALL*\"
:NOTE Not actually a test.

:SEE-ALSO .
▶▶▶

\(fn EXPAND-FORM)" nil nil)

(autoload 'mon-line-string-rotate-name-TEST "mon-testme-utils" "\
Test function for `mon-line-string-rotate-name'.

Key :all-tests-passed is non-nil if so.

:EXAMPLE

\(mon-line-string-rotate-name-TEST)

\(and (cadr (memq :all-tests-passed (mon-line-string-rotate-name-TEST))))

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-line-indent-from-to-col-TEST "mon-testme-utils" "\
Test function for `mon-line-indent-from-to-col'.

Key :all-tests-passed is non-nil if so.

:EXAMPLE

\(mon-line-indent-from-to-col-TEST)

\(and (cadr (memq :all-tests-passed (mon-line-indent-from-to-col-TEST))))

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-line-strings-pipe-to-col-TEST "mon-testme-utils" "\
Test function for `mon-line-strings-pipe-to-col'.

Key :all-tests-passed-p is non-nil if so.

:EXAMPLE

\(mon-line-strings-pipe-to-col-TEST)

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-line-string-insert-chars-under-TEST "mon-testme-utils" "\
Test function for `mon-line-string-insert-chars-under'.

Key :all-tests-passed-p is non-nil if so.

:EXAMPLE

\(mon-line-string-insert-chars-under-TEST)

:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-list-reorder-TEST "mon-testme-utils" "\
Test function for `mon-list-reorder'.

Key :all-tests-passed-p is non-nil if so.

:EXAMPLE

\(mon-list-reorder-TEST)

\(let ((gbc (get-buffer-create \"*mon-list-reorder-TEST*\")))
  (with-current-buffer gbc (erase-buffer))
  (pp-display-expression (mon-list-reorder-TEST)  (buffer-name gbc)))

:SEE-ALSO `%mon-list-reorder'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-regexp-clean-ulan-dispatch-chars-TEST "mon-testme-utils" "\
Test function for variable `*regexp-clean-ulan-dispatch-chars*'.

When optional arg KYWD-STR is non-nil it is a regexp to which should
satisfy the predicate `string-match-p' with the the car of a sublist
in `*regexp-clean-ulan-dispatch-chars*'.  Default is:

 \".*:TEACHER-OF\"

When optional arg NDL-STR is non-nil it is a string to search for.
Default is as follows (not there are two trailing spaces after \"Eman\":

 \":TEACHER-OF Ivory, Percy van Eman  
 (American painter and illustrator, 1883-1960) [500105044]\"

When KYWD-STR is non-ni and NDL-STR is ommitted signal an error.

When KYWD-STR is ommitted and NDL-STR is non-nil use NDL-STR's default.

When a match is made return value is a plist of the form:

 (:w-replace \"<STRING-AFTER-REPLACEMENT>\"
  :w-match   \"<STRING-THAT-MATCHED>\"
  :w-regexp  \"<REGEXP-THAT-MATCHED>\"
  :w-groups  \"<REGEXP-REPLACEMENT-MATCH-GROUPS>\")

:EXAMPLE

\(mon-regexp-clean-ulan-dispatch-chars-TEST)

\(mon-regexp-clean-ulan-dispatch-chars-TEST
 \".*:GRANDPARENT-WAS\"
 (concat
 \":GRANDPARENT-WAS Van-Winkle, Pappy von  \"
 \"(Dutch painter and illustrator, 1800-1903) [500000010]\"))

:USED-IN `naf-mode'.

:SEE-ALSO `mon-cln-ulan'.
▶▶▶

\(fn &optional KYWD-STR NDL-STR)" nil nil)

(autoload 'mon-set-buffer-substring-no-properties-TEST "mon-testme-utils" "\
Test function for `%mon-set-buffer-substring-no-properties', `%mon-set-buffer-substring'
Which in turn are requirements to make `buffer-substring-no-properties' `setf'able.
:EXAMPLE

\(mon-set-buffer-substring-no-properties-TEST)
:SEE-ALSO .
▶▶▶

\(fn)" nil nil)

(autoload 'mon-plist-keys-TEST "mon-testme-utils" "\
Test function for `mon-plist-keys'.

:EXAMPLE

\(mon-plist-keys-TEST)
:SEE-ALSO `mon-plist-values-TEST'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-plist-values-TEST "mon-testme-utils" "\
Test function for `mon-plist-values'
Keyword :all-tests-passed is non-nil if so.

:EXAMPLE

\(mon-plist-values-TEST)

:SEE-ALSO `mon-plist-keys-TEST'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-help-propertize-regexp-symbol-defs-TEST "mon-testme-utils" "\
Helper function for `mon-help-regexp-symbol-defs-TEST'.

Propertize symbols matched by regexp `*regexp-symbol-defs*'.

:SEE-ALSO `mon-help-overlay-result'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-help-regexp-symbol-defs-TEST "mon-testme-utils" "\
Return overlays for matches of regexp in region.

When optional arg DIS-P is non-nil or when called-interactively return formatted
results to the buffer named *REGEXP-SYMBOL-DEFS-REPORT*.

When optional arg DO-BIG-REGEXP is non-nil use regexps in the 
variable `*regexp-symbol-defs-big*'. Default is `*regexp-symbol-defs*'.

:EXAMPLE

\(mon-help-regexp-symbol-defs-TEST t)

\(mon-help-regexp-symbol-defs-TEST t t)

▶
\(defun some-function (&optional optional)
\(defvar som-bq-list `(
\(defun some-function-22 (&optional optional)
\(defvar som-var t
\(defun *some/-symbol:->name<-2* (somevar
\(defmacro some-macro ()
\(defvaralias 'som-var 'som-other-var
\(defmacro some-macro*:22 (&rest)
\(defvar som-double-list ((
\(defun *some/-symbol:->name<-2* (somevar
\(defvar *some-var* 'var
\(defun *some/-symbol:->name<-2* 'somevar
\(defconst som-const \"somestringval\"
\(defun* *some/-symbol:->name<-2* (&
\(defmacro some-macro*:22 (&rest)
\(defun *some/-symbol:->name<-2* (somevar
\(defvar *some-var* 'var
\(defun *some/-symbol:->name<-2* 'somevar
\(defmacro some-macro ()
\(defvar *som-var* nil
\(defmacro* some-macro*:22 (&rest)
\(defcustom reb-re-syntax 'read
\(defun* *some/-symbol:->name<-2* (somevar
\(defsubst *some/subtst-symbol:->name<-2* (
\(defface *some/-symbol:->name<-2* ((
\(defsubst* *some/subtst-symbol:->name<-2* (
\(defcustom *some/-custom-symbol:->name<-2* 'somecustom
\(defconst *some/-symbol:->name<-2* (someconst
\(defface *some/-face-symbol:->name<-2* (someface
\(defgroup *some/-group-symbol:->name<-2* (somegroup
\(deftheme *some/-theme-symbol:->name<-2* (sometheme
◀

:SEE-ALSO `mon-help-propertize-regexp-symbol-defs-TEST', `mon-help-overlay-result'
`lisp-font-lock-keywords', `lisp-font-lock-keywords-1', `lisp-font-lock-keywords-2'.
▶▶▶

\(fn &optional DIS-P DO-BIG-REGEXP)" t nil)

(autoload 'mon-help-propertize-tags-TEST "mon-testme-utils" "\
Test function to verify that `mon-help-propertize-tags' is properly
propertizing.

:EXAMPLE

\(mon-help-propertize-tags-TEST)

Test the following regexps:
`*regexp-mon-doc-help-comment-tags*'
`*regexp-mon-doc-help-docstring-tags*'
`*regexp-mon-doc-help-meta-tags*'
`*regexp-mon-doc-help-pointer-tags*'
`*regexp-mon-doc-help-docstring-tags-URL*'
`*regexp-mon-doc-help-docstring-tags-DYNAMIC*'
`*regexp-mon-doc-help-docstring-tags-TABLES*'
`*regexp-mon-doc-help-docstring-tags-URL*'
`*regexp-mon-doc-help-builtin-dynamic-tags*'
`*regexp-mon-doc-help-builtin-static-tags*'

Test the following keywords in:
`*mon-help-mon-tags-alist*', `*mon-help-custom-faces-builtins-tags*'

Test font-locking of the following faces:
`mon-help-URL-wrap-tag', `mon-help-DYNATAB-tag', `mon-help-INNER-KEY-tag',
`mon-help-KEY-tag', `mon-help-META-tag', `mon-help-PNTR-tag',
`mon-help-COMMENT-tag', `mon-help-BUILTIN-tag'

:SEE-ALSO `mon-help-mon-tags', `mon-help-insert-tags'.
n▶▶▶

\(fn)" nil nil)

(autoload 'mon-help-keys-wikify-TEST "mon-testme-utils" "\
Test function for `mon-help-keys-wikify' helper functions.

Return cumulative result of evaluating:
 `mon-help-keys-wikify', `mon-help-keys-wikify-anchors'
 `mon-help-keys-wikify-heading'

Return value displayed in buffer named *MON-HELP-KEYS-WIKIFY-TEST*.

:SEE `mon-help-keys-wikify' for details of return value format.

:EXAMPLE

\(mon-help-keys-wikify-TEST)

:SEE-ALSO `*mon-help-reference-keywords*', `mon-help-keys',
`mon-help-escape-for-ewiki', `mon-help-unescape-for-ewiki', 
`mon-help-key-functions'.
▶▶▶

\(fn)" nil nil)

(autoload 'mon-drive-transfer-template-TEST "mon-testme-utils" "\
Test function for `mon-drive-transfer-template-cln'.

Return results in new buffer-name'd \"*MON-DRIVE-TRANSFER-CLN-TEST*\".
When optional arg LOG-DEST-TEST is non-nil return results of evaluating
`mon-drive-transfer-template-cln-log-dest' instead.

:SEE-ALSO `mon-drive-transfer-template-cln-all',
`mon-insert-drive-transfer-template', `*mon-drive-transfer-template*',
`*mon-drive-transfer-template-src-dest-log*',
`mon-drive-transfer-template-subst-src-dest-log'.
▶▶▶

\(fn &optional LOG-DEST-TEST)" nil nil)

(autoload 'mon-build-mon-emacsd-example "mon-testme-utils" "\
Return an alist of example key value pairs suitable for `*mon-emacsd*'.

When `bind-var' is non-nil if `*mon-emacsd*' is unbound bind it.

When `force-bind' is non-nil force the binding even if `*mon-emacsd*' bound.

:EXAMPLE

\(mon-build-mon-emacsd-example)

\(assoc 1 (mon-build-mon-emacsd-example))

\(nth 8 (assoc 1 (mon-build-mon-emacsd-example)))

\(assoc 5 (mon-build-mon-emacsd-example))

\(assoc 'IS-USER-4-P (cadr (assoc 5 (mon-build-mon-emacsd-example))))

\(assoc (cadr (nth 3 (cadr (assoc 5 (mon-build-mon-emacsd-example)))))

   (mon-build-mon-emacsd-example))


:SEE-ALSO `mon-get-mon-emacsd-paths', `mon-build-misc-path-example'.
`mon-build-user-name-example', `*mon-emacsd*', `set-emacs-root'.
▶▶▶

\(fn &optional BIND-VAR FORCE-BIND)" nil nil)

(autoload 'mon-build-misc-path-example "mon-testme-utils" "\
Return pre-formattedkey value pairs for use with `*mon-misc-path-alist*'.

When `bind-var' is non-nil if `*mon-misc-path-alist*' is unbound, bind it with
return value.

When `force-bind' is non-nil force the binding even if `*mon-misc-path-alist*'
is already bound.

:EXAMPLE

\(mon-build-misc-path-example)

\(assoc 'the-1-path (mon-build-misc-path-example))

\(assoc 'the-emacs-vars (mon-build-misc-path-example))

\(nth 3 (assoc 'the-sub (mon-build-misc-path-example)))

:SEE-ALSO `mon-get-mon-emacsd-paths', `mon-build-mon-emacsd-example',
`mon-build-user-name-example', `mon-get-env-vars-emacs', 
`mon-get-env-vars-symbols', `mon-get-env-vars-strings'.
▶▶▶

\(fn &optional BIND-VAR FORCE-BIND)" nil nil)

(autoload 'mon-build-user-name-example "mon-testme-utils" "\
Return pre-formatted list of username  pairs for use with mon packages.

`*BUG-NAME*', `*MON-NAME*', `*MON-ORG-NAME*', etc.
When `bind-var' is non-nil if `' is unbound bind it.

When `force-bind' is non-nil force the binding even if `' bound.

Elements of the list might have a form such as this:
\((1 \"Short-First Last\")
 (2 \"First\") (3 \"FML\") 
 (4 \"Full-First Last\") 
 (5 \"fl\") 
 (6 \"MONIKER NAME\") 
 (7 \"MONIKER\") 
 (8 \"MONIKER_NAME\") 
 (9 \"moniker_name\"))

:EXAMPLE

\(mon-build-user-name-example 5)

\(mon-build-user-name-example-TEST)
:SEE-ALSO `mon-build-user-name-example-TEST', `mon-get-mon-emacsd-paths',
`mon-build-misc-path-example' `mon-build-mon-emacsd-example'.
▶▶▶

\(fn NAME-COUNT &optional W-THIS-VAR BIND-VAR FORCE-BIND)" nil nil)

(autoload 'mon-user-system-conditionals-TEST "mon-testme-utils" "\
Test function for `mon-user-name-conditionals' and `mon-system-type-conditionals'.

Return pp'ed results to buffer named \"*MON-USR/SYS-COND-TESTS*\".
When rest args USER-SYSTEM-TEST-WITH are supplied these are additional username
system-type tests to be performed.

Each USER-SYSTEM-TEST-WITH is quoted list of the form:

 (<LIST-KEY> <NAME-PROP> <SYSTEM-TYPE> <USER-NAME>)

For example:

 '(:W32-THIS-USER :W-REAL-USER windows-nt \"i-am-w32-username\")
 '(:GNU-THIS-USER :W-REAL-USER gnu/linux \"i-am-gnu-username\"))

:EXAMPLE

\(mon-user-system-conditionals-TEST
 '(:W32-THIS-USER :W-REAL-USER windows-nt \"i-am-w32-username\")
 '(:GNU-THIS-USER :W-REAL-USER gnu/linux \"i-am-gnu-username\")
 '(:DARWIN-THIS-USER :DARWIN-REAL-USER darwin \"i-am-darwin-username\")
 '(:CYGWIN-THIS-USER :CYGWIN-REAL-USER cygwin \"i-am-cygwin-username\")  
 '(:MSDOS-THIS-USER :MSDOS-REAL-USER  ms-dos \"i-am-msdos-username\"))

:SEE-ALSO `mon-build-copyright-string-TEST',
`mon-help-propertize-regexp-symbol-defs-TEST', `mon-help-propertize-tags-TEST',
`mon-help-regexp-symbol-defs-TEST', `mon-help-CL-wget-pkgs-TEST',
`mon-wget-list-to-script-TEST', `mon-line-strings-to-list-TEST',
`mon-help-keys-wikify-TEST', `mon-insert-lisp-testme-fancy',
`mon-insert-lisp-testme', `mon-insert-test-cases'.
▶▶▶

\(fn &rest USER-SYSTEM-TEST-WITH)" nil nil)

(autoload 'mon-build-user-name-example-TEST "mon-testme-utils" "\
Test function for `mon-build-user-name-example'.

Return value displayed in buffer \"*MON-BUILD-USER-NAME-EXAMPLE-TEST*\".

:SEE-ALSO `mon-user-name-conditionals',`mon-system-type-conditionals'.
▶▶▶

\(fn)" nil nil)

;;;***

;;;### (autoloads (calendar-goto-doomsday) "mon-time-utils" "mon-time-utils.el"
;;;;;;  "7c4dd5599b4881c6fd9987e2f3c4dfa5")
;;; Generated autoloads from mon-time-utils.el

(autoload 'calendar-goto-doomsday "mon-time-utils" "\
Reposition calendar window to next known doomsday warn of pending doom.

\(fn)" t nil)

;;;***

;;;### (autoloads (mon-load-or-alert mon-compile-when-needed mon-byte-compile-and-load
;;;;;;  mon-dump-object-to-file mon-unbind-variable mon-unbind-command
;;;;;;  mon-unbind-function mon-unbind-symbol mon-unbind-defun) "mon-utils"
;;;;;;  "mon-utils.el" "67a599e481cde2ddfedfe488ed33ef95")
;;; Generated autoloads from mon-utils.el

(autoload 'mon-unbind-defun "mon-utils" "\
Unbind the `defun' near `point' in `current-buffer'.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-compile-when-needed' `mon-load-or-alert',
`mon-byte-compile-and-load', `mon-dump-object-to-file', `mon-nuke-and-eval',
`mon-after-mon-utils-loadtime'.
▶▶▶

\(fn)" t nil)

(autoload 'mon-unbind-symbol "mon-utils" "\
Totally unbind SYMBOL.

Includes unbinding function binding, variable binding, and property list.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn SYMBOL)" t nil)

(autoload 'mon-unbind-function "mon-utils" "\
Remove the function binding of FNCN-SYMBOL.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn FNCN-SYMBOL)" t nil)

(autoload 'mon-unbind-command "mon-utils" "\
Remove the command binding of CMD-SYMBOL.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn CMD-SYMBOL)" t nil)

(autoload 'mon-unbind-variable "mon-utils" "\
Remove the variable binding of VAR-SYMBOL.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn VAR-SYMBOL)" t nil)

(autoload 'mon-dump-object-to-file "mon-utils" "\
Save symbol object OBJ to the byte compiled version of FILE.

OBJ can be any lisp object, list, hash-table, etc.
FILE is an elisp file with ext *.el.
Loading the *.elc file will re-institute object.

:NOTE This function utilizes an documented feature of `eval-when-compile'. It
can be interesting way to save a persistent elisp object. Using `setf' combined
with `eval-when-compile' is a convenient way to save lisp objects like
hash-table.
:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn OBJ FILE)" nil nil)

(autoload 'mon-byte-compile-and-load "mon-utils" "\
Byte compile and load the current .el file.

The function `byte-compile-file' was only easily accesible from the menu.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn)" t nil)

(autoload 'mon-compile-when-needed "mon-utils" "\
Compile the given file with COMP-FNAME only if needed.

Add .el if required, and use `load-path' to find it.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn COMP-FNAME)" nil nil)

(autoload 'mon-load-or-alert "mon-utils" "\
Try to load the specified file LIB-NAME.

When optional arg COMPILE-WHEN-NEEDED `mon-compile-when-needed' the file
LIB-NAME first. Insert a warning message in a load-warning buffer in case of
failure.

:SEE-ALSO `mon-unbind-command', `mon-unbind-symbol', `mon-unbind-function',
`mon-unbind-variable', `mon-unbind-defun', `mon-compile-when-needed',
`mon-load-or-alert', `mon-byte-compile-and-load', `mon-dump-object-to-file',
`mon-nuke-and-eval', `mon-after-mon-utils-loadtime'.
▶▶▶

\(fn LIB-NAME &optional COMPILE-WHEN-NEEDED)" nil nil)

;;;***


;;; ==============================
(provide 'mon-loaddefs)
;;; ==============================


;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:

;;; ==============================
;;; mon-loaddefs.el ends here
;;; EOF
