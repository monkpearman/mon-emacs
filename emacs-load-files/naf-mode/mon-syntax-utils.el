;; -*-no-byte-compile: t; -*-
;;; :FILE-CREATED <Timestamp: #{2010-03-02T15:08:59-05:00Z}#{10092} - by MON KEY>
;;; :FILE emacs-load-files/naf-mode/mon-syntax-utils.el
;;; ==============================


;; (let (comp-w)
;;   (setq comp-w (mon-get-text-properties-region (buffer-end 0) (buffer-end 1)))
;;   (princ (cadr comp-w) (get-buffer-create "*MGTPFES-COMP*")))
;;
;; (let* ((comp-w (mon-get-text-properties-region (buffer-end 0) (buffer-end 1)))
;;        (comp-tl (cadr comp-w)))
;;   (setq comp-w (mon-get-text-properties-parse-sym 'face 'font-lock-constant-face comp-tl))
;;   (princ comp-w (get-buffer-create "*MGTPFES-COMP*")))
;;
;; (mon-get-text-properties-parse-sym face font-lock-constant-face 'comp-tl)      


;;
;; jit-lock-after-change-extend-region-functions
;; jit-lock-chunk-size
;; jit-lock-context-time
;; jit-lock-context-timer
;; jit-lock-context-unfontify-pos
;; jit-lock-contextually
;; jit-lock-defer-buffers
;; jit-lock-defer-contextually
;; jit-lock-defer-time
;; jit-lock-defer-timer
;; jit-lock-functions
;; jit-lock-mode
;; jit-lock-stealth-buffers
;; jit-lock-stealth-load
;; jit-lock-stealth-nice
;; jit-lock-stealth-repeat-timer
;; jit-lock-stealth-time
;; jit-lock-stealth-timer
;; jit-lock-stealth-verbose
      ;; (let ((jit-lock-chunk-size (buffer-size)))
      ;;   (font-lock-fontify-buffer)
      ;;   (font-lock-fontify-syntactically-region  (buffer-end 0) (buffer-end 1)))
      ;;(save-excursion (goto-char (buffer-end 0)) (goto-char (buffer-end 1))))
      ;; (unless (<= (buffer-size) 500)
        ;;   (let ((jit-bs (/ (buffer-size) jit-lock-chunk-size))
        ;;         (jlcs jit-lock-chunk-size)))
        ;;     (save-excursion (goto-char (buffer-end 0))
        ;;  (dotimes (i (1- jit-bs))
        ;;    (


;;; ==============================
;;; (insert *mon-help-reference-keys*)
;;; (prin1 *mon-help-reference-keys* (current-buffer))


;; (setq tt--mgtpr (buffer-end 0) (buffer-end 1))
;; (substring tt--mgtpr 15925 15937)


;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-08T18:34:53-05:00Z}#{10101} - by MON KEY>
(defun mon-read-unreadable-object (obj)
  "
Hash notation cannot be read at all, so the Lisp reader signals the
error `invalid-read-syntax' whenever it encounters `#<'.  
:SEE info node `(elisp)Printed Representation'

This happens with (at least):
`current-buffer'               -> #<buffer *This-Buffer*>
`make-marker'                  -> #<marker *>
`current-frame-configuration'  -> #<frame emacs@some-user 0x4436300>
                                  #<window *>
`current-window-configuration' -> #<window-configuration>
 -> #<subr car>
`match-string'                 -> `#('

This variable `read-symbol-positions-list' is modified during calls to `read' or
`read-from-string', but only when `read-with-symbol-positions' is non-nil.
:SEE-ALSO `mon-string-read-match-string'.\n▶▶▶"
  (let ((unrdbl
         (regexp-opt
          '("#<buffer"               ;; :<buffer
            "#<frame"                ;; :<frame
            "#<window"               ;; :<window
            "#<marker"               ;; :<marker
            "#<subr"                 ;; :<subr
            "#<window-configuration" ;;":<window-configuration"
            ;;"#(" <- `match-string', etc.
            ))))
    (setq unrdbl (concat unrdbl "\\(.*\\)>")))
  ;;{ .... }
  )

