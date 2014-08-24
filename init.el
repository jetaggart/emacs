(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/custom")

(load "_global.el")

(load "_evil.el")
(load "_exec-path-from-shell.el")
(load "_haskell.el")
(load "_ido.el")
(load "_git-gutter.el")
(load "_magit.el")
(load "_projectile.el")
(load "_real-auto-save.el")
(load "_ruby.el")
(load "_smartparens.el")
(load "_web-mode.el")
(load "_yasnippet.el")

