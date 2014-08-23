(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(evil-set-initial-state 'magit-log-edit-mode 'emacs)

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "j" 'magit-goto-next-section
  "k" 'magit-goto-previous-section
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)

(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
