(use-package pyvenv
  :demand
  :config
  (pyvenv-mode 1))

(use-package blacken
  :ensure t
  :delight
  :bind
    (("C-c =" . blacken-buffer)))

(use-package py-isort
  :after python
  :hook ((python-mode . pyvenv-mode)
         (before-save . py-isort-before-save)))

(defun pyvenv-autoload ()
          (interactive)
          "auto activate venv directory if exists"
          (f-traverse-upwards (lambda (path)
              (let ((venv-path (f-expand ".env" path)))
              (when (f-exists? venv-path)
              (pyvenv-activate venv-path))))))

(add-hook 'python-mode-hook 'pyvenv-autoload)


(use-package anaconda-mode
  :ensure t
  :commands anaconda-mode
  :diminish anaconda-mode
  :hook python-mode)

(use-package company-anaconda
  :after (anaconda-mode company)
  :config (add-to-list 'company-backends 'company-anaconda))

(provide 'python.module)
