;; Coffee mode
;;
;; This mode (or at least this version of the mode) sucks bad. It's
;; incapable of parsing the """ construct as well as having the
;; world's most annoying indenting mechanism.
;;
;; Need to update it or find a better version.


;; -----------------------------------------------------------------------------
;; Load and associate the mode
;; -----------------------------------------------------------------------------

(utils/require-package 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


;; -----------------------------------------------------------------------------
;; Style fix
;; -----------------------------------------------------------------------------

(setq coffee-tab-width 4)
(setq coffee-cleanup-whitespace nil)


;; -----------------------------------------------------------------------------
;; Key bindings
;; -----------------------------------------------------------------------------

(defun my-coffee-hook ()
  (local-set-key (kbd "C-c c") 'coffee-compile-buffer)
  (local-set-key (kbd "C-c <") 'coffee-indent-shift-left)
  (local-set-key (kbd "C-c >") 'coffee-indent-shift-right))
(add-hook 'coffee-mode-hook 'my-coffee-hook)
