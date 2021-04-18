;;; python.module.el --- Python setup

;;; Commentary:

;;  Python configuration. This module contain package to auto activated the virtualenv.
;;  Looking for .env and also autocomplete including with black formatter.

;;; Code:

(use-package pip-requirements)

(use-package pyvenv
  :demand
  :config
  (pyvenv-mode 1))

(use-package blacken
  :ensure t
  :delight
  :bind
    (("C-c =" . blacken-buffer)))

(defun pyvenv-autoload ()
          (interactive)
          "auto activate venv directory if exists"
          (f-traverse-upwards (lambda (path)
              (let ((venv-path (f-expand "venv" path)))
              (when (f-exists? venv-path)
              (pyvenv-activate venv-path))))))

(add-hook 'python-mode-hook 'pyvenv-autoload)

(use-package lsp-pyright
  :hook
  (python-mode . (lambda ()
                   (require 'lsp-pyright)
                   (lsp-deferred))))

(use-package python-mode
  :ensure t
  :hook
  (python-mode . lsp-deferred)
  (python-mode . pyvenv-mode)
  (python-mode . company-mode)
  (python-mode . yas-minor-mode)
  :custom
  (dap-pythonpi-debugger 'debugpy)
  (python-shell-interpreter "python3")
  :config
  )

(use-package python-pytest
  :after python-mode
  :ensure t
  :bind (:map python-mode-map ("C-c t" . python-pytest-dispatch)))

(provide 'python.module)

;;; python.module.el ends here
