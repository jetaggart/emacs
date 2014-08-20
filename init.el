;; no frills
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(setq inhibit-startup-screen t)

;; no junk
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory)))

(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/custom")

(load "_evil.el")
(load "_exec-path-from-shell.el")
(load "_global.el")
(load "_haskell.el")
(load "_ido.el")
(load "_magit.el")
(load "_projectile.el")
(load "_ruby.el")
(load "_smartparens.el")
(load "_sublimity.el")
(load "_web-mode.el")
(load "_yasnippet.el")


