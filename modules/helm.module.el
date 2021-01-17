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
  :config
  (setq helm-move-to-line-cycle-in-source t
        helm-ff-file-name-history-use-recentf t
        helm-ff-newfile-prompt-p nil
        helm-ff-skip-boring-files t
        helm-ff-ido-style-backspace 'always
        helm-ff-auto-update-initial-value t
        helm-ff--auto-update-state t)
  (helm-mode 1))
(use-package helm-projectile)
(use-package helm-company)
(use-package helm-ag)
(use-package helm-swoop
  :bind(("C-s". 'helm-swoop)))
(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)
         ("C-h w" . helm-descbinds)))

(use-package helm-company
  :ensure t
  :config
  (progn
    (define-key company-mode-map (kbd "C-.") 'helm-company)
    (define-key company-active-map (kbd "C-.") 'helm-company)))

;; Turn on auto-composition mode for helm
;; When used from Lisp, using `nil' will turn _on_ the mode
(add-hook 'helm-major-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

(provide 'helm.module)
