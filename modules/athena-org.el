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

(provide 'athena-org)
