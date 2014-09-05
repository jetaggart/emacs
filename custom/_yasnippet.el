(require 'yasnippet)
(yas-global-mode 1)

(define-key global-map (kbd "M-s") 'yas-expand)

(setq yas-snippet-dirs (append yas-snippet-dirs
			       '("~/.emacs.d/snippets")))
