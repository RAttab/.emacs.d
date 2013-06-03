;; -----------------------------------------------------------------------------
;; elisp.el
;; Rémi Attab (remi.attab@gmail.com), 01 Jun 2013
;; FreeBSD-style copyright and disclaimer apply
;;
;; General config for editing elisp code.
;; -----------------------------------------------------------------------------

;; -----------------------------------------------------------------------------
;; Par Edit
;; -----------------------------------------------------------------------------

(autoload 'enable-paredit-mode
  "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (enable-paredit-mode)
	    ;; Paredit overwrites M-s AND M-S... that's just greedy...
	    (local-set-key (kbd "M-s o") 'occur)))
