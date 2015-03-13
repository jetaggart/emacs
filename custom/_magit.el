(require 'magit)

;; clean whitespace on git
(add-hook 'before-save-hook 'whitespace-cleanup)
