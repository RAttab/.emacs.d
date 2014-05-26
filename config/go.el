;; -----------------------------------------------------------------------------
;; go.el
;; Rémi Attab (remi.attab@gmail.com), 21 Apr 2014
;; FreeBSD-style copyright and disclaimer apply
;;
;; Golang mode
;; -----------------------------------------------------------------------------

(defconst utils/go-sys-path "/usr/local/go/misc/emacs")
(defconst utils/go-usr-path "~/code/golang/misc/emacs")

(defun utils/go-is-sys () (when (file-exists-p utils/go-sys-path) t))
(defun utils/go-is-usr () (when (file-exists-p utils/go-usr-path) t))

(defun utils/go-load ()
  (if (utils/go-is-sys) (setq load-path (cons utils/go-sys-path load-path))
    (when (utils/go-is-usr) (setq load-path (cons utils/go-usr-path load-path)))))


(defun utils/go-mode-hook ()
  (setq tab-width 4)
  (local-set-key (kbd "C-c C-f") 'gofmt)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports))

(when (or (utils/go-is-sys) (utils/go-is-usr))
  (utils/go-load)
  (require 'go-mode-load)
  (add-hook 'go-mode-hook 'utils/go-mode-hook))
