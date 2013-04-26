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

;; Turn on line numbers.
(add-hook 'prog-mode-hook #'linum-mode)

;; Turn on whitespace mode.
(add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'nxml-mode-hook #'whitespace-mode)

;; Paredit mode on certian major modes.
(add-hook 'scheme-mode-hook #'paredit-mode)

;; Compilation mode settings.
;; Automatically scroll compile buffer until the first error.
(setq compilation-scroll-output 'first-error)
;; Ignore warnings.
(setq compilation-skip-threshold 2)

;; Easy recompile.
(global-set-key (kbd "M-g r") 'recompile)
(global-set-key (kbd "M-g M-r") 'recompile)

;; Popup window mode.
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)


;;; CEDET.

;; Add further minor-modes to be enabled by semantic-mode.
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes
             'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)


;; Enable Semantic
(semantic-mode 1)

;; Advanced name completion.
(require 'semantic/ia)

;; Automatically find system headers.
(require 'semantic/bovine/gcc)

;; GNU Global support.
(when (and (fboundp 'cedet-gnu-global-version-check)
           (cedet-gnu-global-version-check t))
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

;; ;; FIXME (2013-02-19, praveen): This is causing Emacs to hang when
;; ;; typing 'std::'

;; ;; (add-hook 'c-mode-common-hook
;; ;;           (lambda ()
;; ;;             (add-to-list 'ac-sources 'ac-source-semantic)))

;; ;; Enable EDE (Project Management) features.
;; (global-ede-mode 1)


;; ;;; ECB.
;; (require 'ecb)


;;; Pymacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Jedi.
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Whitespace mode.
(require 'whitespace)
(setq whitespace-style '(face lines-tail tab-mark trailing))
;; FIXME (2013-03-01, praveen): empty line visualization badly affects
;; auto-complete-mode.


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

;; TAB key behavior in auto complete mode.
(define-key ac-completing-map "\t" nil)
(define-key ac-completing-map [tab] nil)
(define-key ac-completing-map (kbd "C-TAB") 'ac-expand)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; YASnippet.
(require 'yasnippet)
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

;; Flymake.  TODO (2013-04-02, praveen): Remove flymake once flycheck
;; is configured for all use cases.
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)


;;; flycheck
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'text-mode-hook 'flycheck-mode)


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


;; Google this.
(require 'google-this)
(google-this-mode 1)

;; Helm ls git
(require 'helm-ls-git)
(global-set-key (kbd "C-c g l") 'helm-ls-git-ls)

(provide 'athena-programming)
