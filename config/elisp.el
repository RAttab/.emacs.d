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

(utils/require-package 'paredit)

(defun utils/elisp-mode-hook ()
  (whitespace-mode t)
  (setq show-trailing-whitespace nil)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)

  (enable-paredit-mode)
  (local-set-key (kbd "C-c C-b") 'eval-buffer)
  ;; Paredit overwrites M-s AND M-S... that's just greedy...
  (define-key paredit-mode-map (kbd "M-s") nil))

(add-hook 'emacs-lisp-mode-hook 'utils/elisp-mode-hook)
