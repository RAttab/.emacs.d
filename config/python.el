;; Python Mode
;;
;; Could use some extra configuration.

;; Automatic indentation on newline
(add-hook 'python-mode-hook '
	  (lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))