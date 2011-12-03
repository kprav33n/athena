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

(defcustom ms-utest-mode-hook nil
  "Hook run when entering `ms-utest-mode'"
  )

(add-to-list 'auto-mode-alist (cons (purecopy "utest.txt") 'ms-utest-mode))

(defvar ms-utest-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)
    table)
  "Syntax table for `ms-utest-mode'.")

(defvar ms-utest-font-lock-keywords
  `((,(rx line-start
          (group (or "activate" "test")) (1+ space)
          (group (1+ (or word ?_))) (1+ space)
          (group (1+ not-newline)))
     (1 font-lock-keyword-face)
     (2 font-lock-function-name-face)
     (3 font-lock-comment-face))
    )
  "Font lock keywords for `ms-utest-mode'."
  )

(define-derived-mode ms-utest-mode fundamental-mode "MS-UTest"
  "A major mode for editing Messaging Server unit test files."
  :syntax-table ms-utest-mode-syntax-table
  (set (make-local-variable 'font-lock-defaults)
       '(ms-utest-font-lock-keywords))
  (set (make-local-variable 'comment-start) "# ")
  (set (make-local-variable 'comment-start-skip) "#+[\t ]*")
  )

(provide 'ms-utest-mode)
