;; yasnippet mode
;;
;; Snippets are in the ~/.emacs.d/snippets folder which is what you
;; probably want to edit.


;; -----------------------------------------------------------------------------
;; Load & associate 
;; -----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)


;; -----------------------------------------------------------------------------
;; Global config
;; -----------------------------------------------------------------------------

;; Use ido
(setq yas/prompt-functions '(yas/ido-prompt))

;; location of the snippets
(setq yas/root-directory '("~/.emacs.d/snippets"))

;; Register the snippets folder and load them.
(mapc 'yas/load-directory yas/root-directory)
