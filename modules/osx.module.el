;;; osx.module.el --- OS X related specific configuration

;;; Commentary:

;;  Mac OS X specific configuration that differ from Unix

;; Emacs control is Ctrl. Emacs Super is Command. Emacs Meta is Alt. Right Alt (option) can be used to enter symbols like em dashes =—=.

(setq
 mac-right-command-modifier 'meta
 mac-command-modifier 'meta
 mac-option-modifier 'super
 mac-left-option-modifier 'super
 mac-right-option-modifier 'super
 mac-right-option-modifier 'nil)

(provide 'osx.module)

;;; osx.module.el ends here
