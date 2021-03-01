;;; autocomplete.module.el --- Autocomplete setup

;;; Commentary:

;;  This module contain every package related to autocomplete functions.

;;; Code:


(use-package company
 :ensure t
 :config
 (setq company-idle-delay 0
       ; company-minimum-prefix-length 2
       company-show-numbers t
       company-tooltip-limit 10
       company-tooltip-align-annotations t
       ;; invert the navigation direction if the the completion popup-isearch-match
       ;; is displayed on top (happens near the bottom of windows)
       company-tooltip-flip-when-above t)
 (global-company-mode t))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-backends-colors nil
        company-box-show-single-candidate t
        company-box-max-candidates 50
        company-box-enable-icon nil
        company-box-doc-delay 0.5))

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

(use-package company-posframe
  :ensure t
  :after (company posframe)
  :init (company-posframe-mode 1))

(use-package ejc-company
:ensure nil
:after
ejc-sql-mode
:config
(add-to-list (make-local-variable 'company-backends)
			 '(ejc-company-backend)))

(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)

(provide 'autocomplete.module)

;;; autocomplete.module.el ends here
