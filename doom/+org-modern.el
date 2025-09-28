;;; +org-modern.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Cas
;;
;; Author: Cas <cas@cas-ASUS-TUF-Gaming-F15-FX506LH-FX506LH>
;; Maintainer: Cas <cas@cas-ASUS-TUF-Gaming-F15-FX506LH-FX506LH>
;; Created: June 10, 2024
;; Modified: June 10, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/kcimino/+org-modern
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:



;;(provide '+org-modern)
(add-hook 'org-mode-hook 'org-modern-mode)
;; Fix org Modern
;;(with-eval-after-load 'org (global-org-modern-mode))

;; (custom-set-faces
;;   `(+org-todo-eventually ((:background "red"
;;                            :foreground "yellow"))))




;;(defface +org-todo-eventually
;;  '((t (:foreground "gray" :background "red"))) nil)

;; Of potential use if I need to extend this even more https://www.unicode.org/charts/PDF/U1F780.pdf
 ;; and https://www.keynotesupport.com/internet/special-characters-arrows.shtml

(after! org-modern
;; :hook (org-mode . org-modern-mode)
;; :config

  (setq org-modern-star '("◉" "○" "♠" "♤" "♣" "♧" "♥" "♡" "♦" "♢" "★" "✰" "✪" "❣" "•" "◘" "◆" "✦" "✸" "✿" "♪" "♫" "∞" )
;; llama mode
  ;; org-modern-replace-stars '("🦙","🦆","🧀","🍰","📱","🧱","🥔","🍄","🌳","⌂","🎂","🟠","◑")
;;   org-modern-star '("❍","●","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","")

;;      org-tags-column 0
        org-hide-emphasis-markers t
        org-modern-priority
        (quote ((?A . "🦙")
                (?B . "🦆")
                (?C . "🧀")))

        org-modern-todo-faces
   '(
     ("[X]" :inverse-video t :inherit +org-todo-cancel)
     ("DONE" :inverse-video t :inherit +org-todo-cancel)
     ("SKIP" :inverse-video t :inherit +org-todo-cancel)
     ("CANCELLED" :inverse-video t :inherit +org-todo-cancel)
     ("IGNORE" :inverse-video t :inherit +org-todo-cancel)
     ("MET" :inverse-video t :inherit +org-todo-cancel)

     ("PROJ" :inverse-video t  :inherit +org-todo-project)
     ("LOOP" :inverse-video t  :inherit +org-todo-project)

     ("[-]" :inverse-video t :inherit +org-todo-active)
     ("STARTED" :inverse-video t :inherit +org-todo-active)
     ("READING" :inverse-video t :inherit +org-todo-active)
     ("NOTES" :inverse-video t :inherit +org-todo-active)
     ("SUMMARIZE" :inverse-video t :inherit +org-todo-active)

     ("[ ]" :inherit +org-todo-onhold );; :background "red" :foreground "blue")
     ("IDEA" :inherit +org-todo-onhold);; :inverse-video t :inherit org-todo-eventually)
     ("LATER" :inherit +org-todo-onhold);; :inverse-video t :inherit +org-todo-eventually)

     ("[?]" :inverse-video t :inherit +org-todo-onhold)
     ("WAIT" :inverse-video t :inherit +org-todo-onhold)
     ("SENT" :inverse-video t :inherit +org-todo-onhold)

     ("HOLD" :inverse-video t :inherit +org-todo-cancel)
     ("PILL" :inverse-video t :inherit +org-todo-cancel)

     ("TODO" :inverse-video t :inherit org-modern-todo)
     ("MEETING" :inverse-video t :inherit org-modern-todo)
     ("READ" :inverse-video t :inherit org-modern-todo))))





;;; +org-modern.el ends here
