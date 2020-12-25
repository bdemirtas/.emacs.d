(use-package helm
  :delight
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-c C-l" . helm-minibuffer-history)
         ("C-c o" . helm-projectile-switch-project)
         ("C-c i" . helm-projectile-ag)
         ("C-x c t" . helm-top)
         ("C-," . helm-mini))
  :config (helm-mode 1))
(use-package helm-projectile)
(use-package helm-company)
(use-package helm-ag)
(use-package helm-swoop)
(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

;; Turn on auto-composition mode for helm
;; When used from Lisp, using `nil' will turn _on_ the mode
(add-hook 'helm-major-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

(provide 'helm.module)
