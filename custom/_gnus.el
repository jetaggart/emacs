(setq gnus-permanently-visible-groups ".*INBOX")
(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

;; Install directly from github.
(with-current-buffer (url-retrieve-synchronously
                      "https://raw.github.com/chrisbarrett/osx-bbdb/master/osx-bbdb.el")
  (call-interactively 'package-install-from-buffer))

(when (equal system-type 'darwin)
  (require 'osx-bbdb))

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
