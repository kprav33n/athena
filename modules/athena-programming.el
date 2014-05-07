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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Compilation mode settings.

;; Automatically scroll compile buffer until the first error.
;(setq compilation-scroll-output 'first-error)
(setq compilation-scroll-output t)
;; Ignore warnings.
;(setq compilation-skip-threshold 2)

;; Easy recompile.
(global-set-key (kbd "M-g r") 'recompile)
(global-set-key (kbd "M-g M-r") 'recompile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CEDET.

;; ;; Add further minor-modes to be enabled by semantic-mode.
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
;; (add-to-list 'semantic-default-submodes
;;              'global-semantic-idle-local-symbol-highlight-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)


;; ;; Enable Semantic
;; (semantic-mode 1)

;; ;; Advanced name completion.
;; (require 'semantic/ia)

;; ;; Automatically find system headers.
;; (require 'semantic/bovine/gcc)

;; ;; GNU Global support.
;; (when (and (fboundp 'cedet-gnu-global-version-check)
;;            (cedet-gnu-global-version-check t))
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
;;   (semanticdb-enable-gnu-global-databases 'c++-mode))

;; FIXME (2013-02-19, praveen): This is causing Emacs to hang when
;; typing 'std::'

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-semantic)))

;; ;; Enable EDE (Project Management) features.
;; (global-ede-mode 1)


;; ;;; ECB.
;; (require 'ecb)


;;; Pymacs
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Jedi.

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'jedi:ac-setup)
;; (setq jedi:setup-keys t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Whitespace mode.

(setq whitespace-style '(face tab-mark))
;; FIXME (2013-03-01, praveen): empty line visualization badly affects
;; auto-complete-mode.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Fill coulmn indicator.

(require 'fill-column-indicator)
(setq fci-rule-color "thistle")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto complete mode.

(require 'auto-complete-config)
(ac-config-default)

;; Turn off auto-complete menu.
;(setq ac-auto-show-menu nil)

;; Don't ignore case in auto-complete.
(setq ac-ignore-case nil)

;; Make auto-complete play well with linum-mode.
(ac-linum-workaround)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; YASnippet.

(require 'yasnippet)
;; FIXME: Make this conditional.
(defvar yas/snippet-dirs `(,(concat user-emacs-directory "snippets")))
(yas/global-mode 1)

;; Cleanup whitespace in YASnippet expansions.
(add-hook 'yas-after-exit-snippet-hook
          '(lambda ()
             (whitespace-cleanup-region yas-snippet-beg yas-snippet-end)))

;; Helm.
(require 'helm-c-yasnippet)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)

;; Drag stuff.
(drag-stuff-global-mode 1)
(add-to-list 'drag-stuff-except-modes 'org-mode)


;; YAML mode.
(add-to-list 'auto-mode-alist (cons (purecopy "\\.y[a]*ml$") 'yaml-mode))

;; Google C/C++ style.
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Dummy H mode.
(add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))
(autoload 'dummy-h-mode "dummy-h-mode" "Dummy H mode" t)

;; Markdown mode.
(require 'markdown-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "\\.markdown$") 'markdown-mode))

;; Projectile.
(require 'projectile)
(projectile-global-mode)

;; Helm.
(require 'helm-projectile)

;;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)
(setq flycheck-check-syntax-automatically '(save))

;; iPython notebook support.
(require 'ein)

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

;; The silver searcher.
(require 'ag)

;; Helm ls git
(require 'helm-ls-git)


;;; Clojure.

(require 'clojure-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Various minor modes to be used.

;; Turn on line numbers.
(add-hook 'prog-mode-hook #'linum-mode)

;; Turn on whitespace mode.
(add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'nxml-mode-hook #'whitespace-mode)
(add-hook 'yaml-mode-hook #'whitespace-mode)

;; Turn on fill-column-indicator mode.
(add-hook 'prog-mode-hook
          (lambda ()
            (setq fci-rule-column 80)
            (fci-mode)))

;; Highlight indentation.
(add-hook 'prog-mode-hook #'highlight-indentation-mode)
(add-hook 'nxml-mode-hook #'highlight-indentation-mode)
(add-hook 'yaml-mode-hook #'highlight-indentation-mode)

;; Volatile highlights.
(add-hook 'progn-mode-hook #'volatile-highlights-mode)

;; Paredit mode on certian major modes.
(add-hook 'scheme-mode-hook #'paredit-mode)

;; Turn on rainbow delimeters.
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Emacs Lisp mode hook.
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (highlight-indentation-set-offset 2)))


;;; GNU Global.
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;;; xcsope.
(require 'xcscope)
(cscope-setup)

;;; git-gutter.
(require 'git-gutter-fringe)
(global-git-gutter-mode t)


;;; Scala

;; scala-mode2
(require 'scala-mode2)

;; Ensime.
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


(provide 'athena-programming)
;;; athena-programming.el ends here
