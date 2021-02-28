;;; lsp-module.el --- lsp setup

;;; Commentary:

;; lsp configuration for most language

;;; Code:


(use-package lsp-mode
  :defer t
  :commands lsp
  :hook (((js2-mode json-mode rjsx-mode typescript-mode
		    css-mode html-mode web-mode vue-mode
		    java-mode
            scala-mode
		    ) . lsp)
	 (lsp-mdoe . lsp-enable-which-key-integration))
  :config
  (setq lsp--document-symbols-request-async t
	lsp-enable-snippet nil))

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-ivy
  :after lsp-mdoe)


(provide 'lsp.module)

;;; lsp.module.el ends here
