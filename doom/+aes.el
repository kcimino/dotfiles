;;; +aes.el -*- lexical-binding: t; -*-

;; Nyan!
(nyan-mode)

;; Emphasis stuff
(setq org-hide-emphasis-markers t)
;; This'll make the emphasis appear when you hover over it

;;(add-hook 'org-mode-hook 'org-appear-mode)
;; Look into config for this later




;; Fixing bullet lists
(after! org
(setq org-list-allow-alphabetical t)
(setq org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+") ("1." . "a.")))
(setq org-ellipsis " ▼")

)
;;org-pretty-entities t
(after! org
(setq org-support-shift-select 'always)
)
