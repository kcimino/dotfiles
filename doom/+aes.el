;;; +aes.el -*- lexical-binding: t; -*-

;; Nyan!
(nyan-mode)

;; Emphasis stuff
(setq org-hide-emphasis-markers t)
;; This'll make the emphasis appear when you hover over it

;;(add-hook 'org-mode-hook 'org-appear-mode)
;; Look into config for this later

;; doom modeline count words is nice but killing my CPU in larger files...
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-enable-word-count nil)

;; Fixing bullet lists
(after! org
(setq org-list-allow-alphabetical t)
;;(setq org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+") ("1." . "a.")))
(setq org-ellipsis " ▼")
)
;;org-pretty-entities t
(after! org
(setq org-support-shift-select 'always)
)

;; Sticky Header since I can't seem to get rainbow threading to work :(
(add-hook 'org-mode-hook 'org-sticky-header-mode)
(setq org-sticky-header-full-path 'reversed ;; options = nil for only header, full, reveresed
      org-sticky-header-prefix '"" ;; So there aren't a bunch of stars
      )

;; || Tabs
(after! all-the-icons
(after! centaur-tabs
(setq centaur-tabs-style "rounded"
;; :      centaur-tabs-plain-icons t
;;      centaur-tabs-set-icons t
      centaur-tabs-icon-type 'all-the-icons
      centaur-tabs-set-bar 'over
;;      centaur-tabs-adjust-buffer-order t
;;      centaur-tabs-adjust-buffer-order 'right
      centaur-tabs-show-navigation-buttons t
      centaur-tabs-show-count t



      )))

;; || Fonts
(setq
;; doom-font  (font-spec :family "Baumans")
;; doom-font  (font-spec :family "Comic Mono")
  doom-font  (font-spec :family "Overpass Mono")
;; doom-font  (font-spec :family "Merriweather")
;; doom-variable-pitch-font  (font-spec :family "Zilla Slab")
;; doom-font (font-spec :family "Cabin Sketch")
;;doom-font (font-spec :family "Courier Prime")
;;
 ;; doom-font  (font-spec :family "Lato")

;;     doom-symbol-font  (font-spec :family "all-the-icons")
     )
(set-face-attribute 'default nil :height 213) ;; For Baumans and comic mono
;;(set-face-attribute 'default nil :height 180) ;; For Merriweather
;;(set-face-attribute 'default nil :height 200) ;; For Zilla Slab and Lato
;; Indenting
;;
;; Go to .emacs.d/modules/ui/indent-guides.el and comment out the bottom to avoid hiding indent guides in org
;;
;;
;;(setq org-bars-color-options '(:desaturate-level-faces 30
;;                               :darken-level-faces 15))

;;(setq org-bars-with-dynamic-stars-p nil)
;;(add-hook 'org-mode-hook #'org-bars-mode)
;;(setq org-visual-indent-color-indent '((1 (:background "blue" :foreground "blue" :height .1))
;;                                       (2 (:background "red" :foreground "red" :height .1))
;;                                      (3 (:background "green" :foreground "green" :height .1))))
;;
;;
;;
;;(setq org-visual-indent-color-indent
;;      (cl-loop for x from 1 to 8
;;               with color = nil
 ;;              do (setq color (or (face-foreground
   ;;                                (intern
     ;;                               (concat "org-level-"
       ;;                                     (number-to-string x))))
         ;;                         (face-foreground 'org-level-1)))
           ;;    collect `(,x ,(list
             ;;                 :background color
               ;;               :foreground color
                 ;;             :height .1))))

;; If you don’t have all of the org-level-x faces set, this will use
;; org-level-1 as the backup. Or figure out your own way of doing it.
;; None of it matters anyway.
