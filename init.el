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
(defun cd-advice-add (&rest args)
  (when (fboundp 'advice-add)
    (apply #'advice-add args)))

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
(setq minibuffer-message-timeout 1)
(minibuffer-depth-indicate-mode 1)
(csetq rea-quoted-char-radix 16)
;;** editor behavior
(csetq load-prefer-newer t)
(csetq indent-tabs-mode nil)
(csetq ring-bell-function 'ignore)
(csetq highlight-nonselected-windows nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions nil)
(add-hook 'server-switch-hook 'raise-frame)
(defadvice set-window-dedicated-p (around no-dedicated-windows activate))
;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737
(setq x-selection-timeout 10)
;; improves copying from a ssh -X Emacs.
(setq x-selection-timeout 100)
(require 'whicher)
(csetq lpr-command (whicher "gtklp"))
;;** internals
(csetq gc-cons-threshold (* 10 1024 1024))
(csetq ad-redefinition-action 'accept)

;;** Rest

;;*** Backups
(setq backup-by-copying t)
(setq backup-directory-alist (list
                              (cons tramp-file-name-regexp "/tmp/")
                              '("." . "~/.emacs.d/backups")))
(setq delete-old-versions t)
(setq version-control t)
(setq create-lockfiles nil)
;;* Bootstrap
;;** autoloads
(load (concat emacs-d "loaddefs.el") nil t)
;;** enable features
(mapc (lambda (x) (put x 'disabled nil))
      '(erase-buffer upcase-region downcase-region
        dired-find-alternate-file narrow-to-region))
;;** package
(let ((file-name-handler-alist nil))
  (require 'eclipse-theme)
  (load-theme 'eclipse t)
  (require 'smex)
  (require 'warnings))

;;* Modes
;;** global minor modes
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(winner-mode 1)
(remove-hook 'minibuffer-setup-hook 'winner-save-unconditionally)
;; {{recentf
(require 'recentf)
(setq recentf-exclude '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
                        "[0-9a-f]\\{32\\}-[0-9a-f]\\{32\\}\\.org"
                        ".*png$" ".*cache$"))
(setq recentf-max-saved-items 600)
(eval-after-load 'xref
  '(progn
     (setq xref-pulse-on-jump nil)
     (setq xref-after-return-hook nil)))
;; }}
(require 'diminish)
(require 'cd-ivy)
(setq hippie-expand-verbose nil)
(blink-cursor-mode -1)
(require 'cd-auto)

;;* Use Package
;;** expansion
(require 'tiny)
;; {{ yanippet
(require 'yasnippet)
(diminish yas-minor-mode)
(setq yas-after-exit-snippet-hook '((lambda () (yas-global-mode -1))))
(setq yas-fallback-behavior 'return-nil)
(setq yas-triggers-in-field t)
(setq yas-verbosity 0)
(setq yas-snippet-dirs (list (concat emacs-d "snippets/")))
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))
;; }}
(require 'auto-yasnippet)
;; {{ iedit
(require 'iedit)
(setq iedit-log-level 0)
(define-key iedit-mode-keymap "\C-h" nil)
(define-key iedit-lib-keymap "\C-s" 'iedit-next-occurrence)
(define-key iedit-lib-keymap "\C-r" 'iedit-prev-occurrence)
(setq iedit-toggle-key-default nil)
;; }}
;;** completion
;; {{ auto-complete
(require 'auto-complete)
(auto-complete-mode)
(require 'auto-complete-config)
(setq ac-delay 0.4)
(define-key ac-complete-mode-map "\C-j" 'newline-and-indent)
(define-key ac-complete-mode-map [return] nil)
(define-key ac-complete-mode-map (kbd "M-TAB") nil)
;; }}
(require 'cd-company)
;;** keys
(require 'cd-hydra)
(require 'keys)
;;**appearance
(when (image-type-available-p 'xpm)
  (require 'powerline)
  (setq powerline-display-buffer-size nil)
  (setq powerline-display-mule-info t)
  (setq powerline-display-hud nil)
  (when (display-graphic-p)
    (powerline-default-theme)
    (remove-hook 'focus-out-hook 'powerline-unset-selected-window)))
;;** rest
(require 'cd-avy)
(require 'hooks)

;;* tmp put here
(require 'cd-eaf)
(require 'cd-chinese)
(require 'cd-python)
(require 'cd-misc)
(require 'cd-org)


