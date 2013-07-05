;; Interactive do mode.
;;
;; Best mode since sliced bread.

(require 'ido)


;; -----------------------------------------------------------------------------
;; Config
;; -----------------------------------------------------------------------------

(setq ido-case-fold t)
(setq ido-enable-dot-prefix t)
(setq ido-enable-flex-matching nil)
(setq ido-enable-regexp t)

(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode 'both)


;; -----------------------------------------------------------------------------
;; Vertical display
;; -----------------------------------------------------------------------------

;; Display ido results vertically, rather than horizontally
(setq ido-decorations
      (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; (setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))


;; -----------------------------------------------------------------------------
;; ido for M-x
;; -----------------------------------------------------------------------------

(global-set-key
 (kbd "M-x")
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read "M-x " (all-completions "" obarray 'commandp))))))

(defun utils/ido-function-prompt (prompt pred)
  (describe-function
   (intern (ido-completing-read prompt (all-completions "" obarray pred)))))

(global-set-key
 (kbd "C-h f")
 (lambda ()
   (interactive)
   (utils/ido-function-prompt "Describe command: " 'commandp)))

(global-set-key
 (kbd "C-h F")
 (lambda ()
   (interactive)
   (utils/ido-function-prompt "Describe function: " 'fboundp)))
