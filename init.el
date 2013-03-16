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

;; Setup directories.
(defvar athena-root-dir (file-name-directory load-file-name))
(defvar athena-modules-dir (concat athena-root-dir "modules/"))
(defvar athena-personal-dir (concat athena-root-dir "personal/"))
(defvar athena-personal-preload-dir (concat athena-root-dir "personal/preload/"))
(defvar athena-vendor-dir (concat athena-root-dir "vendor/"))

;; Populate the load-path.
(add-to-list 'load-path athena-modules-dir)

;; Add subdirectories to load-path.
(defun athena-add-subdirectories-to-load-path (dir)
  "Adds all toplevel subdirectories to load-path"
  (dolist (file (directory-files dir))
    (let ((name (expand-file-name file dir)))
      (when (and (file-directory-p name)
                 (not (equal file ".."))
                 (not (equal file ".")))
        (add-to-list 'load-path name)))))

;; Load *.el in the given directory.
(defun athena-load-files-from-directory (dir)
  "Load *.el files from the given directory"
  (when (file-exists-p dir)
    (mapc 'load (directory-files dir 't "^[^#].*el$"))))

;; Preload personal lisp files.
(athena-load-files-from-directory athena-personal-preload-dir)

;; Load athena modules.
(require 'athena-env)
(require 'athena-packages)
(require 'athena-ui)
(require 'athena-programming)
(require 'athena-org)

;; Load personal lisp files.
(athena-load-files-from-directory athena-personal-dir)
