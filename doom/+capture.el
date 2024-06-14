;;; +capture.el -*- lexical-binding: t; -*-
 ;; Setting up templates
(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (unless (eq org-journal-file-type 'daily)
    (org-narrow-to-subtree))
  (goto-char (point-max)))
(defvar org-journal--date-location-scheduled-time nil)

(defun org-journal-date-location (&optional scheduled-time)
  (let ((scheduled-time (or scheduled-time (org-read-date nil nil nil "Date:"))))
    (setq org-journal--date-location-scheduled-time scheduled-time)
    (org-journal-new-entry t (org-time-string-to-time scheduled-time))
    (unless (eq org-journal-file-type 'daily)
      (org-narrow-to-subtree))
    (goto-char (point-max))))

(after! org
(setq org-capture-templates
      '(
        ;; Items that aren't part of larger groups
("c" "Item to Current Clocked Task" item (clock)
 "%i" :empty-lines 1)
("d" "Journal entry" plain (function org-journal-find-location)
                               "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
                               :jump-to-captured t :immediate-finish t)

("D" "Future Journal entry" plain (function org-journal-date-location)
                               "** TODO %?\n <%(princ org-journal--date-location-scheduled-time)>\n"
                               :jump-to-captured t)
;; Tasks
("t" "Task" entry (file+datetree "~/org/Inbox.org")
"** %^{STATUS|TODO|STARTED|LATER|IDEA|MEETING|DONE} %^g
%i
" :empty-lines 1 )

        ;; Notes
("n" "Notes")

("ns" "New Source Notes" item (file+datetree "~/org/notes/Inbox.org")
"** %^{SourceTitle}
:PROPERTIES:
:Topic: %^G
:Creator: %^{creator}
:Type: %^{Type}
:source: %^C
:found: %u
:State: Not Started
:END:
%^{description}

related to: %a
" :empty-lines 1
)

        ;; Meetings
("nm" "Meeting Notes" entry (file+olp "~/org/meetings.org" "Unorganized")
"** Meeting about %\\1 %u
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
***** Date: %u
***** Actionable Items:

***** Notes

" :empty-lines 1
)
        ;; Media
("nM" "Notes on media" entry (file "~/org/Media/Unorganized.org")
"*** %^{Title}
:PROPERTIES:
:creator: %^{creator}
:genres: %^G
:Tags: %^G
:series:
:rating: X/10
:Type: %^{type}
:Status: To Read
:END:

*Description:*
%^{description}

*Thoughts on it as of %u*

*Other people who enjoy it*

" :empty-lines 1)
        ;; Random Notes
("nr" "Random Note" entry (file+datetree "~/org/Inbox.org")
 "* %?\nEntered on %U\n  %i\n  %a"
)
        ;; Job
("j" "Job")

        ;; Search


("ja" "Job application" entry (file+olp "~/Desktop/JobApps/Apps.org" "Active")
;;"| %^{JobTitle| Data Analyst | Junior Data Scientist}  | %^{Company | Company}  | Found  | %u  |   |   |   |   | %^C  | %^{Site | LinkedIn | Idealist | Indeed}  | %^{JobCategory| Data Analyst| Data Scientist| Data Engineer}  |   |   |   |" )
"** %^{Job Title| Data Analyst|Junior Data Scientist|Data Engineer}
:PROPERTIES:
:COMPANY: %^{Company}
:STATUS: Found
:DATEFOUND: %u
:DATEREACHEDOUT:
:DATEINFORMALINTERVIEW:
:DATEAPPLIED:
:DATEINTERVIEW:
:DATEREJECTED:
:DATEGAVEUPON:
:LINK: %^C
:WEBSITEFOUNDON: %^{Website|LinkedIn|Idealist|Indeed|ProgressiveDataJobs}
:JOBCATEGORY: %^{JobCat|Data Analyst|Data Scientist|Data Engineer|Other}
:RESUMEUSED:
:COVERLETTERUSED:
:NOTES:
:JOBDESCRIPTION:
:END:

*** TODO Find Contact for %\\1 at %\\2
*** WAIT Reach out to contact at %\\2 " :empty-lines 1)

("jD" "Job application description" table-line (file "~/Desktop/JobApps/Descriptions.org")
"| %u | %^{JobTitle|Data Analyst | Junior Data Scientist}  |   %^{Compnay} | %?  |" )

("ji" "Company and Interviewer Information" entry (file "~/Desktop/JobApps/Companies.org" )
"* %^{Company}
** Notes
*** Mission
*** History
*** Revenue Streams, Products/Services/Customers, Stock if applicable
*** Recent Press
*** Hiring
**** Best way to apply (ask interviewer)
**** Why am I interested in them?
** Contact
:PROPERTIES:
:Name:
:JobTitle:
:ReachedOutToOn:
:HowWeMet:
:END:

*Previous Jobs*

*Commonalities*

*Things of interest*

*** Interview Request

 Hello NAME,

		  I hope you're having a lovely week so far! My name is Killian Cimino, and I'm reaching out [to hopefully learn more about %\\1 / because I'm interested in the work you've done on X, and I was hoping to learn more]. Currently I [relevant career details here], and I was hoping [I could see if %\\1 might be a good fit/ to learn from some of the cool stuff you're doing]. Do you have 15 minutes sometime in the next week or two to connect over the phone? I'm free (just about any time M-F after 6pm EST). Thank you for taking the time to read this, and I hope to speak with you soon!

		  Thanks,
		  Killian Cimino
		  killian.cimino@gmail.com | 865-404-9030 | kcimino.github.io" :empty-lines 1 )

("jI" "Informal Interview Outline" entry (file+datetree "~/Desktop/JobApps/Interviews.org")
"
* Meeting with %^{interviewer} about %^{company}
** Notes
*** Pitch

*** Questions

*** Goal for this meeting
%^{Goal}



** What We Discussed
** Follow Up
*** [ ] Send Thank You [#A]
"



)
        ;; Freelance

        ;; Client




;;;
;;"**%^{Client}
;;
;;:
;;:
;
;;
;;
;;;;

;;
;;;
;;; :maxlevel 3 :compact t;;;;
;;**** Archived Projects

;;
;;
;;;
;;;
;;;
;;;
;;;
;;;

("jc" "Client" item (file+olp "~/org/Working/Clients.org" "Unsorted")
"** %^{Client}
*** General Information
PROPERTIES:
:ClientStatus: %^{STATUS | Current | Potential | Former}
:Type: %^{TYPE | Non-Profit | Organization | Individual}
:END:

[[file:'~/org/Working/%\\1.org'][%\\1]]
**** Contacts

**** Current Projects

BEGIN: clocktable :scope (lambda () (directory-files-recursively '~/org/Working/%^{SubDirectory}' '%\\1*.org')) :maxlevel 3 :compact t

**** Future Projects"

)

        ;; Code
        ;; Project
        ;;
)
      )
)
