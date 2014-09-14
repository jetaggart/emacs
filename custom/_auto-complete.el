(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(define-key ac-completing-map (kbd "ESC") 'ac-stop)
(setq ac-delay 0.125
      ac-auto-show-menu 0.25
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
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers))
(after 'auto-complete
  (add-to-list 'ac-sources 'ac-source-etags))
