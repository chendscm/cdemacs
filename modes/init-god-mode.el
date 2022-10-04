(require 'god-mode)
(global-set-key (kbd "<escape>") #'god-local-mode)

(defun cd-god-mode-update-mode-line ()
  (cond
    (god-local-mode
     (set-face-attribute 'mode-line nil
                         :foreground "#604000"
                         :background "#fff29a")
     (set-face-attribute 'mode-line-inactive nil
                         :foreground "#3f3000"
                         :background "#fff3da"))
    (t
     (set-face-attribute 'mode-line nil
                         :foreground "#0a0a0a"
                         :background "#d7d7d7")
     (set-face-attribute 'mode-line-inactive nil
                         :foreground "#404148"
                         :background "#efefef"))))

(add-hook 'post-command-hook 'cd-god-mode-update-mode-line)

(provide 'init-god-mode)












