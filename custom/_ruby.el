(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . rspec-mode))

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(require 'ruby-tools)
(add-hook 'haml-mode-hook 'ruby-tools-mode)

(eval-after-load 'rspec-mode
 '(rspec-install-snippets))


