(use-package compile
  :defines compilation-scroll-output
  :init
  (setq compilation-scroll-output t))

;; Case-insensitive search
(setq case-fold-search t)

(setq current-language-environment "UTF-8")
(setq default-input-method "utf-8")
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(use-package dired
  :ensure nil
  :delight "Dired "
  :custom
  (dired-auto-revert-buffer t)
  (dired-dwim-target t)
  (dired-hide-details-hide-symlink-targets nil)
  (dired-listing-switches "-alh")
  (dired-ls-F-marks-symlinks nil)
  (dired-recursive-copies 'always))

(use-package dired-narrow
  :bind (("C-c C-n" . dired-narrow)
         ("C-c C-f" . dired-narrow-fuzzy)
         ("C-c C-r" . dired-narrow-regexp)))

(use-package dired-subtree
  :bind (:map dired-mode-map
              ("<backtab>" . dired-subtree-cycle)
              ("<tab>" . dired-subtree-toggle)))

(use-package smartscan
  :ensure t
  :config
  (global-smartscan-mode 1))

(use-package saveplace
  :defines save-place-file
  :config
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "saved-places")))

;; Same-frame speedbar
(use-package sr-speedbar
  :ensure t
  :init
  ;; Use Semantic with Speedbar
  (add-hook 'speedbar-load-hook #'(lambda () (require 'semantic/sb)))
  ;; Win-S
  :bind ("s-S" . sr-speedbar-toggle))

(global-set-key (kbd "RET") 'newline-and-indent)

(setq require-final-newline t)

;; Start from the top when usint C-l
(setq recenter-positions '(top middle bottom))

;; use shift to move around windows
(windmove-default-keybindings 'shift)
;; Window splitting and navigation.
(winner-mode 1)

(use-package windresize
  :ensure t
  :bind ("C-c r" . windresize))

(use-package popwin
  :ensure t
  :functions popwin-mode
  :config
  (popwin-mode 1))

;; http://www.masteringemacs.org/articles/2014/02/28/my-emacs-keybindings/
(defun kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key "\C-x\C-k" 'kill-this-buffer)

(defun revert-this-buffer ()
  "Revert the current buffer."
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))
(global-set-key [f6] 'revert-this-buffer)

;; http://www.emacswiki.org/emacs/FlySpell
;; Printing messages for every word (when checking the entire buffer) causes an enormous slowdown.
(use-package flyspell
  :config
  (setq flyspell-issue-message-flag nil)
  :delight flyspell-mode)

(use-package ispell
  :if (executable-find "aspell")
  :config
  (when (boundp 'ispell-list-command)
    (setq
     ;; http://www.emacswiki.org/emacs/FlySpell
     ;; Use --list instead of -l because the -l option means --lang in aspell
     ispell-list-command "--list"))
  (setq ispell-program-name "aspell"
        ;; http://blog.binchen.org/posts/effective-spell-check-in-emacs.html
        ;; force the English dictionary, support Camel Case spelling check (--run-together)
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=5" "--run-together-min=2")))

(use-package hideshow
  :delight hs-minor-mode)

(use-package drag-stuff
  :ensure t
  :defines drag-stuff-mode-map
  ;; Explicitly define keys as drag-stuff ones don't seem to work.
  :bind (:map drag-stuff-mode-map
              ("<M-S-up>" . drag-stuff-up)
              ("<M-S-down>" . drag-stuff-down)
              ("<M-S-left>" . drag-stuff-left)
              ("<M-S-right>" . drag-stuff-right))
  :delight drag-stuff-mode)
(drag-stuff-global-mode t)

(use-package clean-aindent-mode
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'clean-aindent-mode))

;; unobtrusively trim white spaces from end of line
(use-package ws-butler
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode)
  :delight ws-butler-mode)

;; improved undo system
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  :delight undo-tree-mode)

;; Works best when Editorconfig C Core is installed
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  :delight editorconfig-mode)

;; Better navigation for CamelCase words
(use-package subword
  :ensure nil
  :hook ((java-mode kotlin-mode go-mode) . subword-mode))

(provide 'buffer.module)