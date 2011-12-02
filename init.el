;; Setup directories.
(defvar athena-root-dir (file-name-directory load-file-name))
(defvar athena-modules-dir (concat athena-root-dir "modules/"))
(defvar athena-external-lisp-dir (concat athena-root-dir "external-lisp/"))
(defvar athena-custom-lisp-dir (concat athena-root-dir "custom-lisp/"))

;; Populate the load-path.
(add-to-list 'load-path athena-modules-dir)
(add-to-list 'load-path athena-external-lisp-dir)
(add-to-list 'load-path athena-custom-lisp-dir)

;; Load athena modules.
(require 'athena-packages)
(require 'athena-ui)
(require 'athena-programming)
(require 'athena-org)
