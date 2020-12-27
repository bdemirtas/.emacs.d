(use-package org
  :hook (org-mode . bf/org-mode-setup)
  :config
  (setq org-ellipsis "⮟")
  (setq org-hide-emphasis-markers t)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))
(require 'use-package)

(provide 'org.module)
