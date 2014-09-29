(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(after "evil-leader-autoloads"
  (evil-leader/set-key
    "p" 'projectile-switch-project
    "b" 'projectile-switch-to-buffer
    "h" 'helm-projectile
    "f" 'projectile-find-file))
