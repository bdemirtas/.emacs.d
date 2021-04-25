(global-set-key (kbd "C-S-f") 'forward-word)
(global-set-key (kbd "C-S-b") 'backward-word)
(global-set-key (kbd "C-c c") 'make-directory)
(global-set-key (kbd "C-S-<right>") 'indent-rigidly-right-to-tab-stop)
(global-set-key (kbd "C-S-<left>") 'indent-rigidly-left-to-tab-stop)

;; set buffer list to ibuffer
(global-set-key (kbd "C-c b") 'new-buffer)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)

;; Emacs control is Ctrl. Emacs Super is Command. Emacs Meta is Alt. Right Alt (option) can be used to enter symbols like em dashes =—=.
(when (is-mac-p)
  (setq
    mac-right-command-modifier 'super
    mac-command-modifier 'super
    mac-option-modifier 'meta
    mac-left-option-modifier 'meta
    mac-right-option-modifier 'meta
    mac-right-option-modifier 'nil))

;; ----------------------
;; Navigation and editing
(setq require-final-newline t)
;; Start from the top when usint C-l
(setq recenter-positions '(top middle bottom))

;; use shift to move around windows
(windmove-default-keybindings 'shift)
;; Window splitting and navigation.
(winner-mode 1)
(global-set-key (kbd "RET") 'newline-and-indent)

;;Move more quickly
(global-set-key (kbd "C-S-n")
(lambda ()(interactive)
(ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
(lambda ()(interactive)
(ignore-errors (previous-line 5))))

(global-set-key (kbd "s-c") 'clipboard-kill-ring-save) ; Cmd + C copy to clipboard
(global-set-key (kbd "s-x") 'clipboard-kill-region)    ; Cmd + X copy to clipboard
(global-set-key (kbd "s-v") 'clipboard-yank)           ; Cmd + V paste from clipboard

(global-set-key (kbd "s-<backspace>") 'kill-whole-line)
(global-set-key (kbd "M-S-<backspace>") 'kill-word)
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Use =hyper= (which is =Caps Lock=) for movement and selection
(global-set-key (kbd "s-<left>") 'beginning-of-visual-line)
(global-set-key (kbd "s-<right>") 'end-of-visual-line)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "s-l") 'goto-line)

;; Basic things you should expect
(global-set-key (kbd "s-a") 'mark-whole-buffer)       ;; select all
(global-set-key (kbd "s-s") 'save-buffer)             ;; save
(global-set-key (kbd "s-S") 'write-file)              ;; save as
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs) ;; quit

;; Regular undo-redo.
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "s-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)
(global-set-key (kbd "s-r")   'undo-fu-only-redo)

;;; ; Upcase word and region using the same keys.
(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)

;; SQL
(global-set-key (kbd "C-c eb") 'ejc-get-temp-editor-buffer)

;; Crux
(global-set-key (kbd "C-w") #'backward-kill-word)
(global-set-key (kbd "C-c i") #'crux-find-user-init-file)
(global-set-key (kbd "C-c d") #'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c D") #'crux-delete-file-and-buffer)
(global-set-key (kbd "C-<backspace>") #'crux-kill-line-backwards)
(global-set-key (kbd "C-k") #'crux-kill-and-join-forward)
(global-set-key [remap kill-whole-line] #'crux-kill-whole-line)
(global-set-key [(shift return)] #'crux-smart-open-line)
(key-chord-define-global "yy" 'yank-whole-line)
(key-chord-define-global "sb" 'xah-select-block)

(global-set-key (kbd "s-/") #'easy-mark-word)
(global-set-key (kbd "C-c f") #'counsel-recentf)

;; Make windmove work in Org mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Hydra
(bind-keys*("M-m f" . hydra-folding/body))

;; UUID
(global-set-key (kbd "s-u") 'my/uuidgen-4)
(provide 'key-bindings.module)
