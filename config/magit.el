;; Git mode for emacs
;;
;; Could use config for auto-fill mode at 70 col in commit editor.

(utils/add-vendor-path "magit")
(require 'magit)
(require 'magit-svn)

;; -----------------------------------------------------------------------------
;; key bindings
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-file-log)

(add-hook 'magit-log-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "S") 'magit-show-file-revision)))
