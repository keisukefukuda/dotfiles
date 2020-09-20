(require 'cc-mode)

;; CUDA
(setq auto-mode-alist
      (append '(("\\.cu" . c++-mode)) auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.h" . c++-mode)) auto-mode-alist))

(require 'google-c-style)

;; Coding style
(add-hook 'c-mode-common-hook
          '(lambda()
             (google-set-c-style)
             (setq c-basic-offset 4)
             (c-set-offset 'inextern-lang 0)))

(add-hook 'c-mode-common-hook
          (lambda()
            (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local)))

;; ggtags

;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
          ;; (lambda()
            ;; (when (derived-mode-p 'c-mode 'c++-mode)
              ;; (ggtags-mode 1))))

;; (setq ggtags-completing-read-function nil)

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)


;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4
;; http://qiita.com/MitsutakaTakeda/items/2f526a85ad39424a8363

(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "C-M-i") 'company-complete)
  ;; (setq company-idle-delay nil) ; 自動補完をしない
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

