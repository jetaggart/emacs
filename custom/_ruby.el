(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\html\.erb$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\haml$" . rspec-mode))
(add-to-list 'auto-mode-alist '("\\html\.haml$" . rspec-mode))

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'web-mode-hook 'rspec-mode)
(add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)

(setq rspec-auto-scroll nil)

(require 'ruby-tools)
(add-hook 'haml-mode-hook 'ruby-tools-mode)

(eval-after-load 'robe-mode
  '(local-key-binding (kbd "M-.") 'robe-jump))

(add-hook 'after-init-hook 'inf-ruby-switch-setup) 
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

