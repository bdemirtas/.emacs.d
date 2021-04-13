;;; popper.module.el --- Popper setup

;;; Commentary:

;; Popper is a minor mode that manage buffers without messing up with the actual window configuration

(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          help-mode
          compilation-mode))
  (popper-mode +1))

(provide 'popper.module)

;;; popper.module.el ends here
