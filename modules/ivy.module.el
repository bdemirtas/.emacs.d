(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-c a" . counsel-ag)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-file-jump)
         ("C-c l" . counsel-locate)
         :map minibuffer-local-map
         ("C-h" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^ !

 ;; Use spotlight on macOS.
  (when (eq system-type 'darwin)
    (setq counsel-locate-cmd #'counsel-locate-cmd-mdfind))

(setq max-specpdl-size 1300000)
(setq max-lisp-eval-depth 100000)

(use-package counsel-ag-popup
  :after (counsel))

(use-package counsel-projectile
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1))

;; Disable for now ivy-postframe, I'm having some kind of trouble to make it work properly
;; (use-package ivy-posframe
;;   :ensure t
;;   :config
;;   (setq ivy-posframe-parameters
;;         `((min-width . 100)
;;           (min-height . ,ivy-height)
;;           (left-fringe . 1)
;;           (right-fringe . 1)
;;           (internal-border-width . 10))
;;         ivy-display-functions-alist
;;         '((counsel-git-grep)
;;           (counsel-rg)
;;           (counsel-projectile)
;;           (swiper)
;;           (counsel-irony . ivy-display-function-overlay)
;;           (ivy-completion-in-region . ivy-display-function-overlay)
;;           (t . ivy-posframe-display-at-frame-top-center)))
;;   (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
;;   (ivy-posframe-mode 1))

;; Jump to things in Emacs tree-style
(use-package avy
  :ensure t
  :bind(("C-:" . avy-goto-word-1)))

(use-package ivy :ensure t
  :diminish (ivy-mode . "")             ; does not display ivy in the modeline
  :init
  (ivy-mode 1)                          ; enable ivy globally at startup
  :bind (:map ivy-minibuffer-map        ; bind in the ivy buffer
       ("RET" . ivy-alt-done)
       ("s-<"   . ivy-avy)
       ("s->"   . ivy-dispatching-done)
       ("s-+"   . ivy-call)
       ("s-!"   . ivy-immediate-done)
       ("s-["   . ivy-previous-history-element)
       ("s-]"   . ivy-next-history-element))
  :config
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-virtual-buffers t)       ; extend searching to bookmarks and
  (setq ivy-height 20)                   ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ")     ; count format, from the ivy help page
  (setq ivy-display-style 'fancy)
  (setq ivy-format-function 'ivy-format-function-line) ; Make highlight extend all the way to the right
  (setq ivy-initial-inputs-alist nil))


(use-package ivy-rich
  :after counsel
  :init (setq ivy-rich-path-style 'abbrev
              ivy-virtual-abbreviate 'full)
  :config (ivy-rich-mode))

(use-package ivy-hydra)

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'ivy.module)
