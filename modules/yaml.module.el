;;; yaml.module.el --- Yaml setup

;;; Commentary:

;;  Yaml config.

;;; Code:

(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook #'yas-minor-mode)
  (add-hook 'yaml-mode-hook #'flycheck-mode))

(provide 'yaml.module)

;;; yaml.module.el ends here
