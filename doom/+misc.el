;;; +misc.el -*- lexical-binding: t; -*-

(setq doom-modeline-enable-word-count t)

(after! org
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

(setq org-refile-allow-creating-parent-nodes t)
)

;; Treat camelCase as two words
(global-subword-mode 1)

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      ;;truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?

)
