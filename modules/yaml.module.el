(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook #'yas-minor-mode)
  (add-hook 'yaml-mode-hook #'flycheck-mode))

(use-package ansible
  :ensure t
  :functions yaml-mode ansible-doc-mode ansible-doc ansible
  :mode ("\\.yml$" . my-ansible-minor-mode)
  :init
  (defun my-ansible-minor-mode ()
    "Activate ansible minor mode on top of yaml."
    (progn
      (yaml-mode)
      (ansible t)
      (ansible-doc-mode)))
  :config
  (use-package ansible-doc
    :ensure t
    :defines ansible-doc-mode-map
    :init
    :bind (:map ansible-doc-mode-map
                ("C-c ?" . nil)
                ("M-?" . ansible-doc))
    :delight ansible-doc-mode)
  :delight ansible)

(provide 'yaml.module)
