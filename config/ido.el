;; Interactive do mode.
;;
;; Best mode since sliced bread.

(require 'ido)


;; -----------------------------------------------------------------------------
;; Config
;; -----------------------------------------------------------------------------

(setq ido-case-fold t)
(setq ido-enable-dot-prefix t)
(setq ido-enable-flex-matching t)
(setq ido-enable-regexp t)

(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode 'both)


;; -----------------------------------------------------------------------------
;; Vertical display
;; -----------------------------------------------------------------------------

;; Display ido results vertically, rather than horizontally
(setq ido-decorations 
      (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)
