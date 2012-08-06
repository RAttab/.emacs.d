
;; Set the background to black.
(set-face-attribute 'default nil 
		    :background "black"
		    :font "Bitstream Vera Sans Mono-8")

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
