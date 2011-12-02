(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar athena-packages
  '(ahg autopair color-theme color-theme-zenburn doc-mode drag-stuff
        ecb_snap gtags magit yasnippet)
  "A list of packages that has to be ensured installed from package archives")

(dolist (p athena-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'athena-packages)
