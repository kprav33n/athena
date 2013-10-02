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

;; Common lisp.
(require 'cl)

;; Emacs Lisp Package Archive.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Set of packages to install.
(defvar athena-packages '(
                          ac-nrepl
                          ace-jump-mode
                          ascope
                          ag
                          auto-complete
                          auto-complete-clang
                          clojure-mode
                          clojure-test-mode
                          diminish
                          drag-stuff
                          dummy-h-mode
                          ecb
                          ein
                          flycheck
                          google-c-style
                          graphviz-dot-mode
                          helm
                          helm-ag
                          helm-c-yasnippet
                          helm-gist
                          helm-git
                          helm-gtags
                          helm-ls-git
                          helm-projectile
                          highlight-indentation
                          jedi
                          magit
                          markdown-mode
                          melpa
                          monky
                          nrepl
                          paredit
                          popwin
                          powerline
                          projectile
                          rainbow-delimiters
                          restclient
                          s
                          scala-mode2
                          solarized-theme
                          visual-regexp
                          visual-regexp-steroids
                          w3m
                          yaml-mode
                          yasnippet
                          )
  "A list of packages that has to be ensured installed from package archives")

;; Install packages if not already installed.
(dolist (p athena-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))

;; Load path to external packages that aren't installed via melpa.
(athena-add-subdirectories-to-load-path athena-vendor-dir)

(provide 'athena-packages)
