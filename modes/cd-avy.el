;;* Ace Window
(require 'ace-window)
(csetq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(csetq aw-background nil)

(csetq aw-flip-keys '("n" "v"))
(add-to-list 'aw-dispatch-alist '(?v aw-flip-window))

(setq display-buffer-alist '(("\\*Org Attach\\[R"
			      ;; see alse: `helm-split-window-default-fn'
			      (display-buffer-pop-up-window))
			     ("\\*help\\[R" (display-buffer-reuse-mode-window
					     ace-display-buffer))
			     ("\\*helm"
			      ;; see alse: `helm-split-window-default-fn'
			      (display-buffer-pop-up-window))
			     ("magit-diff:" (ace-display-buffer)
			      (inhibit-same-window . t))))

(provide 'cd-avy)
