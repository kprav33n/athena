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

;; UCS MS C/C++ style.
;; Fixme: Change to auto detect stuff.
(c-add-style
 "oracle-ucs-ms"
 '((indent-tabs-mode . t)
   (fill-column . 75)
   (c-basic-offset . 4)
   (c-offsets-alist . ((innamespace . 0)
                       (member-init-intro . ++)
                       (access-label . /)
                       ))))

;; For msg source, use UCS MS style.
(defun oracle-ucs-ms-style-hook ()
  (when (and buffer-file-name
             (string-match "/msg/" buffer-file-name))
    (c-set-style "oracle-ucs-ms")))
(add-hook 'c-mode-common-hook 'oracle-ucs-ms-style-hook 'append)

;; Guess style from the current code.
(add-hook 'c-mode-common-hook 'guess-style-guess-all 'append)

;; Messaging Server unit test mode.
(require 'ms-utest-mode)


(provide 'athena-programming-ms)
