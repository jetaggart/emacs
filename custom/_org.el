(require 'org)
(require 'evil-org)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-image-actual-width '(400))
(setq org-startup-with-inline-images t)
(setq org-startup-with-latex-preview t)
(setq org-startup-indented t)
(setq org-indent-mode t)
(setq org-ellipsis " \u25b6" )
(setq org-hide-leading-stars t)
(setq org-special-ctrl-a/e t)
(setq org-link-file-path-type 'relative)

(setq org-agenda-files '("~/org"))
(setq org-default-notes-file (concat org-directory "/todo.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Inbox")
	 "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

(add-hook 'org-mode-hook 'evil-org-mode) ;; only load with org-mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)
