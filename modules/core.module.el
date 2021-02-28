;;; core.module.el --- Loading my configuration core modules

;;; Commentary:

;;  Modules here are the core one one and can't be removed. Optional module are loading in init.

;;; Code:

(require 'appearance.module)
(require 'buffer.module)
(require 'autocomplete.module)
(require 'ivy.module)
(require 'project.module)
(require 'parens.module)
(require 'vcs.module)
(require 'sql.module)
(require 'lsp.module)

(provide 'core.module)

;;; core.module.el ends here
