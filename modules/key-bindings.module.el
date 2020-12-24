;; Emacs control is Ctrl. Emacs Super is Command. Emacs Meta is Alt. Right Alt (option) can be used to enter symbols like em dashes =—=.
(when (is-macos)
  (setq
   mac-right-command-modifier 'super
   mac-command-modifier 'super
   mac-option-modifier 'meta
   mac-left-option-modifier 'meta
   mac-right-option-modifier 'meta
   mac-right-option-modifier 'nil))

;; ----------------------
;; Navigation and editing
(global-set-key (kbd "s-.") 'anaconda-mode-find-definitions)
(global-set-key (kbd "s-,") 'anaconda-mode-go-back)

;; Move more quickly
(global-set-key (kbd "C-S-n")
  (lambda ()(interactive)
    (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
  (lambda ()(interactive)
    (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
  (lambda ()(interactive)
    (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
  (lambda ()(interactive)
    (ignore-errors (backward-char 5))))

(global-set-key (kbd "s-c") 'clipboard-kill-ring-save) ; Cmd + C copy to clipboard
(global-set-key (kbd "s-x") 'clipboard-kill-region)    ; Cmd + X copy to clipboard
(global-set-key (kbd "s-v") 'clipboard-yank)           ; Cmd + V paste from clipboard

;; Kill line with =s-Backspace=, which is =Cmd-Backspace=. Note that thanks to Simpleclip, killing doesn't rewrite the system clipboard. Kill one word by =Alt-Backspace=. Also, kill forward word with =Alt-Shift-Backspace=, since =Alt-Backspace= is kill word backwards.
(global-set-key (kbd "s-<backspace>") 'kill-whole-line)
(global-set-key (kbd "s-<delete>") 'kill-whole-line)
(global-set-key (kbd "M-S-<backspace>") 'kill-word)
(global-set-key (kbd "M-<delete>") 'kill-word)
(bind-key* "S-<delete>" 'kill-word)

;; Use =super= (which is =Cmd=) for movement and selection just like in macOS.
(global-set-key (kbd "s-<right>") 'end-of-visual-line)
(global-set-key (kbd "s-<left>") 'beginning-of-visual-line)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "s-l") 'goto-line)

;; Basic things you should expect from macOS.
(global-set-key (kbd "s-a") 'mark-whole-buffer)       ;; select all
(global-set-key (kbd "s-s") 'save-buffer)             ;; save
(global-set-key (kbd "s-S") 'write-file)              ;; save as
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs) ;; quit

;; Regular undo-redo.
(use-package undo-fu)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-z") 'undo-fu-only-redo)
(global-set-key (kbd "s-z")   'undo-fu-only-undo)
(global-set-key (kbd "s-r")   'undo-fu-only-redo)

;; Upcase word and region using the same keys.
(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)

;; SQL
(global-set-key (kbd "C-c eb") 'ejc-get-temp-editor-buffer)

(provide 'key-bindings.module)
