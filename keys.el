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

;;* C-x shortcuts
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x o") 'ace-window)


;;* Hydras
(defhydra hydra-dao (global-map ",")
  "Dao"
  ("d" hydra-sdcv/body "sdcv" :exit t))

(defhydra hydra-sdcv()
  "sdcv"
  ("b" sdcv-search-input "sdcv-input" :exit t)
  ("t" sdcv-search-input+ "sdcv-input+" :exit t))

;; (defhydra hydra-dao (global-map ",")
;;   "Dao"
;;   ("," cd-comma "comma" :exit t)
;;   ("." hydra-normal/body "normal" :exit t)
;;   ;; ("." cd-dot "dot" :exit t)
  
;;   ("db" sdcv-search-input "sdcv-input" :exit t)
;;   ("dt" sdcv-search-input+ "sdcv-input+" :exit t)
  
;;   ("bh" cd-save-and-switch-buffer "switch-buffer" :exit t)
  
;;   ("xf" counsel-find-file "find-file" :exit t)
;;   ("xk" kill-buffer "kill-buffer" :exit t)
;;   ("xs" save-buffer "save-buffer" :exit t)
;;   ("xo" ace-window "ace-window" :exit t))

;; (defhydra hydra-normal (:pre (set-cursor-color "#40e0d0")
;;                         :post (set-cursor-color "#ffffff"))
;;   "Normal mode"
;;   ("l" forward-char)
;;   ("h" backward-char)
;;   ("j" next-line)
;;   ("k" previous-line)
;;   ("i" nil nil)
;;   ("m" set-mark-command "mark")
;;   ("a" move-beginning-of-line "beg")
;;   ("e" move-end-of-line "end")
;;   ("x" delete-char "del-char")
;;   ("y" kill-ring-save "yank" :color blue)
;;   ("q" nil nil))


;;* Text
;;** Template replace 
(defvar cd-text-symbol-alist
  '(("q" "\"\"")
    ("w" "\\")
    ("e" "=")
    ("r" "[]")
    ("t" "~")
    ;; ("y" "")
    ;; ("u" "")
    ;; ("i" "")
    ;; ("p" "")
    
    ("a" "-")
    ("s" "_")
    ("d" ":")
    ("f" "()")
    ("g" ">")
    ;; ("h" "")
    ("j" ";")
    ;; ("k" "")
    ("l" "<")
    
    ("z" "+")
    ;; ("x" "")
    ("c" "{}")
    ;; ("v" "")
    ;; ("b" "")
    ;; ("n" "")
    ;; ("m" "")
    ("," ",")
    ("." ".")))

(defun hot-replace (str)
  "Expand insert template"
  (let ((expansion (cadr (assoc str cd-text-symbol-alist))))
    (backward-char 1)
    (delete-char 1)
    (insert expansion)
    (if (= (length expansion) 2)
        (backward-char 1))))

(defhydra hydra-text-template (:color blue :hint nil)
  ("q" (hot-replace "q") "\"\"")
  ("w" (hot-replace "w") "\\")
  ("e" (hot-replace "e") "=")
  ("r" (hot-replace "r") "\[\]")
  ("t" (hot-replace "t") "~")
  ;; ("y" (hot-replace "") "")
  ;; ("u" (hot-replace "") "")
  ;; ("i" (hot-replace "") "")
  ;; ("p" (hot-replace "") "")
  
  ("a" (hot-replace "a") "-")
  ("s" (hot-replace "s") "_")
  ("d" (hot-replace "d") ":")
  ("f" (hot-replace "f") "()")
  ("g" (hot-replace "g") ">")
  ;; ("h" (hot-replace "") "")
  ("j" (hot-replace "j") ";")
  ;; ("k" (hot-replace "") "")
  ("l" (hot-replace "l") "<")
  ("z" (hot-replace "z") "+")
  
  ;; ("x" (hot-replace "") "")
  ("c" (hot-replace "c") "{}")
  ;; ("v" (hot-replace "") "")
  ;; ("b" (hot-replace "") "")
  ;; ("n" (hot-replace "") "")
  ;; ("m" (hot-replace "") "")
  ("," (hot-replace ",") ",")
  (";" (hydra-text-normal/body))
  ("." (hot-replace ".") ".")
  ("o" nil "quit"))

;;** Modify
(defhydra hydra-text-normal (:pre (set-cursor-color "#40e0d0")
                        :post (set-cursor-color "#ffffff"))
  "Normal"
  ("l" forward-char)
  ("h" backward-char)
  ("j" next-line)
  ("k" previous-line)
  ("i" nil nil)
  ("m" set-mark-command "mark")
  ("a" move-beginning-of-line "beg")
  ("e" move-end-of-line "end")
  ("x" delete-char "del-char")
  ("y" kill-ring-save "yank" :color blue)
  ("o" nil nil))


;;** Control
(defun cd-text ()
  (interactive)
  (cond ((looking-back "d")
         (hydra-text-template/body))
        (t (hydra-text-normal/body))))


(global-set-key "." 'cd-text)
(define-key lispy-mode-map "." 'cd-text)

;;*
(provide 'keys)
