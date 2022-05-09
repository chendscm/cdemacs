;;* {{ pyim
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)

(with-eval-after-load 'pyim
  ;; use western punctuation
  (setq pyim-punctuation-dict nil)

  ;; don't use shortcode2word
  (setq pyim-enable-shortcode nil)

  ;; use memory efficient pyim engine for pinyin ime
  ;; (setq pyim-dcache-backend 'pyim-dregcache)

  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'quanpin)

  ;; don't use tooltip
  ;; (if (posframe-workable-p)
  ;;     (setq pyim-page-tooltip 'posframe)
  ;;   (setq pyim-page-tooltip 'popup))
  (setq pyim-page-tooltip 'posframe))
;; }}


(provide 'cd-chinese)
