;; yaml-mode
(use-package yaml-mode
  :mode ("\\.yml$" "\\.yaml$"))

;; Jenkins
(use-package jenkinsfile-mode
  :ensure t)

;; Docker
(use-package docker
  :bind ("C-c d" . docker))

(use-package dockerfile-mode
  :mode ("\\Dockerfile\\'" . dockerfile-mode))

(use-package elfeed
  :config
  (setq elfeed-feeds
      '("https://news.ycombinator.com/rss"))
  :commands (elfeed))

(global-set-key (kbd "C-x w") 'elfeed)

(provide 'utils.module)
