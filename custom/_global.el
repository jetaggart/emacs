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

;; color theme
(load-theme 'solarized-light t)

;; set up initial state
(setq inhibit-startup-screen t)
(setq initial-major-mode 'text-mode)

;; global undo tree
(global-undo-tree-mode)

;; turn on electric-indent-mode for both 24.3 and 24.4
(electric-indent-mode)

;; global linum mode
(global-linum-mode)
(setq linum-format "%4d ")

;; y/n is good enough
(fset 'yes-or-no-p 'y-or-n-p)

(setq x-underline-at-descent-line t)

;; instantly display current keystrokes in mini buffer
(setq echo-keystrokes 0.02)

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
;; revert dirs
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; no bells
(custom-set-variables '(ring-bell-function 'ignore))
(setq visible-bell nil)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; don't gc so much, this is the future!
(setq gc-cons-threshold 20000000)

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

;; mac like backspace
(global-set-key (kbd "<s-backspace>") 'backward-kill-word)

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'"
  (interactive)
  (let ((path-with-line-number
         (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos)))))
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))

;; quick copy of line
(define-key global-map (kbd "C-c M-l") 'copy-current-line-position-to-clipboard)

(when (display-graphic-p)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

;; seems pointless to warn. There's always undo.
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; fix scrolling
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)


;; quick window movements
(windmove-default-keybindings 'meta)

;; scroll compliation windows
(setq compilation-scroll-output t)

;; color compilation
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; insert slashes in xml mode
(setq nxml-slash-auto-complete-flag t)

;; turn on emacs 24.4 electric pair mode
(electric-pair-mode 1)

;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            (?\' . ?\')
                            ) )

;; emacs os x bindings
(global-set-key (kbd "s-<left>") 'backward-word)
(global-set-key (kbd "s-<right>") 'forward-word)
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-Z") 'undo-tree-redo)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
