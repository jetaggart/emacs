;; after advice borrowed from https://github.com/bling/dotemacs
(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))
;; no frills
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(setq inhibit-startup-screen t)

(powerline-default-theme)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)
;; auto-load all buffers on disk changes
(global-auto-revert-mode t)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

(define-key global-map (kbd "RET") 'newline-and-indent)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

