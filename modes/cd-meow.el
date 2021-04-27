(require 'meow)

(meow-global-mode 1)

;; (define-key keymap (kbd "\C-[") 'meow-insert-exit)

(defun meow-setup ()
  (meow-normal-define-key
   '("h" . meow-left)
   '("j" . meow-next)
   '("k" . meow-prev)
   '("l" . meow-right)
   '("xo" . ace-window)))

(with-eval-after-load "meow"
  (meow-setup))

(provide 'cd-meow)
