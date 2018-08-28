(require 'cc-mode)

;; CUDA
(setq auto-mode-alist
      (append '(("\\.cu" . c++-mode)) auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.h" . c++-mode)) auto-mode-alist))

;; Coding style
(add-hook 'c-mode-common-hook
          '(lambda()
             (google-set-c-style)
             (setq c-basic-offset 4)
             (c-offsets-alist . ((innamespace . -)
                                 (inextern-lang . 0)))))

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

;; (when (require 'flycheck nil 'noerror)
;;   (custom-set-variables
;;    ;; Show popup error window
;;    '(flycheck-display-errors-function
;;      (lambda (errors)
;;        (let ((messages (mapcar #'flycheck-error-message errors)))
;;          (popup-tip (mapconcat 'identity messages "\n")))))
;;    '(flycheck-display-errors-delay 0.5))
;;   (define-key flycheck-mode-map (kbd "C-M-n") 'flycheck-next-error)
;;   (define-key flycheck-mode-map (kbd "C-M-p") 'flycheck-previous-error)
;;   (add-hook 'c-mode-common-hook 'flycheck-mode))

;; (eval-after-load "flycheck"
;;   '(progn
;;      (when (locate-library "flycheck-irony")
;;        (flycheck-irony-setup))))

;; (eval-after-load "irony"
;;   '(progn
;;      (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
;;      (add-to-list 'company-backends 'company-irony)
;;      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;      (add-hook 'c-mode-common-hook 'irony-mode)))

;;      (add-hook 'irony-mode-hook
;;                '(lambda () (if (and buffer-file-name
;;                                     (file-remote-p buffer-file-name))
;;                                (irony-mode 0)
;;                              (irony-mode 1))))
;;      (add-hook 'c-mode-common-hook 'irony-mode)))

