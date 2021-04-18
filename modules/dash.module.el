;;; dash.module.el --- Dash is a tool to get major framework documentations offline

;;; Commentary:

;;  Counsel-Dash

;;; Code:

(use-package dash-docs
  :ensure t
  :config
  (setq dash-docs-enable-debugging nil))

(use-package counsel-dash
	:config
    (setq counsel-dash-min-length 3)
		(setq counsel-dash-common-docsets '())
		(setq counsel-dash-docsets-path "~/.docsets")
		(setq counsel-dash-browser-func 'browse-url)
		(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
		(add-hook 'go-mode-hook (lambda () (setq-local counsel-dash-docsets '("Go"))))
		(add-hook 'rust-mode-hook (lambda () (setq-local counsel-dash-docsets '("Rust"))))
		(add-hook 'scala-mode-hook (lambda () (setq-local counsel-dash-docsets '("Scala"))))
		(add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3", "Django", "FlaskS")))))

(provide 'dash.module)

;;; dash.module.el ends here
