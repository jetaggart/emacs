(setq sp-ignore-modes-list '(minibuffer-inactive-mode web-mode))

(require 'smartparens-config)
(require 'smartparens-ruby)

(smartparens-global-mode)
(show-smartparens-global-mode t)
(setq sp-autoescape-string-quote nil)


(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))
