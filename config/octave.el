;; Octave mode
;;
;; I don't use this anymore and it needs some cleaning up.

;; bind octave-move to .m files.
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; Usefull stuff.
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; Auto-indent on ENTER
;;(define-key octave-mode-map "\C-m"
;;  'octave-reindent-then-newline-and-indent)

;; Start an octave process within emacs
(autoload 'run-octave "octave-inf" nil t)
