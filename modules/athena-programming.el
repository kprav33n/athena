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
(setq whitespace-global-modes '(c-mode c++-mode java-mode emacs-lisp-mode))
(global-whitespace-mode t)

;; YASnippet.
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat athena-root-dir "data/yasnippet/snippets"))

;; aHg - Mercurial frontend.
(require 'cl)
(require 'ahg)

;; GNU Global.
(setq gtags-suggested-key-mapping t)
(require 'gtags)
(add-hook 'c-mode-common-hook 'gtags-mode)

;; Automagically pair braces and quotes like TextMate.
(require 'autopair)
(autopair-global-mode)

;; Drag stuff.
(require 'drag-stuff)
(add-to-list 'drag-stuff-except-modes 'org-mode)
(drag-stuff-global-mode 1)

;; Doc-mode for Doxygen comments.
(require 'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)

;; YAML mode.
(require 'yaml-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "\\.y[a]*ml$") 'yaml-mode))

;; Google C/C++ style.
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; CMake mode.
(require 'cmake-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "CMakeLists.txt") 'cmake-mode))

;; Markdown mode.
(require 'markdown-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "\\.markdown$") 'markdown-mode))

;; Projectile.
(require 'projectile)
(projectile-global-mode)

;; Flymake.
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)


(provide 'athena-programming)
