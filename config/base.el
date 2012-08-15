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

;; Useful shortcuts
(global-set-key "\M-sr" 'replace-string)
(global-set-key "\M-se" 'replace-regexp)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key [f5] 'utils/revert-buffer-no-confirm)


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
