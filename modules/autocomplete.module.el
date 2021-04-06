;;; autocomplete.module.el --- Autocomplete setup

;;; Commentary:

;;  This module contain every package related to autocomplete functions.

;;; Code:

(use-package company
  :diminish company-mode
  :bind (:map company-active-map
              ("<tab>"  . nil)
              ("TAB"    . nil)
              ("C-d"    . company-show-doc-buffer)
              ("C-t"    . company-complete)
              ("C-l"    . company-show-location)
              ("C-n"    . company-select-next)
              ("C-p"    . company-select-previous)
              ([return] . company-complete-selection)
              ("C-w"    . backward-kill-word)
              ("C-g"    . company-abort)
              ("C-c"    . company-search-abort)
              ("<tab>"  . complete-or-indent)
              ("C-s"    . company-search-candidates)
              ("C-o"    . company-search-toggle-filtering))
  (:map lsp-mode-map
        ("M-<tab>" . company-indent-or-complete-common))
  :config
  (use-package company-posframe
    :hook (company-mode . company-posframe-mode))
  (setq company-idle-delay 0.5
        company-tooltip-limit 15
        company-minimum-prefix-length 0
        company-tooltip-align-annotations t))

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1)
  (prescient-persist-mode)
  )

(use-package company-restclient
  :ensure t
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(use-package company-web
  :after web-mode
  :config
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  :hook (web-mode . company-mode))

(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)

(provide 'autocomplete.module)

;;; autocomplete.module.el ends here
