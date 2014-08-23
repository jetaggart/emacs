;; no frills
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(setq inhibit-startup-screen t)

; disable backup
(setq backup-inhibited t)
; disable auto save
(setq auto-save-default nil)
; auto-load all buffers on disk changes
(global-auto-revert-mode t)

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

;; save buffers constantly
(defadvice switch-to-buffer (before save-buffer-now activate)
    (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
(defadvice windmove-up (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
(defadvice windmove-down (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
(defadvice windmove-left (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
(defadvice windmove-right (before other-window-now activate)
    (when buffer-file-name (save-buffer)))

(defun save-all ()
    (interactive)
      (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)


