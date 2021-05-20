
;;; hydra.module.el --- Hydra setup

;;; Commentary:
;;  Hydra configuration

(use-package hydra
    :ensure t
    :config
    (setq hydra-is-helpful t)
    (setq hydra-hint-display-type 'lv))

(provide 'hydra.module)

;;; hydra.module.el ends here
