;;; schrute-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "schrute" "schrute.el" (22727 26403 932919
;;;;;;  499000))
;;; Generated autoloads from schrute.el

(defvar schrute-mode nil "\
Non-nil if Schrute mode is enabled.
See the `schrute-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `schrute-mode'.")

(custom-autoload 'schrute-mode "schrute" nil)

(autoload 'schrute-mode "schrute" "\
Help you remember there is a better way to do something.

\(fn &optional ARG)" t nil)

(autoload 'schrute-check-last-command "schrute" "\
Check what command was used last time.

It also check the time between the last two invocations of the
same command and use the alternative command instead.

\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; schrute-autoloads.el ends here
