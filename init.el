;;; oremacs
;;* Base direcotry and load-path
(defvar emacs-d
  (file-name-directory
   (file-chase-links load-file-name))
  "The giant turtle on which the world rests.")
(let ((emacs-git (expand-file-name "git/" emacs-d)))
  (mapc (lambda (x)
	  (add-to-list 'load-path (expand-file-name x emacs-git)))
	(delete "." (delete ".." (directory-files emacs-git)))))
(add-to-list 'load-path emacs-d)
(add-to-list 'load-path (expand-file-name "modes/" emacs-d))
(setq enable-local-variables :all)

(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set) 'set-default) ',variable ,value))

(require 'cd-visuals)

;;* Customize
;;** navigation within buffer
(csetq next-screen-context-lines 5)
(csetq recenter-positions '(top middle bottom))
;;** finding files
(csetq vc-follow-symlinks t)
(csetq file-file-suppress-same-file-warnings t)
(csetq read-file-name-completion-ignore-case t)
(csetq read-buffer-completion-ignore-case t)
(prefer-coding-system 'utf-8)
;;** minibuffer interaction
(csetq enable-recursive-minibuffers t)
;;** editor behavior
(csetq ring-bell-function 'ignore)

;;* Bootstrap
;;** autoloads
(load (concat emacs-d "loaddefs.el") nil t)
;;** package
(let ((file-name-handler-alist nil))
  (require 'eclipse-theme))

;;* Use Package
;;** rest
(require 'cd-avy)
(require 'hooks)

;;* tmp put here
;; (require 'cd-meow)
(require 'cd-eaf)
