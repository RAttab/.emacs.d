;; c-style file. 

;; Whitespace mode
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs lines-tail))

(defun c-config-hook ()
  (whitespace-mode t)
  (setq fill-column 80)
  ;; (enable-auto-fill 80 1) ;; Sadly it's incredibly buggy. Just use M-q instead.

  ; 4 space indent
  (setq indent-tabs-mode nil)
  (setq c-indent-level 4)
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'c-config-hook)
(add-hook 'c++-mode-common-hook 'c-condig-hook)

;; C-c C-o For offsets-alist name at line
(defun c-style-hook ()
  (setq show-trailing-whitespace nil)
  
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

(add-hook 'c-mode-common-hook 'c-style-hook)
(add-hook 'c++-mode-common-hook 'c-style-hook)



