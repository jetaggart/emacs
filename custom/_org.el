(require 'org)
(require 'evil-org)
(require 'org-drill)
(require 'ob-latex)
(require 'ob-gnuplot)


;; recursively find .org files in provided directory
;; modified from an Emacs Lisp Intro example
(defun sa-find-org-file-recursively (directory &optional filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  ;; FIXME: interactively prompting for directory and file extension
  (let* (org-file-list
         (case-fold-search t)	; filesystems are case sensitive
         (file-name-regex "^[^.#].*")	; exclude .*
         (filext (if filext filext "org$\\\|org_archive"))
         (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
         (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
        (if (string-match fileregex file-or-dir) ; org files
            (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
        (dolist (org-file (sa-find-org-file-recursively file-or-dir filext)
                          org-file-list) ; add files found to result
          (add-to-list 'org-file-list org-file)))))))

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

(setq org-agenda-files (sa-find-org-file-recursively "~/org"))
(setq org-default-notes-file (concat org-directory "/todo.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Inbox")
	 "* TODO %?")
        ("s" "Scheduled Todo" entry (file+headline "~/org/todo.org" "Scheduled")
	 "* TODO %?")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

(add-hook 'org-mode-hook 'evil-org-mode) ;; only load with org-mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)


