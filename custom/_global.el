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

;; always use tabs
(setq-default indent-tabs-mode nil)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)
;; auto-load all buffers on disk changes
(global-auto-revert-mode t)

(global-linum-mode t)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-x C-c") nil)

;; Align with spaces only
;; http://stackoverflow.com/questions/915985/in-emacs-how-to-line-up-equals-signs-in-a-series-of-initialization-statements
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

(defun my-align-single-equals ()
  "Align on a single equals sign (with a space either side)."
  (interactive)
  (align-regexp
   (region-beginning) (region-end)
   "\\(\\s-*\\) =" 1 0 nil))

(global-set-key (kbd "C-c =") 'my-align-single-equals)

;; more readable :)
(when (display-graphic-p)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq mac-control-modifier 'control) 
  (setq ns-function-modifier 'hyper))
