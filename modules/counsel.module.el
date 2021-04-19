;;; counsel.module.el --- Counsel setup

;;; Commentary:
;;

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-c C-r" . ivy-resume)
         ("C-x C-f" . counsel-find-file)
         ("C-c a" . counsel-ag)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c l" . counsel-locate)
         :map minibuffer-local-map
         ("C-h" . 'counsel-minibuffer-history))
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^ !

(use-package counsel-ag-popup
  :after (counsel))

(use-package counsel-projectile
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1))

(use-package counsel-dash
	:config
    (setq counsel-dash-min-length 3)
		(setq counsel-dash-common-docsets '())
		(setq counsel-dash-docsets-path "~/.docsets")
		(setq counsel-dash-browser-func 'browse-url)
		(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
		(add-hook 'go-mode-hook (lambda () (setq-local counsel-dash-docsets '("Go"))))
		(add-hook 'rust-mode-hook (lambda () (setq-local counsel-dash-docsets '("Rust"))))
		(add-hook 'scala-mode-hook (lambda () (setq-local counsel-dash-docsets '("Scala"))))
		(add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3", "Django", "FlaskS")))))

(use-package counsel-jq
  :after json-mode
  :bind (:map json-mode-map ("C-c C-s" . counsel-jq)))

(provide 'counsel.module)

;;; counsel.module.el ends here
