;; Package Management

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Custom theme

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("59171e7f5270c0f8c28721bb96ae56d35f38a0d86da35eab4001aebbd99271a8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-13"))

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

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; js2-mode

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'nodejs-repl)
(require 'js-comint)
(add-to-list 'load-path "/usr/local/bin/node")

;; org bullets

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
