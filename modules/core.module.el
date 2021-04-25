;;; core.module.el --- Loading my configuration core modules

;;; Commentary:

;;  Modules here are the core one one and can't be removed. Optional module are loading in init.

;;; Code:

(use-package posframe)

(use-package prescient
  :diminish)

;; Jump to things in Emacs tree-style
(use-package avy
  :ensure t
  :bind(("C-." . avy-goto-word-1)
        :map isearch-mode-map
        ("C-'" . avy-isearch)))

(use-package swiper
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("C-SPC" . ivy-restrict-to-matches))
  :init
  (ivy-mode 1)
  :config
  (setq ivy-count-format "(%d/%d) "
        ivy-display-style 'fancy
        ivy-height 4
        ivy-use-virtual-buffers t
        ivy-initial-inputs-alist () ;; http://irreal.org/blog/?p=6512
        enable-recursive-minibuffers t))

(use-package general
    :init
    (setq general-override-states '(insert
				    emacs
				    hybrid
				    normal
				    visual
				    motion
				    operator
				    replace)))

(use-package no-littering)
(use-package delight
  :config
  (delight 'visual-line-mode))
(use-package bind-key)
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(provide 'core.module)

;;; core.module.el ends here
