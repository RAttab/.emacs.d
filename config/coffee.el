(add-to-list 'load-path "~/.emacs.d/vendor/defunkt-coffee-mode")
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


(setq coffee-tab-width 4)
(setq coffee-cleanup-whitespace nil)

(defun my-coffee-hook ()
  (local-set-key "\C-cc" 'coffee-compile-buffer)
)

(add-hook 'coffee-mode-hook 'my-coffee-hook)