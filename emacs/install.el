(when (< emacs-major-version 24)
  (let* ((pwd (file-name-as-directory (file-name-directory load-file-name)))
         (pkg-el (concat pwd "package.el")))
    (load pkg-el)))

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(package-refresh-contents)

(defun check-install (pkg)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(check-install 'cmake-mode)
(check-install 'js2-mode)
(check-install 'markdown-mode)
(check-install 'markdown-mode)
(check-install 'helm)
(check-install 'slime)
(check-install 'haskell-mode)
(check-install 'flymake-haskell-multi)

(check-install 'flymake-jslint)

