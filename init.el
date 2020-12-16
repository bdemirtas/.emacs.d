(package-initialize)
(setq use-package-always-ensure t)

(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))


(add-to-list 'load-path (concat user-emacs-directory "modules"))

;; update packages list if we are on a new install
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)


;; Ensure correct indentation for use-package.
(put 'use-package 'lisp-indent-function 1)

(use-package delight
  :ensure t
  :config
  (delight 'visual-line-mode))

(use-package bind-key) ;; to use :bind

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode))


(require 'core.module)
(require 'python.module)
