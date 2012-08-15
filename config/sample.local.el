;; Frame position
(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 200) (height . 100)))

;; Set the background to black.
(set-face-attribute 'default nil
		    :background "black"
		    :font "Bitstream Vera Sans Mono-8")

;; Foreground yellow in base.el changes the cursor color. Calling this
;; before the previous line causes the cursor to disapear.
(set-cursor-color "white")

;; Compilation mode
(setenv "PATH"
	(concat (getenv "PATH")
		":/home/remi/bin"
		":/home/remi/local/bin"))
(setenv "LD_LIBRARY_PATH" "/home/remi/local/lib")

(setq compilation-search-path
      '(nil ;; Default dir
	"/home/remi/code"))

;; Coffee script
(setq coffee-command "~/bin/coffee")


;; Disables warnings about overflowing the undo buffer.
(add-to-list 'warning-suppress-types '(undo discard-info))