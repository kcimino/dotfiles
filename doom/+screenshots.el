;;; +screenshots.el -*- lexical-binding: t; -*-

;;(setq org-attach-screenshot-command-line "grim -g \"$(slurp)\" %f" )
(use-package org-download)
(after! org-download
;; (setq org-download-method 'directory)
 (setq org-download-screenshot-method "grim + slurp")
 (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
;;(setq org-download-image-org-width 600)
(setq org-download-link-format "[[file:%s]]\n")
;;org-download-abbreviate-filename-function #'file-relative-name)
  (setq org-download-link-format-function #'org-download-link-format-function-default))


(add-hook 'dired-mode-hook 'org-download-enable)
