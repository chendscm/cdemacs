;;* Misc
;;;###autoload
(defun cd-emacs-lisp-hook ()
  (ignore-errors
    (require 'lispy)
    (lispy-mode 1)
    (add-to-list 'completion-at-point-functions 'lispy-complete-fname-at-point)))
