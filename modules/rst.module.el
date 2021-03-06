;;; rst.module.el --- RST setup

;;; Commentary:

;;  RST format is the most have with markdown format.

;;; Code:

(use-package rst
  :functions sp--rst-skip-asterisk
  :init
  (add-hook 'rst-mode-hook #'auto-fill-mode)
  (add-hook 'rst-mode-hook #'ws-butler-mode)
  :config
  (defun sp--rst-skip-asterisk (ms mb me)
    (save-excursion
      (goto-char mb)
      (save-match-data (looking-at "^\\* "))))
  (sp-with-modes 'rst-mode
    (sp-local-pair "*" "*"
                   :wrap "C-*"
                   :unless '(sp-point-after-word-p sp-point-at-bol-p)
                   :post-handlers '(("[d1]" "SPC"))
                   :skip-match 'sp--rst-skip-asterisk)
    (sp-local-pair "``" "``")
    (sp-local-pair "**" "**")
    (sp-local-pair "_" "_" :wrap "M-_" :unless '(sp-point-after-word-p))))

(provide 'rst.module)

;;; rst.module.el ends here
