(require 'cc-mode)

;; CUDA
(setq auto-mode-alist
      (append '(("\\.cu" . c++-mode)) auto-mode-alist))

;; coding style
(load "google-c-style.el")
(add-hook 'c-mode-common-hook
          '(lambda()
             (google-set-c-style)))

(setq auto-mode-alist
      (append '(("\\.h" . c++-mode)) auto-mode-alist))

(c-set-offset 'inextern-lang 0)

;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4
;; http://qiita.com/MitsutakaTakeda/items/2f526a85ad39424a8363

