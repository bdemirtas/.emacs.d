;;; lsp-module.el --- lsp setup

;;; Commentary:

;; lsp configuration for most language

;;; Code:


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  :custom
  (lsp-auto-guess-root t)
  (lsp-keymap-prefix "M-m l")
  (lsp-modeline-diagnostics-enable nil)
  (lsp-keep-workspace-alive nil)
  (lsp-auto-execute-action nil)
  (lsp-before-save-edits nil)
  (lsp-eldoc-enable-hover nil)
  (lsp-diagnostic-package :none)
  (lsp-completion-provider :none)
  (lsp-file-watch-threshold 1500)  ; pyright has more than 1000
  (lsp-enable-links nil)
  (lsp-diagnostics-provider :capf)
  (lsp-headerline-breadcrumb-enable t)
  (lsp-headerline-breadcrumb-segments '(project file symbols))
  (lsp-lens-enable nil)
  (lsp-disabled-clients '((python-mode . pyls)))
  :init
  :config
  )

(use-package
  lsp-treemacs
  :ensure t
  :commands lsp-treemacs
  :config (lsp-treemacs-sync-mode 1))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-position 'top)
  (lsp-ui-sideline-delay 0.5)
  (lsp-ui-doc-delay 0.5)
  (lsp-ui-peek-always-show t)
  (lsp-ui-peek-fontify 'always)
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-ivy
  :after lsp-mode)

(setq lsp-inhibit-message t)

(provide 'lsp.module)

;;; lsp.module.el ends here
