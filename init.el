;; Package Management

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; startup frame size
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 80))

;; pdf-tools
(pdf-tools-install)
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
;; magit-mode

(global-set-key (kbd "C-x m") 'magit-status)

;; avy
(avy-setup-default)
(global-set-key (kbd "C-c SPC") 'avy-goto-char)
(global-set-key (kbd "M-g M-g") 'avy-goto-line)
;; Helm Mode

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x b") 'helm-buffers-list)

;; Multiple Cursors

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Expand Region

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Auto Complete

(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; Projectile

(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; Enhanced Ruby Mode

(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)

;; Smartparens Mode

(require 'smartparens-config)
(smartparens-global-mode t)

;; Font Settings

;; (add-to-list 'default-frame-alist
;;              '(font . "Deja Vu Sans Mono 13"))

(add-to-list 'default-frame-alist
	     '(font . "Menlo 13"))

;; Line Numbering

(global-linum-mode 1)

;; Powerline

(require 'powerline)
(powerline-center-theme)

;; Pending Delete

(delete-selection-mode 1)

;; Resume Latex Formatting

;; (add-to-list 'org-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; Neo Tree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Grizzl

(setq projectile-completion-system 'grizzl)

;; Mac key configuration

(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'control)

;; dumb-jump

(dumb-jump-mode)

;; MIT Scheme

(setq scheme-program-name  "/usr/local/bin/scheme")

;; Buffer Move

(global-set-key (kbd "<M-S-up>")     'buf-move-up)
(global-set-key (kbd "<M-S-down>")   'buf-move-down)
(global-set-key (kbd "<M-S-left>")   'buf-move-left)
(global-set-key (kbd "<M-S-right>")  'buf-move-right)

;; js2-mode

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'nodejs-repl)
(require 'js-comint)
(add-to-list 'load-path "/usr/local/bin/node")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; org-mode

(setq org-log-done 'time)

(require 'org)
(require 'ob)

;; make org mode allow eval of some langs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)
   (python . t)
   (ruby . t)))

(setq org-src-fontify-natively t)

;; org bullets

(require 'org-bullets)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; org ioslide

(require 'ox-ioslide)
(require 'ox-html5slide)
(require 'ox-reveal)
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")


;; indent guide

(require 'indent-guide)
(indent-guide-global-mode)


;; yasnippet

(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;; org-tree-slide

(require 'org-tree-slide)
(global-set-key (kbd "<f9>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f9>") 'org-tree-slide-skip-done-toggle)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-hook 'web-mode-hook 'emmet-mode)

;; html-mode

(add-hook 'html-mode-hook 'emmet-mode)

;; racket path

(setq geiser-racket-binary "/usr/local/bin/racket")
(add-to-list 'load-path "/usr/local/bin/racket")

;; pollen mode

(require 'pollen-mode)

;; enable lozenge for Pollen
;; ◊◊◊◊◊◊◊◊◊◊◊◊◊
;; 'mule-unicode part from
;; https://lists.gnu.org/archive/html//emacs-devel/2005-03/msg01187.html
(defun insert-lozenge ()
  "inserts the lozenge character for use with Pollen"
  ;; enables function through M-x
  (interactive)
  ;; insert the proper character
  (insert (make-char
           'mule-unicode-2500-33ff 34 42)))

;; Bind key to M-\ a la DrRacket for lambda
(global-set-key "\M-\\" 'insert-lozenge)

;; kill the gui

(tool-bar-mode -1)

;; web mode snippet

(setq web-mode-ac-sources-alist
      '(("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
	("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

;; line highlighting

(require 'vline)

;; Fixes having to type 'yes' all over the place

(fset 'yes-or-no-p (symbol-function 'y-or-n-p))

;; saves point position in windows

(setq switch-to-buffer-preserve-window-point t)

;; so that non-ascii chars are easy to search for
(setq search-default-mode #'char-fold-to-regexp)

;; make indentation commands use space only (never the tab character)
(setq-default indent-tabs-mode nil)

;; Don't load out of date .elc files
(setq load-prefer-newer t)

;;; Add some smart things

(global-hl-line-mode)

(setq tramp-default-method "ssh")

;; Watch the garbage collector in action.
;(setq garbage-collection-messages t)

;;; Set up prefered key bindings

(global-set-key "\C-cz" 'compile)

;; General Stuff

(defun endless/fill-or-unfill ()
  "Like `fill-paragraph', but unfill if used twice."
  (interactive)
  (let ((fill-column
         (if (eq last-command 'endless/fill-or-unfill)
             (progn (setq this-command nil)
                    (point-max))
           fill-column)))
    (call-interactively #'fill-paragraph)))

(global-set-key [remap fill-paragraph]
                #'endless/fill-or-unfill)

(setq default-major-mode 'text-mode
      ; Is this next obsolete? Sep 6, 2014
      ;ask-about-buffer-names t
      inhibit-startup-message t
      delete-auto-save-files t
      version-control t
      default-fill-column 70
      dired-listing-switches "-alg")

(setq-default show-trailing-whitespace t)
(setq x-stretch-cursor t)

;(setq gc-cons-threshold 800000)
(setq gc-cons-threshold 1600000)

; Start with Mondays
;(setq calendar-week-start-day 1)

;added Mon Sep  8 2014, 12:22 :)
(defun insert-timestamp ()
  "Insert the date and time into the current buffer."
  (interactive)
  (insert (format-time-string "%a %b %e %Y, %R")))
(global-set-key "\C-ct" 'insert-timestamp)

;;
;; Tabbar keys
;; (require 'tabbar)
;; (define-key tabbar-mode-map [C-left] 'tabbar-backward-tab)
;; (define-key tabbar-mode-map [C-right] 'tabbar-forward-tab)

;; VC mode stuff

;(global-set-key "\C-x\C-q" 'vc-toggle-read-only)
(setq diff-switches "-u")

;; Set things up for C mode

; define knf style...

(defconst knf-c-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset . 0)
    (c-offsets-alist . ((string                . -1000)
			(c                     . c-lineup-C-comments)
			(defun-open            . 0)
			(defun-close           . 0)
			(defun-block-intro     . +)
;			(ansi-funcdecl-cont    . -)
			(knr-argdecl-intro     . +)
			(knr-argdecl           . 0)
			(topmost-intro         . 0)
			(topmost-intro-cont    . 0)
			(block-open            . 0)
			(block-close           . 0)
			(brace-list-open       . 0)
			(brace-list-close      . 0)
			(brace-list-intro      . +)
			(brace-list-entry      . 0)
			(statement             . 0)
			(statement-cont        . 4)
			(statement-block-intro . +)
			(statement-case-intro  . +)
			(statement-case-open   . 0)
			(substatement          . +)
			(substatement-open     . 0)
			(case-label            . 0)
			(label                 . 0)
			(do-while-closure      . 0)
			(else-clause           . 0)
			(comment-intro         . c-lineup-comment)
			(arglist-intro         . 4)
			(arglist-cont          . 0)
			(arglist-cont-nonempty . 4)
			(arglist-close         . 4)
			(cpp-macro             . -1000)
			))
    )
  "KNF C Programming Style")

; My c-mode hook (has to be setq'd to c-mode-hook)
(setq c-mode-hook
      '(lambda ()
	 (c-add-style "KNF" knf-c-style t)
	 (c-toggle-auto-state 1)
	 (auto-fill-mode 1)
	 (flyspell-prog-mode 1)
	 (setq indent-tabs-mode nil)
	 (setq comment-column 60)
	 (setq c-hanging-comment-ender-p nil)
	 (setq c-hanging-comment-starter-p nil)
	 (define-key c-mode-map "\177" 'delete-backward-char)))

(setq objc-mode-hook
      '(lambda ()
	 (setq c-basic-offset 4)))

;; Text mode setup

; set text mode to include auto-fill
(setq text-mode-hook
      '(lambda ()
	 (auto-fill-mode 1)
	 (flyspell-mode 1)
	 ;(define-key text-mode-map "\^i" 'tab-to-tab-stop)
	 ))

(column-number-mode)
(size-indication-mode)

;(setq default-frame-alist '((width . 80) (height . 55) (menu-bar-lines . 1))
;(setq default-frame-alist '((tool-bar-lines . 0)
;			    (menu-bar-lines . 1)
;			    (scroll-bar-width . 10)))

(if (not window-system) (menu-bar-mode 0))

(if (eq window-system 'ns)
    (progn
      (setq ns-command-modifier 'meta
            ;none means OS X gets to handle "option" for accent
            ;translations. "super" would let us use it as a "super" key.
            ;"none" is probably what you want.
            ;ns-option-modifier 'super
            ns-option-modifier 'none
            mouse-wheel-scroll-amount '(0.001))
      ;Inconsolata is really nice, but unfortunately it has few
      ;extended unicode characters available.
      ;(set-face-attribute 'default nil
      ;                    :family "inconsolata" :height 180)
      (set-face-attribute 'default nil
                          :family "menlo" :height 140)
      (set-face-attribute 'cursor nil
                           :background "red")
      (set-face-attribute 'mode-line nil
                           :background "goldenrod")
      ;; remove me -- does not seem to work
      ;(add-to-list 'default-frame-alist '(cursor-color . "red"))
      ;; remove me -- does not seem to work
      ;(set-face-background 'cursor "red")
      ;(set-cursor-color "red")
      ;; Was forced to do this to make sure color stays set!!!
      (add-hook 'after-make-frame-functions
		(lambda (frame)
		  (select-frame frame)
		  (set-cursor-color "red")))
      (set-face-attribute 'trailing-whitespace nil
                          :background "gray")
      (add-to-list 'default-frame-alist '(top . 0))
      ;(global-set-key "\C-c`" 'other-frame)
      ;(global-set-key "\C-c~" 'ns-prev-frame)
      (global-set-key "\C-cc" 'ns-copy-including-secondary)
      )
  )

(if (eq window-system 'x)
    (progn
      ;(set-default-font "Inconsolata-14")
      ; Probably should switch to dejavu, it is close to Menlo
      (set-face-attribute 'default nil
			  :family "inconsolata" :height 135)
      (set-face-attribute 'cursor nil
			  :background "red")
      (set-face-attribute 'trailing-whitespace nil
			  :background "pink")
      (setq default-frame-alist '((scroll-bar-width . 10)))))


;; custom theme


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(minimap-always-recenter t)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (jabber pdf-tools avy schrute mode-icons tabbar evil yasnippet yaml-mode web-mode vline sublimity sublime-themes speed-type smooth-scrolling smooth-scroll smartparens slack skewer-mode sicp sexy-monochrome-theme scss-mode scribble-mode screenshot rvm ruby-refactor ruby-compilation rubocop rspec-mode robe rainbow-mode rainbow-delimiters racket-mode projectile-rails powerline pollen-mode pastebin ox-twbs ox-reveal ox-ioslide ox-impress-js ox-html5slide org-tree-slide org-bullets nodejs-repl neotree multiple-cursors monokai-theme minimap magit lorem-ipsum js-comint indent-guide impatient-mode helm-projectile helm-ag grizzl god-mode geiser fountain-mode flx-ido expand-region epresent enh-ruby-mode emmet-mode eimp dumb-jump capture camcorder bufshow buffer-move auto-complete atom-one-dark-theme ag ace-jump-mode)))
 '(sublimity-scroll-weight 10))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((t (:background "DarkSlateGray4")))))


;; split window toggle

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x C-\\") 'toggle-window-split)
