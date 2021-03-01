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

(use-package undo-fu)

(use-package smartscan
  :ensure t
  :config
  (global-smartscan-mode 1))

(use-package saveplace
  :defines save-place-file
  :config
  (setq-default save-place t)
  (setq save-place-file (concat user-emacs-directory "saved-places")))

(use-package windresize
  :ensure t
  :bind ("C-c r" . windresize))

(use-package popwin
  :ensure t
  :functions popwin-mode
  :config
  (popwin-mode 1))

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
(global-set-key (kbd "s-r") 'revert-this-buffer)

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
        ispell-extra-args '("--sug-mode=ultra" "--lang=en_CA" "--run-together" "--run-together-limit=5" "--run-together-min=2")))

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

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  :delight undo-tree-mode)

(use-package subword
  :ensure nil
  :hook ((java-mode kotlin-mode go-mode) . subword-mode))

;; Multiple cusors are a must. Make <return> insert a newline; multiple-cursors-mode can still be disabled with C-g.
(use-package multiple-cursors
  :config
  (setq mc/always-run-for-all 1)
  (global-set-key (kbd "s-d") 'mc/mark-next-like-this)
  (global-set-key (kbd "s-D") 'mc/mark-all-dwim)
  (define-key mc/keymap (kbd "<return>") nil))

;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer :ignore-auto :noconfirm))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; https://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)



(defun my/query-replace (from-string to-string &optional delimited start end)
  "Replace some occurrences of FROM-STRING with TO-STRING.  As each match is
found, the user must type a character saying what to do with it. This is a
modified version of the standard `query-replace' function in `replace.el',
This modified version defaults to operating on the entire buffer instead of
working only from POINT to the end of the buffer. For more information, see
the documentation of `query-replace'"
  (interactive
   (let ((common
      (query-replace-read-args
       (concat "Query replace"
           (if current-prefix-arg " word" "")
           (if (and transient-mark-mode mark-active) " in region" ""))
       nil)))
     (list (nth 0 common) (nth 1 common) (nth 2 common)
       (if (and transient-mark-mode mark-active)
           (region-beginning)
         (buffer-end -1))
       (if (and transient-mark-mode mark-active)
           (region-end)
         (buffer-end 1)))))
  (perform-replace from-string to-string t nil delimited nil nil start end))
;; Replace the default key mapping
(define-key esc-map "%" 'my/query-replace)

(provide 'buffer.module)
