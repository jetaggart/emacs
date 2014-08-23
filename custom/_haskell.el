(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-type 'cabal-repl)
(custom-set-variables
 ;; To enable tags generation on save.
 '(haskell-tags-on-save t)
 ;; To enable stylish on save.
 '(haskell-stylish-on-save t))
