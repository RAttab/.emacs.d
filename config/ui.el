;; General Emacs tweaks
;;
;; For non-mode specific tweaks.


;; -----------------------------------------------------------------------------
;; theme
;; -----------------------------------------------------------------------------

(utils/require-package 'sublime-themes)
(load-theme 'junio t)


;; -----------------------------------------------------------------------------
;; misc
;; -----------------------------------------------------------------------------

;; Avoids accidental quits.
(setq confirm-kill-emacs 'yes-or-no-p)

(setq interprogram-paste-function 'x-selection-value)

(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))
(setq ring-bell-function 'flash-mode-line)
(setq visible-bell nil)


;; -----------------------------------------------------------------------------
;; Useful display modes
;; -----------------------------------------------------------------------------

(display-time)
(column-number-mode 1)
(show-paren-mode 1)
(size-indication-mode 1)


;; -----------------------------------------------------------------------------
;; Disable anoying crap.
;; -----------------------------------------------------------------------------

(setq visible-bell 'nil)
(setq inhibit-splash-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Disable the stupid mouse wheel acceleration
(setq mouse-wheel-progressive-speed nil)

;; Avoids horizontal (top-bottom) splits.
(setq split-height-threshold nil)
(setq split-width-treshold most-positive-fixnum)


;; -----------------------------------------------------------------------------
;; Backups
;; -----------------------------------------------------------------------------

(setq make-backup-files nil) ; stop creating those backup~ files
