(require 'shm)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(setq haskell-process-type 'cabal-repl)

(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(set-face-background 'shm-current-face "#eee8d5")
(set-face-background 'shm-quarantine-face "lemonchiffon")

(define-key shm-map (kbd "RET") 'shm/newline-indent)
