;; C/C++ Style definition.


;; -----------------------------------------------------------------------------
;; General formatting
;; -----------------------------------------------------------------------------

(defun utils/c-config-hook ()
  (whitespace-mode t)
  (setq show-trailing-whitespace nil)
  (setq fill-column 80)

  ;; Sadly it's incredibly buggy. Just use M-q instead.
  ;; (utils/enable-auto-fill 80 1)

  ; 4 space indent
  (setq indent-tabs-mode nil)
  (setq c-indent-level 4)
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'utils/c-config-hook)
(add-hook 'c++-mode-common-hook 'utils/c-condig-hook)


;; -----------------------------------------------------------------------------
;; Indentation guide
;; -----------------------------------------------------------------------------

(defun utils/c-style-hook ()
  ;; C-c C-o For offsets-alist name at line
  (setq c-offsets-alist
	(quote ((innamespace . 0)
		(inclass . +)
		(access-label . -)

		(statement-block-intro . +)
		(statement-cont . +)
		(statement-case-intro . +)

		(substatement . +)
		(substatement-open . 0)

		(topmost-intro . 0)
		(topmost-intro-cont . 0)

		(member-init-intro . +)
		(defun-block-intro . +)

		(arglist-intro . ++)
		(arglist-cont-nonempty . ++)
		(template-args-cont . +)

		(brace-list-intro . +)

		(cpp-define-intro . +)
		(stream-op . +)
		))))

(add-hook 'c-mode-common-hook 'utils/c-style-hook)
(add-hook 'c++-mode-common-hook 'utils/c-style-hook)
