;; database SQL client using Clojure JDBC
(use-package ejc-sql
  :commands (ejc-connect ejc-connect-existing-repl ejc-sql-mode)
  :bind (:map ejc-sql-mode-keymap
  		 ("C-c C-q" . ejc-connect)
         ("C-g" . nil) ; unbind C-g in mode-map shadowing regular C-g
         ("C-c C-k" . ejc-cancel-query)) ; rebind to C-c C-k instead
  :init
  ;; use `completing-read' for minibuffer completion
  ;; change ejc-sql keymap prefix to "C-c s" (from the default "C-c e")
  (setq ejc-completion-system 'standard
  		ejc-complete-on-dot t
        ejc-keymap-prefix (kbd "C-c s"))
  :hook (ejc-sql-minor-mode . (lambda ()
                                (auto-complete-mode t)
                                (ejc-eldoc-setup)
                                (ejc-ac-setup))))

(use-package ejc-company
:ensure nil
:after
ejc-sql-mode
:config
(add-to-list (make-local-variable 'company-backends)
			 '(ejc-company-backend)))

(provide 'sql.module)
