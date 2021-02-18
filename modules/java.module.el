(use-package lsp-java
  :defer t
  :init
  (add-hook 'java-mode-hook #'lsp))

(use-package meghanada
  :defer t
  :config
  (add-hook 'meghanada-mode-hook #'flycheck-mode)
)
(use-package company-lsp
  :after  company
  :ensure t
  :config
  (setq company-lsp-cache-candidates t
        company-lsp-async t))

(use-package java-snippets
  :ensure t)

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(require 'dap-java)

(provide 'java.module)
