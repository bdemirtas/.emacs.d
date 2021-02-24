(package-initialize)
(setq use-package-always-ensure t)

;; Check if system is Darwin/macOS
(defun is-macos ()
  (string-equal system-type "darwin"))
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (add-to-list 'exec-path "/usr/local/bin/")
  (add-to-list 'exec-path "/usr/bin/")
  (add-to-list 'exec-path "/Library/TeX/texbin/")


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

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; I don't care about auto save and backup files.
(setq
 make-backup-files nil  ; stop creating backup~ files
 auto-save-default nil  ; stop creating #autosave# files
 create-lockfiles nil)  ; stop creating .# files

;; Delete trailing spaces and add new line in the end of a file on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

;; Ensure correct indentation for use-package.
(put 'use-package 'lisp-indent-function 1)

;; Save customize in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(use-package no-littering)

(use-package delight
  :ensure t
  :config
  (delight 'visual-line-mode))

(use-package bind-key) ;; to use :bind

(use-package which-key
  :config
  (add-hook 'after-init-hook 'which-key-mode))

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode))


(require 'python.module)
(require 'web.module)
(require 'java.module)
(require 'scala.module)
(require 'utils.module)
(require 'org.module)
(require 'sx.module)
(require 'tree.module)
(require 'core.module)
(require 'handy-functions)
(require 'key-bindings.module)

(provide 'init)

;;; init ends here
