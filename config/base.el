;; Entry point for my emacs config.

;; -----------------------------------------------------------------------------
;; Utilities
;; -----------------------------------------------------------------------------

(load "~/.emacs.d/config/utils.el")

;; Determines whether we want to load cedet or not.
;; Should be changed in the local.el file.
(setq utils/enable-cedet t)


;; -----------------------------------------------------------------------------
;; Global Bindings
;; -----------------------------------------------------------------------------

;; Disable the backgrounding keys (super annoying)
(global-set-key "\C-z" nil)
(global-set-key "\C-x\C-z" nil)

;; Avoids spliting windows when opening buffer list
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Movement keys (the true emacs way)
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(add-hook 'makefile-mode-hook 'utils/set-paragraph-keys)
(add-hook 'Info-mode-hook 'utils/set-paragraph-keys)

;; Training wheels are OFF
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<M-right>"))

;; Useful shortcuts
(global-set-key "\M-sr" 'replace-string)
(global-set-key "\M-se" 'replace-regexp)
(global-set-key "\M-ss" 'search-forward-regexp)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key [f5] 'utils/revert-buffer-no-confirm)

;; Not quite c-hungry-delete but close enough for now.
(global-set-key "\C-c\C-d" 'just-one-space)


;; -----------------------------------------------------------------------------
;; Load rest of configs
;; -----------------------------------------------------------------------------

;; General stuff
(utils/load-config "ui.el")
(utils/load-config-if-exists "local.el")

;; Useful modes
(utils/load-config "modes.el")
(utils/load-config "ido.el")
(utils/load-config "yasnippet.el")
(utils/load-config "magit.el")
(utils/load-config "org.el")

;; C/C++
(utils/load-config "style.el")
(if utils/enable-cedet (utils/load-config "cedet.el"))
(if utils/enable-cedet (utils/load-config-if-exists "project.el"))

;; Other languages
(utils/load-config "coffee.el")
(utils/load-config "python.el")
(utils/load-config "lua.el")
(utils/load-config "octave.el")
