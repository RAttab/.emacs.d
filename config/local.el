

;; Emacs' general look.

(setq default-frame-alist
      '((top . 0) (left . 0)
        (width . 200) (height . 60)
        (cursor-color . "white")
        (cursor-type . box)
        (foreground-color . "yellow")
        (background-color . "black")
;;        (font . "-*-Courier-normal-r-*-*-13-*-*-*-c-*-iso8859-1")
))

(set-face-attribute 'default nil :height 80)
(setq initial-frame-alist '((top . 10) (left . 30)))



;; indent as 4 spaces.
(defun c-local-style-hook ()
	(setq indent-tabs-mode nil)
	(setq c-indent-level 4)
	(setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'c-local-style-hook)
(add-hook 'c++-mode-common-hook 'c-local-style-hook)


;; Compilation mode
(setenv "PATH"
	(concat (getenv "PATH")
		":/home/remi/bin"
		":/home/remi/local/bin"))
(setenv "LD_LIBRARY_PATH" "/home/remi/local/lib")
(setenv "PLATFORM" "/home/remi/code/platform")

(setq compilation-search-path 
      '(nil ;; Default dir
	"/home/remi/code/platform"
	"/home/remi/code/platform-deps"
	"/home/remi/code/platform-deps/node"
	"/home/remi/code/platform-deps/node/deps/v8"))

;; Coffee script
(setq coffee-command "~/bin/coffee")