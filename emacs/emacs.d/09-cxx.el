(require 'cc-mode)

;; CUDA
(setq auto-mode-alist
      (append '(("\\.cu" . c++-mode)) auto-mode-alist))

(setq-default c-basic-offset 4)

;; Coding style
(setq clang-format-style "{BasedOnStyle: Google, AccessModifierOffset: -4, ColumnLimit: 140, IndentWidth: 4, DerivePointerAlignment: false, PointerAlignment: Left}")

;(add-hook 'c-mode-common-hook
          ;(function (lambda()
                    ;(add-hook 'after-save-hook
                                        ;'clang-format-buffer))))

(add-hook 'c-mode-common-hook
          (lambda()
            (c-set-offset 'inextern-lang 0)
            (c-set-offset 'innamespace 0)))

(setq auto-mode-alist
      (append '(("\\.h" . c++-mode)) auto-mode-alist))

;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4
;; http://qiita.com/MitsutakaTakeda/items/2f526a85ad39424a8363

(use-package rtags
  :config
  (progn
    (rtags-enable-standard-keybindings c-mode-base-map)))

