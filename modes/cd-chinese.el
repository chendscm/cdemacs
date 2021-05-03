(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)

(with-eval-after-load 'pyim
  ;; use western punctuation
  (setq pyim-punctuation-dict nil)

  ;; don't use shortcode2word
  (setq pyim-enable-shortcode nil)

  ;; use memory efficient pyim engine for pinyin ime
  (setq pyim-dcache-backend 'pyim-dregcache)

  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'quanpin)

  ;; don't use tooltip
  (setq pyim-use-tooltip 'popup))


(provide 'cd-chinese)
