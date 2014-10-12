(require 'company)

(setq company-auto-complete t)
(setq company-idle-delay 0.1)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 3)

;; don't conflict with evil-mode
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "TAB") 'company-complete-selection)

;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

(add-to-list 'company-backends 'company-ghc)

(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'company-mode)
