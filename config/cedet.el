;; General CEDET configuration.


;; -----------------------------------------------------------------------------
;; Load CEDET itself
;; -----------------------------------------------------------------------------

(utils/load-vendor "cedet/common/cedet.el")

(require 'semantic-gcc)
(require 'semantic-ia)
(require 'semantic-decorate-include)
(require 'eassist)

(global-ede-mode t)

(add-to-list 'auto-mode-alist '("\\.tcc$" . c++-mode))


;; -----------------------------------------------------------------------------
;; Semantic
;; -----------------------------------------------------------------------------

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


;; -----------------------------------------------------------------------------
;; Hook
;; -----------------------------------------------------------------------------

(add-hook 'semantic-init-hooks 'senator-minor-mode)

(defun rattab/cedet-hook ()
  (setq senator-step-at-tag-classes 'function)
  (setq senator-step-at-start-end-tag-classes nil)

  (local-set-key (kbd "C-c J") 'senator-complete-jump)
  (local-set-key (kbd "C-<tab>") 'senator-complete-symbol)

  (local-set-key (kbd "C-c /") 'semantic-complete-analyze-inline)
  (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle)

;; conflicts with magit keys.
;;  (local-set-key (kbd "C-c l") 'semantic-ia-complete-symbol)
;;  (local-set-key (kbd "C-c s") 'semantic-ia-show-summary)

  (local-set-key (kbd "C-c d") 'semantic-ia-show-doc)
  (local-set-key (kbd "C-c j") 'semantic-ia-fast-jump)

  (local-set-key (kbd "C-c r") 'semantic-symref)
  (local-set-key (kbd "C-c R") 'semantic-symref-symbol)

  (local-set-key (kbd "C-c f") 'eassist-list-methods)
  (local-set-key (kbd "C-c h") 'eassist-switch-h-cpp)

  (local-set-key (kbd "C-c C-n") 'utils/join-line-down)
  (local-set-key (kbd "C-c C-p") 'delete-indentation))

(add-hook 'c-mode-common-hook 'rattab/cedet-hook)
(add-hook 'c++-mode-common-hook 'rattab/cedet-hook)
(add-hook 'python-mode-hook 'rattab/cedet-hook)
(add-hook 'java-mode-hook 'rattab/cedet-hook)
