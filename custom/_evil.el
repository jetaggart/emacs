(evil-mode 1)
(global-evil-surround-mode 1)
(global-evil-leader-mode t)

;; Set the initial evil state that certain major modes will be in.
(defcustom my-evil-state-modes
  '(fundamental-mode
    nav-mode
    ibuffer-mode
    grep-mode
    text-mode
    prog-mode
    sws-mode
    dired-mode
    comint-mode
    log-edit-mode
    compilation-mode)
  "List of modes that should start up in Evil state."
  :type '(repeat (symbol)))

(defun my-enable-evil-mode ()
  (if (apply 'derived-mode-p my-evil-state-modes)
      (turn-on-evil-mode)
    (set-cursor-color "red")))
(add-hook 'after-change-major-mode-hook 'my-enable-evil-mode)

(define-key evil-insert-state-map [remap newline] 'newline)
(define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

;; Window commands
(define-key evil-normal-state-map (kbd "C-w q") 'evil-window-delete)
(define-key evil-normal-state-map (kbd "C-w o") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(after 'evil
  ;; fix conflict with electric-indent-mode in 24.4
  (define-key evil-insert-state-map [remap newline] 'newline)
  (define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)

  (after "evil-leader-autoloads"
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "w" 'save-buffer
      "m" 'helm-M-x
      "b d" 'kill-this-buffer
      "v" (kbd "C-w v C-w l")
      "s" (kbd "C-w s C-w j") 
      "h" help-map
      "h h" 'help-for-help-internal

      ;; rspec
      "r l" (kbd "C-c , r")
      "r f" (kbd "C-c , v")
      "r s" (kbd "C-c , s")
      "r a" (kbd "C-c , a"))

    (after "magit-autoloads"
      (evil-leader/set-key
        "g s" 'magit-status
        "g b" 'magit-blame-mode
        "g c" 'magit-commit
        "g l" 'magit-log))))
