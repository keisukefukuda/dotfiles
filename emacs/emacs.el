(require 'cask "~/.cask/cask.el")
(cask-initialize "~/.cask")

;;;;;;;;;;;;;;;;;;; load all local *.el files

(let ((dot-file-dir (file-name-directory load-file-name)))
  (let ((dot-emacs-d  (concat (file-name-as-directory dot-file-dir) "emacs.d")))
    (setq elisp-root dot-file-dir)
    (setq elisp-dir
      (file-name-as-directory dot-emacs-d))))

(add-to-list 'load-path elisp-dir)

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

(define-minor-mode sticky-buffer-mode
  "Make the current window always display this buffer."
  nil " sticky" nil
  (set-window-dedicated-p (selected-window) sticky-buffer-mode))


;;;;;;;;;;;;;;;;;;;; Misc settings

(unless window-system
	(require 'mouse)
	(if (fboundp 'xterm-mouse-mode) (xterm-mouse-mode t))
	(if (fboundp 'mouse-wheel-mode) (mouse-wheel-mode t))

	(global-set-key [mouse-4] '(lambda()
															 (interactive)
															 (scroll-down 1)))
	(global-set-key [mouse-5] '(lambda()
															 (interactive)
															 (scroll-up 1)))

	(defun track-mouse (e))
	(setq mouse-sel-mode t))

;; OSX clip board integration
(if (eq system-type 'darwin)
    (progn
      (defun pbcopy ()
	(interactive)
	(call-process-region (point) (mark) "pbcopy")
	(setq deactivate-mark t))
  
      (defun pbpaste ()
	(interactive)
	(call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))
      
      (defun pbcut ()
	(interactive)
	(pbcopy)
	(delete-region (region-beginning) (region-end)))))
	

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

;;(setq windmove-wrap-around t)
(windmove-default-keybindings)

;;; workaround for the error "controlPath too long" when using tramp
(setenv "TMPDIR" "/tmp")

