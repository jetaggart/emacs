;; default vim for up
(setq-default evil-want-C-u-scroll t)

(evil-mode 1)
(global-evil-surround-mode 1)
(global-evil-leader-mode t)
(evilnc-default-hotkeys)
(global-evil-visualstar-mode)
(global-evil-matchit-mode 1)

;; configure evil-jumper mode
(setq evil-jumper-auto-center t)
(setq evil-jumper-auto-save-interval 3600)
(global-evil-jumper-mode t)

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
    log-edit-mode
    compilation-mode)
  "List of modes that should start up in Evil state."
  :type '(repeat (symbol)))

(defun my-enable-evil-mode ()
  (if (apply 'derived-mode-p my-evil-state-modes)
      (turn-on-evil-mode)))
(add-hook 'after-change-major-mode-hook 'my-enable-evil-mode)

(define-key evil-insert-state-map [remap newline] 'newline)
(define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

;; Window commands
(define-key evil-normal-state-map (kbd "C-w u") (kbd "4 0 C-w -"))
(define-key evil-normal-state-map (kbd "C-w d") (kbd "4 0 C-w +"))

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
      "e v" (kbd "C-w v C-w l")
      "e s" (kbd "C-w s C-w j")
      "h" help-map
      "h h" 'help-for-help-internal
      "u" 'universal-argument

      "t l" (kbd "C-c , r")
      "t f" (kbd "C-c , v")
      "t s" (kbd "C-c , s")
      "t a" (kbd "C-c , a")

      "g g" 'helm-google-suggest

      "i j" (lambda (count)
             "Insert a new line below with no identation."
             (interactive "p")
             (save-excursion
               (evil-move-end-of-line)
               (while (> count 0)
                 (insert "\n")
                 (setq count (1- count))))))

    (after "magit-autoloads"
      (evil-leader/set-key
        "g s" 'magit-status
        "g b" 'magit-blame-mode
        "g c" 'magit-commit
        "g l" 'magit-log))))
