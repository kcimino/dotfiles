;;; +org-custom.el -*- lexical-binding: t; -*-
(after! org
  (setq org-todo-keywords
      '((sequence
         "[ ](T)"                       ; A task
         "[-](S)"                       ; Task is in progress
         "[?](W)"                       ; Task is being held up or paused
         "|"
         "[X](D)"                       ; Task was completed
         )
        (sequence
         "TODO(t)"                      ; A task that needs doing & is ready to do
         "STARTED(s)"                   ; A task that is in progress
         "WAIT(w)"                      ; Something external is holding up this task
         "HOLD(h)"                      ; This task is paused/on hold because of me
         "LATER(l)"                     ; A task I want to do later
         "IDEA(i)"                      ; A potential task or project or related
         "PROJ(p)"                      ; A project
         "PILL(P)"                      ; headache waiting to happen, need to do it though
         "MEETING(m)"                   ; Meeting
         "LOOP(L)"                      ; A category or series of actions that will repeat (e.g. debugging)
         "|"
         "DONE(d)"                      ; Task successfully completed
         "SKIP(k)"                      ; Skipped a recurring task
         "CANCELLED(c)"                 ; Task was cancelled, aborted or is no longer applicable
         ;; "KILL(k)"
         ;;     ;;
         )
        (sequence
         "READ(r)"              ; I want to read/watch/play this
         "READING(R)"           ; I have started reading/watching/whatever
         "NOTES(n)"             ; I need to take notes
         "SUMMARIZE(U)"         ; I need to summarize or organize my thoughts (notes or a "review")
         "|"
         "IGNORE(I)"            ; I don't really plan on watching /whatever soon
         )
        (sequence
         "TOSEND(e)"              ; I need to send this email/text
         "SENT(E)"                ; I sent the message, need a response
         "|"
         "GOTRESPONSE(g)"         ; Got response
         "NORESPONSENEEDED(G)"    ; I don't need a response
         )

       )
  )
)

;; Other stuff


;; Insert Org headings at point, not after subtree
(after! org (setq org-insert-heading-respect-content nil))

;; journal stuff
;;
(after! org-journal
(setq org-journal-dir "~/org/journal/")
(setq org-journal-carryover-items "")
(setq org-journal-enable-agenda-integration t)
(setq org-journal-file-type 'monthly)
)
