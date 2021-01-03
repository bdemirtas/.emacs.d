(global-font-lock-mode t)
(set-default 'show-trailing-whitespace t)
(global-set-key (kbd "C-c w") 'whitespace-mode)
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

(use-package dash :ensure t)

(use-package diminish :ensure t)

(use-package cyberpunk-theme
  :defer t
  :init (load-theme 'cyberpunk t))

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode))

(provide 'appearance.module)
