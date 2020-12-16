(use-package projectile
  :ensure t
  :functions projectile-project-name projectile-mode
  :config
  (projectile-mode)
  (helm-projectile-on)
  (setq
   projectile-mode-line-function #'(lambda () (format " [%s]" (projectile-project-name)))
   ;; Disable remote files cache
   projectile-file-exists-remote-cache-expire nil)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :bind (:map projectile-command-map
              ("s s" . helm-projectile-ag)))

(provide 'project.module)
