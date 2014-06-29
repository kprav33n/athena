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

;; Org mode.
(require 'org-install)
(setq org-replace-disputed-keys 't)

;; Keep timestamps in TOC.
(setq org-export-remove-timestamps-from-toc nil)

(require 'ob-ditaa)

(require 'ob-dot)

(require 'ob-plantuml)
(setq org-plantuml-jar-path
      (concat user-emacs-directory "bin/plantuml.jar"))

(defun my-org-confirm-babel-evaluate (lang body)
            (and (not (string= lang "ditaa"))
                 (not (string= lang "dot"))
                 (not (string= lang "plantuml"))))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;;; The following are added for the new org-mode exporter.

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

;; Use minted for syntax highlighting.
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))

(require 'ox-beamer)
(setq org-beamer-outline-frame-options "")

(provide 'athena-org)
;;; athena-org.el ends here
