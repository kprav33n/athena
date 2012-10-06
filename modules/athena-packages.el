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
                          auto-complete
                          clojure-mode
                          drag-stuff
                          graphviz-dot-mode
                          guru-mode
                          helm
                          helm-c-yasnippet
                          helm-gist
                          helm-git
                          helm-gtags
                          helm-projectile
                          magit
                          markdown-mode
                          melpa
                          monky
                          projectile
                          yaml-mode
                          yasnippet
                          )
  "A list of packages that has to be ensured installed from package archives")

;; Install packages if not already installed.
(dolist (p athena-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'athena-packages)
