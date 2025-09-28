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

*** Thoughts
1. Was I able to handle my thoughts today?
2. Did I think unduly unkind things about someone today?
3. Did I spiral today?
4. Did I pay attention to my thoughts?
5. Did I get obsessive about anything?
6. Did I look for a better way to handle triggers?
7. Did I accept myself and my flaws today?



*** Actions
1. Did I say anything unkind without purpose?
2. Did I lash out?
3. Did I overshare?
4. Did I relax?
5. Did I work on a personal project today?
6. Did I work on work today?
7. Did I do one thing to make my life better today?


*** Practice
1. Did I say morning blessings?
2. Did I say hamotzi?
3. Did I prepare for or observe Shabbat?
4. Did I practice Tikkum Olam, even in a small way?
5. Did I take care of my body?
6. Did I learn at least one thing today?
7. Did I seek community, even in a small way?


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


;; General capture
;;
(setq org-roam-capture-templates
    '(

("d" "default" plain "%?"
    :target (file+head "Inbox/${slug}.org"

"#+TITLE: ${title}
#+CREATED: %u
#+MODIFIED:
* ${title}
"):unnarrowed t)

("m" "meeting" entry "
#+TITLE: ${title}
#+CREATED: %u
#+CATEGORY:

"

 :target (file+datetree "~/org/Inbox/Meetings.org" day
"
** Meeting about ${title} %u
:PROPERTIES:
:Topic: %^{topics}
:Group: %^{group}
:State: Not Started
:END:
*** Participants

*** Agenda

*** Notes

*** Condensed Notes
**** %\\1
***** Date: %U
***** Actionable Items:

***** Notes

"


                        )
 :prepend t
 :time-prompt t
 :unarrowed t


 )

("P" "project" plain "%?"
 :target (file+olp "~/org/Projects/${slug}/${slug}.org")

"#+TITLE: ${title}
#+CREATED: %u
#+MODIFIED:
* ${title}
:PROPERTIES:
:Status:
:END:

* Overview
DEADLINE: <year-month-day dayOfWeek>

** Vision

** Status

** Questions

*** Archived


* Contacts

* Steps

** LOOP Admin

* Notes

** References

* Related Meetings

"

 )

("p" "person" entry
"
** ${title}
:PROPERTIES:
:ID: ${org-id-get-create}
:Full_Name:
:Email:
:Phone:
:Relationship:
:Past_Companies_And_Orgs:
:Current_Company:
:Current_Role:
:Location:
:Interests:
:Dietary_Restrictions:
:Pronouns:
:Added: %u
:END:
*** ${title}'s Birthday - yyyy-mm-dd   :bday:
DEADLINE: <yyyy-mm-dd aaa +1y -4w>
*** How We Met
*** Mutual Connections
*** Projects
**** Project 1
:PROPERTIES:
:Status:
:RelationshipToProject:
:END:

*** Actions
Last Contacted:

Upcoming Contacts:


"

 :target (file+olp "~/org/References/People/People.org"
                         ("%^{prompt|Unsorted|Knoxville Temple Beth El|Knoxville Stitch and Bitch|Wesleyan|Knoxville}")
):unnarrowed t)

("m" "Media" plain "%?"
	 :target (file+head "~/org/refs/Media/${slug}.org"
"#+TITLE: ${title}
#+CREATED: %u
#+MODIFIED:
* ${title}
:PROPERTIES:
:ID:${org-id-get-create}
:Type:
:Start:
:Fin:
:Killed:
:Rating:
:Digested:
:Creator:
:URL:
:END:
* Actions
** READ ${title}

* Key Ideas
** Review
** Quotes
** Notes
"):unnarrowed t)


("7" "Weekly" plain "%?"
 :target (file+head "~/org/daily/${slug}.org"
"#+TITLE: ${title}
#+CREATED: %u
#+MODIFIED:
* Intents
Week Goal:
|----------+-----+-----+-----+-----+-----+-----+-----|
|          | Mon | Tue | Wed | Thu | Fri | Sat | Sun |
|----------+-----+-----+-----+-----+-----+-----+-----|
| Personal |     |     |     |     |     |     |     |
|----------+-----+-----+-----+-----+-----+-----+-----|
| Work     |     |     |     |     |     |     |     |
|----------+-----+-----+-----+-----+-----+-----+-----|

* Commits
|---------------------------------------+-----------------------------------|
| *This Week*                           | *Medium-term Goals*               |
|---------------------------------------+-----------------------------------|
| 1. Health (physical):                 | 1. 30 sec plank                   |
| 2. Health (mental):                   | 2. check in 1 week straight       |
| 3. Coding:                            | 3. Servo's Bazaar                 |
| 4. Work:                              | 4. 1 income source                |
| 5. Writing:                           | 5. 1 rough draft 1 chapter        |
|---------------------------------------+-----------------------------------|
| *Next 4 Weeks*                        | *Metrics*                         |
|---------------------------------------+-----------------------------------|
| 1. Change Therapist                   | 1. secs plank                     |
| 2. M's Americorp Over                 | 2. # check ins                    |
| 3.                                    | 3. Progress in coding outline     |
| 4.                                    | 4. binary y/n                     |
| 5.                                    | 5. words                          |
|---------------------------------------+-----------------------------------|

Watched:
Played:
Read:


* Weekly Review
  ⬜✅💪❌🔼🔽¼ ½ ¾ ⅓ ⅔ ⅕ ⅖ ⅗ ⅘
** Score: XX/XX ~ XX%
** How'd it go?
** *🏆 Pluses*
1.
2.
3.
** 🔽 Learning Opportunities
1.
2.
3.
** ▶️ Next
1.
2.
3.
"):unnarrowed t)

))


;;; +org-roam.el ends here
