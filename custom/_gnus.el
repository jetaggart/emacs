(load "_osx-bbdb.el")

(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(setq bbdb-send-mail-style 'gnus)
(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)

(setq bbdb-offer-save 1
      bbdb-use-pop-up t
      bbdb-electric-p t
      bbdb-popup-target-lines  1)

(setq gnus-show-threads t
      gnus-thread-hide-subject t
      gnus-thread-hide-subtree nil
      gnus-thread-hide-killed t
      gnus-thread-ignore-subject nil
      gnus-use-cross-reference nil
      gnus-nov-is-evil nil)

(setq-default
  gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f  %B%s%)\n"
  gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
  gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject
  gnus-sum-thread-tree-false-root ""
  gnus-sum-thread-tree-indent ""
  gnus-sum-thread-tree-leaf-with-other "-> "
  gnus-sum-thread-tree-root ""
  gnus-sum-thread-tree-single-leaf "|_ "
  gnus-sum-thread-tree-vertical "|")

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-thread-hide-subtree t)
(setq gnus-thread-ignore-subject t)

(setq gnus-message-archive-group "nnimap:INBOX.Sent Items")

(setq gnus-ignored-newsgroups "")
