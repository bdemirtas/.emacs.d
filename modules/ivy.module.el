;;; ivy.module.el --- Ivy is a powerful alternative to the popular helm

;;; Commentary:

;; Ivy-related config.  This module contain Ivy configuration.
;;

;;; Code:

(use-package ivy
  :config
  ;; (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d)")
  (ivy-mode 1))

(use-package ivy-xref
  :after ivy
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package ivy-rich
  :after (ivy counsel)
  :init
  (ivy-rich-mode 1))

(use-package ivy-prescient
  :after (ivy counsel)
  :init
  (ivy-prescient-mode)
  (prescient-persist-mode)
  )

(use-package ivy-posframe
  :after ivy
  :config
  (setq ivy-posframe-display-functions-alist
        '(
          (t . ivy-posframe-display-at-frame-top-center)
          ;; (swiper . ivy-display-function-fallback)
          (complete-symbol . ivy-posframe-display-at-point))
        ivy-posframe-parameters '((left-fringe . 8)
                                  (right-fringe . 8)))
  (ivy-posframe-mode 1))

(add-to-list 'ivy-height-alist
             (cons 'counsel-find-file
                   (lambda (_caller)
                     (/ (frame-height) 2))))

(setq ivy-height-alist
      '((t
         lambda (_caller)
         (/ (frame-height) 2))))

(defun ivy-resize--minibuffer-setup-hook ()
  "Minibuffer setup hook."
  (add-hook 'post-command-hook #'ivy-resize--post-command-hook nil t))

(defun ivy-resize--post-command-hook ()
  "Hook run every command in minibuffer."
  (when ivy-mode
    (shrink-window (1+ ivy-height))))  ; Plus 1 for the input field.

(add-hook 'minibuffer-setup-hook 'ivy-resize--minibuffer-setup-hook)

(use-package ivy-hydra)
(use-package ivy-yasnippet
  :bind ("C-c C-y" . ivy-yasnippet))

(provide 'ivy.module)
;;; ivy.module.el ends here
