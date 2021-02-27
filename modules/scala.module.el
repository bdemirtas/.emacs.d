;;; scala.module.el --- Scala setup

;;; Commentary:

;;  Scala related confiration.

;;; Code:

(use-package scala-mode
  :init
  (add-hook 'scala-mode-hook #'lsp)
  (prettify-symbols-mode))

;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(provide 'scala.module)

;;; scala.module.el ends here
