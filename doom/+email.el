;;; +email.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Cas
;;
;; Author: Cas <cas@cas-ASUS-TUF-Gaming-F15-FX506LH-FX506LH>
;; Maintainer: Cas <cas@cas-ASUS-TUF-Gaming-F15-FX506LH-FX506LH>
;; Created: July 13, 2024
;; Modified: July 13, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/kcimino/+email
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:



;;(provide '+email)
;; https://github.com/doomemacs/doomemacs/tree/master/modules/email/mu4e
;; Each path is relative to the path of the maildir you passed to mu
(set-email-account! "kathleencimino@gmail.com"
  '((mu4e-sent-folder       . "/kathleenCiminoGmail/Sent Mail")
    (mu4e-drafts-folder     . "/kathleenCiminoGmail/Drafts")
    (mu4e-trash-folder      . "/kathleenCiminoGmail/Trash")
    (mu4e-refile-folder     . "/kathleenCiminoGmail/All Mail")
    (smtpmail-smtp-user     . "kathleenCiminoGmail@gmail.com")
;;    (user-mail-address      . "foo@bar.com")    ;; only needed for mu < 1.4
;;    (mu4e-compose-signature . "---\nThanks,\nThe Baz"))
  t))



;;; +email.el ends here
