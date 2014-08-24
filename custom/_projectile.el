(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(global-set-key (kbd "M-p") 'projectile-find-file)
(global-set-key (kbd "M-b") 'projectile-switch-to-buffer)

(after "evil-leader-autoloads"
  (evil-leader/set-key
    "g p" 'projectile-switch-project))
