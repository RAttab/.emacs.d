;; ansi-term stuff
;;
;; Quick tips:
;; - C-x C-j -> line mode
;; - C-x C-k -> char mode

(require 'term)

;; -----------------------------------------------------------------------------
;; Smart F2 key
;; -----------------------------------------------------------------------------

(defun visit-ansi-term ()
  "If the current buffer is:
     1) a running ansi-term named *ansi-term*, rename it.
     2) a stopped ansi-term, kill it and create a new one.
     3) a non ansi-term, go to an already running ansi-term
        or start a new one while killing a defunt one"
  (interactive)
  (let ((is-term (string= "term-mode" major-mode))
        (is-running (term-check-proc (buffer-name)))
        (term-cmd "/bin/bash")
        (anon-term (get-buffer "*ansi-term*")))
    (if is-term
        (if is-running
            (if (string= "*ansi-term*" (buffer-name))
                (call-interactively 'rename-buffer)
              (if anon-term
                  (switch-to-buffer "*ansi-term*")
                (ansi-term term-cmd)))
          (kill-buffer (buffer-name))
          (ansi-term term-cmd))
      (if anon-term
          (if (term-check-proc "*ansi-term*")
              (switch-to-buffer "*ansi-term*")
            (kill-buffer "*ansi-term*")
            (ansi-term term-cmd))
        (ansi-term term-cmd)))))
(global-set-key (kbd "<f2>") 'visit-ansi-term)


;; -----------------------------------------------------------------------------
;; Enable F keys
;; -----------------------------------------------------------------------------
;; Pretty wonky and only really useful for htop.

;; (defconst term-function-key-alist '((f1 . "\e[OR")
;;                                     (f2 . "\e[OS")
;;                                     (f3 . "\e[OT")
;;                                     (f4 . "\e[OU")))

;; (defun term-send-function-key ()
;;   (interactive)
;;   (let* ((char last-input-event)
;;          (output (cdr (assoc char term-function-key-alist))))
;;     (term-send-raw-string output)))

;; (dolist (spec term-function-key-alist)
;;   (define-key term-raw-map
;;     (read-kbd-macro (format "<%s>" (car spec)))
;;     'term-send-function-key))