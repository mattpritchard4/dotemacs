;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "alert/alert" "alert/alert.el" (22912 42228
;;;;;;  0 0))
;;; Generated autoloads from alert/alert.el

(autoload 'alert-add-rule "alert/alert" "\
Programmatically add an alert configuration rule.

Normally, users should custoimze `alert-user-configuration'.
This facility is for module writers and users that need to do
things the Lisp way.

Here is a rule the author currently uses with ERC, so that the
fringe gets colored whenever people chat on BitlBee:

\(alert-add-rule :status   \\='(buried visible idle)
                :severity \\='(moderate high urgent)
                :mode     \\='erc-mode
                :predicate
                #\\='(lambda (info)
                    (string-match (concat \"\\\\`[^&].*@BitlBee\\\\\\='\")
                                  (erc-format-target-and/or-network)))
                :persistent
                #\\='(lambda (info)
                    ;; If the buffer is buried, or the user has been
                    ;; idle for `alert-reveal-idle-time' seconds,
                    ;; make this alert persistent.  Normally, alerts
                    ;; become persistent after
                    ;; `alert-persist-idle-time' seconds.
                    (memq (plist-get info :status) \\='(buried idle)))
                :style \\='fringe
                :continue t)

\(fn &key SEVERITY STATUS MODE CATEGORY TITLE MESSAGE PREDICATE ICON (style alert-default-style) PERSISTENT CONTINUE NEVER-PERSIST APPEND)" nil nil)

