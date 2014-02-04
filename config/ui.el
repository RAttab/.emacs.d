;; General Emacs tweaks
;;
;; For non-mode specific tweaks.


(set-face-attribute 'default nil :height 80)

;; Black in a terminal ends up as an horrible gray background.
;; The default in X is a horrible white background.
;; I think it was designed to give you eye cancer.
(if (eq window-system 'x)
    (set-face-attribute 'default nil :background "black"))

;; Avoids accidental quits.
(setq confirm-kill-emacs 'yes-or-no-p)


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

(setq inhibit-splash-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

;; Disable the stupid mouse wheel acceleration
(setq mouse-wheel-progressive-speed nil)

;; Avoids horizontal (top-bottom) splits.
(setq split-height-threshold nil)
(setq split-width-treshold most-positive-fixnum)


;; -----------------------------------------------------------------------------
;; Ubuntu copy & paste fix
;; -----------------------------------------------------------------------------

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; -----------------------------------------------------------------------------
;; Backups
;; -----------------------------------------------------------------------------

(setq make-backup-files nil) ; stop creating those backup~ files

;; Failed attempts to keep this feature running in a less anoying manner.
;; (setq make-backup-file-name-function 'utils/make-backup-filename)
;; (setq backup-directory-alist '(("*" . "~/.emacs_backup")))
