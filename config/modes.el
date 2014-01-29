;; Misc modes config
;;
;; Contains mode configs too short to be placed in it's own file.

(utils/add-vendor-path "misc")

;; -----------------------------------------------------------------------------
;; color-theme
;; -----------------------------------------------------------------------------

(utils/add-vendor-path "color-theme")
(require 'color-theme)

(utils/add-vendor-path "solarized")
(require 'color-theme-solarized)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))

;; -----------------------------------------------------------------------------
;; Dired-mode
;; -----------------------------------------------------------------------------

;; Dired for directory listing (same as C-xd). Avoids confusion.
(global-set-key (kbd "C-x C-d") 'dired)
(setq dired-listing-switches "-alh")


;; -----------------------------------------------------------------------------
;; Compilation
;; -----------------------------------------------------------------------------

(global-set-key (kbd "<f9>") 'recompile)
(global-set-key (kbd "<C-f9>") 'compile)
(setq compilation-auto-jump-to-first-error nil)
(setq compilation-context-lines 10)
(setq compilation-scroll-output 'first-error)


;; -----------------------------------------------------------------------------
;; Whitespace mode
;; -----------------------------------------------------------------------------

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs lines-tail))


;; -----------------------------------------------------------------------------
;; iedit
;; -----------------------------------------------------------------------------

(require 'iedit)
(define-key global-map (kbd "C-;") 'iedit-mode)
(define-key isearch-mode-map (kbd "C-;") 'iedit-mode)


;; -----------------------------------------------------------------------------
;; cmake-mode
;; -----------------------------------------------------------------------------

(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists.txt" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

(defun my-cmake-hook ()
  (utils/setup-indent)
  (setq cmake-tab-width 4))
(add-hook 'cmake-mode-hook 'my-cmake-hook)

;; -----------------------------------------------------------------------------
;; js-mode
;; -----------------------------------------------------------------------------

(setq auto-mode-alist (cons '("\\.json\\'" . js-mode) auto-mode-alist))
(add-hook 'js-mode-hook 'utils/setup-indent)

;; -----------------------------------------------------------------------------
;; markdown-mode
;; -----------------------------------------------------------------------------

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(defun my-markdown-hook ()
  (setq fill-column 80)
  (visual-line-mode)
  (utils/set-paragraph-keys))
(add-hook 'markdown-mode-hook 'my-markdown-hook)

;; -----------------------------------------------------------------------------
;; gdb
;; -----------------------------------------------------------------------------

(setq gdb-many-windows t)
(setq gdb-use-seperate-io-buffer nil) ;; meh, need to experiment.

(add-to-list 'auto-mode-alist '("\\.gdb$" . gdb-script-mode))
(setq gdb-script-basic-indent 4)
(add-hook 'gdb-script-mode-hook 'utils/setup-indent)

;; -----------------------------------------------------------------------------
;; Shell mode
;; -----------------------------------------------------------------------------

;; Renders color codes in shell.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; -----------------------------------------------------------------------------
;; ispell
;; -----------------------------------------------------------------------------

(setq ispell-personal-dictionary "~/.emacs.d/ispell-dict")


;; -----------------------------------------------------------------------------
;; iasm-mode
;; -----------------------------------------------------------------------------

(require 'iasm-mode)

(global-set-key (kbd "C-c C-d") 'iasm-disasm)
(global-set-key (kbd "C-c C-l") 'iasm-ldd)

(add-hook
 'c-mode-common-hook
 (lambda ()
   (local-set-key (kbd "C-c d") 'iasm-goto-disasm-buffer)
   (local-set-key (kbd "C-c l") 'iasm-disasm-link-buffer)))

;; -----------------------------------------------------------------------------
;; uniquify
;; -----------------------------------------------------------------------------

(require 'uniquify)

(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix t)
