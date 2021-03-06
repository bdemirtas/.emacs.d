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
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^ !

(use-package ivy-xref
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package ivy-prescient
  :after counsel
  :init
  (ivy-prescient-mode)
  (prescient-persist-mode)
  )
(use-package prescient
  :diminish
  :config
  )
(use-package counsel-ag-popup
  :after (counsel))

(use-package counsel-projectile
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1))

(use-package ivy
  :config
  ;; (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d)")
  (ivy-mode 1))

(add-to-list 'ivy-height-alist
             (cons 'counsel-find-file
                   (lambda (_caller)
                     (/ (frame-height) 2))))

(setq ivy-height-alist
      '((t
         lambda (_caller)
         (/ (frame-height) 2))))
(defun ivy-resize--minibuffer-setup-hook ()
  "Minibuffer setup hook."
  (add-hook 'post-command-hook #'ivy-resize--post-command-hook nil t))

(defun ivy-resize--post-command-hook ()
  "Hook run every command in minibuffer."
  (when ivy-mode
    (shrink-window (1+ ivy-height))))  ; Plus 1 for the input field.

(add-hook 'minibuffer-setup-hook 'ivy-resize--minibuffer-setup-hook)

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
