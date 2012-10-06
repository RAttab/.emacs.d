;; Misc modes config
;;
;; Contains mode configs too short to be placed in it's own file.

(utils/add-vendor-path "misc")

;; -----------------------------------------------------------------------------
;; Dired-mode
;; -----------------------------------------------------------------------------

;; Dired for directory listing (same as C-xd). Avoids confusion.
(global-set-key (kbd "C-x C-d") 'dired)
(setq dired-listing-switches "-alh")


;; -----------------------------------------------------------------------------
;; Compilation
;; -----------------------------------------------------------------------------

(global-set-key (kbd "<f9>") 'recompile)
(global-set-key (kbd "<C-f9>") 'compile)
(setq compilation-auto-jump-to-first-error nil)
(setq compilation-context-lines 10)
(setq compilation-scroll-output 'first-error)


;; -----------------------------------------------------------------------------
;; Whitespace mode
;; -----------------------------------------------------------------------------

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs lines-tail))


;; -----------------------------------------------------------------------------
;; ispell
;; -----------------------------------------------------------------------------

(require 'iedit)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-;") 'iedit-mode)


;; -----------------------------------------------------------------------------
;; GDB
;; -----------------------------------------------------------------------------

(setq gdb-many-windows t)
(setq gdb-use-seperate-io-buffer nil) ;; meh, need to experiment.


;; -----------------------------------------------------------------------------
;; Shell mode
;; -----------------------------------------------------------------------------

;; Renders color codes in shell.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; -----------------------------------------------------------------------------
;; ispell
;; -----------------------------------------------------------------------------

(setq ispell-personal-dictionary "~/.emacs.d/ispell-dict")
