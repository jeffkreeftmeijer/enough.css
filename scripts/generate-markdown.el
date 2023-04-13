;; Bootstrap straight.el

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Get ox-gfm and ox-md-title.el

(straight-use-package 'ox-gfm)
(straight-use-package
 '(ox-md-title :type git :host github :repo "jeffkreeftmeijer/ox-md-title.el"))

;; Generate Markdown version of ox-html-stable-ids.org

(require 'ox-md-title)

(setq make-backup-files nil)

(defun enough.css/generate-markdown ()
  (org-md-title-add)
  (org-publish-file "enough.css.org"
		    '("readme"
		      :base-directory "."
		      :publishing-directory "."
		      :publishing-function org-gfm-publish-to-gfm
		      :extensions ('ox-md-title)))
  (org-md-title-remove))
