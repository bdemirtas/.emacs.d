;;; ivy.module.el --- Ivy is a powerful alternative to the popular helm

;;; Commentary:

;; Ivy-related config.  This module contain Ivy configuration and related package.
;; like counsel and avy

;;; Code:

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-c a" . counsel-ag)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-file-jump)
         ("C-c l" . counsel-locate)
         :map minibuffer-local-map
         ("C-h" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^ !

(use-package counsel-ag-popup
  :after (counsel))

(use-package counsel-projectile
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1))

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d)")
  (ivy-mode 1))

;;; Ivy Posframe
(use-package ivy-posframe
  :ensure t
  :custom
  (ivy-posframe-height 20)
  (ivy-posframe-width 70)
  :config
  (setq ivy-posframe-parameters
        '((min-width . 100)
          (min-height . ,ivy-height)
          (left-fringe . 1)
          (right-fringe . 1)
          (internal-border-width . 10)))
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (ivy-posframe-mode 1))

(use-package company-posframe
  :disabled
  :if (and (window-system) (version<= "26.1" emacs-version))
  :hook (company-mode . company-posframe-mode))

;;; Hydra Posframe
(use-package hydra-posframe
  :disabled
  :if (and (window-system) (version<= "26.1" emacs-version))
  :hook (after-init . hydra-posframe-enable)
  :config
  (setq hydra-posframe-border-width 15))

;; Jump to things in Emacs tree-style
(use-package avy
  :ensure t
  :bind(("C-:" . avy-goto-word-1)
        :map isearch-mode-map
              ("C-'" . avy-isearch)))

(use-package ivy-hydra)
(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
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

(provide 'ivy.module)

;;; ivy.module.el ends here
