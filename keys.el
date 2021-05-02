;; keys -*- lexical-binding: t -*-
;;* Ctrl shortcus

;;* Ctrl Meta shortcuts

;;* Mod4 shortcuts
(global-set-key "θ" 'cd-quotes)                 ; q
(global-set-key "ρ" 'cd-brackets)               ; r
(global-set-key "σ" 'cd-braces)                 ; c
(global-set-key "η" 'cd-save-and-switch-buffer) ; h
(global-set-key "ν" 'ace-window)                ; n


;;* Hydras
(defhydra hydra-dao (global-map ",")
  "Dao"
  ("," cd-comma "comma" :exit t)
  ("bb" cd-save-and-switch-buffer "switch-buffer" :exit t)
  ("xo" ace-window "ace-window" :exit t))

(provide 'keys)
