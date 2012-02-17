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


;; Tabs are evil.
(setq-default indent-tabs-mode nil)

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
(drag-stuff-global-mode 1)

;; Doc-mode for Doxygen comments.
(require 'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)

;; ;; ECB.
;; (require 'ecb)

;; ;; Split root window.
;; (require 'split-root)


;; ;; Tweak default compilation output behavior.
;; (require 'compile)
;; ;; Scroll the compilation window automatically.
;; (defvar compilation-window nil
;;   "The window opened for displaying a compilation buffer.")
;; (setq compilation-window-height 14)
(setq compilation-scroll-output t)

;; (defun athena-display-buffer (buffer &optional not-this-window)
;;   (if (or (compilation-buffer-p buffer)
;;           (equal (buffer-name buffer) "*Shell Command Output*"))
;;       (unless (and compilation-window (window-live-p compilation-window))
;;         (setq compilation-window (split-root-window compilation-window-height))
;;         (set-window-buffer compilation-window buffer))
;;     (let ((display-buffer-function nil))
;;       (display-buffer buffer not-this-window))))

;; (setq display-buffer-function 'athena-display-buffer)

;; ;; on success, delete compilation window right away!
;; (add-hook 'compilation-finish-functions
;;           '(lambda(buf res)
;;              (unless (or (eq last-command 'grep)
;;                          (eq last-command 'grep-find))
;;                (when (equal res "finished\n")
;;                  (when compilation-window
;;                    (delete-window compilation-window)
;;                    (setq compilation-window nil))
;;                  (message "compilation successful")))))


;; Spell check comments.
(add-hook 'c-mode-common-hook
          (lambda ()
            (flyspell-prog-mode)))

;; Google C/C++ style.
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; CMake mode.
(require 'cmake-mode)
(add-to-list 'auto-mode-alist (cons (purecopy "CMakeLists.txt") 'cmake-mode))

(provide 'athena-programming)
