;; keys -*- lexical-binding: t -*-
;;* Ctrl shortcus
(global-set-key "\C-a" 'cd-move-beginning-of-line)      ; 'move-beginning-of-line
;; (global-set-key "\C-b" 'backward-char)                ; default
;; (global-set-key "\C-c" 'mode-specific-command-prefix) ; default
;; (global-set-key "\C-d" 'delete-char)                  ; default
;; (global-set-key "\C-e" 'move-end-of-line)             ; default
;; (global-set-key "\C-f" 'forward-char)                 ; default
;; (global-set-key "\C-g" 'keyboard-quit)                ; default
;; (global-set-key "\C-h" nil)                           ; 'help-command
;; (global-set-key "\C-i" 'indent-for-tab-command)       ; default
;; (global-set-key "\C-j" 'newline)                      ; default
;; (global-set-key "\C-k" 'kill-line)                    ; default
;; (global-set-key "\C-l" 'recenter-top-bottom)          ; default
;; (global-set-key "\C-m" 'newline-and-indent)           ; default
;; (global-set-key "\C-n" 'next-line)                    ; default
(global-set-key "\C-s" 'swiper)                          ; 'isearch-forward
(global-set-key "\C-t" 'smex)                            ; 'transpose-chars
(global-set-key "\C-u" 'undo)

(global-set-key (kbd "C-/") 'toggle-input-method)


;;* Ctrl Meta shortcuts

;;* C-x shortcuts
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x o") 'ace-window)


;;* Hydras
(defhydra hydra-dao (global-map ",")
  "Dao"
  ("w" hydra-window/body "window" :exit t)  
  ("d" hydra-sdcv/body "sdcv" :exit t)
  ("xf" counsel-find-file "find-file" :exit t)
  ("xk" kill-buffer "kill-buffer" :exit t)
  ("xs" save-buffer "save-buffer" :exit t)
  ("xo" ace-window "ace-window" :exit t))

(defhydra hydra-sdcv()
  "sdcv"
  ("b" sdcv-search-input "sdcv-input" :exit t)
  ("t" sdcv-search-input+ "sdcv-input+" :exit t))

(defhydra hydra-window (:color red
                        :columns nil)
  "window"
  ("h" windmove-left nil)
  ("j" windmove-down nil)
  ("k" windmove-up nil)
  ("l" windmove-right nil)
  ("H" hydra-move-splitter-left nil)
  ("J" hydra-move-splitter-down nil)
  ("K" hydra-move-splitter-up nil)
  ("L" hydra-move-splitter-right nil)
  ("v" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right))
       "vert")
  ("x" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down))
       "horz")
  ("t" transpose-frame "'" :exit t)
  ("o" delete-other-windows "one" :exit t)
  ("a" ace-window "ace")
  ("s" ace-swap-window "swap")
  ("d" ace-delete-window "del")
  ("i" ace-maximize-window "ace-one" :exit t)
  ("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump "bmk")
  ("q" nil "cancel")
  ("u" (progn (winner-undo) (setq this-command 'winner-undo)) "undo")
  ("f" nil))


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
  
  ("a" cd-move-beginning-of-line "beg")
  ("e" move-end-of-line "end")
  ("s" swiper "swiper")
  ("y" kill-ring-save "yank" :color blue)
  ("u" undo)
  ("x" delete-char "del-char")
  ("m" set-mark-command "mark")
  ("o" nil nil)
  ("/" toggle-input-method "input" :exit t)
  (";" nil nil))


;;** Control
(defun cd-text ()
  (interactive)
  (cond ((looking-back "d")
         (hydra-text-template/body))
        (t (hydra-text-normal/body))))


(global-set-key ";" 'cd-text)
(define-key lispy-mode-map ";" 'cd-text)

;;*
(provide 'keys)
