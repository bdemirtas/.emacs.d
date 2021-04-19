(use-package crux)
(use-package uuidgen)
(use-package key-chord
  :config
  (key-chord-mode 1))

;; easy-kill - kill and mark things easily
(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill)
  (global-set-key [remap mark-sexp] 'easy-mark)
  )

(use-package easy-kill-extras
  :ensure t
  :if (display-graphic-p)
  :after easy-kill
  :bind (([remap kill-ring-save] . easy-kill)
	 ([remap mark-sexp] . easy-mark-sexp)
	 ([remap mark-word] . easy-mark-word)

	 ;; Integrate `zap-to-char'
	 ([remap zap-to-char] . easy-mark-to-char)
	 ([remap zap-up-to-char] . easy-mark-up-to-char)

	 ;; Integrate `expand-region'
	 :map easy-kill-base-map
	 ("o" . easy-kill-er-expand)
	 ("i" . easy-kill-er-unexpand)))

(use-package origami
  :config
  (global-set-key (kbd "C-c n o") 'origami-open-node)
  (global-set-key (kbd "C-c n c") 'origami-close-node)
  (global-set-key (kbd "C-c n a") 'origami-open-all-nodes)
  (global-set-key (kbd "C-c n u") 'origami-undo)
  (global-set-key (kbd "C-c n n") 'origami-show-only-node)
  (global-set-key (kbd "C-c n TAB") 'origami-recursively-toggle-node))

(defhydra hydra-folding ()
  "folding"
  ("C" origami-close-all-nodes "close all")
  ("O" origami-open-all-nodes "open all")
  ("c" origami-close-node "close")
  ("o" origami-open-node "open"))

(defun new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "buffer"))
  )

(defun my/uuidgen-4 (arg)
  "Return an UUID from random numbers (UUIDv4).
 If ARG is non nil then use CID format."
  (interactive "P")
  (let ((uuid (uuidgen-4)))
    (if arg
        (insert-uuid-cid uuid)
      (insert uuid))))

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(bind-keys ("M-<up>" . move-line-up)
           ("M-<down>" . move-line-down))

(provide 'handy-functions)
