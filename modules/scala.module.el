(use-package scala-mode
  :ensure t
  :init
  (setq comment-start "/* "
        comment-end " */"
        comment-style 'multi-line
        comment-empty-lines t)
; (setq prettify-symbols-alist scala-prettify-symbols-alist)
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

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  :pin melpa
  ;; Optional - enable lsp-mode automatically in scala files
  :hook (scala-mode . lsp)
  :config (setq lsp-prefer-flymake nil))

(use-package lsp-ui)

;; Add company-lsp backend for metals
(use-package company-lsp
  :pin melpa
  :ensure t
  :init (setq company-minimum-prefix-length 0 company-idle-delay 0.0))

(provide 'scala.module)