;; `mon-string-read-match-string'

;;; ==============================
;; :NOTE To make the printed representation match the symbol-bound string.
;;; map 1+ the head/tail of idx's in list with 
;;; `mon-get-text-properties-map-ranges-compensate'
;;;
;;; take an optional arg to read a string instead.
;;;
;;; :CREATED <Timestamp: #{2010-03-05T17:35:32-05:00Z}#{10095} - by MON KEY>
;; (defun mon-get-text-properties-region (start end &optional tp-buff intrp) ;; :WAS(start end intrp)
;;   "Return region as a two elt list string and strings text properties.\n
;; :EXAMPLE\n\n\(let \(\(bubbas-buffer \(get-buffer-create \"*BUBBA*\"\)\)\)
;;   \(unwind-protect
;;        \(with-current-buffer bubbas-buffer
;;          \(prin1 *mon-help-reference-keys* \(current-buffer\)\)
;;          \(emacs-lisp-mode\)
;;          \(apply 'mon-get-text-properties-region \(buffer-end 0\) \(buffer-end 1\) 
;;                 \(list \"*NEW-BUBBA*\" t\)\)\)
;;     \(kill-buffer \(get-buffer bubbas-buffer\)\)\)\)\n
;; \(mon-get-text-properties-region \(buffer-end 0\) \(buffer-end 1\)\)\n
;; :NOTE Indexes are into string not buffer as with return value of:
;;  `mon-get-text-properties-print' & `mon-get-text-properties-read-temp'\n
;; :SEE-ALSO `mon-get-text-properties-region-to-kill-ring'.\n▶▶▶"
;;   ;; :WAS (interactive "r\np")
;;   (interactive "r\nsBuffer name for output: \np")
;;   (let (get-str nw-tl to-bfr this-bfr)
;;     (with-current-buffer (current-buffer)
;;       (when jit-lock-mode (jit-lock-fontify-now (buffer-end 0) (buffer-end 1)))
;;       (setq this-bfr (buffer-name (current-buffer))))
;;     (setq get-str (format "%S" (buffer-substring start end)))
;;     (setq get-str (substring get-str 1))
;;     ;;(setq get-str (substring (format "%S" (buffer-substring start end)) 1))
;;     (setq get-str (car (read-from-string get-str)))
;;     (setq get-str `(,(car get-str) ,(cdr get-str)))
;;     (setq nw-tl (substring (format "%S" (cdr get-str)) 1 -1))
;;     (setq nw-tl (replace-regexp-in-string " ?\\([0-9]+ [0-9]+\\( (\\)\\)" ")(\\1" nw-tl t))
;;     (setq nw-tl (substring nw-tl 1))
;;     (setq nw-tl (concat "(" (substring nw-tl 1) ")"))
;;     (setq nw-tl (list (car (read-from-string nw-tl))))
;;     (setcdr get-str nw-tl)
;;     ;;get-str))
;;     ;;
;;     (cond ((or tp-buff intrp)
;;            (setq to-bfr 
;;                  (if (get-buffer tp-buff)
;;                      `(,(get-buffer tp-buff) . t) 
;;                      (if (not intrp)
;;                          (error ;; won't create the buffer here.
;;                           ":FUNCTION `mon-get-text-properties-region' - buffer TP-BUFF does not exist")
;;                          `(,(get-buffer-create tp-buff)))))
;;            (let* ((semic-shrt (make-string 22 59))
;;                   (semic-long (concat "\n" semic-shrt semic-shrt semic-shrt ";;\n"))
;;                   (semi-btp 
;;                    (concat semic-long semic-shrt " :BEGIN-TEXT-PROPERTIES " semic-shrt semic-long
;;                            ";; :IN-BUFFER " this-bfr semic-shrt "\n")))
;;              (if intrp            
;;                  (with-current-buffer (car to-bfr) 
;;                    (when (and (cdr to-bfr)
;;                               (yes-or-no-p 
;;                                (format 
;;                                 "Buffer %s already exists erase exting contents :"
;;                                 (buffer-name (car to-bfr)))))
;;                      (erase-buffer))
;;                    (save-excursion
;;                      (princ (car get-str) (current-buffer))
;;                      (insert semi-btp)
;;                      (princ (pp-to-string  (cadr get-str)) (current-buffer)))
;;                    (emacs-lisp-mode)
;;                    (display-buffer (current-buffer) t))
;;                  (progn
;;                    (princ (car get-str) (car to-bfr))
;;                    (princ semi-btp (car to-bfr))
;;                    (princ (pp-to-string  (cadr get-str)) (car to-bfr))))))
;;           (t get-str))))
;;
;;; Following is quivalent to an interactive call.
;;; :TEST-ME 
;;; (let ((bubbas-buffer (get-buffer-create "*BUBBA*")))
;;;   (unwind-protect
;;;        (with-current-buffer bubbas-buffer
;;;          (prin1 *mon-help-reference-keys* (current-buffer))
;;;          (emacs-lisp-mode)
;;;          (apply 'mon-get-text-properties-region (buffer-end 0) (buffer-end 1) 
;;;                 (list "*NEW-BUBBA*" t)))
;;;     (kill-buffer (get-buffer bubbas-buffer))))
;;;
;;; :TEST-ME (mon-get-text-properties-region (buffer-end 0) (buffer-end 1)
;;;               (get-buffer-create "*SOME-TEST-BUFF*"))
;;;
;;; :TEST-ME (prin1 (mon-get-text-properties-region (buffer-end 0) (buffer-end 1)) 
;;;                    (get-buffer-create "*SOME-TEST-BUFF*"))
;;;;;;;;;;;;
;; :TEST-ME 
;; (let ((bubbas-buffer (get-buffer-create "*BUBBA*")))
;;   (unwind-protect
;;        (with-current-buffer bubbas-buffer
;;          (prin1 *mon-help-reference-keys* (current-buffer))
;;          (emacs-lisp-mode)
;;          (apply 'mon-get-text-properties-region (buffer-end 0) (buffer-end 1) 
;;                 (list "*NEW-BUBBA*" t)))
;;     (kill-buffer (get-buffer bubbas-buffer))))
;;
;; (prin1 *mon-help-reference-keys* (current-buffer))
;; (mon-get-text-properties-region (buffer-end 0) (buffer-end 1))
;; (mon-get-text-properties-region (buffer-end 0) (buffer-end 1))
;;
;; :TEST-ME 
;; (mon-get-text-properties-region (buffer-end 0) (buffer-end 1))
;;                                 (get-buffer-create "*SOME-TEST-BUFF*"))
;;
;; :TEST-ME 
;; (prin1 (mon-get-text-properties-region (buffer-end 0) (buffer-end 1)) 
;;        (get-buffer-create "*SOME-TEST-BUFF*"))
;;
;; (setq tt--mgafpc
;;       (substring (format "%S" (buffer-substring start end)) 1))
;;     (setq get-str (car (read-from-string get-str)))
;;;;;;;;;

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:08:34-05:00Z}#{10093} - by MON KEY>
;; (defun mon-get-text-properties-print (start end tp-buff) ;;:WAS (start end tp-buff &optional intrp)
;;   "Return buffer-string START END with text-properties.\n
;; TP-BUFF is a buffer name to print to as with prin1.\n
;; When called-interactively insert at point. Moves point.
;; :SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
;; `mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
;; `mon-get-text-properties-elisp-string-pp',
;; `mon-get-text-properties-region-to-kill-ring'.\n▶▶▶"
;;   (interactive "r\ni\np")
;;   (let* (mgtpfs-get
;;          (standard-output mgtpfs-get)
;;          mgtpfs)
;;     (setq mgtpfs (buffer-substring start end))
;;     (setq mgtpfs-get (prin1 mgtpfs mgtpfs-get))
;;     ;; :WAS  (if intrp 
;;     ;;        (prin1 mgtpfs-get (current-buffer))
;;     ;;        (prin1 mgtpfs-get tp-buff))))
;;     (cond (intrp 
;;            (goto-char end)
;;            (prin1 mgtpfs-get (current-buffer)))
;;           (tp-buff 
;;            (let ((gb (get-buffer tp-buff)))
;;              (if gb (prin1 mgtpfs-get gb))))
;;           (t mgtpfs-get))))
;;
;;; (mon-get-text-properties-print (buffer-end 0) (buffer-end 1) )
;;; (mon-get-text-properties-print (buffer-end 0) (buffer-end 1) nil t)
;;; (mon-get-text-properties-print (buffer-end 0) (buffer-end 1) )
           
;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:08:44-05:00Z}#{10093} - by MON KEY>
;; (defun mon-get-text-properties-read-temp (&optional tp-buff)
;;   "Read list from `mon-get-text-properties-print' and strip leading #.\n
;; The car of return value is a new list formulated as with `read-from-string'.
;; The cdr is a list of index pairs and text-propery prop/val pairs e.g.:\n
;;  \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)
;;   ;; { ... lots more here ... } 
;;   idx3 idx4 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)\n
;; When non-nil optional arg TP-BUFF names a buffer as required by
;; `mon-get-text-properties-elisp-string'.\n
;; :SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
;; `mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
;; `mon-get-text-properties-elisp-string-pp'.▶▶▶"
;;   (let ((mgtprt-new 
;;          (if tp-buff tp-buff 
;;              (get-buffer-create "*MGTPRT-NEW*")))
;;         re-str 
;;         str-props)
;;     (with-current-buffer mgtprt-new
;;       (goto-char (buffer-end 0))
;;       (delete-char 1)
;;       (setq re-str (read-from-string (car (sexp-at-point))))
;;       (setq str-props (cdr (sexp-at-point)))
;;       (setq re-str `(,re-str ,str-props)))
;;     (unless tp-buff (kill-buffer mgtprt-new))
;;     re-str))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:07:17-05:00Z}#{10093} - by MON KEY>
;; (defun mon-get-text-properties-elisp-string-pp (syn-list split-buff)
;;   "Pretty print the string and text property list extracted with
;; `mon-get-text-properties-elisp-string'.\n
;; :SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
;; `mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string'.\n▶▶▶"
;;   (let* ((mgppespp-split (buffer-name split-buff))
;;          (mgppespp-buf2
;;           (concat 
;;            (substring mgppespp-split 0 (1- (length mgppespp-split))) "-STRING*")) 
;;          (mgppespp-syn-list
;;           (concat "(" 
;;                   (replace-regexp-in-string ") " ")) (" 
;;                                             (format "%S" (cadr syn-list)))
;;                ")"))
;;          chck-syn-list)
;;     (with-temp-buffer 
;;       (princ mgppespp-syn-list (current-buffer))
;;       (pp-buffer)
;;       (setq mgppespp-syn-list 
;;             (buffer-substring-no-properties (buffer-end 0) (buffer-end 1))))
;;     (with-current-buffer split-buff
;;       (erase-buffer)
;;       (save-excursion (princ mgppespp-syn-list (current-buffer)))
;;       (princ (format ";; :IN-BUFFER %s\n;;\n" mgppespp-buf2) (current-buffer))
;;       (emacs-lisp-mode))
;;     ;; (mon-get-all-face-property-change 'font-lock-constant-face (buffer-end 0))
;;     (get-buffer-create mgppespp-buf2)
;;     (with-current-buffer mgppespp-buf2
;;       (prin1 (caar syn-list) (current-buffer))
;;        (emacs-lisp-mode))
;;     (display-buffer split-buff t)
;;     (display-buffer mgppespp-buf2 t)))
    

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T20:07:24-05:00Z}#{10093} - by MON KEY>
;; (defun mon-get-text-properties-elisp-string (&optional some-el-string)
;;   "Extract the text properties from the elisp SOME-EL-STRING.\n
;; :EXAMPLE\n\n\(mon-get-text-properties-elisp-string
;;  \(documentation 'mon-help-mon-help\)\)\n
;; \(mon-get-text-properties-elisp-string *mon-help-reference-keys*\)\n
;; :SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
;; `mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
;; `mon-get-text-properties-elisp-string-pp'.
;; ▶▶▶"
;;   (let ((mgtpfes-buf (get-buffer-create "*MGTPFES*"))
;;         mgtpes-buf2
;;         mgtpfes-rd)
;;     (unless (stringp some-el-string)
;;       (error 
;;        ":FUNCTION `mon-get-text-properties-elisp-string' - arg SOME-EL-STRING is not"))
;;     (with-current-buffer mgtpfes-buf (erase-buffer))
;;     (with-temp-buffer 
;;       (save-excursion (print some-el-string (current-buffer)))
;;     (emacs-lisp-mode)
;;     (font-lock-fontify-syntactically-region  (buffer-end 0) (buffer-end 1))
;;     (font-lock-fontify-buffer)
;;     ;; (current-buffer)
;;     (mon-get-text-properties-print (buffer-end 0) (buffer-end 1) mgtpfes-buf))
;;     ;; (substring mgtpfes-buf 0 (1- (length mgtpfes-buf))) "-STRING*"))
;;     (setq mgtpfes-rd (mon-get-text-properties-read-temp mgtpfes-buf))
;;     (mon-get-text-properties-elisp-string-pp mgtpfes-rd mgtpfes-buf)))
;;
;;; :TEST-ME (mon-get-text-properties-elisp-string *mon-help-reference-keys*)
;;; :TEST-ME (mon-get-text-properties-elisp-string (documentation 'mon-help-mon-help))

;;; ==============================
;;; !!! VERSION2
(defun mon-get-text-properties-elisp-string2 (some-el-string )
  "Extract the text properties from the elisp SOME-EL-STRING.\n
:EXAMPLE\n\n\(mon-get-text-properties-elisp-string
 \(documentation 'mon-help-mon-help\)\)\n
\(mon-get-text-properties-elisp-string *mon-help-reference-keys*\)\n
:SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-print',
`mon-get-text-properties-read-temp', `mon-get-text-properties-elisp-string',
`mon-get-text-properties-elisp-string-pp'.
▶▶▶"
  (let ((mgtpfes-buf (get-buffer-create "*MGTPFES*"))
        mgtpes-buf2
        mgtpfes-rd)
    (unless (stringp some-el-string)
      (error 
       ":FUNCTION `mon-get-text-properties-elisp-string' - arg SOME-EL-STRING is not"))
    (with-current-buffer mgtpfes-buf (erase-buffer))
    (with-temp-buffer 
      (save-excursion (print some-el-string (current-buffer)))
    (emacs-lisp-mode)
    (font-lock-fontify-syntactically-region  (buffer-end 0) (buffer-end 1))
    (font-lock-fontify-buffer)
    ;; (current-buffer)
    (mon-get-text-properties-print (buffer-end 0) (buffer-end 1) mgtpfes-buf))
    ;; (substring mgtpfes-buf 0 (1- (length mgtpfes-buf))) "-STRING*"))
    (setq mgtpfes-rd (mon-get-text-properties-read-temp mgtpfes-buf))
    (mon-get-text-properties-elisp-string-pp mgtpfes-rd mgtpfes-buf)))

;; mon-get-text-properties-region

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T19:07:34-05:00Z}#{10096} - by MON KEY>
;; (defun mon-get-text-properties-parse-prop-val-type-chk (prop-val)
;;   "Check that PROP-VAL's type is suitable.
;; Return eq, eql, equal depending on type of PROP-VAL.
;; Signal an error if PROP-VAL is not of the type:
;;  string, integer, symbol, float, vector, or buffer.
;; For use with:
;;  `mon-get-text-properties-parse-buffer'
;;  `mon-get-text-properties-parse-sym'
;;  `mon-get-text-properties-parse-buffer-or-sym'\n
;; :EXAMPLE\n
;; \(let \(\(bubba-type 
;;        `\(\"bubba\" bubba  8 8.8 [b u b b a] ,\(get-buffer \(current-buffer\)\)\)\)
;;       bubba-types\)
;;   \(dolist \(the-bubba bubba-type \(setq bubba-types \(nreverse bubba-types\)\)\)
;;     \(push `\(,the-bubba 
;;             . ,\(mon-get-text-properties-parse-prop-val-type-chk the-bubba\)\)
;;           bubba-types\)\)\)\n
;; :SEE-ALSO .\n▶▶▶"
;;   (typecase prop-val
;;     (string  'equal)           
;;     (integer 'eq)
;;     (symbol  'eq) 
;;     (float   'eql)
;;     (vector  'equal)
;;     (buffer  'eq)
;;     ;; cons can't happen '(a b c) 
;;     (t (error 
;;         (concat
;;          ":FUNCTION mon-get-text-properties-parse-sym"
;;          "- PROPS-IN-SYM not string, integer, float, vector, buffer, or symbol")))))
;;
;;; :TEST-ME 
;; (let ((bubba-type 
;;        `("bubba" bubba  8 8.8 [b u b b a] ,(get-buffer (current-buffer))))
;;       bubba-types)
;;   (dolist (the-bubba bubba-type (setq bubba-types (nreverse bubba-types)))
;;     (push `(,the-bubba 
;;             . ,(mon-get-text-properties-parse-prop-val-type-chk the-bubba))
;;           bubba-types)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-06T13:03:06-05:00Z}#{10096} - by MON KEY>
(defun mon-get-text-properties-map-ranges-string-chk-type (to-check)
  "Return type-of value for TO-CHECK. 
Signal an error if TO-CHECK does not name a symbol or buffer.\n
:CALLED-BY `mon-get-text-properties-map-ranges-string'
:SEE-ALSO .\n▶▶▶"
  (let* ((to-check-str-p (if (eq (type-of to-check) 'string)
                             (or (get-buffer to-check)
                                 (intern-soft to-check))
                             to-check))
         ;(tos (symbol-value to-check-str-p)))
         (tos (if (null to-check-str-p)
                  nil
                  (type-of to-check-str-p))))
    (cond (;; :NOTE to-check's value can still be null.
           (and (not (null tos)) (eq tos 'symbol)) tos)
          ((eq tos 'buffer) tos)
          (t (error "arg does not name a valid symbol or buffer")))))
;;
;;; :TEST-ME (mon-get-text-properties-map-ranges-string-chk-type 'bubba)
;;; :TEST-ME (mon-get-text-properties-map-ranges-string-chk-type "bubba")
;;; :TEST-ME (progn (unintern 'bubba) (mon-get-text-properties-map-ranges-string-chk-type "bubba")) ; should fail.
;;; :TEST-ME (mon-get-text-properties-map-ranges-string-chk-type (get-buffer (current-buffer)))
;;; :TEST-ME (mon-get-text-properties-map-ranges-string-chk-type (get-buffer "not-a-buffer")) ; should fail.

;;; ==============================
;;; (insert-buffer-substring "*MGTPFES*")
;;; :CREATED <Timestamp: #{2010-03-05T12:21:29-05:00Z}#{10095} - by MON KEY>
;; (defun mon-get-text-properties-parse-buffer (prop prop-val prop-buffer)
;;   "Filter the text-property list for sublists containing the text-property PROP
;;   and PROP-VAL.\n
;; PROP is a property to filter.
;; PROP-VAL is a property value of PROP to filter.
;; PROP-BUFFER names a buffer name from which to read from a list of sublists.
;; Sublists contain two index values and text-property plist of prop val pairs e.g.\n
;;  \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)\n
;; :NOTE Reading begins from `point-min'. Reading does not move point.\n
;; :SEE `mon-get-text-properties-parse-buffer-or-sym' for usage example.
;; :SEE `mon-get-text-properties-parse-prop-val-type-chk' for PROP-VAL types.\n
;; :SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-parse-sym',
;; `mon-get-text-properties-parse-buffer-or-sym'.\n▶▶▶"
;;   (unless (buffer-live-p (get-buffer prop-buffer))
;;     (error ":FUNCTION mon-get-text-properties-parse-buffer - PROP-BUFFER does not exist"))
;;   (let ((rd-prop-marker (make-marker))
;;         (prop-st-marker (make-marker))
;;         (comp-type 
;;          (mon-get-text-properties-parse-prop-val-type-chk prop-val))
;;         rd-prop-times i-red im-reding)
;;     (with-current-buffer  prop-buffer
;;       (set-marker prop-st-marker (point))
;;       (set-marker rd-prop-marker (buffer-end 0))
;;       (unwind-protect
;;            (progn
;;              (goto-char (marker-position rd-prop-marker))
;;              (cond ((> (skip-syntax-forward "^(") 0)
;;                     (set-marker rd-prop-marker (point)))
;;                    ((bobp)
;;                     (set-marker rd-prop-marker (point)))
;;                     ;; Anything else if prob. funky
;;                     (t (error ":FUNCTION mon-get-text-properties-parse-buffer - bounds of sexp unknown")))
;;              (if (eq (car (syntax-after (1+ (marker-position rd-prop-marker)))) 4)
;;                  (progn 
;;                    (setq rd-prop-times (length (sexp-at-point)))
;;                    (forward-char)
;;                    (set-marker rd-prop-marker (point)))
;;                  (error ":FUNCTION mon-get-text-properties-parse-buffer - bounds of sexp unknown"))
;;              ;;(marker-position rd-prop-marker)
;;              (dotimes (rd rd-prop-times (setq i-red (nreverse i-red)))
;;                (setq im-reding (read rd-prop-marker))
;;                (let* ((red-prop (plist-member (caddr im-reding) prop))
;;                       (red-prop-val (cadr red-prop)))
;;                  (when red-prop 
;;                    (cond ((consp red-prop-val)
;;                           (when (member prop-val red-prop-val)
;;                             (push im-reding i-red)))
;;                          ((and (not (null red-prop-val)) (atom red-prop-val))
;;                           (when (funcall comp-type prop-val red-prop-val)
;;                             (push im-reding i-red))))))))
;;         (goto-char prop-st-marker)))))
;;
;;; :TEST-ME (mon-get-text-properties-parse-buffer 'face 'font-lock-constant-face "*MGTPFES*")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T14:10:07-05:00Z}#{10095} - by MON KEY>
;; (defun mon-get-text-properties-parse-sym (prop prop-val props-in-sym)
;;   "Filter the text-property list for sublists containing the text-property PROP and PROP-VAL.\n
;; PROP is a property to filter.
;; PROP-VAL is a property value of PROP to filter. 
;; It is one of the types:
;;  string, integer, symbol, float, vector, buffer
;; PROPS-IN-SYM is a symbol to parse.\n
;; Format of PROPS-IN-SYM are as per `mon-get-text-properties-parse-buffer-or-sym'.\n
;; :SEE `mon-get-text-properties-parse-buffer-or-sym' for usage example.
;; :SEE `mon-get-text-properties-parse-prop-val-type-chk' for PROP-VAL types.\n
;; :SEE-ALSO `mon-get-text-properties-region', `mon-get-text-properties-parse-buffer'.
;; \n▶▶▶"
;;   (let ((comp-type 
;;          (mon-get-text-properties-parse-prop-val-type-chk prop-val))
;;         i-red)
;;     (mapc #'(lambda (im-reding)
;;               (let* ((red-prop (plist-member (caddr im-reding) prop))
;;                      (red-prop-val (cadr red-prop)))
;;                 (when red-prop 
;;                   (cond ((consp red-prop-val)
;;                          (when (member prop-val red-prop-val)
;;                            (push im-reding i-red)))
;;                         ((and (not (null red-prop-val)) (atom red-prop-val))
;;                          (when (funcall comp-type prop-val red-prop-val)
;;                            (push im-reding i-red)))))))
;;           props-in-sym)
;;     (setq i-red (nreverse i-red))))
;;
;;; :TEST-ME 
;;; (let ((mgtppb (mon-get-text-properties-parse-buffer 'face 'font-lock-constant-face "*MGTPFES*")))
;;;   (mon-get-text-properties-parse-sym 'face 'font-lock-string-face mgtppb))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T13:41:29-05:00Z}#{10095} - by MON KEY>
;; (defun* mon-get-text-properties-parse-buffer-or-sym (prop prop-val &key
;;                                                           read-prop-sym
;;                                                           read-prop-buffer)
;;   "Filter the text-property list for sublists containing the text-property PROP and PROP-VAL.\n
;; Return a two valued list. 
;; The car is a list of conses of only the indexes for each matching sublist.
;; The cadr is a list of each each matching sublist.
;; PROP is a property to filter.
;; PROP-VAL is a property value of PROP to filter.
;; Keyword READ-PROP-SYM names a symbol to parse.
;; Keyword READ-PROP-BUFFER names a buffer to read from.
;; When keyword READ-PROP-BUFFER is non-nil reading begins from `point-min' does
;; not move point.\n
;; Contents of READ-PROP-SYM or READ-PROP-BUFFER should hold a list with sublists.
;; Sublists contain two index values and text-property plist of prop val pairs e.g.\n
;;  \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)\n
;; :EXAMPLE\n\n\(let \(\(mgtppbos-example
;;        '\(\(34 35   \(fontified t hard t rear-nonsticky t face some-face\)\)
;;          \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)
;;          \(388 391 \(some-boolean-prop t face \(some-first-face second-face\)\)\)
;;          ;; { ... lots more here ... }
;;          \(3862 3884 \(face \(font-lock-constant-face second-face\)\)\)\)\)\)
;;   \(mon-get-text-properties-parse-buffer-or-sym 
;;    'face 'second-face :read-prop-sym mgtppbos-example\)\)\n
;; \(let \(\(mgtppbos-example
;;        '\(\(34 35     \(fontified t p2 p2-val rear-nonsticky t face some-face\)\)
;;          \(idx1 idx2 \(p1 p1-val p2 p2-val p3-val \(p3-lv1 p3-lv2 p3-lv3\)\)\)
;;          \(388 391   \(some-boolean-prop t face \(some-first-face second-face\)\)\)
;;          ;; { ... lots more here ... }
;;          \(3862 3884 \(face \(font-lock-constant-face second-face\)\)\)\)\)\)
;;   \(prin1 mgtppbos-example \(get-buffer-create \"*MGTPPBOS-EXAMPLE*\"\)\)
;;   \(setq mgtppbos-example
;;         \(mon-get-text-properties-parse-buffer-or-sym 
;;          'p2 'p2-val :read-prop-buffer \"*MGTPPBOS-EXAMPLE*\"\)\)
;;   \(kill-buffer \"*MGTPPBOS-EXAMPLE*\"\)
;;   mgtppbos-example\)\n
;; :SEE-ALSO `mon-get-text-properties-parse-sym', `mon-get-text-properties-parse-buffer',
;; `mon-get-text-properties-region'.\n▶▶▶"
;;   (let (mgtpbos)
;;     (cond (read-prop-sym
;;            (setq mgtpbos (mon-get-text-properties-parse-sym 
;;                           prop prop-val read-prop-sym)))
;;           (read-prop-buffer
;;            (setq mgtpbos (mon-get-text-properties-parse-buffer 
;;                           prop prop-val read-prop-buffer))))
;;     (setq mgtpbos `(,(mon-get-text-properties-map-ranges mgtpbos) ,mgtpbos))
;;     (if w-compensate 
;;         (setq mgtpbos (mon-get-text-properties-map-ranges mgtpbos))
;;         mgtpbos)))
;;
;;; :TEST-ME (mon-get-text-properties-parse-buffer-or-sym 
;;;               'face 'font-lock-constant-face :read-prop-buffer "*MGTPFES*")
;;; :TEST-ME (let ((mgtppb 
;;;                    (mon-get-text-properties-parse-buffer 
;;;                     'face 'font-lock-constant-face "*MGTPFES*")))
;;;               (mon-get-text-properties-parse-buffer-or-sym 
;;;                'face 'font-lock-string-face :read-prop-sym mgtppb))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T19:04:53-05:00Z}#{10096} - by MON KEY>
;; (defun mon-get-text-properties-map-ranges (text-prop-list)
;;   "Map the indexes at head of each sublist of TEXT-PROP-LIST to a consed list.
;; Return value is a list of sublists of the form:
;;  ( (idx1a idx1b) (idx2a idx2b) (idx3a idx3b) { ... } )\n
;; :CALLED-BY `mon-get-text-properties-parse-buffer-or-sym'.\n
;; :SEE-ALSO \n▶▶▶"
;;   (let (mgtpmmr)
;;     (setq mgtpmmr
;;           (mapcar #'(lambda (top) 
;;                       (let ((bt (butlast top 1)))
;;                         (setq bt `(,(car bt) . ,(cadr bt)))))
;;                   text-prop-list))))
;;
;; (let ((mgtppb
;;        (mon-get-text-properties-parse-buffer 'face 'font-lock-constant-face "*MGTPFES*")))
;;   (setq mgtppb
;;         (mon-get-text-properties-parse-sym 'face 'font-lock-string-face mgtppb))
;;   (setq mgtppb `(,(mon-get-text-properties-map-ranges mgtppb) ,mgtppb)))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-06T11:54:24-05:00Z}#{10096} - by MON KEY>
(defun mon-get-text-properties-map-ranges-compensate (compensate-list)
  "1+ the car of each sublist.\n
Use with return value of `mon-get-text-properties-parse-buffer-or-sym'
to compensate for point offset when string read from (buffer-end 0) and posn 1
is a `\"' e.g. when mon-get-text-properties-parse-buffer-or-sym's keyword arg
:read-prop-buffer is non-nil.\n
:SEE-ALSO .\n▶▶▶"
  (let ((comp+ compensate-list))
    (mapc  #'(lambda (tp) (setf (caar tp) (1+ (caar tp))))
           comp+)
    comp+))

    ;; `(,ssob . ,tsob)))
(mon-get-text-properties-map-ranges-string  
 :str-sym-or-buffer "*MGTPFES-STRING*"
 :tp-sym-or-buffer 'some-symbol
 :filter-prop 'thunk
 :w-prop-val 'thunk
 )
    
;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-05T20:16:13-05:00Z}#{10096} - by MON KEY>
(cl-defun mon-get-text-properties-map-ranges-string (&key filter-prop 
                                                    w-prop-val 
                                                    str-sym-or-buffer 
                                                    tp-sym-or-buffer)
                                                    ;;w-compensate)
  "
