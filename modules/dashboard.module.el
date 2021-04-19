;;; dashboard.module.el --- Dashboard setup

;;; Commentary:
;;  dashboard configurationS


(use-package dashboard
  :custom
  (dashboard-item-shortcuts '((recents . "r")
                              (projects . "p")))
  (dashboard-items '((recents  . 10)
                     (projects . 5)
                     ))
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'my/dashboard-banner)
  :config
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-startup-banner 'nil)
  (dashboard-setup-startup-hook))


(provide 'dashboard.module)

;;; dashboard.module.el ends here
