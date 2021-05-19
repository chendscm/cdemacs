(require 'eww)
(require 'avy)

(defun eww-view-ace ()
  "Select point with ace-jump-mode and make that line the top one."
  (interactive)
  (call-interactively #'avy-goto-char)
  (recenter 0))

(defun cd-para-down (arg)
  (interactive "p")
  (if (bolp)
      (progn
        (forward-paragraph arg)
        (forward-line 1))
    (line-move arg)))

(defun cd-para-up (arg)
  (interactive "p")
  (if (bolp)
      (progn
        (forward-line -1)
        (backward-paragraph arg)
        (forward-line 1))
    (line-move (- arg))))

(define-key eww-mode-map "j" 'cd-para-down)
(define-key eww-mode-map "k" 'cd-para-up)
(define-key eww-mode-map "l" 'forward-char)
(define-key eww-mode-map "L" 'eww-back-url)
(define-key eww-mode-map "h" 'backward-char)
(define-key eww-mode-map "v" 'recenter-top-bottom)
(define-key eww-mode-map "V" 'eww-view-source)
(define-key eww-mode-map "m" 'eww-follow-link)
(define-key eww-mode-map "a" 'move-beginning-of-line)
(define-key eww-mode-map "e" 'move-end-of-line)
(define-key eww-mode-map "o" 'ace-link-eww)
(define-key eww-mode-map "y" 'eww)
(define-key eww-mode-map "A" 'eww-view-ace)
(define-key eww-mode-map "c" 'counsel-ace-link)
(define-key eww-mode-map "R" 'cd-eww-readable)

;;;###autoload
(defun cd-eww-hook ())

(csetq shr-width 60)

(defun cd-eww-readable ()
  (interactive)
  (eww-readable)
  (cd--eww-reader-scale))

(defun cd--eww-reader-scale ()
  (text-scale-set 3)
  (setq left-margin-width 30)
  (set-window-margins nil 30)
  (remove-hook 'eww-after-render-hook 'cd--eww-reader-scale))

;;;###autoload
(defun cd-eww-reader ()
  (interactive)
  (cond ((eq major-mode 'org-mode)
         (let ((context (org-element-context)))
           (when (eq (org-element-type context) 'link)
             (eww (org-element-property :raw-link context))
             (add-hook 'eww-after-render-hook 'cd--eww-reader-scale))))))
