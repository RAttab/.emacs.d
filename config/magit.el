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

(setq magit-commit-all-when-nothing-staged 'nil)
(setq magit-completing-read-function 'magit-ido-completing-read)

(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log-buffer-file)
(global-set-key (kbd "C-c b") 'magit-blame)
(global-set-key (kbd "C-x f") 'magit-find-file-completing-read)

(add-hook 'magit-log-mode-hook
          '(lambda ()
             (local-set-key (kbd "S") 'magit-show-file-revision)))

(add-hook 'magit-log-edit-mode-hook
          '(lambda ()
             (setq fill-column 70)
             (auto-fill-mode 1)))


;; Windows shell are stupid slow and this makes things more bearable.
;; https://github.com/magit/magit/issues/2395
(when (eq system-type 'windows-nt)

  (define-derived-mode magit-staging-mode magit-status-mode "Magit staging"
    "Mode for showing staged and unstaged changes."
    :group 'magit-status)

  (defun magit-staging-refresh-buffer ()
    (magit-insert-section (status)
      (magit-insert-untracked-files)
      (magit-insert-unstaged-changes)
      (magit-insert-staged-changes)))

  (defun magit-staging ()
    (interactive)
    (magit-mode-setup #'magit-staging-mode)))
