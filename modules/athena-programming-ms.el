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
(c-add-style
 "oracle-ucs-ms"
 '((indent-tabs-mode . nil)
   (fill-column . 75)
   (c-basic-offset . 4)
   (c-offsets-alist . (
                       (access-label . /)
                       (inextern-lang . 0)
                       (innamespace . 0)
                       (member-init-intro . ++)
                       ))))

;; For msg source:
;;  - Use oracle-ucs-ms style.
;;  - Turn on flymake.
(defun ms-c-mode-common-hook ()
  (when (and buffer-file-name
             (string-match "/msg/" buffer-file-name))
    (c-set-style "oracle-ucs-ms")
    (flymake-mode)))
(add-hook 'c-mode-common-hook 'ms-c-mode-common-hook 'append)

;; Messaging Server unit test mode.
(require 'ms-utest-mode)

;; Setup flymake mask for C and C++ sources to use Makefile.
(push '("/msg/.*\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)$"
        flymake-simple-make-init) flymake-allowed-file-name-masks)
(push '("/msg/.*\\.\\(?:h\\(?:pp\\|xx\\|\\+\\+\\)?\\|HH\\)$"
        flymake-simple-make-init) flymake-allowed-file-name-masks)

;; Print number of literals in region. This takes the 'C: ' prefix in
;; the utest.txt into account. To count, select the region beginning
;; at begin of the line of APPEND literals and ending at end of the
;; line of APPEND data. Exclude the final <CR><LF> line.
(defun ms-utest-count-literals-in-region (start end)
  "Print number of literals in region."
  (interactive "r")
  (message "Region has %d literals"
           (+ (- (- end start) (* (count-lines start end) 2)) 2)))

(provide 'athena-programming-ms)
