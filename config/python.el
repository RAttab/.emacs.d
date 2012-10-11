;; Python Mode
;;
;; Could use some extra configuration.

;; Automatic indentation on newline
(defun my-python-hook ()
  (define-key python-mode-map "\C-m" 'newline-and-indent)
  (utils/enable-auto-fill 80 nil))

(add-hook 'python-mode-hook 'my-python-hook)
