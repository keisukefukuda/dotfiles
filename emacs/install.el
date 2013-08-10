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
(check-install 'markdown-mode)
(check-install 'helm)
(check-install 'helm-descbinds)

(check-install 'nrepl)
(check-install 'ac-nrepl)
(check-install 'clojure-mode)
(check-install 'nrepl-ritz)
(check-install 'melpa)
(check-install 'rainbow-delimiters)

(check-install 'haskell-mode)
(check-install 'flymake-haskell-multi)

(check-install 'clojure-mode)
(check-install 'nrepl)
(check-install 'nrepl-ritz)

(check-install 'js2-mode)
(check-install 'flymake-jslint)

(check-install 'cl)
(check-install 'go-mode)


