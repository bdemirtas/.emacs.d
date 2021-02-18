(use-package org
  :mode ("\\.org$" . org-mode)
  :bind (("\C-cl" . org-store-link))
  :custom
  (org-log-done t)
  (org-startup-indented t)
  :config
  (add-hook 'org-mode-hook #'visual-line-mode))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package
    auctex
  :mode ("\\.(la)?tex\\'" . latex-mode)
  :config (progn
            (setq TeX-source-correlate-method 'synctex)
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            (setq reftex-plug-into-AUCTeX t)
            (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
                  TeX-source-correlate-start-server t)
            (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
            (add-hook 'LaTeX-mode-hook (lambda ()
                                         (reftex-mode t)
                                         (flyspell-mode t)))
            (use-package
                pdf-tools
              :config (progn (pdf-tools-install)
                             (setq-default pdf-view-display-size 'fit-page)
                             (setq pdf-annot-activate-created-annotations t)
                             (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
                             (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward)
                             (add-hook 'pdf-view-mode-hook (lambda ()
                                                             (bms/pdf-midnite-amber)))))
            (setq TeX-source-correlate-mode t)))

(use-package
    auctex-latexmk
  :hook (LaTeX-mode . auctex-latexmk-setup))


(provide 'org.module)
