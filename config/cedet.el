
(load-file "~/.emacs.d/vendor/cedet/common/cedet.el")

(require 'semantic-gcc)
(require 'semantic-ia)
(require 'semantic-decorate-include)
(require 'eassist)

(global-ede-mode t)

;; === Semantic ===

;; Configure by hand but still enable a minimum.
(semantic-load-enable-code-helpers)

(setq semanticdb-default-save-directory "~/.semanticdb")

(global-semanticdb-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semantic-stickyfunc-mode 1) ;; function name in buffer header.
(global-semantic-highlight-func-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-breadcrumbs-mode 1)
(global-semantic-idle-summary-mode 1) ;; summary of tag under point (minor-mode)

;; Idle work scheduling
(setq semantic-idle-scheduler-idle-time 1) ;; small work loads
(setq semantic-idle-scheduler-work-idle-time 60) ;; large work loads.
(setq semantic-idle-work-parse-neighboring-files-flag t)
(setq semantic-idle-scheduler-no-working-message nil)
(setq semantic-idle-scheduler-working-in-modeline-flag t)

;; this will probably not work, not sure how NAME is supposed to be specified.
(semantic-toggle-decoration-style 'semantic-decoration-on-includes t)

;; speedup searchs by not looking system files.
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(local recursive unloaded))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(local recursive unloaded))

;; === Hook ===

(add-hook 'semantic-init-hooks 'senator-minor-mode)

(defun rattab/cedet-hook ()
  (setq senator-step-at-tag-classes 'function)
  (setq senator-step-at-start-end-tag-classes nil)

  (local-set-key "\C-cJ" 'senator-complete-jump)
  (local-set-key [(control tab)] 'senator-complete-symbol)

  (local-set-key "\C-c/" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)

  (local-set-key "\C-cl" 'semantic-ia-complete-symbol)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cd" 'semantic-ia-show-doc)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)

  (local-set-key "\C-cr" 'semantic-symref)
  (local-set-key "\C-cR" 'semantic-symref-symbol)

  (local-set-key "\C-cf" 'eassist-list-methods)
  (local-set-key "\C-ch" 'eassist-switch-h-cpp))

(add-hook 'c-mode-common-hook 'rattab/cedet-hook)
(add-hook 'c++-mode-common-hook 'rattab/cedet-hook)
(add-hook 'python-mode-hook 'rattab/cedet-hook)
