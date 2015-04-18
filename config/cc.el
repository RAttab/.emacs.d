;; -----------------------------------------------------------------------------
;; auto-load
;; -----------------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("\\.tcc$" . c++-mode))


;; -----------------------------------------------------------------------------
;; My general style
;; -----------------------------------------------------------------------------

(defun utils/c-general-init ()
  (c-add-style "me-general"
               '((c-offsets-alist

                  ;; C-c C-o For offsets-alist name at line
                  (innamespace . 0)
                  (inclass . +)
                  (access-label . -)

                  (inline-open . 0)

                  (statement-block-intro . +)
                  (statement-cont . +)
                  (statement-case-intro . +)

                  (substatement . +)
                  (substatement-open . 0)

                  (topmost-intro . 0)
                  (topmost-intro-cont . 0)

                  (member-init-intro . +)
                  (defun-block-intro . +)

                  (arglist-intro . ++)
                  (arglist-cont-nonempty . ++)
                  (template-args-cont . +)

                  (brace-list-intro . +)

                  (cpp-define-intro . +)
                  (stream-op . +)
                  ))))

(add-hook 'c-mode-common-hook 'utils/c-general-init)
(add-hook 'c++-mode-common-hook 'utils/c-general-init)


(defun utils/c-general-load ()
  (whitespace-mode t)
  (setq show-trailing-whitespace nil)
  (setq fill-column 80)

  (setq indent-tabs-mode nil)
  (setq c-indent-level 4)
  (setq c-basic-offset 4)

  (c-set-style "me-general"))


;; -----------------------------------------------------------------------------
;; Linux Kernel style
;; -----------------------------------------------------------------------------

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1) c-basic-offset)))


(defun utils/c-linux-init ()
  (c-add-style "linux-tabs-only"
               '("linux" (c-offsets-alist
                          (arglist-cont-nonempty
                           c-lineup-gcc-asm-reg
                           c-lineup-arglist-tabs-only)))))

(add-hook 'c-mode-common-hook 'utils/c-linux-init)


(defun utils/c-linux-load ()
  (setq show-trailing-whitespace t)
  ;;(add-to-list ‘write-file-functions ‘delete-trailing-whitespace)

  (setq fill-column 80)
  (setq indent-tabs-mode t)

  (c-set-style "linux-tabs-only"))

;; -----------------------------------------------------------------------------
;; C & C++ hook
;; -----------------------------------------------------------------------------

(defun utils/c-hook ()
  (local-set-key (kbd "C-c C-n") 'utils/join-line-down)
  (local-set-key (kbd "C-c C-p") 'delete-indentation)

  (let ((filename (buffer-file-name)))
    ;; Enable kernel mode for the appropriate files
    (if (and filename (string-match (expand-file-name "~/code/linux") filename))
        (utils/c-linux-load) (utils/c-general-load))))

(add-hook 'c-mode-hook 'utils/c-hook)
(add-hook 'c++-mode-hook 'utils/c-hook)


;; -----------------------------------------------------------------------------
;; Java hook
;; -----------------------------------------------------------------------------

(defun utils/java-hook () (utils/c-general-load))
(add-hook 'java-mode-hook 'utils/c-general-load)
