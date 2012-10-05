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

(utils/add-vendor-path "defunkt-coffee-mode")
(require 'coffee-mode)

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
  (local-set-key "\C-cc" 'coffee-compile-buffer))
(add-hook 'coffee-mode-hook 'my-coffee-hook)