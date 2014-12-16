;; -----------------------------------------------------------------------------
;; go.el
;; Rémi Attab (remi.attab@gmail.com), 21 Apr 2014
;; FreeBSD-style copyright and disclaimer apply
;;
;; Golang mode
;; -----------------------------------------------------------------------------

(utils/require-package 'go-mode)


(defun utils/go-mode-hook ()
  (setq tab-width 4)
  (setq fill-column 80)
  ;; (add-hook 'before-save-hook 'gofmt-before-save) ;; Super annoying.
  (local-set-key (kbd "C-c C-f") 'gofmt)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-c d") 'godoc)
  (local-set-key (kbd "C-c a") 'go-import-add)
  (local-set-key (kbd "C-c C-c") 'comment-region))

(add-hook 'go-mode-hook 'utils/go-mode-hook)


(defun utils/go-package-name ()
  (let* ((dir (file-name-directory (buffer-file-name)))
         (name (file-name-nondirectory (directory-file-name dir))))
    (replace-regexp-in-string "^go" "" name)))