(autoload 'alert "alert/alert" "\
Alert the user that something has happened.
MESSAGE is what the user will see.  You may also use keyword
arguments to specify additional details.  Here is a full example:

\(alert \"This is a message\"
       :severity \\='high          ;; The default severity is `normal'
       :title \"Title\"           ;; An optional title
       :category \\='example       ;; A symbol to identify the message
       :mode \\='text-mode         ;; Normally determined automatically
       :buffer (current-buffer) ;; This is the default
       :data nil                ;; Unused by alert.el itself
       :persistent nil          ;; Force the alert to be persistent;
                                ;; it is best not to use this
       :never-persist nil       ;; Force this alert to never persist
       :style \\='fringe)          ;; Force a given style to be used;
                                ;; this is only for debugging!

If no :title is given, the buffer-name of :buffer is used.  If
:buffer is nil, it is the current buffer at the point of call.

:data is an opaque value which modules can pass through to their
own styles if they wish.

Here are some more typical examples of usage:

  ;; This is the most basic form usage
  (alert \"This is an alert\")

  ;; You can adjust the severity for more important messages
  (alert \"This is an alert\" :severity \\='high)

  ;; Or decrease it for purely informative ones
  (alert \"This is an alert\" :severity \\='trivial)

  ;; Alerts can have optional titles.  Otherwise, the title is the
  ;; buffer-name of the (current-buffer) where the alert originated.
  (alert \"This is an alert\" :title \"My Alert\")

  ;; Further, alerts can have categories.  This allows users to
  ;; selectively filter on them.
  (alert \"This is an alert\" :title \"My Alert\"
         :category \\='some-category-or-other)

\(fn MESSAGE &key (severity (quote normal)) TITLE ICON CATEGORY BUFFER MODE DATA STYLE PERSISTENT NEVER-PERSIST)" nil nil)

;;;***

;;;### (autoloads nil "circe/circe" "circe/circe.el" (22912 42233
;;;;;;  0 0))
;;; Generated autoloads from circe/circe.el

(autoload 'circe-version "circe/circe" "\
Display Circe's version.

\(fn)" t nil)

(autoload 'circe "circe/circe" "\
Connect to IRC.

Connect to the given network specified by NETWORK-OR-SERVER.

When this function is called, it collects options from the
SERVER-OPTIONS argument, the user variable
`circe-network-options', and the defaults found in
`circe-network-defaults', in this order.

If NETWORK-OR-SERVER is not found in any of these variables, the
argument is assumed to be the host name for the server, and all
relevant settings must be passed via SERVER-OPTIONS.

All SERVER-OPTIONS are treated as variables by getting the string
\"circe-\" prepended to their name. This variable is then set
locally in the server buffer.

See `circe-network-options' for a list of common options.

\(fn NETWORK-OR-SERVER &rest SERVER-OPTIONS)" t nil)

;;;***

;;;### (autoloads nil "circe/circe-color-nicks" "circe/circe-color-nicks.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/circe-color-nicks.el

(autoload 'enable-circe-color-nicks "circe/circe-color-nicks" "\
Enable the Color Nicks module for Circe.
This module colors all encountered nicks in a cross-server fashion.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "circe/circe-highlight-all-nicks" "circe/circe-highlight-all-nicks.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/circe-highlight-all-nicks.el

(autoload 'enable-circe-highlight-all-nicks "circe/circe-highlight-all-nicks" "\
Enable the Highlight Nicks module for Circe.
This module highlights all occurances of nicks in the current
channel in messages of other people.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "circe/circe-lagmon" "circe/circe-lagmon.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/circe-lagmon.el

(defvar circe-lagmon-mode nil "\
Non-nil if Circe-Lagmon mode is enabled.
See the `circe-lagmon-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `circe-lagmon-mode'.")

(custom-autoload 'circe-lagmon-mode "circe/circe-lagmon" nil)

(autoload 'circe-lagmon-mode "circe/circe-lagmon" "\
Circe-lagmon-mode monitors the amount of lag on your
connection to each server, and displays the lag time in seconds
in the mode-line.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "circe/circe-new-day-notifier" "circe/circe-new-day-notifier.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/circe-new-day-notifier.el

(autoload 'enable-circe-new-day-notifier "circe/circe-new-day-notifier" "\


\(fn)" t nil)

(autoload 'disable-circe-new-day-notifier "circe/circe-new-day-notifier" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "circe/lui-autopaste" "circe/lui-autopaste.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/lui-autopaste.el

(autoload 'enable-lui-autopaste "circe/lui-autopaste" "\
Enable the lui autopaste feature.

If you enter more than `lui-autopaste-lines' at once, Lui will
ask if you would prefer to use a paste service instead. If you
agree, Lui will paste your input to `lui-autopaste-function' and
replace it with the resulting URL.

\(fn)" t nil)

(autoload 'disable-lui-autopaste "circe/lui-autopaste" "\
Disable the lui autopaste feature.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "circe/lui-irc-colors" "circe/lui-irc-colors.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/lui-irc-colors.el

(autoload 'enable-lui-irc-colors "circe/lui-irc-colors" "\
Enable IRC color interpretation for Lui.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "circe/lui-track-bar" "circe/lui-track-bar.el"
;;;;;;  (22912 42233 0 0))
;;; Generated autoloads from circe/lui-track-bar.el

(autoload 'enable-lui-track-bar "circe/lui-track-bar" "\
Enable a bar in Lui buffers that shows where you stopped reading.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "circe/shorten" "circe/shorten.el" (22912 42233
;;;;;;  0 0))
;;; Generated autoloads from circe/shorten.el

(autoload 'shorten-strings "circe/shorten" "\
Takes a list of strings and returns an alist ((STRING
. SHORTENED-STRING) ...).  Uses `shorten-split-function' to split
the strings, and `shorten-join-function' to join shortened
components back together into SHORTENED-STRING.  See also
`shorten-validate-component-function'.

\(fn STRINGS)" nil nil)

;;;***

;;;### (autoloads nil "circe/tracking" "circe/tracking.el" (22912
;;;;;;  42233 0 0))
;;; Generated autoloads from circe/tracking.el

(defvar tracking-mode nil "\
Non-nil if Tracking mode is enabled.
See the `tracking-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `tracking-mode'.")

(custom-autoload 'tracking-mode "circe/tracking" nil)

(autoload 'tracking-mode "circe/tracking" "\
Allow cycling through modified buffers.
This mode in itself does not track buffer modification, but
provides an API for programs to add buffers as modified (using
`tracking-add-buffer').

Once this mode is active, modified buffers are shown in the mode
line. The user can cycle through them using
\\[tracking-next-buffer].

\(fn &optional ARG)" t nil)

(autoload 'tracking-add-buffer "circe/tracking" "\
Add BUFFER as being modified with FACES.
This does check whether BUFFER is currently visible.

If FACES is given, it lists the faces that might be appropriate
for BUFFER in the mode line. The highest-priority face of these
and the current face of the buffer, if any, is used. Priority is
decided according to `tracking-faces-priorities'.

\(fn BUFFER &optional FACES)" nil nil)

(autoload 'tracking-remove-buffer "circe/tracking" "\
Remove BUFFER from being tracked.

\(fn BUFFER)" nil nil)

(autoload 'tracking-next-buffer "circe/tracking" "\
Switch to the next active buffer.

\(fn)" t nil)

(autoload 'tracking-previous-buffer "circe/tracking" "\
Switch to the last active buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "el-get/el-get" "el-get/el-get.el" (22912 37709
;;;;;;  0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

;;;***

;;;### (autoloads nil "el-get/el-get-bundle" "el-get/el-get-bundle.el"
;;;;;;  (22912 37709 0 0))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC SYNC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The property list may include the keyword
`:bundle-sync' with a value of either `t' or `nil' to request that
`el-get-bundle' invoke `el-get' synchronously (respectively asynchronously).
The keyword `:bundle-async' is the inverse of `:bundle-sync'.
\(Note that the request to run el-get synchronously may not be respected in all
circumstances: see the definition of `el-get-bundle-el-get' for details.)
The FORM after the property list is treated as initialization code,
which is actually an `:after' property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(function-put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(function-put 'el-get-bundle! 'lisp-indent-function 'defun)

;;;***

;;;### (autoloads nil "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (22912 37709 0 0))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

;;;***

;;;### (autoloads nil "el-get/el-get-list-packages" "el-get/el-get-list-packages.el"
;;;;;;  (22912 37709 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "emojify/emojify" "emojify/emojify.el" (22912
;;;;;;  42237 0 0))
;;; Generated autoloads from emojify/emojify.el

(autoload 'emojify-set-emoji-styles "emojify/emojify" "\
Set the type of emojis that should be displayed.

STYLES is the styles emoji styles that should be used, see `emojify-emoji-styles'

\(fn STYLES)" nil nil)

(autoload 'emojify-mode "emojify/emojify" "\
Emojify mode

\(fn &optional ARG)" t nil)

(defvar global-emojify-mode nil "\
Non-nil if Global Emojify mode is enabled.
See the `global-emojify-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-emojify-mode'.")

(custom-autoload 'global-emojify-mode "emojify/emojify" nil)

(autoload 'global-emojify-mode "emojify/emojify" "\
Toggle Emojify mode in all buffers.
With prefix ARG, enable Global Emojify mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Emojify mode is enabled in all buffers where
`emojify-mode' would do it.
See `emojify-mode' for more information on Emojify mode.

\(fn &optional ARG)" t nil)

(autoload 'emojify-mode-line-mode "emojify/emojify" "\
Emojify mode line

\(fn &optional ARG)" t nil)

(defvar global-emojify-mode-line-mode nil "\
Non-nil if Global Emojify-Mode-Line mode is enabled.
See the `global-emojify-mode-line-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-emojify-mode-line-mode'.")

(custom-autoload 'global-emojify-mode-line-mode "emojify/emojify" nil)

(autoload 'global-emojify-mode-line-mode "emojify/emojify" "\
Toggle Emojify-Mode-Line mode in all buffers.
With prefix ARG, enable Global Emojify-Mode-Line mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Emojify-Mode-Line mode is enabled in all buffers where
`emojify-mode-line-mode' would do it.
See `emojify-mode-line-mode' for more information on Emojify-Mode-Line mode.

\(fn &optional ARG)" t nil)

(autoload 'emojify-apropos-emoji "emojify/emojify" "\
Show Emojis that match PATTERN.

\(fn PATTERN)" t nil)

(autoload 'emojify-insert-emoji "emojify/emojify" "\
Interactively prompt for Emojis and insert them in the current buffer.

This respects the `emojify-emoji-styles' variable.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "oauth2/oauth2" "oauth2/oauth2.el" (22912 37535
;;;;;;  0 0))
;;; Generated autoloads from oauth2/oauth2.el

(autoload 'oauth2-refresh-access "oauth2/oauth2" "\
Refresh OAuth access TOKEN.
TOKEN should be obtained with `oauth2-request-access'.

\(fn TOKEN)" nil nil)

(autoload 'oauth2-auth "oauth2/oauth2" "\
Authenticate application via OAuth2.

\(fn AUTH-URL TOKEN-URL CLIENT-ID CLIENT-SECRET &optional SCOPE STATE REDIRECT-URI)" nil nil)

(autoload 'oauth2-auth-and-store "oauth2/oauth2" "\
Request access to a resource and store it using `plstore'.

\(fn AUTH-URL TOKEN-URL RESOURCE-URL CLIENT-ID CLIENT-SECRET &optional REDIRECT-URI)" nil nil)

(autoload 'oauth2-url-retrieve-synchronously "oauth2/oauth2" "\
Retrieve an URL synchronously using TOKEN to access it.
TOKEN can be obtained with `oauth2-auth'.

\(fn TOKEN URL &optional REQUEST-METHOD REQUEST-DATA REQUEST-EXTRA-HEADERS)" nil nil)

(autoload 'oauth2-url-retrieve "oauth2/oauth2" "\
Retrieve an URL asynchronously using TOKEN to access it.
TOKEN can be obtained with `oauth2-auth'.  CALLBACK gets called with CBARGS
when finished.  See `url-retrieve'.

\(fn TOKEN URL CALLBACK &optional CBARGS REQUEST-METHOD REQUEST-DATA REQUEST-EXTRA-HEADERS)" nil nil)

;;;***

;;;### (autoloads nil "slack/slack" "slack/slack.el" (22912 43053
;;;;;;  0 0))
;;; Generated autoloads from slack/slack.el

(autoload 'slack-start "slack/slack" "\


\(fn &optional TEAM)" t nil)

;;;***

;;;### (autoloads nil "slack/slack-team" "slack/slack-team.el" (22912
;;;;;;  43053 0 0))
;;; Generated autoloads from slack/slack-team.el

(autoload 'slack-register-team "slack/slack-team" "\
PLIST must contain :name :client-id :client-secret with value.
setting :token will reduce your configuration step.
you will notified when receive message with channel included in subscribed-chennels.
if :default is t and `slack-prefer-current-team' is t, skip selecting team when channels listed.
you can change current-team with `slack-change-current-team'

\(fn &rest PLIST)" t nil)

;;;***

;;;### (autoloads nil nil ("circe/circe-chanop.el" "circe/circe-compat.el"
;;;;;;  "circe/circe-pkg.el" "circe/irc.el" "circe/lcs.el" "circe/lui-format.el"
;;;;;;  "circe/lui-logging.el" "circe/lui.el" "circe/make-tls-process.el"
;;;;;;  "deferred/concurrent.el" "deferred/deferred.el" "el-get/el-get-autoloading.el"
;;;;;;  "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "ht/ht.el"
;;;;;;  "oauth2/oauth2-autoloads.el" "oauth2/oauth2-pkg.el" "request/request-deferred.el"
;;;;;;  "request/request.el" "slack/slack-attachment.el" "slack/slack-bot-message.el"
;;;;;;  "slack/slack-buffer.el" "slack/slack-channel.el" "slack/slack-emoji.el"
;;;;;;  "slack/slack-file-share-message.el" "slack/slack-file.el"
;;;;;;  "slack/slack-group.el" "slack/slack-im.el" "slack/slack-message-changed.el"
;;;;;;  "slack/slack-message-delete.el" "slack/slack-message-editor.el"
;;;;;;  "slack/slack-message-formatter.el" "slack/slack-message-notification.el"
;;;;;;  "slack/slack-message-reaction.el" "slack/slack-message-sender.el"
;;;;;;  "slack/slack-message-update.el" "slack/slack-message.el"
;;;;;;  "slack/slack-pkg.el" "slack/slack-reaction.el" "slack/slack-reminder.el"
;;;;;;  "slack/slack-reply.el" "slack/slack-request.el" "slack/slack-room-history.el"
;;;;;;  "slack/slack-room.el" "slack/slack-search.el" "slack/slack-slash-commands.el"
;;;;;;  "slack/slack-thread.el" "slack/slack-user-message.el" "slack/slack-user.el"
;;;;;;  "slack/slack-util.el" "slack/slack-websocket.el" "websocket/websocket-functional-test.el"
;;;;;;  "websocket/websocket-test.el" "websocket/websocket.el") (22912
;;;;;;  43053 0 0))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
