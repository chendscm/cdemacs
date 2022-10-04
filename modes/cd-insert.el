(require 'lispy)

;;* Insert defun 
;;;###autoload
(defun cd-quotes (arg)
  (interactive "P")
  (let (bnd)
    (cond ((eq major-mode 'term-mode)
           (term-send-raw-string "\"\"")
           (term-send-raw-string ""))

          ((region-active-p)
           (let ((beg (region-beginning))
                 (end (region-end)))
             (deactivate-mark)
             (goto-char beg)
             (insert "\"")
             (goto-char (1+ end))
             (insert "\"")))

          ((and (not (eq major-mode 'org-mode))
                (setq bnd (lispy--bounds-string))
                (not (eq (car bnd)
                         (point)))
                (not arg))
           (insert "\\\"\\\"")
           (backward-char 2))

          ((and (eq (char-before) ?<)
                (eq (char-after) ?>))
           (delete-region (1- (point))
                          (1+ (point)))
           (insert "\"\"")
           (backward-char))

          (t
           (insert "\"\"")
           (backward-char)))))

;;;###autoload
(defun cd-single-quotes (arg)
  (interactive "P")
  (if (region-active-p)
      (lispy--surround-region "'" "'")
    (insert "''")
    (backward-char)))

;;;###autoload
(defun cd-parens ()
  (interactive)
  (cond ((eq major-mode 'term-mode)
         (term-send-raw-string "()")
         (term-send-raw-string ""))
        ((region-active-p)
         (let ((beg (region-beginning))
               (end (region-end)))
           (goto-char end)
           (insert ")")
           (goto-char beg)
           (insert "(")
           (deactivate-mark)))
        ((looking-back "\\\\")
         (insert "(\\)")
         (backward-char 2))
        (t
         (if (or (looking-back "\\(if\\)\\|\\(for\\)\\|\\(switch\\)\\|\\(while\\)")
                 (eq major-mode 'sml-mode))
             (unless (looking-back " \\|\\[\\|(")
               (insert " ")))
         (insert "()")
         (backward-char))))

;;;###autoload
(defun cd-dollars ()
  (interactive)
  (cond ((region-active-p)
         (lispy--surround-region "$" "$"))
        (t
         (insert "$$")
         (backward-char))))

;;;###autoload
(defun cd-brackets ()
  (interactive)
  (cond ((eq major-mode 'term-mode)
         (term-send-raw-string "[]")
         (term-send-raw-string ""))
        ((region-active-p)
         (lispy--surround-region "[" "]"))
        (t
         (insert "[]")
         (backward-char))))

;;;###autoload
(defun cd-braces ()
  (interactive)
  (if (region-active-p)
      (progn
        (lispy--surround-region "{" "}")
        (backward-char)
        (forward-list))
    (insert "{}")
    (backward-char)))


(provide 'cd-insert)
