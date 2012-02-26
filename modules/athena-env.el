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

(defun setenv-from-path-helper ()
  (setenv "MANPATH" "")
  (setq path_helper_output (shell-command-to-string "/usr/libexec/path_helper"))
  (when (string-match "^PATH=\"\\(.*\\)\"; export PATH;$" path_helper_output)
    (setenv "PATH" (match-string 1 path_helper_output)))
  (when (string-match "^MANPATH=\"\\(.*\\)\"; export MANPATH;$" path_helper_output)
    (setenv "MANPATH" (match-string 1 path_helper_output))))

(if (eq system-type 'darwin)
    (setenv-from-path-helper))

(provide 'athena-env)
