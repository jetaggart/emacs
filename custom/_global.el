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

;; always truncate lines
(setq-default truncate-lines t)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)
;; auto-load all buffers on disk changes
(global-auto-revert-mode t)

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

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'"
  (interactive)
  (let ((path-with-line-number
         (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos)))))
    (x-select-text path-with-line-number)
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))

(define-key global-map (kbd "M-l") 'copy-current-line-position-to-clipboard)

(defun mac-copy ()
  (shell-command-to-string "pbpaste"))

(defun mac-paste (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'mac-paste)
(setq interprogram-paste-function 'mac-copy)
