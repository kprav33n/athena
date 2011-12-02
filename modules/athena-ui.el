;; Default font.
(set-frame-font "Monaco 13")

;; Inhibit startup message.
(setq inhibit-startup-screen 't)

;; Turn off tool bar.
(tool-bar-mode 0)

;; Turn off scroll bar.
(scroll-bar-mode 0)

;; Show matching parenthesis.
(show-paren-mode 1)

;; Window navigation.
(windmove-default-keybindings)

;; Window layout history.
(winner-mode 1)

;; Easy file and buffer name completion.
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; Show column number in the mode line.
(column-number-mode 1)

;; Show file size in the mode line.
(size-indication-mode 1)

;; Y/N in place of Yes/No answers.
(fset 'yes-or-no-p 'y-or-n-p)

;; Use ibuffer.
(defalias 'list-buffers 'ibuffer)

;; Unique buffer names.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)

;; Zenburn color theme.
(require 'color-theme)
(require 'color-theme-zenburn)
(color-theme-zenburn)

;; Spell checker.
(setq ispell-program-name "aspell")

(provide 'athena-ui)