FILTER-PROP 

W-PROP-VAL 
STR-SYM-OR-BUFFER

TP-SYM-OR-BUFFER

W-COMPENSATE when non-nil 1+ the car of each sublist in return value
with `mon-get-text-properties-map-ranges-compensate' to adjust for point offset.

:SEE-ALSO .\n▶▶▶"
;;   (unless (and filter-prop w-prop-val str-sym-or-buffer tp-sym-or-buffer)
;;     (error ":FUCTION `mon-get-text-properties-map-ranges-string' - missing a keyword arg"))
;;   (let ((ssob 
;;          (mon-get-text-properties-map-ranges-string-chk-type str-sym-or-buffer))
;;         (tsob
;;          (mon-get-text-properties-map-ranges-string-chk-type tp-sym-or-buffer))
;;         rr the-str str-range)
;;     ssob))
;; ))
  ;; (setq rr 
  ;;           (cond (eq (ssob 
  ;;                      (with-current-buffer str-buffer ;;"*MGTPFES-STRING*"
  ;;           (mon-get-text-properties-region (buffer-end 0) (buffer-end 1))))
  ;;     (setq the-str (car rr))
  ;;     (setq rr (cadr rr))
  ;;     (setq rr (mon-get-text-properties-parse-buffer-or-sym 
  ;;               ;;'face 'font-lock-constant-face :read-prop-sym rr))
  ;;               filter-prop w-prop-val :read-prop-sym rr))
  ;;     (setq rr (mapcar #'(lambda (idx-pair)
  ;;                          `(,idx-pair ,(substring the-str (car idx-pair) (cdr idx-pair))))
  ;;                      (car rr)))
  ;;     (princ rr (get-buffer tp-buffer))))

;; (type-of (get-buffer str-sym-or-buffer)) ;;"*MGTPFES-STRING*"))
;; (type-of (get-buffer tp-sym-or-buffer))
;; (type-of 

;; (
;; #'(lambda (sym-buff)
;; (let ((ssob 
;;        (mon-get-text-properties-map-ranges-string-chk-type str-sym-or-buffer))
;;       (tsob
;;        (tp-sym-or-buffer mon-get-text-properties-map-ranges-string-chk-type)))

;; sym-buff))

;; (type-of (get-buffer (get-buffer "*MGTPFES-STRING*")))

         "some-not")
;; (get-buffer "*MGTPFES-STRING*"))
;;
                          ;))
;;;
;;; 
;; (mon-get-text-properties-map-ranges-string 
;;  :filter-prop 'face
;;  :w-prop-val 'font-lock-constant-face
;;  :str-buffer "*MGTPFES-STRING*"
;;  :tp-buffer "*MGTPFES*")

(mon-get-text-properties-map-ranges-string 
 :filter-prop 'face
 :w-prop-val 'font-lock-constant-face
 :str-buffer "*MGTPFES-STRING*"
 :tp-buffer "*MGTPFES*")

(mon-get-text-properties-parse-buffer-or-sym 
 'face 'font-lock-constant-face :read-prop-buffer (current-buffer))
filter-prop w-prop-val 

;;; ==============================

;;; :TEST-ME (print *mon-help-reference-keys* (current-buffer))

;;; (unintern "mon-get-syntax-at" obarray)
(get-char-property (point) 'symbol

(syntax-class 
(:sytax (2) :char 110 :at-psn 33123)


;; (char-syntax (syntax-class '(4 . 41)))
;; char-syntax

;; (logand 11 65535)
;; string-prefix-p

;;; ==============================
;;; :CHANGESET 2180
;;; :CREATED <Timestamp: #{2010-10-10T09:17:24-04:00Z}#{10407} - by MON KEY>
;; (defun mon-get-syntax-at (&optional psn-at)
;;   "Get syntax at position. Default is position 1+ point.\n
;; When PSN-AT an integer is non-nil examine that position from point.\n
;; :EXAMPLE\n\n\(mon-get-syntax-at\)\n
;; \(mon-get-syntax-at -8\)\n
;; :SEE-ALSO `mon-get-syntax-class-at'.\n▶▶▶"
;;   (interactive)
;;   (let ((at-pnt (if psn-at 
;;                     (+ (point) psn-at)
;;                   (point))))
;;     `(:sytax-at  ,(syntax-after at-pnt)
;;       :char-at   ,(char-after at-pnt)
;;       :string-at ,(char-to-string (char-after at-pnt))
;;       ;; it isn't clear when/if this is relevant
;;       ;; :syntax-class-at ,(mon-get-syntax-class-at at-pnt)
;;       :psn-at     ,at-pnt)))


;;; ==============================
;;; :CREATED <Timestamp: #{2010-03-02T15:09:03-05:00Z}#{10092} - by MON KEY>
(defun mon-syn-rng-scn-psn-at (&optional psn-at)
  (if psn-at
      (car (syntax-after (+ (point) psn-at)))
    (car (syntax-after (1+ (point))))))

(defun mon-syn-parse-args (syn-args)
  "
:SEE-ALSO \n.▶▶▶"
(let ((mspa (cond ((consp syn-args) syn-args)
                  ((stringp syn-args)
                   (string-to-list syn-args))))
      mspa-str)
  (mapc #'(lambda ()
            )
        mspa)
  ;; (syntax-class '(0))
  ;; (string (char-syntax ?\`))
  ;; (case 
  ;; (string-to-syntax "w")
  ;; (string-to-char "_")
  (syntax-class 
   )
(string (char-syntax 32))
;; (syntax-class (string-to-syntax "w"))
;; (string-to-syntax "b")

;; (syntax-class (syntax-after (point)))
;;
;;; :TEST-ME (mon-syn-parse-args '(a))
;;; :TEST-ME (mon-syn-parse-args '(a b c))
;;; :TEST-ME (mon-syn-parse-args "bubba")



0       whitespace         (designated by ` ' or `-')
1       punctuation        (designated by `.')
2       word               (designated by `w')
3       symbol             (designated by `_')
4       open parenthesis   (designated by `(')
5       close parenthesi   (designated by `)')
6       expression prefi   (designated by `'')
7       string quote       (designated by `"')
8       paired delimiter   (designated by `$')
9       escape             (designated by `\')
10      character quote    (designated by `/')
11      comment-start      (designated by `<')
12      comment-end        (designated by `>')
13      inherit            (designated by `@')
14      generic comment    (designated by `!')
15      generic string     (designated by `|')
"
;; Adjust to take any range of syntax chars or string using `mon-syn-parse-args' above.
(defun mon-syn-skp-to6 (&optional skip-back w-line-clamp)  ;syn-args 
  "Skip over range that is not of syntax type expression prefix.\n
When optional arg SKIP-BACK is non-nil skip-syntax-backward.\n
When optional arg W-LINE-CLAMP is non-nil limit motion to current line.
If W-LINE-CLAMP is non-nil limit to `line-end-position' unless SKIP-BACK is
non-nil in which case limit to `line-beginning-position'.\n
When W-LINE-CLAMP is non-nil and syntax-class is not found move point to EOL or
\"\"BOL respectively.
:NOTE The syntax-class 6 is expression-prefix designated by `''.
:SEE-ALSO `mon-get-syntax-at'.\n▶▶▶"
  (cond (skip-back 
         (if w-line-clamp
             (skip-syntax-backward "^'" (line-beginning-position))
             (skip-syntax-backward "^'")))
        (t (if w-line-clamp
               (skip-syntax-forward "^'" (line-end-position))
               (skip-syntax-forward "^'")))))

(progn (mon-syn-skp-to6)
       (if (or (eq (mon-get-syntax-at) 2)
               (eq (mon-get-syntax-at) 3))
           (forward-char)
           (mon-syn-skp-to6 nil t)))


(defun mon-syn-rng-scn6 ()
  "
:SEE-ALSO .\n▶▶▶"
  (while (not (eq (mon-get-syntax-at) 6))
    (forward-char)))

(mon-syn-rng-scn6)

(defun rng-scn-2-3 ()
  (while (or (not (eq (car (syntax-after (point))) 2))
             (not (eq (car (syntax-after (point))) 3)))
    (forward-char)))


 (let (pst-grave)
   (mon-syn-skp-to6 nil t)
   (when (eq (char-after) 96)
     (forward-char) 
     (setq pst-grave (point))
     (if (or (eq (mon-get-syntax-at) 2)
             (eq (mon-get-syntax-at) 3))
           (forward-char))))
     
(while (not (eq (car (syntax-after (point))) 6))
    (forward-char))

;;; ==============================
;;; test below:
(mon-get-syntax-at)
(mon-get-syntax-at -8)
(mon-syn-skp-to6 t t)
(mon-syn-skp-to6 nil t)

"while `skip-syntax-forward'
`skip-syntax-backward'
`syntax-after'"

;;; =============================
;;; (backward-prefix-chars)
;;; (skip-syntax-forward "^'")
;;; (skip-syntax-forward "^_'")
;;; (when (eq (skip-syntax-backward "-") -1)
;;;   (progn 
;;;     (skip-syntax-forward "^'")
;;;     (syntax-after (point)))
;;;   (skip-syntax-forward "^_'")
;;;   (while (syntax-after (point))
;;;     (skip-syntax-forward "^w")


;;; ==============================
;;; emacs-lisp-mode-syntax-table
;; syntax-ppss-toplevel-pos
;;; font-lock-syntax-table
;; (with-syntax-table (syntax-table)
;; syntax-begin-function
;; syntax-ppss-cache  
;; syntax-ppss-stats
;; syntax-ppss-last
;;(parse-partial-sexp (line-beginning-position) (line-end-position))
;; (char-to-string 34) -> \ 7 string quote
;; 7       string quote       (designated by `"')
;; (length '(2 4078 nil 34 nil nil 1 nil 4079 (3890 4078)))
;; 0. depth in parens.
;; 1. character address of start of innermost containing list; nil if none.
;; 2. character address of start of last complete sexp terminated.
;; 3. non-nil if inside a string.
;;    (it is the character that will terminate the string,
;;     or t if the string should be terminated by a generic string delimiter.)
;; 4. nil if outside a comment, t if inside a non-nestable comment,
;;    else an integer (the current comment nesting).
;; 5. t if following a quote character.
;; 6. the minimum paren-depth encountered during this scan.
;; 7. t if in a comment of style b; symbol `syntax-table' if the comment
;;    should be terminated by a generic comment delimiter.
;; 8. character address of start of comment or string; nil if not in one.
;;; 
;; (syntax-ppss)
;; => (2 4078 nil 34 nil nil 1 nil 4079 (3890 4078))
;; "If W-LINE-CLAMP is  non-nil limit to `line-end-position' unless SKIP-BACK is")
;; (1 5072 nil 34 nil nil 0 nil 5073 (5072))


;;; ==============================
;;; ==============================
;;; Following redefines `lisp-font-lock-syntactic-face-function' to `save-match-data'
;;; trying to figure out what is causing the bug with `mon-get-all-face-property-change'.
;;; ==============================
(defun mon-lisp-font-lock-syntactic-face-function (state)
  (if (nth 3 state)
      ;; This might be a (doc)string or a |...| symbol.
      (let ((startpos (nth 8 state)))
        (if (eq (char-after startpos) ?|)
            ;; This is not a string, but a |...| symbol.
            nil
          (let* ((listbeg (nth 1 state))
                 (firstsym (and listbeg
                                (save-excursion
                                  (goto-char listbeg)
                                  (and 
                                   (save-match-data (looking-at "([ \t\n]*\\(\\(\\sw\\|\\s_\\)+\\)")) ;;<----
                                   (match-string 1)))))
                 (docelt (and firstsym (get (intern-soft firstsym)
                                            lisp-doc-string-elt-property))))
            (if (and docelt
                     ;; It's a string in a form that can have a docstring.
                     ;; Check whether it's in docstring position.
                     (save-excursion
                       (when (functionp docelt)
                         (goto-char (match-end 1))
                         (setq docelt (funcall docelt)))
                       (goto-char listbeg)
                       (forward-char 1)
                       (condition-case nil
                           (while (and (> docelt 0) (< (point) startpos)
                                       (progn (forward-sexp 1) t))
                             (setq docelt (1- docelt)))
                         (error nil))
                       (and (zerop docelt) (<= (point) startpos)
                            (progn (forward-comment (point-max)) t)
                            (= (point) (nth 8 state)))))
                font-lock-doc-face
              font-lock-string-face))))
    font-lock-comment-face))

;;; (let ((font-lock-syntactic-face-function 'mon-lisp-font-lock-syntactic-face-function)
;;;       ;(parse-sexp-lookup-properties t)) before-change-functions
;;        )
;;;   font-lock-syntactic-face-function)
;;
;; (font-lock-fontify-syntactically-region (buffer-end 0) (buffer-end 1) t)

;;; ==============================

;;; ==============================
;;; EOF
