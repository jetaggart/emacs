(projectile-global-mode)

(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(global-set-key (kbd "M-p") 'projectile-find-file)
(global-set-key (kbd "M-b") 'projectile-switch-to-buffer)
