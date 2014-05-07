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
       (setq default-frame-alist '((font . "Monaco 13"))))
      ((eq system-type 'gnu/linux)
       (setq default-frame-alist '((font . "Monaco for Powerline 11")))))

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

(ido-ubiquitous)

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
(global-set-key (kbd "C-c h") 'helm-mini)

;; Full screen on Mac.
(global-set-key (kbd "s-f") 'ns-toggle-fullscreen)


;; Use Emacs's own emulation of ls for dired.
(setq ls-lisp-use-insert-directory-program nil)

;; Display buffer should reuse frame.
(setq-default display-buffer-reuse-frames t)

;;; Visual Regexp.
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)


;;; Anzu.
(require 'anzu)
(global-anzu-mode +1)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))

(set-face-attribute 'anzu-mode-line nil
                    :foreground "black" :weight 'bold)

;; Solarized color theme.
;; (if (eq system-type 'darwin)
;;     (load-theme 'solarized-light t))

;; Don't save backup files.
(setq make-backup-files nil)

;;; Powerline.
(set-face-attribute 'powerline-active1 nil
                    :foreground "white")
(set-face-attribute 'powerline-active2 nil
                    :foreground "white")
(powerline-default-theme)

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;;; Remove modeline clutter.

(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "drag-stuff" '(diminish 'drag-stuff-mode))
(eval-after-load "whitespace" '(diminish 'whitespace-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
;; (eval-after-load "gtags" '(diminish 'gtags-mode))
;; (eval-after-load "helm" '(diminish 'helm-mode))
;; (eval-after-load "yas" (diminish 'yas-minor-mode))


;;; Turn on undo-tree.
(global-undo-tree-mode)


;;; Expand region.
(global-set-key (kbd "C-=") 'er/expand-region)


;;; Smartparens.
(require 'smartparens-config)

;;; Smex.

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; Multiple cursors.

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; Switching to previous buffer.

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "<C-tab>") 'switch-to-previous-buffer)



;;; Listen on TCP socket when running in server mode.

;; (setq server-use-tcp t)
;; (setq server-host (system-name))


;;; Various faces for highlights.

(make-face 'athena-hi-common)
(set-face-attribute 'athena-hi-common nil
                    :height 1.0)

(make-face 'athena-hi-blue)
(set-face-attribute 'athena-hi-blue nil
                    :inherit 'athena-hi-common
                    :foreground "white"
                    :background "royal blue")

(make-face 'athena-hi-red)
(set-face-attribute 'athena-hi-red nil
                    :inherit 'athena-hi-common
                    :foreground "white"
                    :background "red")

(make-face 'athena-hi-yellow)
(set-face-attribute 'athena-hi-yellow nil
                    :inherit 'athena-hi-common
                    :foreground "black"
                    :background "yellow")

(make-face 'athena-hi-green)
(set-face-attribute 'athena-hi-green nil
                    :inherit 'athena-hi-common
                    :foreground "black"
                    :background "lime green")

(make-face 'athena-hi-orange)
(set-face-attribute 'athena-hi-orange nil
                    :inherit 'athena-hi-common
                    :foreground "black"
                    :background "orange")

(make-face 'athena-hi-dull)
(set-face-attribute 'athena-hi-dull nil
                    :foreground "grey80")

(provide 'athena-ui)
;;; athena-ui.el ends here
