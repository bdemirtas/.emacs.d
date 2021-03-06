;;; parens.module.el --- Parenthesis setup

;;; Commentary:

;;  Parenthesis configuration for a better handling.

;;; Code:

(use-package rainbow-delimiters
  :ensure t
  :config
  (defvar on-mode-hooks
  '(emacs-lisp-mode-hook python-mode-hook js2-mode-hook shell-mode-hook shell-script-mode-hook sh-mode cider-repl-mode-hook))
  (defun enable-rainbow-delimiters (mode-hook)
    "Enable rainbow delimiters in MODE-HOOK."
    (add-hook mode-hook #'rainbow-delimiters-mode))
  (mapc 'enable-rainbow-delimiters on-mode-hooks))

(use-package smartparens-config
  :ensure smartparens
  :functions sp-local-pair
  :init
  (add-hook 'minibuffer-setup-hook #'turn-on-smartparens-strict-mode)
  :config
  (show-smartparens-global-mode t)
  (smartparens-global-mode t)
  (sp-use-smartparens-bindings)
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
  :delight smartparens-mode)

(defun indent-between-pair (&rest _ignored)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-local-pair 'prog-mode "{" nil :post-handlers '((indent-between-pair "RET")))
(sp-local-pair 'prog-mode "[" nil :post-handlers '((indent-between-pair "RET")))
(sp-local-pair 'prog-mode "(" nil :post-handlers '((indent-between-pair "RET")))

(provide 'parens.module)

;;; parens.module.el ends here
