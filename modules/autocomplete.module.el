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

(use-package helm-company
  :ensure t
  :config
  (progn
    (define-key company-mode-map (kbd "C-.") 'helm-company)
    (define-key company-active-map (kbd "C-.") 'helm-company)))

(use-package company-box
  :defer t
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-backends-colors nil
        company-box-show-single-candidate t
        company-box-max-candidates 50
        company-box-enable-icon nil
        company-box-doc-delay 0.5))

(use-package company-posframe
  :after (company posframe)
  :init (company-posframe-mode 1))

(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(setq tab-always-indent 'complete)

(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))

(provide 'autocomplete.module)
