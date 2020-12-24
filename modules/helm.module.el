(use-package helm-projectile
  :ensure t
  :bind ("C-c p h" . helm-projectile)
  :config
  ;; So one can select a file in the project directly.
  (setq projectile-switch-project-action 'helm-projectile))

(use-package helm-config
  :ensure helm
  :defines shell-mode-map
  :functions my-add-to-helm-boring-file-regexp-list

  :init
  (helm-mode 1)
  (helm-adaptive-mode 1)

  :custom
  (helm-command-prefix-key "C-c h")

  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring) ;; replace yank-pop
         ("C-h SPC" . helm-all-mark-rings)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-mini)
         ("M-/" . helm-dabbrev)
         :map shell-mode-map
         ("C-c C-l" . helm-comint-input-ring)
         :map minibuffer-local-map
         ("C-c C-l" . helm-minibuffer-history)
         :map helm-command-map
         ("o" . helm-occur)
         ("M-s o" . nil)))

(use-package helm
  :ensure t
  :defines
  helm-ff-ido-style-backspace
  helm-ff-file-name-history-use-recentf
  helm-ff-newfile-prompt-p
  helm-ff-skip-boring-files
  helm-ff-auto-update-initial-value
  helm-ff--auto-update-state

  :config
  (require 'helm-config)

  :delight helm-mode
  :bind (:map helm-map
              ([left] . helm-previous-source)
              ([right] . helm-next-source))
  :config
  (setq helm-move-to-line-cycle-in-source t
        helm-ff-file-name-history-use-recentf t
        helm-ff-newfile-prompt-p nil
        helm-ff-skip-boring-files t
        helm-ff-ido-style-backspace 'always
        helm-ff-auto-update-initial-value t
        helm-ff--auto-update-state t))

(use-package helm-files
  :ensure helm
  :bind ([f7] . helm-browse-project)
  :custom
  (helm-ff-lynx-style-map t))

(when (executable-find "global")
  (use-package helm-gtags
    :ensure t
    :init
    (add-hook 'dired-mode-hook #'helm-gtags-mode)
    (add-hook 'eshell-mode-hook #'helm-gtags-mode)
    (add-hook 'c-mode-hook #'helm-gtags-mode)
    (add-hook 'c++-mode-hook #'helm-gtags-mode)
    (add-hook 'asm-mode-hook #'helm-gtags-mode)
    :config
    (setq
     helm-gtags-ignore-case t
     helm-gtags-auto-update t
     helm-gtags-use-input-at-cursor t
     helm-gtags-pulse-at-cursor t
     helm-gtags-prefix-key "\C-cg"
     helm-gtags-suggested-key-mapping t)
    (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
    (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
    (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
    (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
    (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
    :delight helm-gtags-mode))

(when (executable-find "ag")
  (use-package helm-ag
    :ensure t))

(define-advice helm-projectile-grep (:override (&optional dir) ag)
  (helm-do-ag (or dir (projectile-project-root))))

(when (executable-find "git")
  (use-package helm-ls-git
    :ensure t))

(require 'helm-config)
(require 'helm-projectile)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
;; discussion of these options.
(setq helm-split-window-in-side-p           t
      helm-buffers-fuzzy-matching           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-ff-file-name-history-use-recentf t)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-command-map (kbd "o")     'helm-occur)
(define-key helm-command-map (kbd "g")     'helm-do-grep)
(define-key helm-command-map (kbd "C-c w") 'helm-wikipedia-suggest)
(define-key helm-command-map (kbd "SPC")   'helm-all-mark-rings)


(provide 'helm.module)
