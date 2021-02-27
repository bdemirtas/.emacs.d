;;; java.module.el --- Java setup

;;; Commentary:
;;  Java-related config.  This module contain autocomplete features for Java.

;;; Code:

(use-package lsp-java
  :defer t
  :after lsp-mode
  :init
  (add-hook 'java-mode-hook #'lsp))

(use-package meghanada
  :defer t
  :config
  (add-hook 'meghanada-mode-hook #'flycheck-mode)
)

(use-package java-snippets)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(require 'dap-java)

(provide 'java.module)

;;; java.module.el ends here
