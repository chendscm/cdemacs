;;* {{ start dictionary lookup
(require 'sdcv)
;; # wordnet English => English
;;  https://src.fedoraproject.org/repo/pkgs/stardict-dic/stardict-dictd_www.dict.org_wn-2.4.2.tar.bz2/f164dcb24b1084e1cfa2b1cb63d590e6/stardict-dictd_www.dict.org_wn-2.4.2.tar.bz2
;; # Langdao Chinese => English
;; https://src.fedoraproject.org/repo/pkgs/stardict-dic/stardict-langdao-ec-gb-2.4.2.tar.bz2/41a71f5b3952709746dd7e52cf155b8b/stardict-langdao-ec-gb-2.4.2.tar.bz2
;;
(setq sdcv-dictionary-data-dir ;; setup directory of stardict dictionary
      (concat emacs-d "sdcv-dict"))
(setq sdcv-dictionary-simple-list ;; setup dictionary list for simple search
      '("朗道英汉字典5.0"))
(setq sdcv-dictionary-complete-list ;; setup dictionary list for complete search
      '("朗道英汉字典5.0"
        ;; "WordNet"
        ))
(setq sdcv-tooltip-timeout 60)
;; }}

(provide 'cd-misc)

