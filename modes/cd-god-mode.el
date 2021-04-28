(require 'god-mode)

(global-set-key (kbd "<escape>") #'god-local-mode)

(defun cd-god-mode-update-modeline ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "pink" "#ffc0cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "grey20" "grey90"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#f9b593"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "grey20" "grey90")))))))

(add-hook 'god-mode-enabled-hook #'cd-god-mode-update-modeline)
(add-hook 'god-mode-disabled-hook #'cd-god-mode-update-modeline)

(provide 'cd-god-mode)
