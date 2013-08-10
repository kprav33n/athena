;; Copyright (C) 2011, Praveen Kumar.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Default font.

;;; Code:

(cond ((eq system-type 'darwin)
       (setq default-frame-alist '((font . "Monaco 14"))))
      ((eq system-type 'gnu/linux)
       (setq default-frame-alist '((font . "Ubuntu Mono 12")))))

;; Alt is meta.
(if (eq system-type 'gnu/linux)
    (setq x-alt-keysym 'meta))

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

;; Use the selected window when switching to a buffer in ido-mode.
(setq ido-default-buffer-method 'selected-window)

;; Show column number in the mode line.
(column-number-mode 1)

;; Y/N in place of Yes/No answers.
(fset 'yes-or-no-p 'y-or-n-p)

;; Use ibuffer.
(defalias 'list-buffers 'ibuffer)

;; Unique buffer names.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)

;; Spell checker.
(setq ispell-program-name "aspell")

;; Save minibuffer history.
(savehist-mode 1)

;; Helm.
(require 'helm)
(global-set-key (kbd "C-c h") 'helm-mini)

;; Full screen on Mac.
(global-set-key (kbd "s-f") 'ns-toggle-fullscreen)

;; Auto complete.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; Use Emacs's own emulation of ls for dired.
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)

;; Display buffer should reuse frame.
(setq-default display-buffer-reuse-frames t)

;;; Visual Regexp.
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

;; Solarized color theme.
(load-theme 'solarized-light t)

;; Don't save backup files.
(setq make-backup-files nil)

;;; Powerline.
;; (require 'powerline)
;; (powerline-default-theme)


(provide 'athena-ui)
;;; athena-ui.el ends here
