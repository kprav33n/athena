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

;; Generate standup report from Org file.
;; Fixme: Refactor this function.
(defun athena-standup-report-from-org()
  (interactive)

  (generate-new-buffer "Standup Report")
  (save-excursion (goto-char (point-min))
		  (re-search-forward "* Status")
		  (re-search-forward "** 20")
		  (forward-line 1)
		  (copy-region-as-kill (point)
				       (save-excursion (re-search-forward "^$") (point)))
		  (switch-to-buffer "Standup Report")
		  (goto-char (point-max))
		  (insert "Status:")
		  (newline-and-indent)
		  (yank)
		  (newline-and-indent))

  (save-excursion (goto-char (point-min))
		  (re-search-forward "* Plan")
		  (re-search-forward "** 20")
		  (forward-line 1)
		  (copy-region-as-kill (point)
				       (save-excursion (re-search-forward "^$") (point)))
		  (switch-to-buffer "Standup Report")
		  (goto-char (point-max))
		  (insert "Plan:")
		  (newline-and-indent)
		  (yank))

  (save-excursion (switch-to-buffer "Standup Report")
		  (mark-whole-buffer)
		  (shell-command-on-region (region-beginning)
					   (region-end)
					   "~/UCS/Scripts/AppleScript/NGSStandupReport.scpt"))
  (kill-buffer "Standup Report"))

;; (add-to-list 'org-emphasis-alist
;;              '("@" org-warning "<b>" "</b>"))
;; (add-to-list 'org-export-latex-emphasis-alist
;;              '("@" "\\alert{%s}" nil))

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

(require 'org-latex)
(setq org-export-latex-listings 'minted)
(add-to-list 'org-export-latex-packages-alist '("" "minted"))

(provide 'athena-org)
