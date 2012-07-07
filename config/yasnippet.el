(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(setq yas/root-directory '("~/.emacs.d/snippets"))
			   ;; "~/.emacs.d/vendor/yasnippet/snippets"))

(mapc 'yas/load-directory yas/root-directory)