;; General Emacs tweaks
;;
;; For non-mode specific tweaks.


;; -----------------------------------------------------------------------------
;; color-theme
;; -----------------------------------------------------------------------------

(utils/require-package 'color-theme)
(utils/require-package 'sublime-themes)

(setq custom-safe-themes
      '("7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" ;brin
        "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" ;junio
        default))

(if (eq window-system 'x) (load-theme 'brin) (load-theme 'junio))


;; -----------------------------------------------------------------------------
;; misc
;; -----------------------------------------------------------------------------

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
