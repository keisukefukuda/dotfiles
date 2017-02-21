(require 'paredit)
(require 'ac-cider)

(ac-config-default)

(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'ac-flyspell-workaround)
(add-hook 'clojure-mode-hook 'ac-cider-setup)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(add-hook 'cider-mode-hook 'eldoc-mode)

(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)
(setq cider-prefer-local-resources t)
;;(setq cider-repl-wrap-history t)

(defun cider-with-profile (profile)
  "Starts up a cider repl using jack-in with the specific lein profile
   selected."
  (interactive "sProfile: ")
  (let* ((profile-str profile)
         (profile-str (replace-regexp-in-string ":\\(.*\\)$" "\\1" profile-str))
         (lein-params (concat "with-profile user," profile-str " repl :headless")))
    (setq cider-lein-parameters lein-params)
    (cider-jack-in)))

(define-key paredit-mode-map (kbd "C-c ]") 'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-c [") 'paredit-forward-barf-sexp)
(define-key paredit-mode-map (kbd "C-c 0") 'paredit-backward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-c 9") 'paredit-backward-barf-sexp)
(define-key paredit-mode-map (kbd "C-c <up>") 'paredit-splice-sexp)
