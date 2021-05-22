;;

;;;### (autoloads nil "init" "init.el" (0 0 0 0))
;;; Generated autoloads from init.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "init" '("cd-advice-add" "csetq" "emacs-d" "yes-or-no-p")))

;;;***

;;;### (autoloads nil "keys" "keys.el" (0 0 0 0))
;;; Generated autoloads from keys.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "keys" '("hydra-dao")))

;;;***

;;;### (autoloads nil "modes/cd-company" "modes/cd-company.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from modes/cd-company.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-company" '("cd-")))

;;;***

;;;### (autoloads nil "modes/cd-eaf" "modes/cd-eaf.el" (0 0 0 0))
;;; Generated autoloads from modes/cd-eaf.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-eaf" '("cd-eaf-hook")))

;;;***

;;;### (autoloads nil "modes/cd-elisp" "modes/cd-elisp.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from modes/cd-elisp.el

(autoload 'cd-emacs-lisp-hook "modes/cd-elisp" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-elisp" '("cd-" "conditionally-enable-lispy" "eldoc-mode" "lisp--match-hidden-arg")))

;;;***

;;;### (autoloads nil "modes/cd-eshell" "modes/cd-eshell.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from modes/cd-eshell.el

(autoload 'cd-eshell-hook "modes/cd-eshell" nil nil nil)

(autoload 'eshell-this-dir "modes/cd-eshell" "\
Open or move eshell in `default-directory'." t nil)

;;;***

;;;### (autoloads nil "modes/cd-eww" "modes/cd-eww.el" (0 0 0 0))
;;; Generated autoloads from modes/cd-eww.el

(autoload 'cd-eww-hook "modes/cd-eww" nil nil nil)

(autoload 'cd-eww-reader "modes/cd-eww" nil t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-eww" '("cd-" "eww-view-ace")))

;;;***

;;;### (autoloads nil "modes/cd-flyspell" "modes/cd-flyspell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from modes/cd-flyspell.el

(autoload 'cd-flyspell-previous-word "modes/cd-flyspell" "\
Correct the first misspelled word that occurs before point.
But don't look beyond what's visible on the screen." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-flyspell" '("cd-make-flyspell-overlay-return-mouse-stuff" "flyspell-ignore-http-and-https")))

;;;***

;;;### (autoloads nil "modes/cd-fonts" "modes/cd-fonts.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from modes/cd-fonts.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-fonts" '("cd-set-font")))

;;;***

;;;### (autoloads nil "modes/cd-insert" "modes/cd-insert.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from modes/cd-insert.el

(autoload 'cd-quotes "modes/cd-insert" "\


\(fn ARG)" t nil)

(autoload 'cd-single-quotes "modes/cd-insert" "\


\(fn ARG)" t nil)

(autoload 'cd-parens "modes/cd-insert" nil t nil)

(autoload 'cd-dollars "modes/cd-insert" nil t nil)

(autoload 'cd-brackets "modes/cd-insert" nil t nil)

(autoload 'cd-braces "modes/cd-insert" nil t nil)

(autoload 'cd-braces-c++ "modes/cd-insert" "\
Insert {}.
Threat is as function body when from endline before )" t nil)

(autoload 'cd-angles-c++ "modes/cd-insert" nil t nil)

(autoload 'cd-angles "modes/cd-insert" nil t nil)

(autoload 'cd-comma "modes/cd-insert" nil t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-insert" '("cd-self-insert")))

;;;***

;;;### (autoloads nil "modes/cd-org" "modes/cd-org.el" (0 0 0 0))
;;; Generated autoloads from modes/cd-org.el

(autoload 'cd-org-latex-impatient-hook "modes/cd-org" nil nil nil)

;;;***

;;;### (autoloads nil "modes/cd-python" "modes/cd-python.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from modes/cd-python.el

(autoload 'cd-inferior-python-hook "modes/cd-python" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-python" '("cd-" "python-")))

;;;***

;;;### (autoloads nil "modes/cd-scheme" "modes/cd-scheme.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from modes/cd-scheme.el

(autoload 'cd-scheme-hook "modes/cd-scheme" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "modes/cd-scheme" '("scheme-completion-at-point")))

;;;***

;;;### (autoloads nil nil ("hooks.el" "modes/cd-auto.el" "modes/cd-avy.el"
;;;;;;  "modes/cd-chinese.el" "modes/cd-elisp-style-guide.el" "modes/cd-hydra.el"
;;;;;;  "modes/cd-ivy.el" "modes/cd-misc.el" "modes/cd-visuals.el")
;;;;;;  (0 0 0 0))

;;;***

;;;### (autoloads nil "auto" "auto.el" (0 0 0 0))
;;; Generated autoloads from auto.el

(autoload 'cd-c-forward-sexp-function "auto" "\


\(fn ARG)" nil nil)

(autoload 'update-all-autoloads "auto" nil t nil)

(autoload 'cd-save-and-switch-buffer "auto" "\


\(fn &optional ARG)" t nil)

(autoload 'cd-fontify-glyph "auto" "\


\(fn ITEM GLYPH)" nil nil)

;;;***
