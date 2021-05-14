;;* Latex
;;** org-latex-impatient
(require 'names)
(require 'posframe)
(require 'org-latex-impatient)
;; {{ Dependencies npm
;; npm install mathjax-node-cli
;; }}

;;;###autoload
(defun cd-org-latex-impatient-hook()
  (org-latex-impatient-mode t)
  (setq org-latex-impatient-tex2svg-bin
        ;; location of tex2svg executable
        "~/node_modules/mathjax-node-cli/bin/tex2svg")
  (setq org-latex-impatient-scale 3)
  (setq org-latex-impatient-border-color "black"))

(require 'cd-org)
