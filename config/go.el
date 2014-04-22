;; -----------------------------------------------------------------------------
;; go.el
;; Rémi Attab (remi.attab@gmail.com), 21 Apr 2014
;; FreeBSD-style copyright and disclaimer apply
;;
;; Golang mode
;; -----------------------------------------------------------------------------

(setq load-path (cons "/usr/local/go/misc/emacs" load-path))
(require 'go-mode-load)

(defun utils/go-mode-hook ()
  (setq tab-width 4)
  (local-set-key (kbd "C-c C-f") 'gofmt)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports))
(add-hook 'go-mode-hook 'utils/go-mode-hook)
