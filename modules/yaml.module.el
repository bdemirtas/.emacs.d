(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook #'yas-minor-mode)
  (add-hook 'yaml-mode-hook #'flycheck-mode))

(provide 'yaml.module)
