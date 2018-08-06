;; -----------------------------------------------------------------------------
;; base.el
;; Rémi Attab (remi.attab@gmail.com), 01 Jun 2013
;; FreeBSD-style copyright and disclaimer apply
;;
;; Entry point for my config.
;; -----------------------------------------------------------------------------

;; -----------------------------------------------------------------------------
;; Utilities
;; -----------------------------------------------------------------------------

(load "~/.emacs.d/config/utils.el")

;; Disable annoying training wheel warning.
(put 'narrow-to-region 'disabled nil)


;; -----------------------------------------------------------------------------
;; Global Bindings
;; -----------------------------------------------------------------------------

;; Disable the backgrounding keys (super annoying)
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") nil)

;; Avoids spliting windows when opening buffer list
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; Movement keys (the true emacs way)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(add-hook 'makefile-mode-hook 'utils/set-paragraph-keys)
(add-hook 'Info-mode-hook 'utils/set-paragraph-keys)

;; Training wheels are OFF
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<M-right>"))

;; Useful shortcuts
(global-set-key (kbd "M-s r") 'replace-string)
(global-set-key (kbd "M-s e") 'replace-regexp)
(global-set-key (kbd "M-s s") 'search-forward-regexp)
(global-set-key (kbd "M-s w") 'rgrep)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "<f5>") 'utils/revert-buffer-no-confirm)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)
;; (global-set-key (kbd "C-x f") 'find-name-dired) ;; Replaced by magit-find-file.

;; Not quite c-hungry-delete but close enough for now.
;; (global-set-key (kbd "C-c C-d") 'just-one-space)
(global-set-key (kbd "C-c C-n") 'utils/join-line-down)
(global-set-key (kbd "C-c C-p") 'delete-indentation)

(global-set-key (kbd "C-c u") 'calc)
(global-set-key (kbd "C-c m") 'man)

(global-set-key (kbd "<f8>") 'flyspell-mode)
(global-set-key (kbd "C-<f8>") 'flyspell-buffer)

(global-set-key (kbd "C-c h") 'ff-find-other-file)


(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(global-set-key (kbd "M-Q") 'unfill-paragraph)

;; -----------------------------------------------------------------------------
;; Packages
;; -----------------------------------------------------------------------------

(require 'package)
(setq package-archives
      '(("gnu"          . "http://elpa.gnu.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")
	("melpa"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("melpa-stable" . 10)
	("gnu"          . 5)
	("melpa"        . 0)))
(package-initialize)


;; -----------------------------------------------------------------------------
;; Load rest of configs
;; -----------------------------------------------------------------------------

;; General stuff
(utils/load-config "ui.el")
(utils/load-config-if-exists "local.el")

;; Useful modes
(utils/load-config "org.el") ;; Has tons of global keys so make sure it goes first.
(utils/load-config "modes.el")
(utils/load-config "ido.el")
(utils/load-config "magit.el")
(utils/load-config "term.el")
(utils/load-config "cc.el")

;; Other languages
(utils/load-config "elisp.el")
(utils/load-config "coffee.el")
(utils/load-config "go.el")
