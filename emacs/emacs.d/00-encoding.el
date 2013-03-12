;;;;;;;;;;;;;;;;;;;; Language & encoding settings
(set-language-environment "Japanese")
(prefer-coding-system          'utf-8)
(set-default-coding-systems    'utf-8)
(set-terminal-coding-system    'utf-8)
(set-keyboard-coding-system    'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;;; solve context-dependent wide character problem(
(if (string-match "^22" emacs-version)
    (utf-translate-cjk-set-unicode-range
       '((#x00a2 . #x00a3)                    ; ¢, £
         (#x00a7 . #x00a8)                    ; §, ¨
         (#x00ac . #x00ac)                    ; ¬
         (#x00b0 . #x00b1)                    ; °, ±
         (#x00b4 . #x00b4)                    ; ´
         (#x00b6 . #x00b6)                    ; ¶
         (#x00d7 . #x00d7)                    ; ×
         (#X00f7 . #x00f7)                    ; ÷
         (#x0370 . #x03ff)                    ; Greek and Coptic
         (#x0400 . #x04FF)                    ; Cyrillic
         (#x2000 . #x206F)                    ; General Punctuation
         (#x2100 . #x214F)                    ; Letterlike Symbols
         (#x2190 . #x21FF)                    ; Arrows
         (#x2200 . #x22FF)                    ; Mathematical Operators
         (#x2300 . #x23FF)                    ; Miscellaneous Technical
         (#x2500 . #x257F)                    ; Box Drawing
         (#x25A0 . #x25FF)                    ; Geometric Shapes
         (#x2600 . #x26FF)                    ; Miscellaneous Symbols
         (#x2e80 . #xd7a3) (#xff00 . #xffef))))

(eval-after-load "subst-jis" '(load "subst-jisx0208ex"))

