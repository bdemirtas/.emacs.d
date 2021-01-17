(setq inhibit-startup-screen t)

(require 'appearance.module)
(require 'buffer.module)
(require 'autocomplete.module)
(require 'ivy.module)
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

(use-package ivy-yasnippet
  :bind ("C-c C-y" . ivy-yasnippet))

(use-package flycheck
  :ensure t)

(use-package helpful
  :ensure t
  :bind
  ("C-h f" . helpful-function)
  ("C-h F" . helpful-command)
  ("C-h v" . helpful-variable)
  ("C-h o" . helpful-symbol))


(require 'vcs.module)
(require 'sql.module)

(provide 'core.module)
