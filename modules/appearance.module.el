(global-font-lock-mode t)
(set-default 'show-trailing-whitespace t)
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; Change font
(set-frame-font "Roboto Mono" nil t)
;; fill-column influences how Emacs justifies paragraphs
(setq-default fill-column 79)
;; show both line and column number by default
(setq column-number-mode t)
(setq line-number-mode t)
;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
;; Turn beep off
(setq visible-bell nil)
;; Ask for 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)

;; Never use tabs, use spaces instead.
(setq-default
 indent-tabs-mode nil
 tab-width 4)

(setq
 tab-width 2
 js-indent-level 2
 css-indent-offset 2
 python-indent-offset 4)

;; always full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package dash :ensure t)

(use-package diminish :ensure t)

(use-package doom-themes
  :defer t
  :init (load-theme 'doom-dracula t))

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode))

(provide 'appearance.module)
