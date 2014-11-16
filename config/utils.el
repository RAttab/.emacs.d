;; Collection of useful functions.
;;
;; Any functions that are not expected to be used through M-x should
;; be prefixed by the utils/ namespace.


;; -----------------------------------------------------------------------------
;; Elisp load
;; -----------------------------------------------------------------------------

(defun utils/require-package (package)
  (when (not (require package nil t)) 
    (when (not package-archive-contents) (package-refresh-contents))
    (package-install package)
    (require package)))

(setq utils/base-path "~/.emacs.d/")
(setq utils/config-path (concat utils/base-path "config/"))

(defun load-if-exists (file)
  "Loads a file only if it exists"
  (if (file-exists-p file) (load file)))

(defun utils/load-config (file)
  "Loads a config file from ~/.emacs.d/config"
  (load (concat utils/config-path file)))

(defun utils/load-config-if-exists (file)
  "Loads a config file from ~/.emacs.d/config"
  (load-if-exists (concat utils/config-path file)))


;; -----------------------------------------------------------------------------
;; Join Line
;; -----------------------------------------------------------------------------

(defun utils/join-line-down ()
  "See the join-line doc"
  (interactive)
  (join-line -1))


;; -----------------------------------------------------------------------------
;; Paragraph keys
;; -----------------------------------------------------------------------------

(defun utils/set-paragraph-keys ()
  "Sets the M-n and M-p paragraph keys localy for a given mode"
  (local-set-key (kbd "M-n") 'forward-paragraph)
  (local-set-key (kbd "M-p") 'backward-paragraph))

;; -----------------------------------------------------------------------------
;; Indent
;; -----------------------------------------------------------------------------

(defun utils/setup-indent ()
  (whitespace-mode t)
  (setq fill-column 80)
  (setq indent-tabs-mode nil)
  (setq c-indent-level 4)
  (setq c-basic-offset 4))


;; -----------------------------------------------------------------------------
;; Autofill
;; -----------------------------------------------------------------------------

(defun utils/enable-auto-fill (col comments)
  (setq fill-column col)
  (set (make-local-variable 'comment-auto-fill-only-comments) comments)
  (auto-fill-mode 1))


;; -----------------------------------------------------------------------------
;; Revert
;; -----------------------------------------------------------------------------

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
	(if (file-exists-p buffer-file-name)
	    (revert-buffer t t t)
	  (message (concat "File no longer exists: " buffer-file-name))))))
  (message "Refreshed open files."))


(defun utils/revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))


;; -----------------------------------------------------------------------------
;; Backup
;; -----------------------------------------------------------------------------
;; Failed experiment

(defun utils/replace-char (str old new)
  "Replace all the OLD chars to the NEW char in the STR string."
  (let ((index (string-match (make-string 1 old) str)))
    (if index
	(let ()
	  (aset str index new)
	  (utils/replace-char str old new))
      str)))

(defun utils/make-backup-filename (file)
  "Turns a path into a unique filename usable for backups."
  (concat "~/.emacs_backups/"
	  (utils/replace-char (expand-file-name file) ?/ ?!)))
