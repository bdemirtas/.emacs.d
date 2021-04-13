;;; dash.module.el --- Dash is a tool to get major framework documentations offline

;;; Commentary:

;;  Counsel-Dash

;;; Code:

(use-package counsel-dash
  :after counsel
  :ensure t
  :config
  (setq dash-docs-common-docsets '("Java" "Python 3" "Rust" "React", "Scala", "Elixir", "Django")))

(provide 'dash.module)

;;; dash.module.el ends here
