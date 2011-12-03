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

;; Use homebrew binaries.
(push "/usr/local/bin" exec-path)

;; Setup directories.
(defvar athena-root-dir (file-name-directory load-file-name))
(defvar athena-modules-dir (concat athena-root-dir "modules/"))
(defvar athena-external-lisp-dir (concat athena-root-dir "external-lisp/"))
(defvar athena-custom-lisp-dir (concat athena-root-dir "custom-lisp/"))

;; Populate the load-path.
(add-to-list 'load-path athena-modules-dir)
(add-to-list 'load-path athena-external-lisp-dir)
(add-to-list 'load-path athena-custom-lisp-dir)

;; Load athena modules.
(require 'athena-packages)
(require 'athena-ui)
(require 'athena-programming)
(require 'athena-programming-ms)
(require 'athena-org)
