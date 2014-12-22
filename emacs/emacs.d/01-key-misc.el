;;;;;;;;;;;;;;;;;;;; Key bindings

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-?" 'help-command)
(global-set-key "\C-x\C-i" 'indent-region)


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

(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")
             (setq indent-tabs-mode nil)
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 引数リストの閉じ括弧はインデントしない
             ))
