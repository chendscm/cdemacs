;; keys -*- lexical-binding: t -*-
;;* Ctrl shortcus
(global-set-key (kbd "C-\\") 'toggle-input-method)
;;* Ctrl Meta shortcuts

;;* Mod4 shortcuts
(global-set-key "θ" 'cd-quotes)                             ; [q]
;; (global-set-key "ω" 'self-insert-command)                 ; [w]
;; (global-set-key (kbd "=") 'self-insert-command)           ; [e]
 (global-set-key "ρ" 'cd-brackets)                           ; [r]
;; (global-set-key (kbd "~") 'self-insert-command)           ; [t]
(global-set-key "υ" 'aya-expand)                             ; [y]
(global-set-key "ψ" 'universal-argument)                     ; [u]
(global-set-key "ϊ" 'hydra-avy/body)                         ; [i]
;; (global-set-key (kbd "DEL") 'self-insert-command)         ; [o]
(global-set-key (kbd "π") 'avy-goto-char)                    ; [p]
;; (global-set-key (kbd "-") 'self-insert-command)           ; [a]
;; (global-set-key (kbd "_") 'self-insert-command)           ; [s]
;; (global-set-key (kbd ":") 'self-insert-command)           ; [d]
(global-set-key "φ" 'cd-parens)                             ; [f]
;; (global-set-key (kbd ">") 'self-insert-command)           ; [g]
(global-set-key "η" 'cd-save-and-switch-buffer)             ; [h]
;; (global-set-key (kbd ";") 'self-insert-command)           ; [j]
(global-set-key "κ" 'hydra-k/body)                           ; [k]
;; (global-set-key (kbd "<") 'self-insert-command)           ; [l]
;; (global-set-key (kbd "+") 'self-insert-command)           ; [z]
(global-set-key "χ" 'lispy-right)                            ; [x]
(global-set-key "σ" 'cd-braces)                             ; [c]
;; (global-set-key (kbd "RET") 'newline)                     ; [v]
(global-set-key "β" nil)                                     ; [b]
(global-set-key "ν" 'ace-window)                             ; [n]
(global-set-key "μ" 'headlong-bookmark-jump)                 ; [m]



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
