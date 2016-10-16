;; Package Management

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Ace Jump Mode

(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

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


;; flx-ido

;; (require 'flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights.
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)

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


;; sublimity

(require 'sublimity)
(require 'sublimity-scroll)

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

(setq geiser-racket-binary "/usr/local/bin/Racket")
(add-to-list 'load-path "/usr/local/bin/Racket")

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

;; custom theme

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("42ba25fad91db26bfa0130161412d49804ff27e6a09bf45f1a8268511300d981" "1160f5fc215738551fce39a67b2bcf312ed07ef3568d15d53c87baa4fd1f4d4e" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "59171e7f5270c0f8c28721bb96ae56d35f38a0d86da35eab4001aebbd99271a8" default)))
 '(fci-rule-color "#20240E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (bufshow eimp epresent ox-twbs ox-ioslide ox-html5slide ox-impress-js ox-reveal rainbow-mode god-mode slack sexy-monochrome-theme ruby-compilation ruby-refactor rubocop pollen-mode yaml-mode rspec-mode scribble-mode yasnippet websocket web-mode sublimity sublime-themes speed-type smooth-scrolling smooth-scroll smartparens skewer-mode sicp scss-mode rvm robe rainbow-delimiters racket-mode projectile-rails powerline pastebin org-tree-slide org-bullets nodejs-repl neotree multiple-cursors monokai-theme minimap magit lorem-ipsum js-comint indent-guide impatient-mode helm-projectile helm-ag grizzl geiser fountain-mode flx-ido expand-region enh-ruby-mode emmet-mode dumb-jump buffer-move auto-complete atom-one-dark-theme ag ace-jump-mode)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
