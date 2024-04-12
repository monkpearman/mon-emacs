

;;; ==============================
;; :SEE (URL `http://www.xmlrpc.com/')
;; :SEE (URL `http://common-lisp.net/project/s-xml-rpc/')
;; :SEE (URL `http://common-lisp.net/project/lisppaste/xml-rpc.html')
;; :SEE (URL `http://www.emacswiki.org/emacs/xml-rpc.el')
;; :SEE (URL `http://www.emacswiki.org/cgi-bin/wiki/XmlRpc')
;; :SEE (URL `http://www.emacswiki.org/emacs/xml-rpc.el') 
;;
;;; ==============================
;; Following modified from the discussion here:
;; :SOURCE (URL `http://common-lisp.net/project/lisppaste/xml-rpc.html')
;;
;; ,----
;; | 
;; | Lisppaste XML-RPC support
;; | 
;; | As of version 2.2, Lisppaste now supports XML-RPC. The irc.freenode.net pastebot
;; | serves XML-RPC on port 8185 of common-lisp.net. There is a snippet of elisp that
;; | enables lisppasting directly from emacs.
;; | 
;; | The following methods are implemented:
;; | 
;; | NEWPASTE <CHANNEL> <USER> <TITLE> <CONTENTS> [ANNOTATE-OR-COLORIZATION-MODE] 
;; |  Make a new paste to specified channel with given user, title, and contents. 
;; |  If ANNOTATE-OR-COLORIZATION-MODE is supplied and is a number, it will be taken as a
;; |  number of a paste to annotate, in which case the channel must be equal to the
;; |  original channel. If it is a string, it will be taken as a colorization mode to
;; |  use.
;; | 
;; | PASTEHEADERS <NUMBER> [START] 
;; |  Return a list of lists describing the most recent number pastes on the
;; |  system. 
;; |  Each list has (in order) the number of the paste, the time of the paste, the
;; |  username, channel, and title of the paste, and the number of annotations for the
;; |  paste.
;; | 
;; | PASTEHEADERSBYCHANNEL <CHANNEL> <NUMBER> [start] 
;; |  Return a list of lists describing the most recent number pastes in the supplied
;; |  channel. The return type is the same as pasteheaders.
;; | 
;; | PASTEANNOTATIONHEADERS <NUMBER>
;; |  return a list of lists describing the annotations of the paste numbered number. 
;; |  Each list has (in order) the number of the annotation, the time of the
;; |  annotation, the username, channel, and title of the annotation, and the number
;; |  of annotations for the annotation (currently always 0).
;; | 
;; | PASTEDETAILS <NUMBER> [ANNOTATION] 
;; |  Return a list describing the paste numbered number, or of the annotation of it
;; |  numbered annotation.
;; |  This list has (in order) the number of the past or annotation, the time it
;; |  occured, the username, channel, title, number of annotations, and lastly the
;; |  paste or annotation contents.
;; | 
;; | LISTCHANNELS
;; |  Return a list of channels that the lisppaste bot is visible on.
;; | 
;; | If you are planning on running a lisppaste with XML-RPC support, you will need
;; | Sven Van Caekenberghe's S-XML-RPC package installed server-side; there is a
;; | xml-rpc-sbcl.patch file in the Lisppaste 2.2 distribution which allows it to run
;; | on SBCL. To enable XML-RPC, start the pastebot as normal and then load the
;; | xml-paste.lisp file, and start your XML-RPC server on your choice of port.
;; | 
;; | Erik Enge
;; | Brian Mastenbrook
;; | Last modified: Tue Apr 27 16:08:14 2004 EST 
;; `----
;;
;; ,----
;; | API for package S-XML-RPC
;; | 
;; |     An implementation of the standard XML-RPC protocol for both client and server
;; | 
;; | *xml-rpc-agent*   [VARIABLE]
;; | 
;; |     String specifying the default XML-RPC agent to include in server responses
;; | 
;; |     Initial value: "LispWorks 4.3.7"
;; | 
;; | *xml-rpc-authorization*   [VARIABLE]
;; | 
;; |     When not null, a string to be used as Authorization header
;; | 
;; |     Initial value: NIL
;; | 
;; | *xml-rpc-call-hook*   [VARIABLE]
;; | 
;; |     A function to execute the xml-rpc call and return the result, accepting a
;; |     method-name string and an optional argument list
;; | 
;; |     Initial value: EXECUTE-XML-RPC-CALL
;; | 
;; | *xml-rpc-debug*   [VARIABLE]
;; | 
;; |     When T the XML-RPC client and server part will be more verbose about their
;; |     protocol.
;; | 
;; |     Initial value: NIL
;; | 
;; | *xml-rpc-debug-stream*   [VARIABLE]
;; | 
;; |     When not nil it specifies where debugging output should be written to.
;; | 
;; |     Initial value: NIL
;; | 
;; | *xml-rpc-host*   [VARIABLE]
;; | 
;; |     String naming the default XML-RPC host to use.
;; | 
;; |     Initial value: "localhost"
;; | 
;; | *xml-rpc-package*   [VARIABLE]
;; | 
;; |     Package for XML-RPC callable functions
;; | 
;; |     Initial value: #
;; | 
;; | *xml-rpc-port*   [VARIABLE]
;; | 
;; |     Integer specifying the default XML-RPC port to use
;; | 
;; |     Initial value: 80
;; | 
;; | *xml-rpc-proxy-host*   [VARIABLE]
;; | 
;; |     When not null, a string naming the XML-RPC proxy host to use
;; | 
;; |     Initial value: NIL
;; | 
;; | *xml-rpc-proxy-port*   [VARIABLE]
;; | 
;; |     When not null, an integer specifying the XML-RPC proxy port to use
;; | 
;; |     Initial value: NIL
;; | 
;; | *xml-rpc-url*   [VARIABLE]
;; | 
;; |     String specifying the default XML-RPC URL to use
;; | 
;; |     Initial value: "/RPC2"
;; | 
;; | (call-xml-rpc-server server-keywords name &rest args)   [FUNCTION]
;; | 
;; |     Encode and execute an XML-RPC call with name and args, using the list of
;; |     server-keywords
;; | 
;; | (encode-xml-rpc-call name &rest args)   [FUNCTION]
;; | 
;; |     Encode an XML-RPC call with name and args as an XML string
;; | 
;; | (execute-xml-rpc-call method-name &rest arguments)   [FUNCTION]
;; | 
;; |     Execute method METHOD-NAME on ARGUMENTS, or raise an error if no such method
;; |     exists in *XML-RPC-PACKAGE*
;; | 
;; | (get-xml-rpc-struct-member struct member)   [FUNCTION]
;; | 
;; |     Get the value of a specific member of an XML-RPC-STRUCT
;; | 
;; | (setf (get-xml-rpc-struct-member struct member) value)   [FUNCTION]
;; | 
;; |     Set the value of a specific member of an XML-RPC-STRUCT
;; | 
;; | (start-xml-rpc-server &key (port *xml-rpc-port*) 
;; |                            (url *xml-rpc-url*) 
;; |                            (agent *xml-rpc-agent*))   [FUNCTION]
;; | 
;; |     Start an XML-RPC server in a separate process
;; | 
;; | (stop-server name)   [FUNCTION]
;; | 
;; |     Kill a server process by name (as started by start-standard-server)
;; | 
;; | (system.listmethods)   [FUNCTION]
;; | 
;; |     List the methods that are available on this server.
;; | 
;; | (system.methodhelp method-name)   [FUNCTION]
;; | 
;; |     Returns the function documentation for the given method.
;; | 
;; | (system.methodsignature method-name)   [FUNCTION]
;; | 
;; |     Dummy system.methodSignature implementation. There's no way to get (and no
;; |     concept of) required argument types in Lisp, so this function always returns
;; |     nil or errors.
;; | 
;; | (system.multicall calls)   [FUNCTION]
;; | 
;; |     Implement system.multicall. 
;; |     For the specification:
;; |     :SEE (URL `http://www.xmlrpc.com/discuss/msgReader$1208')
;; | 
;; | (xml-rpc-call encoded &key (url *xml-rpc-url*) 
;; |                            (agent *xml-rpc-agent*) 
;; |                            (host *xml-rpc-host*) 
;; |                            (port *xml-rpc-port*) 
;; |                            (authorization *xml-rpc-authorization*)
;; |                            (proxy-host *xml-rpc-proxy-host*)
;; |                            (proxy-port *xml-rpc-proxy-port*))   [FUNCTION]
;; | 
;; |     Execute an already encoded XML-RPC call and return the decoded result
;; | 
;; | xml-rpc-condition   [CONDITION]
;; | 
;; |     Parent condition for all conditions thrown by the XML-RPC package
;; | 
;; |     Class precedence list: xml-rpc-condition error serious-condition condition
;; |     standard-object t
;; | 
;; | xml-rpc-error   [CONDITION]
;; | 
;; |     This condition is thrown when an XML-RPC protocol error occurs
;; | 
;; |     Class precedence list: 
;; |       xml-rpc-error xml-rpc-condition error 
;; |       serious-condition condition standard-object t
;; |       
;; | 
;; |     Class init args: :data :code
;; | 
;; | (xml-rpc-error-data xml-rpc-error)   [GENERIC-FUNCTION]
;; | 
;; |     Get the data from an XML-RPC error
;; | 
;; | (xml-rpc-error-place xml-rpc-error)   [GENERIC-FUNCTION]
;; | 
;; |     Get the place from an XML-RPC error
;; | 
;; | xml-rpc-fault   [CONDITION]
;; | 
;; |     This condition is thrown when the XML-RPC server returns a fault
;; | 
;; |     Class precedence list: 
;; |      xml-rpc-fault xml-rpc-condition error 
;; |      serious-condition condition standard-object t
;; | 
;; |     Class init args: :string :code
;; | 
;; | (xml-rpc-fault-code xml-rpc-fault)   [GENERIC-FUNCTION]
;; | 
;; |     Get the code from an XML-RPC fault
;; | 
;; | (xml-rpc-fault-string xml-rpc-fault)   [GENERIC-FUNCTION]
;; | 
;; |     Get the string from an XML-RPC fault
;; | 
;; | xml-rpc-struct   structure
;; | 
;; |     An XML-RPC-STRUCT is an associative map of member names and values
;; | 
;; | (xml-rpc-struct &rest args)   [FUNCTION]
;; | 
;; |     Create a new XML-RPC-STRUCT from the arguments: alternating member names and
;; |     values
;; | 
;; | (xml-rpc-struct-alist object)   [FUNCTION]
;; | 
;; |     Return the alist of member names and values from an XML-RPC struct
;; | 
;; | (xml-rpc-struct-equal struct1 struct2)   [FUNCTION]
;; | 
;; |     Compare two XML-RPC-STRUCTs for equality
;; | 
;; | (xml-rpc-struct-p object)   [FUNCTION]
;; | 
;; |     Return T when the argument is an XML-RPC struct
;; | 
;; | xml-rpc-time   structure
;; | 
;; |     A wrapper around a Common Lisp universal time to be interpreted as an
;; |     XML-RPC-TIME
;; | 
;; | (xml-rpc-time &optional (universal-time (get-universal-time)))   [FUNCTION]
;; | 
;; |     Create a new XML-RPC-TIME struct with the universal time specified,
;; |     defaulting to now
;; | 
;; | (xml-rpc-time-p object)   [FUNCTION]
;; | 
;; |     Return T when the argument is an XML-RPC time
;; | 
;; | (xml-rpc-time-universal-time object)   [FUNCTION]
;; | 
;; |     Return the universal time from an XML-RPC time
;; | 
;; |
;; | Documentation generated by lispdoc running on LispWorks
;; `---- :SOURCE (URL `http://common-lisp.net/project/s-xml-rpc/S-XML-RPC.html')


;;; ==============================

;;; ==============================
;;; Based on code by Rudi Schlatte.
;;; Needs this library:
;;; (URL `http://www.emacswiki.org/cgi-bin/wiki/XmlRpc')
;;  (URL `http://www.emacswiki.org/emacs/xml-rpc.el')
;; (require 'xml-rpc)
;;
;; 
;; (defgroup mon-lisppaste nil
;;  :group 'google-define-redux
;;  :group  (or (when (featurep 'mon-doc-help-utils)  'mon-doc-help-utils-faces) nil)  
;;  :prefix "gg-def-")
;; 
;;
;; (defcustom *mon-lisppaste-xrefs*  
;;   '()
;;   :type '(repeat symbol)
;;   :group 'mon-lisppaste
;;   :group 'mon-xrefs)

;; (defcustom *mon-lisppaste-nick* "mon_key" 
;; :type 'string
;; :group 'mon-lisppaste)
;; 
;; (defvar *mon-lisppaste-channel* "#lisp" ;; "lisp"?
;;  :type 'choice
;; '("#awk" "#chicken" "#dylan" "#emacs" "#evergreen" "#fink" "#guile" "#ipaddev"
;;  "#iphonedev" "#lisp" "#lisppaste" "#macdev" "#macports" "#oe" "#opendarwin"
;;  "#opennms" "#racket" "#sbcl" "#scheme" "#webkit" "openemu")
;;  :group 'mon-lisppaste)
;;
;; (defcustom *mon-lisppaste-colorize-as* "Common Lisp"
(defcustom *tt--colorize-as* "Common Lisp"
:type :
 (list "Common Lisp" "Basic Lisp" "Emacs Lisp" "Scheme" "C" "C++" "Java" "Objective C"
;; "Erlang" "Python"  "Haskell" "Unified Context Diff" "Webkit (text or diff)"
)
;;
;; (defvar *mon-lisppaste-prev-title* "")
;;
(cl-fad:list-directory "")
(defun mon-lisppaste-region (region-begin region-end
                                          &optional channel username title annotate)
  ;; CHANNEL names a lisppaste channel. Default is #lisp
  ;; ANNOTATE is an integer denoting an annotation for an existing paste.
  (interactive "r")
  (let* ((mlr-region-content (buffer-substring-no-properties region-begin region-end))
         (mlr-channel (or channel
                          (read-from-minibuffer "Channel: " *mon-lisppaste-channel*)))
         (mlr-username (or username (read-from-minibuffer "Nick: " *mon-lisppaste-nick*)))
         (mlr-title (or title (read-from-minibuffer "Title: " *mon-lisppaste-prev-title*)))
         (mlr-annotate (or annotate (string-to-number (read-from-minibuffer "Annotate? "))))
         (mlr-colorize-as (if (zerop annotate) (read-from-minibuffer "Colorize as (empty for default): " *mon-lisppaste-colorize-as*))))
    (setf *mon-lisppaste-prev-title* title)
    (let* ((mlr-rtn (xml-rpc-method-call "http://common-lisp.net:8185/RPC2" 'newpaste
                                         mlr-channel mlr-username mlr-title mlr-region-content (or mlr-colorize-as mlr-annotate)))
           (mlr-url-beg (search "http://" mlr-rtn))
           (mlr-url-end (and mlr-url-beg (search " " mlr-rtn :start2 mlr-url-beg)))
           (mlr-url (and mlr-url-end (substring mlr-rtn mlr-url-beg mlr-url-end))))
      (print mlr-rtn)
      (and mlr-url (browse-url mlr-url))
      (or mlr-url mrl-rtn))))

;;; ==============================
