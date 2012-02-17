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

;; Emacs Lisp Package Archive.
(require 'package)
;; Configure package archives.
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") 'append)
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/") 'append)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") 'append)

;; Refresh package archive contents.
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Set of packages to install.
(defvar athena-packages
  '(ahg autopair cmake-mode clojure-mode color-theme color-theme-zenburn
        doc-mode drag-stuff ecb_snap gtags guess-style magit org
        yasnippet)
  "A list of packages that has to be ensured installed from package archives")

;; Install packages if not already installed.
(dolist (p athena-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'athena-packages)
