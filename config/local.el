

;; Emacs' general look.

(setq default-frame-alist
      '((top . 0) (left . 0)
        (width . 200) (height . 60)
        (cursor-color . "white")
        (cursor-type . box)
        (foreground-color . "yellow")
        (background-color . "black")
;;        (font . "-*-Courier-normal-r-*-*-13-*-*-*-c-*-iso8859-1")
))

(set-face-attribute 'default nil :height 80)
(setq initial-frame-alist '((top . 10) (left . 30)))



;; indent as tabs of width 2
(defun c-local-style-hook ()
	(setq indent-tabs-mode f)
	(setq c-indent-level 4)
	(setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'c-local-style-hook)
(add-hook 'c++-mode-common-hook 'c-local-style-hook)


;; cedet

;;semantic-add-system-include - shove in a hook for the lang