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
  "Hook run when entering MS UTest mode")

(defvar ms-utest-font-lock-keywords
  `((,(rx line-start
          (group (or "activate" "test")) (1+ space)
          (group (1+ (or word ?_))) (1+ space)
          (group (1+ not-newline)))
     (1 font-lock-keyword-face)
     (2 font-lock-function-name-face)
     (3 font-lock-comment-face))
    ))

(define-derived-mode ms-utest-mode nil "MS-UTest"
  "A major mode for editing Messaging Server unit test files"
  (set (make-local-variable 'font-lock-defaults)
       '(ms-utest-font-lock-keywords)))

(provide 'ms-utest-mode)
