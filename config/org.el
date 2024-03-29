;; Org mode

;; -----------------------------------------------------------------------------
;; Load & associate mode
;; -----------------------------------------------------------------------------

(require 'org)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(utils/require-package 'org-present)


;; -----------------------------------------------------------------------------
;; Global config
;; -----------------------------------------------------------------------------

(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; Controls where the agenda will look for it's files. A directory means that all
(setq org-agenda-files '("~/.emacs.d" "~/code" "~/org"))

(setq org-startup-indented t) ;space indented lists (no stars) - emacs 23.2 & +
(setq org-hide-leading-stars t) ; emacs 23.2 & -

(add-hook 'org-mode-hook 'visual-line-mode) ;; visual-line-fringe-indicators
;; (add-hook 'org-mode-hook 'turn-on-flyspell 'append) ;; Adds way to much visual noise.
;; (add-hook 'org-mode-hook (lambda () (abbrev-mode 1))) ;; TBD
(add-hook 'org-mode-hook (lambda () (utils/enable-auto-fill 80 nil)))

;; Syntax highlighting for source block.
(setq org-src-fontify-natively t)

;; Avoids the annoying non-monospace face for source blocks
(when (eq system-type 'windows-nt)
  (custom-set-faces
   '(org-block ((t (:inherit shadow :extend t))))))


;; -----------------------------------------------------------------------------
;; Present
;; -----------------------------------------------------------------------------

(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

;; -----------------------------------------------------------------------------
;; Refile
;; -----------------------------------------------------------------------------

;; Targets
(setq org-refile-targets '((nil :maxlevel . 2)(org-agenda-files :maxlevel . 2)))
;; Stop using paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path nil)
;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))
;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)


;; -----------------------------------------------------------------------------
;; Tags
;; -----------------------------------------------------------------------------

(setq org-tag-alist '(("task" . ?t)
                      ("bug" . ?b)
                      ("question" . ?q)
                      ("note" . ?n)
                      ("event" . ?e)))


;; -----------------------------------------------------------------------------
;; States
;; -----------------------------------------------------------------------------

(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "ONGOING(o!)" "DONE(d!)"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("ONGOING" :foreground "green" :weight bold)
              ("DONE" :foreground "blue" :weight bold))))


;; -----------------------------------------------------------------------------
;; Capture
;; -----------------------------------------------------------------------------

(setq org-deault-notes-file (expand-file-name "~/org/refile.org"))
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/org/refile.org" "Refile")
         "* TODO %? :task:\n  - State \"TODO\"       from \"\"           %T\n\n  %i\n")

        ("b" "Bug" entry (file+headline "~/org/refile.org" "Refile")
         "* TODO %? :bug:\n  - State \"TODO\"       from \"\"           %T\n  - FROM: %a\n\n  %i\n")

        ("q" "Question" entry (file+headline "~/org/refile.org" "Refile")
         "* ONGOING %? :question:\n  - State \"ONGOING\"    from \"\"           %T\n  - FROM: %a\n\n  %i\n")

        ("e" "Event" entry (file+headline "~/org/refile.org" "Refile")
         "* DONE %? :event:\n  - State \"DONE\"    from \"\"           %T\n\n  %i\n")

        ("n" "Note" entry (file+headline "~/org/refile.org" "Refile")
         "* %? :note:\n")))
