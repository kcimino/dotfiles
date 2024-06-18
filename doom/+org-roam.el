;;; +org-roam.el --- Description -*- lexical-binding: t; -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; Code:



(provide '+org-roam)
(after! org
;; set the directory to be the org directory
(setq org-roam-directory (file-truename "~/org"))
;; set it to follow symlinks (does affect performance)
(setq find-file-visit-truename t)
(org-roam-db-autosync-mode)

(add-to-list '+doom-dashboard-menu-sections
             '("Open daily org-roam note"
               :icon (all-the-icons-octicon "calendar" :face 'doom-dashboard-menu-title)
               :when (featurep! :lang org +journal)
               :face (:inherit (doom-dashboard-menu-title bold))
               :action org-roam-dailies-goto-today)))

(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
'(("d" "default" entry
		"* %?"
		:target (file+head "%<%Y-%m-%d>.org"
"#+title: %<%Y-%m-%d %a>
#+CREATED: %<%Y-%m-%d %a>
#+MODIFIED:

*  Daily Intent

The one thing I plan on doing
___

Things I'm /not/ going to do to productively procrastinate

* Log

-

** Todos

** Pings


* Personal



** Meta

- Where: ???
- Weather: ???
- Music: ???
- Sleep: 7h?
- Energy: L/M/H
- Effective: L/M/H

*** Moods:
[[id:7e3c5eb5-4822-4c64-a99d-a8eaead2e3a4][Emotions]]


*** [[id:245f5c0e-0ada-46a8-aa4f-797f5618643b][Workouts]]

*** [[id:2bcfd9bc-eec1-4426-9c55-5208f64f0b3c][Cool Stuff]]

*** [[id:29126504-8fc5-4f06-862a-3bf95740e698][Grumps]]

*** TIL

*** TLDR for today

*** Eats

- Lunch: ???

- Dinner: ???

- Snacks: ???

** Nightly Check In

*** Other

What was my most intent state today?
(Up, Down)

How intense was it?

How long has it been going on?

 What does/did it feel like physically, mentally, emotionally, spiritually, socially, career/ financially?

How did it influence my ability to function? What did I begin to understand about being able to function in the state?

What does functioning mean to me? How well did I function?

Was I comfortable in the state?

What actions did I take that made those around me comfortable or uncomfortable?

What valuable thing(s) did I learn from the state?


"))))


;;; +org-roam.el ends here
