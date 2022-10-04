(require 'eaf)

;; pdf
(require 'eaf-pdf-viewer)

;; browser
(require 'eaf-browser)
(setq eaf-browser-continue-where-left-off t)
(setq eaf-browser-enable-adblocker t)
(setq eaf-browser-remember-history nil)
(eaf-setq eaf-browser-default-zoom "1.5")
;; Proxy
(setq eaf-proxy-type "socks5")
(setq eaf-proxy-host "127.0.0.1")
(setq eaf-proxy-port "1080")

;; video player
(require 'eaf-video-player)

;; terminal
(require 'eaf-terminal)

;;
;; (setq eaf-evil-leader-key (kbd "<escape>"))

;;;##autoload
(defun cd-eaf-hook ()
  (define-key eaf-mode-map "," 'hydra-one-symbol/body))

(provide 'cd-eaf)
