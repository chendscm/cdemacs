;;* Navigation
;;;###autoload
(defun cd-backward-delete-whitespace()
  (interactive)
  (save-match-data
    (let ((st (point))
          (en (progn
                (re-search-backward "[^ \t\r\n]+" nil t)
                (forward-char 1)
                (point))))
      (if (= st en)
          (progn
            (while (looking-back ")")
              (backward-char))
            (backward-kill-word 1))
        (delete-region st en)))))

(defun cd-c-forward-sexp-function (arg)
  (if (looking-at "^#")
      (forward-ifdef arg)
    (let ((forward-sexp-function nil))
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

;;* Launchers 

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

;;;###autoload
(defun cd-fontify-glyph (item glyph)
  `((,item)
    (0 font-lock-keyword-face t)
    (0 (prog1
           (compose-region (match-beginning 0)
                           (match-end 0)
                           ,glyph) nil))))
