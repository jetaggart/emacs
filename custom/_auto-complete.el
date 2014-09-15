(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

;;; Make sure autocomplete doesn't interfere with yasnippet.
(setq yas-before-expand-snippet-hook (lambda () (auto-complete-mode -1)))
(setq yas-after-exit-snippet-hook (lambda () (auto-complete-mode 1)))

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(define-key ac-completing-map (kbd "C-g") 'ac-stop)
(define-key ac-completing-map (kbd "ESC") 'evil-normal-state)
(evil-make-intercept-map ac-completing-map)

(setq ac-delay 0.1
      ac-auto-show-menu 3
      ac-auto-start 3
      ac-quick-help-delay 2.0
      ac-ignore-case nil
      ac-candidate-menu-min 2
      ac-use-quick-help t
      ac-limit 10
      ac-disable-faces nil)

(setq-default ac-sources '(ac-source-abbrev
			   ac-source-words-in-buffer
			   ac-source-filename
			   ac-source-imenu
			   ac-source-etags
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers))
