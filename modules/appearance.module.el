;;; appearance.module.el --- Apparance setup

;;; Commentary:

;;  Apparance related configration.  Every configuration related to the apprance it's here.

;;; Code:

(setq-default
 cursor-type 'box                       ; Cursor shape is a bar
 blink-cursor-mode 0                    ; Cursor blink
 ad-redefinition-action 'accept         ; Silence warnings for redefinition
 auto-save-list-file-prefix nil         ; Prevent tracking for auto-saves
 custom-unlispify-menu-entries nil      ; Prefer kebab-case for titles
 custom-unlispify-tag-names nil         ; Prefer kebab-case for symbols
 delete-by-moving-to-trash t            ; Delete files to trash
 fill-column 79                         ; Set width for automatic line breaks
 gc-cons-threshold (* 8 1024 1024)      ; We're not using Game Boys anymore
 help-window-select t                   ; Focus new help windows when opened
 indent-tabs-mode nil                   ; Stop using tabs to indent
 inhibit-startup-screen t               ; Disable start-up screen
 initial-scratch-message ""             ; Empty the initial *scratch* buffer
 mouse-yank-at-point t                  ; Yank at point rather than pointer
 recenter-positions '(5 top bottom)     ; Set re-centering positions
 scroll-conservatively 101              ; Avoid recentering when scrolling far
 scroll-margin 5                        ; Add a margin when scrolling vertically
 select-enable-clipboard t              ; Merge system's and Emacs' clipboard
 sentence-end-double-space nil          ; Use a single space after dots
 show-help-function nil                 ; Disable help text everywhere
 tab-width 2                            ; Set width for tabs
 uniquify-buffer-name-style 'forward    ; Uniquify buffer names
 ring-bell-function 'ignore             ; Disable ring bell
 window-combination-resize t)           ; Resize windows proportionally
(tool-bar-mode -1)                      ; Remove tool bar
(scroll-bar-mode -1)                    ; Remove scroll bar
(delete-selection-mode 1)               ; Replace region when inserting text
(fset 'yes-or-no-p 'y-or-n-p)           ; Replace yes/no prompts with y/n
(global-subword-mode 1)                 ; Iterate through CamelCase words
(mouse-avoidance-mode 'exile)           ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)    ; Enable downcase-region
(put 'upcase-region 'disabled nil)      ; Enable upcase-region
(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(global-font-lock-mode t)
(global-auto-revert-mode t)
(set-default 'show-trailing-whitespace t)
(global-display-line-numbers-mode t)
(global-set-key (kbd "C-c w") 'whitespace-mode)

(add-to-list 'default-frame-alist '(font . "Roboto Mono-14"))
;; (set-frame-font "Roboto Mono" nil t)
;; (set-default-font "Roboto Mono 14")
;; always full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
(recentf-mode t)
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package dash :ensure t)
(use-package diminish :ensure t)
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark))

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode))

(use-package highlight-indent-guides
  :diminish highlight-indent-guides-mode
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'bitmap
        highlight-indent-guides-auto-enabled nil
        highlight-indent-guides-responsive 'top))

(use-package fancy-narrow
  :defer t)

(provide 'appearance.module)

;;; appearance.module.el ends here
