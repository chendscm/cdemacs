(require 'python)
(require 'autoinsert)
(require 'python-environment)
(require 'company-jedi)

(require 'lpy)

(setq-default python-shell-interpreter "python3")
;; python-shell-first-prompt-hook
(csetq python-indent-guess-indent-offset nil)
(defvar cd-no-pip
  (string-match "Command not found\\|no pip in"
                (shell-command-to-string "which pip")))

(define-key python-mode-map (kbd "RET") 'newline-and-indent)
(define-key python-mode-map (kbd "C-m") 'python-newline-dedent)

(defun python-newline-dedent ()
  (interactive)
  (if (bolp)
      (newline)
    (newline-and-indent)
    (unless (or (bolp)
                (lispy--in-string-p)))))

;;;###autoload
(defun cd-python-hook ()
  (setq-local company-backends '(company-dabbrev-code company-keywords))
  (setq python-environment-virtualenv
        '("virtualenv" "--system-site-packages" "--quite" "--python" "/usr/bin/python3"))
  (unless cd-no-pip
    (require 'jedi)
    (setq jedi:environment-root "jedi")
    (setq jedi:environment-virtualenv python-environment-virtualenv)
    (add-to-list 'company-backends 'company-jedi))
  (electric-indent-mode -1)
  (auto-complete-mode -1)
  (company-mode)
  (remove-hook 'post-command-hook 'jedi:handle-post-command t)
  (setq lispy-no-space t)
  (setq forward-sexp-function 'cd-c-forward-sexp-function)
  (lpy-mode)
  (setq completion-at-point-functions '(lispy-python-completion-at-point t))
  (setf (symbol-function #'jedi:handle-post-command) (lambda nil nil)))

;;;##autoload
(defun cd-inferior-python-hook ()
  (setq next-error-function 'cd-comint-next-error-function))

(defun cd-comint-next-error-function (n &optional reset)
  (interactive "p")
  (when reset
    (setq compilation-current-error nil))
  (let* ((msg (compilation-next-error (or n 1) nil
                                      (or compilation-current-error
                                          compilation-messages-start
                                          (point-min))))
         (loc (compilation--message->loc msg))
         (file (caar (compilation--loc->file-struct loc)))
         (buffer (find-file-noselect file)))
    (pop-to-buffer buffer)
    (goto-char (point-min))
    (forward-line (1- (cadr loc)))
    (back-to-indentation)
    (unless (bolp)
      (backward-char))))

(provide 'cd-python)

