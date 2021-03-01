
;;; hydra.module.el --- Hydra setup

;;; Commentary:
;;  Hydra configuration

(use-package hydra
    :ensure t
    :config
    (setq hydra-is-helpful t)
    (setq hydra-hint-display-type 'lv))

;; for reference when I learn hydra better
;; gives access to functions that make nice hydra UI
(use-package pretty-hydra
   :disabled
   :ensure t
   :requires hydra)
;; http://www.masteringemacs.org/articles/2014/02/28/my-emacs-keybindings/

(provide 'hydra.module)

;;; hydra.module.el ends here
