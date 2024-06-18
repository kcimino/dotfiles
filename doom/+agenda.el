;;; +agenda.el --- Description -*- lexical-binding: t; -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; Code:



(provide '+agenda)
;; Note: emacs will complain about assignment to a free variable, but it doesn't seem to be an issue

;; Have all of the files in the org directory in the agenda
(setq org-agenda-files '("~/org/"
                         "~/org/GTD/"))

;; Warn 5 days before a deadline
(setq org-deadline-warning-days 5)

;; Track when something is done, rescheduled, redeadlined
(setq org-log-into-drawer t)
(setq org-log-done t)
(setq org-log-reschedule t)
(setq org-log-redeadline t)

;; Start on Monday like a reasonable person
(setq calendar-week-start-day 1)


;;; +agenda.el ends here
