(add-hook 'clojure-mode-hook 'cider-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)

;;; ac-nrepl
(autoload 'ac-nrepl "ac-nrepl" nil t)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-nrepl-mode))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

