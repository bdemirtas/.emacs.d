(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode) ;; github-flavored-markdown
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (add-hook 'markdown-mode-hook #'flyspell-mode)
  (add-hook 'gfm-mode-hook #'flyspell-mode)
  (add-hook 'markdown-mode-hook #'auto-fill-mode)
  (add-hook 'gfm-mode-hook #'auto-fill-mode)
  (add-hook 'markdown-mode-hook #'ws-butler-mode)
  (add-hook 'gfm-mode-hook #'ws-butler-mode)
  :config
  (defun sp--gfm-point-after-word-p (id action context)
    "Return t if point is after a word, nil otherwise.
This predicate is only tested on \"insert\" action."
    (when (eq action 'insert)
      (sp--looking-back-p (concat "\\(\\sw\\)" (regexp-quote id)))))

  (defun sp--gfm-skip-asterisk (ms mb me)
    (save-excursion
      (goto-char mb)
      (save-match-data (looking-at "^\\* "))))

  (sp-with-modes '(markdown-mode gfm-mode)
    (sp-local-pair "*" "*"
                   :wrap "C-*"
                   :unless '(sp--gfm-point-after-word-p sp-point-at-bol-p)
                   :post-handlers '(("[d1]" "SPC"))
                   :skip-match 'sp--gfm-skip-asterisk)
    (sp-local-pair "**" "**")
    (sp-local-pair "_" "_" :wrap "C-_" :unless '(sp-point-after-word-p))))

(provide 'markdown.module)
