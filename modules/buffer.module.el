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

(use-package visual-regexp
  :bind
  ("C-c r" . vr/replace)
  ("C-c q" . vr/query-replace))

;; Experimental
;; minor mode for killing thing quickly
(use-package viking-mode
  :config
  (viking-global-mode))

;; rebind emacs in a better way
(use-package mwim
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

;; Quickly jumps between other symbols found at point in Emacs.
;; M-n and M-p move between symboles
;; M-' replace all symbols in the buffer
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
  :ensure t)

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
;; (use-package flyspell
;;   :config
;;   (setq flyspell-issue-message-flag nil)
;;   :delight flyspell-mode)

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

(use-package whole-line-or-region
  :diminish whole-line-or-region-global-mode
  :config (whole-line-or-region-global-mode t))

(use-package electric-operator)

(use-package anzu
  :diminish
  :bind
  ("C-r"   . anzu-query-replace-regexp)
  ("C-M-r" . anzu-query-replace-at-cursor-thing)
  :hook
  (after-init . global-anzu-mode))

(use-package subword
  :ensure nil
  :hook ((java-mode kotlin-mode go-mode) . subword-mode))

(use-package multiple-cursors
  :functions hydra-multiple-cursors
  :bind
  ("C-c C-m" . hydra-multiple-cursors/body)
  :preface
  ;; insert specific serial number
  (defvar ladicle/mc/insert-numbers-hist nil)
  (defvar ladicle/mc/insert-numbers-inc 1)
  (defvar ladicle/mc/insert-numbers-pad "%01d")

  (defun ladicle/mc/insert-numbers (start inc pad)
    "Insert increasing numbers for each cursor specifically."
    (interactive
     (list (read-number "Start from: " 0)
           (read-number "Increment by: " 1)
           (read-string "Padding (%01d): " nil ladicle/mc/insert-numbers-hist "%01d")))
    (setq mc--insert-numbers-number start)
    (setq ladicle/mc/insert-numbers-inc inc)
    (setq ladicle/mc/insert-numbers-pad pad)
    (mc/for-each-cursor-ordered
     (mc/execute-command-for-fake-cursor
      'ladicle/mc--insert-number-and-increase
      cursor)))

  (defun ladicle/mc--insert-number-and-increase ()
    (interactive)
    (insert (format ladicle/mc/insert-numbers-pad mc--insert-numbers-number))
    (setq mc--insert-numbers-number (+ mc--insert-numbers-number ladicle/mc/insert-numbers-inc)))

  :config
  (with-eval-after-load 'hydra
    (defhydra hydra-multiple-cursors (:color pink :hint nil)
"
                                                                        ╔════════╗
    Point^^^^^^             Misc^^            Insert                            ║ Cursor ║
  ──────────────────────────────────────────────────────────────────────╨────────╜
     _k_    _K_    _M-k_    [_l_] edit lines  [_i_] 0...
     ^↑^    ^↑^     ^↑^     [_m_] mark all    [_a_] letters
    mark^^ skip^^^ un-mk^   [_s_] sort        [_n_] numbers
     ^↓^    ^↓^     ^↓^
     _j_    _J_    _M-j_
  ╭──────────────────────────────────────────────────────────────────────────────╯
                           [_q_]: quit, [Click]: point
"
          ("l" mc/edit-lines)
          ("m" mc/mark-all-like-this)
          ("j" mc/mark-next-like-this)
          ("J" mc/skip-to-next-like-this)
          ("M-j" mc/unmark-next-like-this)
          ("k" mc/mark-previous-like-this)
          ("K" mc/skip-to-previous-like-this)
          ("M-k" mc/unmark-previous-like-this)
          ("s" mc/mark-all-in-region-regexp)
          ("i" mc/insert-numbers)
          ("a" mc/insert-letters)
          ("n" ladicle/mc/insert-numbers)
          ("<mouse-1>" mc/add-cursor-on-click)
          ;; Help with click recognition in this hydra
          ("<down-mouse-1>" ignore)
          ("<drag-mouse-1>" ignore)
          ("q" nil))))

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
