;; Linux-Mandrake Configuration
; Chmouel Boudjnah <chmouel@mandrakesoft.com>.
; Thanks to Eric Marsden <emarsden@mail.dotcom.fr>.

(setq-default indent-tabs-mode nil)
(setq-default nuke-trailing-whitespace-p t)


(set-background-color "ivory")
 (set-foreground-color "black")
 
(set-face-background `default "ivory")
 (set-face-foreground `default "black")

;; Some macros.
(defmacro GNUEmacs (&rest x)
  (list 'if (string-match "GNU Emacs 20" (version)) (cons 'progn x)))
(defmacro XEmacs (&rest x)
  (list 'if (string-match "XEmacs 20" (version)) (cons 'progn x)))
(defmacro Xlaunch (&rest x)
  (list 'if (eq window-system 'x)(cons 'progn x)))


(GNUEmacs 
 (Xlaunch
     (define-key global-map [(delete)]    "\C-d") 
))

(global-set-key "\M-g" 'goto-line)

(XEmacs
 (if (eq window-system 'x)
     (global-set-key (read-kbd-macro "DEL") 'delete-char)
   (or (global-set-key "[3~" 'delete-char))
   ))

;; By default we starting in text mode.
(setq initial-major-mode
      (lambda ()
        (text-mode)
	(font-lock-mode)
	))


;; Accents
(GNUEmacs
 (set-input-mode nil nil t))

; Some new Colors for Font-lock.
(setq font-lock-mode-maximum-decoration t)
(require 'font-lock)
(GNUEmacs (set-face-foreground 'modeline "red")
	  (set-face-background 'modeline "lemonchiffon"))

(GNUEmacs
 (setq transient-mark-mode 't)
 )

;;(setq default-frame-alist
;;      '(
;;; Define here the default geometry or via ~/.Xdefaults.
;;	(width . 84) (height . 46)
;;	(cursor-color . "red")
;;	(cursor-type . box)))

(setq default-frame-alist
      '(
;;; Define here the default geometry or via ~/.Xdefaults.
	(width . 80) (height . 40)
	(cursor-color . "red")
	(cursor-type . box)
	(foreground-color . "black")
	(background-color . "ivory")))


;; A small exemples to show how Emacs is powerfull.
; Define function to match a parenthesis otherwise insert a %

;; By default turn on colorization.
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode t)
  )

;; More information with the info file (Control-h i)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((innamespace . 0) (innamespace . 0))))
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(frame-background-mode (quote light))
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(js2-bounce-indent-flag nil)
 '(js2-mirror-mode nil)
 '(pc-select-meta-moves-sexps t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t nil (pc-select))
 '(prolog-indent-width 4)
 '(prolog-parse-mode (quote beg-of-clause))
 '(prolog-system (quote swi) t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(tool-bar-mode 0)
 '(widget-mouse-face (quote highlight)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "ivory" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((((class color) (background light)) (:foreground "Orchid"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "Firebrick"))))
 '(font-lock-constant-face ((((class color) (background light)) (:foreground "CadetBlue"))))
 '(font-lock-function-name-face ((((class color) (background light)) (:foreground "Blue"))))
 '(font-lock-keyword-face ((t (:bold t :italic t :foreground "Purple"))))
 '(font-lock-string-face ((((class color) (background light)) (:underline nil :foreground "RosyBrown"))))
 '(font-lock-type-face ((t (:foreground "Green4"))))
 '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "DarkGoldenrod"))))
 '(vhdl-font-lock-directive-face ((t (:foreground "Orchid")))))



;(setq load-path (cons "/usr/lib/pl-4.0.5/" load-path))
;(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
;(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
;(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
;(setq prolog-system 'swi)
;(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
;                                ("\\.m$" . mercury-mode))
;			      auto-mode-alist))


;(autoload 'matlab-mode "~/etc/emacs/matlab.el" "Enter Matlab mode." t) 
;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist)) 
;(autoload 'matlab-shell "~/etc/emacs/matlab.el" "Interactive Matlab mode." t) 

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

