(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-company-mode)

  (use-package company-quickhelp
    :ensure t
    :config (company-quickhelp-mode))

  (setq company-tooltip-align-annotations t ; Align annotations to the right hand side
        company-dabbrev-downcase nil        ; Do not downcase candidates
        )

  :delight company-mode
  :bind ("M-SPC" . company-complete))

(use-package helm-company
  :ensure t
  :config
  (progn
    (define-key company-mode-map (kbd "C-.") 'helm-company)
    (define-key company-active-map (kbd "C-.") 'helm-company)))

(provide 'autocomplete.module)
