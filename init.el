(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/custom")

(load "_global.el")

(load "_exec-path-from-shell.el")
(load "_eshell.el")
(load "_haskell.el")
(load "_helm.el")
(load "_javascript.el")
(load "_magit.el")
(load "_multiplecursors.el")
(load "_org.el")
(load "_projectile.el")
(load "_ruby.el")
(load "_sass.el")
(load "_term.el")
(load "_web-mode.el")
(load "_winner.el")
(load "_yasnippet.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "19d84b6b3d8ff178fcf8c19ae97bd1b6c74bb07903d5856caa36b107ce923134" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(magit-use-overlays nil)
 '(org-drill-optimal-factor-matrix (quote ((1 (2.6 . 4.14) (1.7000000000000002 . 3.44)))))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.3 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values (quote ((hamlet/basic-offset . 4))))
 '(tab-width 2)
 '(todotxt-file "/Users/psylinse/Dropbox/todo/todo.txt" nil (todotxt)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-symbol-face ((t (:foreground "color-37")))))
