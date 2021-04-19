;;; web.module.el --- Web development setup

;;; Commentary:

;;  Everything related to develeping a website configuration.

;;; Code:

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode)))

(use-package jq-mode)

(use-package json-reformat
  :commands json-reformat
  :init (setq json-reformat:indent-width 4)
  ;; :bind (("C-c C-J" . json-reformat-region))
  )

(use-package json-navigator)

(use-package json-mode
  :bind (:map json-mode-map
              (("C-c C-f" . json-pretty-print)
               ("C-c C-d" . nil))))

(use-package restclient-test
  :ensure t
  :after restclient
  :hook
  (restclient-mode-hook . restclient-test-mode))

(use-package ob-restclient
  :ensure t
  :after org restclient
  :init
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((restclient . t))))

(require 'restclient)
(require 'restclient-jq)
(provide 'web.module)

;;; web.module.el ends here
