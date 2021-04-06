;;; vcs.module.el --- VCS setup

;;; Commentary:

;;  All vcs types and configuration is in this module.

;;; Code:

(use-package magit
  :ensure t
  :defines magit-last-seen-setup-instructions
  :init
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  (setq magit-default-tracking-name-function 'magit-default-tracking-name-branch-only)
  (setq vc-handled-backends (delq 'Git vc-handled-backends) magit-repository-directories '(("\~/Projects" . 4)) )
  :hook ((after-save . magit-after-save-refresh-status))
  :bind (
    ("C-x g s" . magit-status))
    ("C-x g b" . magit-blame)
    ("C-x g l" . magit-log-buffer-file)
  )

(use-package diffview
  :commands (diffview-region diffview-current)
  :preface
  (defun ladicle/diffview-dwim ()
    (interactive)
    (if (region-active-p)
        (diffview-region)
      (diffview-current)))
  :bind ("M-g v" . ladicle/diffview-dwim))

(use-package smerge-mode
  :config
  (defhydra unpackaged/smerge-hydra
    (:color pink :hint nil :post (smerge-auto-leave))
    "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
    ("n" smerge-next)
    ("p" smerge-prev)
    ("b" smerge-keep-base)
    ("u" smerge-keep-upper)
    ("l" smerge-keep-lower)
    ("a" smerge-keep-all)
    ("RET" smerge-keep-current)
    ("\C-m" smerge-keep-current)
    ("<" smerge-diff-base-upper)
    ("=" smerge-diff-upper-lower)
    (">" smerge-diff-base-lower)
    ("R" smerge-refine)
    ("E" smerge-ediff)
    ("C" smerge-combine-with-next)
    ("r" smerge-resolve)
    ("k" smerge-kill-current)
    ("ZZ" (lambda ()
            (interactive)
            (save-buffer)
            (bury-buffer))
     "Save and bury buffer" :color blue)
    ("q" nil "cancel" :color blue))
  :hook (magit-diff-visit-file . (lambda ()
                                   (when smerge-mode
                                     (unpackaged/smerge-hydra/body)))))

(use-package magit-popup :ensure t)
(use-package gitignore-mode :ensure t)
(use-package magit-popup :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package diff-hl
  :ensure t
  :functions diff-hl-magit-post-refresh
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh))

(use-package git-timemachine
  :bind (:map prog-prefix-map
              ("T" . git-timemachine)))

(provide 'vcs.module)

;;; vcs.module.el ends here
