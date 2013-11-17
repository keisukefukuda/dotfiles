;;;;;;;;;;;;;;;;;;; package.el

(when (< emacs-major-version 24)
  (let* ((pwd (file-name-as-directory (file-name-directory load-file-name)))
         (pkg-el (concat pwd "package.el")))
    (load pkg-el)))

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;;;;;;;;;;;;;;;;;;; load all local *.el files

(let ((dot-file-dir (file-name-directory load-file-name)))
  (let ((dot-emacs-d  (concat (file-name-as-directory dot-file-dir) "emacs.d")))
    (setq elisp-dir
					(file-name-as-directory dot-emacs-d))))

(add-to-list 'load-path elisp-dir)

;;;;;;;;;;;;;;;;;;; Prepare some utilities and load files
(defmacro exec-if-bound (sexplist)
	"execute only if the function is bound."
  `(if (fboundp (car ',sexplist))
       ,sexplist))

(defun load-safe (loadlib)
  "Safe load. Never stops if failed to load a file"
  (let ((load-status (load loadlib t)))
    (or load-status
        (message (format "[load-safe] failed %s" loadlib)))
    load-status))

(let ((elisp-to-load (directory-files elisp-dir t "^[0-9][0-9].*\.el$")))
	(dolist (file elisp-to-load)
		(load-safe file)))

;;;;;;;;;;;;;;;;;;;; Misc settings

(if (fboundp 'xterm-mouse-mode) (xterm-mouse-mode t))
(if (fboundp 'mouse-wheel-mode) (mouse-wheel-mode t))
(if (fboundp 'menu-bar-mode)    (menu-bar-mode 0))
(if (fboundp 'tool-bar-mode)    (tool-bar-mode 0))

(setq mac-command-modifier 'meta)

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(add-hook 'emacs-startup-hook
          '(lambda ()
             (setq buffer-offer-save nil)
             (auto-save-mode -1)))

(require 'tramp)
(add-to-list 'backup-directory-alist
						 (cons tramp-file-name-regexp nil))



;;; Markdown-mode
(add-to-list 'auto-mode-alist '("[.]md$" . markdown-mode))

(defun find-command (progname)
  (let ((cmd (concat "which " progname)))
		(with-temp-buffer
			(call-process "/bin/sh" nil (current-buffer) nil "-c" cmd)
      (let ((str (buffer-string)))
        (while (string-match "[ \t\n]$" str)
          (setq str (replace-match "" t t str)))
        str))))

(when (fboundp 'slime)
	(let ((sbcl (find-command "sbcl")))
	(if (not (string= "" sbcl))
			(setq inferior-lisp-program sbcl)
		nil)))


;;; Haskell-mode
(require 'haskell-mode)
(require 'flymake-haskell-multi)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)
(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))

;;; helm-mode
;(require 'helm-config)
;(require 'helm-command)
;(require 'helm-descbinds)

;(helm-mode 1)

