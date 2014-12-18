(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(after "evil-leader-autoloads"
  (evil-leader/set-key
    "s" 'helm-projectile-ag
    "r" 'projectile-replace
    "p" 'helm-projectile-switch-project
    "b" 'helm-projectile-switch-to-buffer
    "h" 'helm-projectile
    "f" 'helm-projectile-find-file))
