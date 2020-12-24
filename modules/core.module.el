(setq inhibit-startup-screen t)

(require 'appearance.module)
(require 'buffer.module)
(require 'autocomplete.module)
(require 'helm.module)
(require 'project.module)
(require 'parens.module)

(use-package yasnippet
  :ensure t
  :functions yas-reload-all
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-global-mode 1)
  :delight yas-minor-mode)

(use-package flycheck
  :ensure t)

(require 'vcs.module)
(require 'sql.module)

(provide 'core.module)
