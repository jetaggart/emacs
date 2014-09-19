(require 'yasnippet)
(yas-global-mode 1)

;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key global-map (kbd "M-d") 'yas-expand)

(setq yas-snippet-dirs (append yas-snippet-dirs
			       '("~/.emacs.d/snippets")))
