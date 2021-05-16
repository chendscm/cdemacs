;;* Navigation
;;;###autoload 
(defun cd-c-forward-sexp-function (arg)
  (if (looking-at "^#")
      (forward-esxp arg)
    (let ((forward-esxp-function nil))
      (forward-sexp arg)
      (while (looking-at "[.-]")
        (forward-sexp)))
    (when (and (eq (char-after) ?.)
               (looking-back "[0-9]+" (line-beginning-position)))
      (forward-char)
      (skip-chars-forward "0-9"))))


;;* Regex

;;;###autoload
(defun update-all-autoloads ()
  (interactive)
  (cd emacs-d)
  (let ((generated-autoload-file
	 (expand-file-name "loaddefs.el")))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;") ;; create the file with non-zero size to appease autoload
	(save-buffer)))
    (mapcar #'update-directory-autoloads
	    '("" "modes"))
    (update-directory-autoloads "")))

;;* Utility
;;;###autoload
(defun cd-save-and-switch-buffer (&optional arg)
  (interactive "P")
  (when (and (buffer-file-name)
             (not (bound-and-true-p archive-subfile-mode))
             (not buffer-read-only))
    (save-buffer))
  (if arg
      (let ((current-prefix-arg 4))
        (call-interactively #'magit-status))
    (unless (window-minibuffer-p)
      (ivy-switch-buffer))))
