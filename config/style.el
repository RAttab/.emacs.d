;; c-style file. 
;; Can't keep it in cedet.el because that thing doesn't want to be reloaded.

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
		(topmost-intro-cont . +)

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


