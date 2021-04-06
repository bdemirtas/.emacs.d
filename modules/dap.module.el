;;; dap.module.el --- DAP setup

;;; Commentary:
;;  debugger configration


(use-package dap-mode
    :init
    :commands (dap-mode)
    :hook ((python-mode) . dap-mode)
    :hook ((java-mode) . dap-mode)
    :hook ((scala-mode) . dap-mode)
    :config
    (require 'dap-hydra)
    (add-hook 'dap-mode-hook
	      (lambda ()
		(dap-ui-mode 1)
		(dap-tooltip-mode 1)))
    (require 'dap-python))

(provide 'dap.module)

;;; dap.module.el ends here
