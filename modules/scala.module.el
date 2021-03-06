;;; scala.module.el --- Scala setup

;;; Commentary:

;;  Scala related confiration.

;;; Code:

;; Add metals backend for lsp-mode

;; Add metals backend for lsp-mode
(use-package lsp-metals
  :after lsp-mode
  :config (setq lsp-metals-treeview-show-when-views-received t))

(use-package scala-mode
  :after java-mode
  :config
  (require 'dap-java)
  :interpreter
  ("scala" . scala-mode))

(global-set-key (kbd "C-c S") #'sbt-hydra)

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(add-hook 'sbt-mode-hook (lambda ()
                           (add-hook 'before-save-hook 'sbt-hydra:check-modified-buffers)))
(provide 'scala.module)

;;; scala.module.el ends here
