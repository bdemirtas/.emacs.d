;;; sql.module.el --- Database setup

;;; Commentary:

;;  Database configuration. This module contain config to connect to any database.

;;; Code:

;; database SQL client using Clojure JDBC
(defvar pg-jdbc-driver
  "~/.m2/repository/postgresql/postgresql/9.3-1102.jdbc41/postgresql-9.3-1102.jdbc41.jar"
  "Location of postgres jdbc driver for ejc.")

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

(provide 'sql.module)

;;; sql.module.el ends here
