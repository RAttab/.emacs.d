;; Frame position
(setq initial-frame-alist
      '((top . 0) (left . 0) (width . 200) (height . 100)))

(set-face-attribute 'default nil
		    ;; Disable if running in console mode.
		    :background "black"
		    ;; In ubuntu use the ttf-bitstream-vera package.
		    :font "Bitstream Vera Sans Mono-8")

;; Foreground yellow in base.el changes the cursor color. Calling this
;; before the previous line causes the cursor to disapear.
(set-cursor-color "white")

;; Compilation mode
(setenv "PATH" (concat
		(getenv "PATH")
		":/home/remi/bin"
		":/home/remi/local/bin"))
(setenv "LD_LIBRARY_PATH" "/home/remi/local/lib")

(setq compilation-search-path
      '(nil ;; Default dir
	"/home/remi/code"))

;; Coffee script
(setq coffee-command "~/bin/coffee")


;; Disables warnings about overflowing the undo buffer.
;; warning-suppress-types seems to be a recent addition.
(add-to-list 'warning-suppress-types '(undo discard-info))

;; Uncomment to not load cedet.
;; (setq utils/enable-cedet nil)
