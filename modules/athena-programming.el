;; Semantic.
(setq semantic-default-submodes
        '(global-semanticdb-minor-mode
          global-semantic-idle-scheduler-mode
          global-semantic-idle-summary-mode
          global-semantic-idle-completions-mode
          global-semantic-decoration-mode
          global-semantic-highlight-func-mode
          global-semantic-stickyfunc-mode))
(semantic-mode 1)


;; ;; Auto complete mode.
;; (add-to-list 'load-path (concat user-emacs-directory "site/auto-complete"))
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories
;; 	     (concat user-emacs-directory "ac-dict"))
;; (ac-config-default)
;; (defun ac-c-mode-common-setup ()
;;   (add-to-list 'ac-sources 'ac-source-semantic))
;; (add-hook 'c-mode-common-hook 'ac-c-mode-common-setup)
;; ;; Due to an auto-complete-mode bug.
;; (require 'help-mode)


;; Whitespace mode.
(require 'whitespace)
(setq whitespace-style '(face lines-tail tab-mark trailing))
(setq whitespace-global-modes '(c-mode c++-mode java-mode lisp-mode))
(global-whitespace-mode t)


;; aHg - Mercurial frontend.
(require 'cl)
(require 'ahg)


;; GNU Global.
(add-hook 'c-mode-common-hook 'gtags-mode)


;; Automagically pair braces and quotes like TextMate.
(require 'autopair)
(autopair-global-mode)


;; ;; Doc-mode for Doxygen comments.
;; (require 'doc-mode)
;; (add-hook 'c-mode-common-hook 'doc-mode)


;; ;; Split root window.
;; (require 'split-root)


;; ;; Tweak default compilation output behavior.
;; (require 'compile)
;; ;; Scroll the compilation window automatically.
;; (defvar compilation-window nil
;;   "The window opened for displaying a compilation buffer.")
;; (setq compilation-window-height 14)
;; (setq compilation-scroll-output t)

;; (defun athena-display-buffer (buffer &optional not-this-window)
;;   (if (or (compilation-buffer-p buffer)
;;           (equal (buffer-name buffer) "*Shell Command Output*"))
;;       (unless (and compilation-window (window-live-p compilation-window))
;;         (setq compilation-window (split-root-window compilation-window-height))
;;         (set-window-buffer compilation-window buffer))
;;     (let ((display-buffer-function nil))
;;       (display-buffer buffer not-this-window))))

;; (setq display-buffer-function 'athena-display-buffer)

;; ;; on success, delete compilation window right away!
;; (add-hook 'compilation-finish-functions
;;           '(lambda(buf res)
;;              (unless (or (eq last-command 'grep)
;;                          (eq last-command 'grep-find))
;;                (when (equal res "finished\n")
;;                  (when compilation-window
;;                    (delete-window compilation-window)
;;                    (setq compilation-window nil))
;;                  (message "compilation successful")))))


;; UCS MS C/C++ style.
(c-add-style
 "ucs-ms"
 '((indent-tabs-mode . t)
   (fill-column . 75)
   (c-basic-offset . 4)
   (c-offsets-alist . ((innamespace . 0)
                       (member-init-intro . ++)
                       (access-label . /)
                       ))))

;; For msg source, use UCS MS style.
(defun ucs-ms-style-hook ()
  (when (and buffer-file-name
             (string-match "/msg/" buffer-file-name))
    (c-set-style "ucs-ms")))
(add-hook 'c-mode-common-hook 'ucs-ms-style-hook)

;; ;; Google C/C++ style.
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)


(provide 'athena-programming)
