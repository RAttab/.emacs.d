;;; -*- lexical-binding: t; -*-
;; Git mode for emacs
;;
;; Could use config for auto-fill mode at 70 col in commit editor.

(utils/require-package 'magit)
(utils/require-package 'magit-find-file)
(utils/require-package 'ido-completing-read+)
(require 'magit-blame)

;; -----------------------------------------------------------------------------
;; key bindings
;; -----------------------------------------------------------------------------

(setq magit-completing-read-function 'magit-ido-completing-read)


;; -----------------------------------------------------------------------------
;; windows
;; -----------------------------------------------------------------------------

(defun utils/magit-display-buffer (buffer)
  (let ((split-width-threshold nil)
        (split-height-threshold nil))
    (magit-display-buffer-same-window-except-diff-v1 buffer)))

(setq magit-display-buffer-function 'utils/magit-display-buffer)

(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log-buffer-file)
(global-set-key (kbd "C-c b") 'magit-blame)
(global-set-key (kbd "C-x f") 'magit-find-file-completing-read)

(add-hook 'git-commit-setup-hook
          (lambda ()
            (setq fill-column 70)
            (auto-fill-mode 1)))
