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

(defun restore-exec-path-to-standard-value ()
  (let* ((standard-path (get 'exec-path 'standard-value)))
    (setq exec-path (and (consp standard-path)
                         (condition-case nil
                             (eval (car standard-path)))))))

(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if (eq system-type 'darwin)
    (progn
      (setenv-from-path-helper)
      (set-exec-path-from-shell-PATH)))

(provide 'athena-env)
