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

(setq auto-mode-alist
      (append '(("\\.cu" . c++-mode)) auto-mode-alist))

(require 'cc-mode)
(load "google-c-style.el")
(add-hook 'c-mode-common-hook
          '(lambda()
             (google-set-c-style)))

(setq auto-mode-alist
      (append '(("\\.h" . c++-mode)) auto-mode-alist))

