(use-package projectile
  :init (setq projectile-enable-caching t)
  :custom
  (projectile-indexing-method 'alien)
  :ensure t
  :functions projectile-project-name projectile-mode
  :config
  (projectile-mode)
  (helm-projectile-on)
  (add-to-list 'projectile-globally-ignored-directories "elpa")
  (add-to-list 'projectile-globally-ignored-directories ".cache")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "anaconda-mode")
  (add-to-list 'projectile-globally-ignored-directories "var")
  (add-to-list 'projectile-globally-ignored-directories ".DS_Store")
    (projectile-global-mode 1)
  (setq
   projectile-mode-line-function #'(lambda () (format " [%s]" (projectile-project-name)))
   projectile-enable-caching t
   projectile-file-exists-remote-cache-expire nil)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :bind (:map projectile-command-map
              ("s s" . helm-projectile-ag)))

(provide 'project.module)
