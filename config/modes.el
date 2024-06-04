;; Misc modes config
;;
;; Contains mode configs too short to be placed in it's own file.

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

(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))


;; -----------------------------------------------------------------------------
;; Whitespace mode
;; -----------------------------------------------------------------------------

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs lines-tail))

;; -----------------------------------------------------------------------------
;; markdown-mode
;; -----------------------------------------------------------------------------

(utils/require-package 'markdown-mode)
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

(add-to-list 'auto-mode-alist '("\\.ebuild$" . shell-script-mode))
(defun my-shell-script-hook ()
  (whitespace-mode t)
  (setq ident-tabs-mode nil)
  (setq sh-basic-offset 4)
  (setq sh-indentation 4))
(add-hook 'sh-mode-hook 'my-shell-script-hook)


;; -----------------------------------------------------------------------------
;; ispell
;; -----------------------------------------------------------------------------

(setq ispell-personal-dictionary "~/.emacs.d/ispell-dict")


;; -----------------------------------------------------------------------------
;; iasm-mode
;; -----------------------------------------------------------------------------

(utils/require-package 'iasm-mode)

(global-set-key (kbd "C-c C-d") 'iasm-disasm)
(global-set-key (kbd "C-c C-l") 'iasm-ldd)

(add-hook
 'c-mode-common-hook
 (lambda ()
   (local-set-key (kbd "C-c C-d") 'iasm-goto-disasm-buffer)
   (local-set-key (kbd "C-c C-l") 'iasm-disasm-link-buffer)))

;; -----------------------------------------------------------------------------
;; uniquify
;; -----------------------------------------------------------------------------

(require 'uniquify)

(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix t)


;; -----------------------------------------------------------------------------
;; json
;; -----------------------------------------------------------------------------

(utils/require-package 'json-reformat)
(utils/require-package 'json-snatcher)
(utils/require-package 'json-mode)

(setq auto-mode-alist (append '(("\\.json$" . json-mode)) auto-mode-alist))

;; -----------------------------------------------------------------------------
;; yasnipet
;; -----------------------------------------------------------------------------

(utils/require-package 'yasnippet)

(yas/global-mode 1)
(setq yas/prompt-functions '(yas/ido-prompt))
(setq yas/root-directory '("~/.emacs.d/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;; -----------------------------------------------------------------------------
;; python
;; -----------------------------------------------------------------------------

(defun my-python-hook ()
  (local-set-key (kbd "C-m") 'newline-and-indent)
  (local-set-key (kbd "C-c C-c") 'comment-region))

(add-hook 'python-mode-hook 'my-python-hook)

;; -----------------------------------------------------------------------------
;; rust
;; -----------------------------------------------------------------------------

(utils/require-package 'rust-mode)

(setq auto-mode-alist (append '(("\\.rs$" . rust-mode)) auto-mode-alist))


;; -----------------------------------------------------------------------------
;; yaml
;; -----------------------------------------------------------------------------

(utils/require-package 'yaml-mode)
(setq auto-mode-alist (append '(("\\.sls$" . yaml-mode)) auto-mode-alist))


;; -----------------------------------------------------------------------------
;; docker
;; -----------------------------------------------------------------------------

(utils/require-package 'dockerfile-mode)


;; -----------------------------------------------------------------------------
;; graphviz
;; -----------------------------------------------------------------------------

(utils/require-package 'graphviz-dot-mode)

(setq auto-mode-alist (append '(("\\.dot$" . graphviz-dot-mode)) auto-mode-alist))

(defun utils/graphviz-dot-hook ()
  (whitespace-mode t)
  (setq show-trailing-whitespace t)
  (setq whitespace-line-column 160)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
(add-hook 'graphviz-dot-mode-hook 'utils/graphviz-dot-hook)


;; -----------------------------------------------------------------------------
;; elixir
;; -----------------------------------------------------------------------------

(utils/require-package 'erlang)

(defun utils/erlang-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'erlang-mode-hook 'utils/erlang-hook)

(setq auto-mode-alist (append '(("\\.erl$" . erlang-mode)) auto-mode-alist))


;; -----------------------------------------------------------------------------
;; elixir
;; -----------------------------------------------------------------------------

(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

(defun utils/elixir-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'elixir-mode-hook 'utils/elixir-hook)


;; -----------------------------------------------------------------------------
;; terraform
;; -----------------------------------------------------------------------------

(utils/require-package 'terraform-mode)
(setq auto-mode-alist (append '(("\\.tf$" . terraform-mode)) auto-mode-alist))


;; -----------------------------------------------------------------------------
;; rest
;; -----------------------------------------------------------------------------

(utils/require-package 'jq-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/restclient")
(require 'restclient)
(require 'restclient-jq)
