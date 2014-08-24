(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

(global-set-key (kbd "M-p") 'helm-projectile)

(after "evil-leader-autoloads"
  (evil-leader/set-key
    "g p" 'projectile-switch-project))
