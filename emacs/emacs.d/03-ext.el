(defmacro safe-require-and-do (pkg sym body)
  `(when (package-installed-p ,pkg)
     (progn
       (require ,sym)
       ,body)))

(defun require-if-installed (pkg sym)
  (when (package-installed-p pkg)
    (require sym)))

(safe-require-and-do
 'cmake-mode
 'cmake-mode
 (setq auto-mode-alist
       (append '(("CMakeLists\\.txt" . cmake-mode)
                 ("\\.cmake" . cmake-mode))
               auto-mode-alist)))


;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-command "/opt/local/bin/multimarkdown")


;; git-gutter+
;(require 'git-gutter+)
;(global-git-gutter+-mode t)
  

;; yasnippet-mode
;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4

(eval-after-load "yasnippet"
  '(progn
     (define-key yas-keymap (kbd "<tab>" nil))
     (yas-global-mode 1)))

;; company-mode
;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4

(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "C-M-i") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

;; irony
;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4

(eval-after-load "irony"
  '(progn
     (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
     (add-to-list 'company-backends 'company-irony)
     (add-hook 'irony-mode-ook 'irony-cdb-autosetup-compile-options)
     (add-hook 'c-mode-common-hook 'irony-mode)))


