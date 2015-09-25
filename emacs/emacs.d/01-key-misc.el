;;;;;;;;;;;;;;;;;;;; Key bindings

(defun previous-window ()
  "Go to the previous window"
  (interactive)
  (other-window -1))

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-?" 'help-command)
(global-set-key "\C-x\C-i" 'indent-region)
(global-set-key "\C-xp" 'previous-window)


(column-number-mode t)
(global-set-key "\C-o" 'dabbrev-expand)
(global-set-key "\C-c\C-g" 'goto-line)

(define-key esc-map "c" 'compile)
(define-key esc-map "n" 'compilation-next-error)

(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word)

(require 'indent-tabs-maybe)
(require 'tramp)

(show-paren-mode t)
(setq transient-mark-mode t)


