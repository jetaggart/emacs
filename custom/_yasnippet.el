(require 'yasnippet)

(setq yas-snippet-dirs (append yas-snippet-dirs
             '("~/.emacs.d/snippets")))

(yas-global-mode 1)

(add-hook 'term-mode-hook (lambda()
        (yas-minor-mode -1)))
