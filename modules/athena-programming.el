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

;; Tabs are evil.
(setq-default indent-tabs-mode nil)

;; Turn on line numbers and highlight current line in programming
;; modes.
(add-hook 'prog-mode-hook (lambda () (linum-mode) (hl-line-mode)))

;; Compilation mode settings.
;; Automatically scroll compile buffer until the first error.
(setq compilation-scroll-output 'first-error)
;; Ignore warnings.
(setq compilation-skip-threshold 2)

;; ;; Semantic.
;; (setq semantic-default-submodes
;;         '(global-semanticdb-minor-mode
;;           global-semantic-idle-scheduler-mode
;;           global-semantic-idle-summary-mode
;;           global-semantic-idle-completions-mode
;;           global-semantic-decoration-mode
;;           global-semantic-highlight-func-mode
;;           global-semantic-stickyfunc-mode))
;; (semantic-mode 1)


;; ;; Auto complete mode.
;; (add-to-list 'load-path (concat user-emacs-directory "site/auto-complete"))
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories
;; 	     (concat user-emacs-directory "ac-dict"))
;; (ac-config-default)
;; (defun ac-c-mode-common-setup ()
;;   (add-to-list 'ac-sources 'ac-source-semantic))
;; (add-hook 'c-mode-common-hook 'ac-c-mode-common-setup)
;; ;; Due to an auto-complete-mode bug.
;; (require 'help-mode)

;; Whitespace mode.
(require 'whitespace)
(setq whitespace-style '(face lines-tail tab-mark trailing))
(setq whitespace-global-modes '(
                                c++-mode
                                c-mode
                                emacs-lisp-mode
                                java-mode
                                python-mode
                                ))
(global-whitespace-mode t)

;; YASnippet.
(require 'yasnippet)
(setq yas/snippet-dirs `(,(concat user-emacs-directory "snippets")))
(yas/global-mode 1)

;; Helm.
(require 'helm-c-yasnippet)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)

;; Drag stuff.
(require 'drag-stuff)
(add-to-list 'drag-stuff-except-modes 'org-mode)
(drag-stuff-global-mode 1)

;; YAML mode.
(require 'yaml-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "\\.y[a]*ml$") 'yaml-mode))

;; Google C/C++ style.
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Markdown mode.
(require 'markdown-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "\\.markdown$") 'markdown-mode))

;; Projectile.
(require 'projectile)
(projectile-global-mode)

;; Helm.
(require 'helm-projectile)

;; Flymake.
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)

;; Helm gtags.
(require 'helm-gtags)
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c g t") 'helm-gtags-find-tag)
             (local-set-key (kbd "C-c g r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "C-c g s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-c g p") 'helm-gtags-pop-stack)
             (local-set-key (kbd "C-c g f") 'helm-gtags-find-files)
             (local-set-key (kbd "C-c g h") 'helm-gtags-select)))
(add-hook 'c-mode-common-hook 'helm-gtags-mode)

(provide 'athena-programming)
