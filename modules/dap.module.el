;;; dap.module.el --- DAP setup

;;; Commentary:
;;  debugger configration


(use-package dap-mode
  :after lsp-mode
  :config (dap-auto-configure-mode))

(provide 'dap.module)

;;; dap.module.el ends here
