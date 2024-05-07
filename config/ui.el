;; General Emacs tweaks
;;
;; For non-mode specific tweaks.


;; -----------------------------------------------------------------------------
;; color-theme
;; -----------------------------------------------------------------------------

(utils/require-package 'color-theme)

;; newest version of sublime theme is broken so we keep the older version around.
(add-to-list 'load-path "~/.emacs.d/vendor/sublime-themes")
(require 'sublime-themes)

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

(setq interprogram-paste-function 'x-selection-value)

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
(scroll-bar-mode -1)

;; Disable the stupid mouse wheel acceleration
(setq mouse-wheel-progressive-speed nil)

;; Avoids horizontal (top-bottom) splits.
(setq split-height-threshold nil)
(setq split-width-treshold most-positive-fixnum)


;; -----------------------------------------------------------------------------
;; Backups
;; -----------------------------------------------------------------------------

(setq make-backup-files nil) ; stop creating those backup~ files
