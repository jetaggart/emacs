(require 'org)
(require 'ob-latex)
(require 'ob-gnuplot)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(add-to-list 'org-latex-packages-alist '("" "tikz"))

(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)
(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-latex-image-default-width "")
(setq org-startup-with-inline-images t)
(setq org-startup-with-latex-preview t)
(setq org-startup-indented t)
(setq org-indent-mode t)
(setq org-ellipsis " \u25b6" )
(setq org-hide-leading-stars t)
(setq org-special-ctrl-a/e t)
(setq org-link-file-path-type 'relative)

(setq org-default-notes-file (concat org-directory "/todo.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-agenda-files (quote ("~/org/todo.org")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Inbox")
	 "* TODO %?")
        ("s" "Scheduled Todo" entry (file+headline "~/org/todo.org" "Scheduled")
	 "* TODO %?")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))
