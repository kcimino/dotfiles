;;; +misc.el -*- lexical-binding: t; -*-

(setq doom-modeline-enable-word-count t)

(after! org
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

(setq org-refile-allow-creating-parent-nodes t)
)
(after! projectile
  (add-to-list 'projectile-ignored-projects "~/org"))
;; Treat camelCase as two words
(global-subword-mode 1)

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      ;;truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
)
;;(setq which-key-use-C-h-commands 't)



;; from https://orgmode.org/worg/org-hacks.html#orgf722eb0
;; This sets it to ask for a note when you clock out, could be useful to note where I left off
(defun rgr/check-for-clock-out-note()
      (interactive)
      (save-excursion
        (org-back-to-heading)
        (let ((tags (org-get-tags)))
          (and tags (message "tags: %s " tags)
               (when (member "clocknote" tags)
                 (org-add-note))))))

(add-hook 'org-clock-out-hook 'rgr/check-for-clock-out-note)
