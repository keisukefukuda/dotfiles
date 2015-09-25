
(require 'paredit)
(require 'auto-complete-config)

(ac-config-default)

(require 'ac-cider)

(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'ac-flyspell-workaround)
(add-hook 'clojure-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(add-hook 'cider-mode-hook 'eldoc-mode)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)
(setq cider-prefer-local-resources t)
(setq cider-repl-wrap-history t)

(defun cider-with-profile (profile)
  "Starts up a cider repl using jack-in with the specific lein profile
   selected."
  (interactive "sProfile: ")
  (let* ((profile-str profile)
         (profile-str (replace-regexp-in-string ":\\(.*\\)$" "\\1" profile-str))
         (lein-params (concat "with-profile user," profile-str " repl :headless")))
    (setq cider-lein-parameters lein-params)
    (cider-jack-in)))

(define-key paredit-mode-map (kbd "M-0") 'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "M-9") 'paredit-forward-barf-sexp)
(define-key paredit-mode-map (kbd "M-)") 'paredit-backward-slurp-sexp)
(define-key paredit-mode-map (kbd "M-(") 'paredit-backward-barf-sexp)
