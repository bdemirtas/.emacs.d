;;; autocomplete.module.el --- Autocomplete setup
;; Enable nice rendering of diagnostics like compile errors.

;;; Commentary:

;;  This module contain every package related to autocomplete functions.

;;; Code:

(use-package lsp-mode
  :pin melpa
  :config (setq lsp-prefer-flymake nil))

(use-package lsp-ui)

;; Add company-lsp backend for metals
(use-package company-lsp
  :pin melpa
  :ensure t
  :config
  :after company
  (setq company-lsp-cache-candidates t
        company-lsp-async t)
  :init (setq company-minimum-prefix-length 0 company-idle-delay 0.0))

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

;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq company-box-backends-colors nil
;;         company-box-show-single-candidate t
;;         company-box-max-candidates 50
;;         company-box-enable-icon nil
;;         company-box-doc-delay 0.5))

(use-package company-restclient
  :ensure t
  :config
  (add-to-list 'company-backends 'company-restclient))

(use-package company-posframe
  :ensure t
  :after (company posframe)
  :init (company-posframe-mode 1))

(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)

(provide 'autocomplete.module)

;;; autocomplete.module.el ends here
