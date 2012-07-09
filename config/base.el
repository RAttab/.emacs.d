;; Main .emacs file

;; UI improvements

(setq default-frame-alist
      '((top . 0) (left . 0)
        (width . 200) (height . 60)
        (cursor-color . "white")
        (cursor-type . box)
        (foreground-color . "yellow")
        (background-color . "black")))
;;      (font . "-*-Courier-normal-r-*-*-13-*-*-*-c-*-iso8859-1")))

(set-face-attribute 'default nil :height 80)
(setq initial-frame-alist '((top . 10) (left . 30)))

(column-number-mode 1)
(show-paren-mode 1)
(size-indication-mode 1)

(setq confirm-kill-emacs 'yes-or-no-p)
(setq inhibit-splash-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)
;; Disable the backgrounding keys (super annoying)
(global-set-key "\C-z" nil)
(global-set-key "\C-x\C-z" nil)
;; Avoids spliting windows when opening buffer list
(global-set-key "\C-x\C-b" 'buffer-menu)
;; replace-string/regex
(global-set-key "\M-sr" 'replace-string)
(global-set-key "\M-se" 'replace-regexp)
;; Compilation mode invocation
(global-set-key [f9] 'recompile)
(global-set-key [(control f9)] 'compile)
;;comment-region
(global-set-key "\C-c\C-c" 'comment-region)

;; Fixes the stupid mouse wheel thing
(setq mouse-wheel-progressive-speed nil)
;; Avoids horizontal (top-bottom) splits.
(setq split-height-threshold nil)
(setq split-width-treshold most-positive-fixnum)
;; Windows key as meta - bad idea if you can't rebind it in the OS.
;;(setq x-super-keysym 'meta)

;; Ubuntu copy & paste
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Time in status bar
(display-time)

;; Create a backup file directory (removes annoying ~ files.
;; (defun make-backup-file-name (filename)
;;   (while (string-match "\\\\" (expand-file-name filename))
;;     (replace-match "!"))
;;   (concat "~/.emacs-backup/" filename))

;;(defun make-backup-file-name (file)
;;  (concat “~/.emacs_backups/” (file-name-nondirectory file) “~”))
(setq make-backup-files nil) ; stop creating those backup~ files
;; (setq auto-save-default nil) ; stop creating those #autosave# files


(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key [f5] 'revert-buffer-no-confirm)

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
	(revert-buffer t t t) )))
  (message "Refreshed open files.") )

;; Misc modes

;; Dired for directory listing (same as C-xd). Avoids confusion.
(global-set-key "\C-x\C-d" 'dired)

;; Renders color codes in shell.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; GDB
(setq gdb-many-windows t)
(setq gdb-use-seperate-io-buffer nil) ;; meh, need to experiment.

;; Compilation
(setq compilation-auto-jump-to-first-error nil)
(setq compilation-context-lines 10)
(setq compilation-scroll-output (quote first-error))

;; ispell
(setq ispell-personal-dictionary "~/.emacs.d/ispell-dict")

;; package.el
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))

;; Autofill
(defun enable-auto-fill (col comments)
  (setq fill-column col)
  (set (make-local-variable 'comment-auto-fill-only-comments) comments)
  (auto-fill-mode 1))

(defun load-if-exists (file)
  "Loads a file only if it exists"
  (if (file-exists-p file) (load file)))

;; Now load our various other modes and tweaks.

(load "~/.emacs.d/config/ido.el")
(load "~/.emacs.d/config/yasnippet.el")

(load "~/.emacs.d/config/magit.el")
(load "~/.emacs.d/config/org.el")

(load "~/.emacs.d/config/coffee.el")
(load "~/.emacs.d/config/python.el")
(load "~/.emacs.d/config/lua.el")
(load "~/.emacs.d/config/octave.el")

(load "~/.emacs.d/config/cedet.el")
(load "~/.emacs.d/config/style.el")
(load-if-exists "~/.emacs.d/config/project.el")

(load-if-exists "~/.emacs.d/config/local.el")
