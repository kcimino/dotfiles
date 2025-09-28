;;; +archive.el -*- lexical-binding: t; -*-

;; For things I'm not using but might want later so it's not crowding the config
;; Collapse plain lists
;;(setq org-cycle-include-plain-lists 'integrate)

;; turn on whitespace cleanup
;;(add-hook! 'before-save-hook 'whitespace-cleanup)

;;(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)

;;(setq python-shell-interpreter "jupyter"
;;      python-shell-interpreter-args "console --simple-prompt")
;; keybindings- set SPC + RET to open vterm
;; This is to alternate the splash page

;;(let ((alternatives '("doom-ascii-art.png"
 ;;                     "doom-vaporwave.png"
;;                      "doom-emacs-bw-dark.png"
;;                      "I-am-doom.png"
;;                      ""

;;                      )))
;;  (setq fancy-splash-image
;;        (concat doom-private-dir "splash/"
;;                (nth (random (length alternatives)) alternatives))))


;; In org-roam weekly:
;;
;;* Buckets
;;** Sharpen
;;2 wo/run + movie + game + read
;;⬜ ⬜ ⬜ ⬜
;;** Create
;;Blog + Book
;;⬜ ⬜

;;** Learn
;;Astro + COMA Airflow + Rust
;;⬜ ⬜ ⬜
;;** Review, Plan, Prune
;;Buckets + Weekly Review
;;✅ ⬜
(setq org-modern-replace-stars '("◉" "○" "◔" "◓" "◐" "◒" "◑" "♠" "♣" "♥" "♦" "+" "•" "◘" "░" "▒" "▓" "█" "⦾" "✰" "✸" "◆" "✿" "★" "✦" "✪" ))
 (setq org-modern-replace-stars '("+""○""✸""✿""✤""◆""◉""○""✸""✿""✤""◆")
 ❥
