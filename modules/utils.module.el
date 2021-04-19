;;; utils.module.el --- Various packages setup

;;; Commentary:

;;  Various packages config. Packages here aren't worth to be in a single module by itself.

;;; Code:

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

(use-package helpful
  :ensure t
  :bind
  ("C-h f" . helpful-function)
  ("C-h F" . helpful-command)
  ("C-h v" . helpful-variable)
  ("C-h o" . helpful-symbol))

(use-package dotenv-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode)))

;; yaml-mode
(use-package yaml-mode
  :mode ("\\.yml$" "\\.yaml$"))

;; Jenkins
(use-package jenkinsfile-mode
  :ensure t)

;; Docker
(use-package docker
  :bind ("C-c C-d" . docker))

(use-package dockerfile-mode
  :mode ("\\Dockerfile\\'" . dockerfile-mode))

(use-package elfeed
  :config
  (setq elfeed-feeds
      '("https://news.ycombinator.com/rss"))
  :commands (elfeed))

(global-set-key (kbd "C-x w") 'elfeed)

(provide 'utils.module)

;;; utils.module.el ends here
