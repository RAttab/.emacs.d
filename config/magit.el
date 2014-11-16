;; Git mode for emacs
;;
;; Could use config for auto-fill mode at 70 col in commit editor.

(utils/require-package 'magit)
(utils/require-package 'magit-find-file)
(utils/require-package 'magit-svn)
(require 'magit-blame)

;; -----------------------------------------------------------------------------
;; key bindings
;; -----------------------------------------------------------------------------

(setq magit-commit-all-when-nothing-staged 'nil)
(setq magit-completing-read-function 'magit-ido-completing-read)

(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-file-log)
(global-set-key (kbd "C-c b") 'magit-blame-mode)
(global-set-key (kbd "C-x f") 'magit-find-file-completing-read)

(add-hook 'magit-log-mode-hook
          '(lambda ()
             (local-set-key (kbd "S") 'magit-show-file-revision)))

(add-hook 'magit-log-edit-mode-hook
          '(lambda ()
             (setq fill-column 70)
             (auto-fill-mode 1)))

