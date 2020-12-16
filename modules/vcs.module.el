(when (executable-find "git")
  (use-package magit
    :ensure t
    :defines magit-last-seen-setup-instructions
    :init
    (setq magit-last-seen-setup-instructions "1.4.0")
    :config
    (setq vc-handled-backends (delq 'Git vc-handled-backends)) ; disable default VCS
    :hook ((after-save . magit-after-save-refresh-status)
           (git-commit-mode . flyspell-mode))
    :bind (("C-x g" . magit-status)))

  (use-package gitignore-mode
    :ensure t)

  (use-package gitconfig-mode
    :ensure t)

  (use-package diff-hl
    :ensure t
    :functions diff-hl-magit-post-refresh
    :config
    (global-diff-hl-mode)
    (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh)))

(provide 'vcs.module)
