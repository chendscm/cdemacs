;; keys -*- lexical-binding: t -*-
;;* Ctrl shortcus
(global-set-key (kbd "C-\\") 'toggle-input-method)
;;* Ctrl Meta shortcuts

;;* Mod4 shortcuts
(global-set-key "θ" 'cd-quotes)                 ; [q]
(global-set-key "ρ" 'cd-brackets)               ; [r]
(global-set-key "σ" 'cd-braces)                 ; [c]
(global-set-key "η" 'cd-save-and-switch-buffer) ; [h]
(global-set-key "ν" 'ace-window)                ; [n]
(global-set-key "φ" 'cd-parens)                 ; [f]


;;* Hydras
(defhydra hydra-dao (global-map ",")
  "Dao"
  ("," cd-comma "comma" :exit t)
  ("db" sdcv-search-input "sdcv-input" :exit t)
  ("dt" sdcv-search-input+ "sdcv-input+" :exit t)
  ("xb" cd-save-and-switch-buffer "switch-buffer" :exit t)
  ("xf" counsel-find-file "find-file" :exit t)
  ("xk" kill-buffer "kill-buffer" :exit t)
  ("xs" save-buffer "save-buffer" :exit t)
  ("xo" ace-window "ace-window" :exit t))

(provide 'keys)
