;;; autocomplete.module.el --- Autocomplete setup

;;; Commentary:

;;  This module contain every package related to autocomplete functions.

;;; Code:

(use-package company
  :diminish company-mode
  :bind (:map company-active-map
              ("<tab>" . nil)
              ("TAB" . nil)
              ("M-<tab>" . company-complete-common-or-cycle)
              ("M-<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("M-<tab>" . company-indent-or-complete-common))
  :config
  (setq company-idle-delay 0
        company-tooltip-limit 10
        company-minimum-prefix-length 0
        company-tooltip-align-annotations t)
  (global-company-mode t))

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1)
  (prescient-persist-mode)
  )

(use-package company-lsp
  :commands company-lsp
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends)
  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil))

(use-package company-restclient
  :ensure t
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)

(provide 'autocomplete.module)

;;; autocomplete.module.el ends here
