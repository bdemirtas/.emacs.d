;;; org.module.el --- Org mode setup

;;; Commentary:

;;  Org mode and extensions

;;; Code:

(use-package org
  :mode ("\\.org$" . org-mode)
  :bind (("C-c a"  . org-agenda)
         ("C-c l"  . org-store-link)
         ("C-c c"  . org-capture))
  :custom
  (org-log-done t)
  (org-startup-indented t)
  (org-directory "~/~.org")

  (org-agenda-files (list "~/~.org/blog.org"
                          "~/~.org/personal.org"
                          "~/~.org/ideas.org"
                          "~/~.org/home.org"))
  :config
    (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

    (add-hook 'org-mode-hook #'visual-line-mode))

(use-package org-super-agenda
  :ensure t
  :after org
  :config
  (setq org-super-agenda-groups
        '((:name "Today" :time-grid t)
          (:name "Important" :priority "A")
          (:name "Next" :priority<= "B")
          (:todo "IN-PROGRESS" :order 1)
          (:todo "SCHEDULED" :order 2)
          (:tag "job" :order 3)
          (:tag "personal" :order 4)))
  (org-super-agenda-mode 1))

(use-package ox-twbs)
(use-package htmlize)
(use-package org-sidebar
  :ensure t
  :after org)

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
                                         (reftex-mode t)))
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

(use-package org-re-reveal
  :ensure t
  :after org
  :config
  (setq org-re-reveal-root "file:///home/burki/.emacs.d/js/reveal.js-4.1.0/"))

(use-package
    auctex-latexmk
  :hook (LaTeX-mode . auctex-latexmk-setup))

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/.roam")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

(provide 'org.module)

;;; org.module.el ends here
