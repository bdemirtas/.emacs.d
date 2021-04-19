;;; lsp-module.el --- lsp setup

;;; Commentary:

;; lsp configuration for most language

;;; Code:

(use-package lsp-pyright
  :after lsp-mode
  :custom
  (lsp-pyright-auto-import-completions nil)
  (lsp-pyright-typechecking-mode "off")
  :hook
  (python-mode . (lambda ()
                   (require 'lsp-pyright)
                   (lsp-deferred))))

(use-package lsp-mode
    :defer t
    :init
    (defhydra hydra-lsp (:exit t :hint nil)
      "
   Buffer^^               Server^^                   Symbol
  -------------------------------------------------------------------------------------
   [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
   [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
   [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature       [_l_] display symbols"
      ("d" lsp-find-declaration)
      ("D" lsp-ui-peek-find-definitions)
      ("R" lsp-ui-peek-find-references)
      ("i" lsp-ui-peek-find-implementation)
      ("t" lsp-find-type-definition)
      ("s" lsp-signature-help)
      ("o" lsp-describe-thing-at-point)
      ("r" lsp-rename)
      ("l" lsp-treemacs-symbols)

      ("f" lsp-format-buffer)
      ("m" lsp-ui-imenu)
      ("x" lsp-execute-code-action)

      ("M-s" lsp-describe-session)
      ("M-r" lsp-restart-workspace)
      ("S" lsp-shutdown-workspace))
    :general
    (lsp-mode-map "C-c h" 'hydra-lsp/body)
    :config
    (setq lsp-prefer-flymake nil)
    :hook
    (lsp-mode . lsp-enable-which-key-integration)
    :custom
    (lsp-auto-guess-root t)
    (lsp-enable-snippet t)
    (lsp-keymap-prefix "M-m l")
    (lsp-modeline-diagnostics-enable nil)
    (lsp-keep-workspace-alive nil)
    (lsp-auto-execute-action nil)
    (lsp-before-save-edits nil)
    (lsp-eldoc-enable-hover nil)
    (lsp-diagnostic-package :none)
    (lsp-completion-provider :none)
    (lsp-file-watch-threshold 20000)  ; pyright has more than 1000
    (lsp-enable-links nil)
    (lsp-diagnostics-provider :capf)
    (lsp-headerline-breadcrumb-enable t)
    (lsp-headerline-breadcrumb-segments '(project file symbols))
    (lsp-lens-enable nil)
    (lsp-disabled-clients '((python-mode . pyls)))
    :commands lsp-mode)

(use-package
  lsp-treemacs
  :ensure t
  :commands lsp-treemacs
  :config (lsp-treemacs-sync-mode 1))

(use-package lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-sideline-delay 0.5
        lsp-ui-doc-delay 0.5
        lsp-ui-peek-always-show t
        lsp-ui-peek-fontify 'always
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable nil
        lsp-ui-flycheck-live-reporting nil
        lsp-ui-peek-enable t)
  :commands lsp-ui-mode
  :preface
    (defun ladicle/toggle-lsp-ui-doc ()
      (interactive)
      (if lsp-ui-doc-mode
        (progn
          (lsp-ui-doc-mode -1)
          (lsp-ui-doc--hide-frame))
         (lsp-ui-doc-mode 1)))
  :bind
  (:map lsp-mode-map
        ("C-c C-r" . lsp-ui-peek-find-references)
        ("C-c C-j" . lsp-ui-peek-find-definitions)
        ("C-c i"   . lsp-ui-peek-find-implementation)
        ("C-c m"   . lsp-ui-imenu)
        ("C-c s"   . lsp-ui-sideline-mode)
        ("C-c d"   . ladicle/toggle-lsp-ui-doc))
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-ivy
  :after lsp-mode)

(setq lsp-inhibit-message t)

(provide 'lsp.module)

;;; lsp.module.el ends here
