;; Python Mode
;;
;; Could use some extra configuration.

;; Automatic indentation on newline
(defun my-python-hook ()
  (define-key python-mode-map "\C-m" 'newline-and-indent))

(add-hook 'python-mode-hook 'my-python-hook)
