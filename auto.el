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
