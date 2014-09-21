(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/custom")

(load "_global.el")
(load "_evil.el")

(load "_company.el")
(load "_erc.el")
(load "_exec-path-from-shell.el")
(load "_haskell.el")
(load "_helm.el")
(load "_javascript.el")
(load "_git-gutter.el")
(load "_gnus.el")
(load "_magit.el")
(load "_org.el")
(load "_projectile.el")
(load "_real-auto-save.el")
(load "_ruby.el")
(load "_smartparens.el")
(load "_sass.el")
(load "_web-mode.el")
(load "_winner.el")
(load "_yasnippet.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))

(load-theme 'solarized-light)
(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))
