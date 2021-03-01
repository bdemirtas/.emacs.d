;;; java.module.el --- Java setup

;;; Commentary:
;;  Java-related config.  This module contain autocomplete features for Java.

;;; Code:

(use-package lsp-java
  :defer t
  :after lsp-mode
  :init
  (add-hook 'java-mode-hook #'lsp))

(use-package dap-java
  :ensure nil
  :after (lsp-java))

(use-package meghanada
  :defer t
  :config
  (add-hook 'meghanada-mode-hook #'flycheck-mode)
)

(use-package java-snippets)

(require 'lsp-java-boot)
;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(provide 'java.module)

;;; java.module.el ends here
