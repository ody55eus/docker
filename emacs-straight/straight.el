;;; straight.el --- ody55eus/emacs-straight-*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Jonathan Pieper
;;
;; Author: Jonathan Pieper <https://github.com/jp>
;; Maintainer: Jonathan Pieper <ody55eus@mailbox.org>
;; Created: September 24, 2021
;; Modified: September 24, 2021
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/jp/packages
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'org-roam)
(straight-use-package 'plantuml-mode)
(setq plantuml-jar-path "/usr/local/bin/plantuml.jar")
(unless (file-exists-p plantuml-jar-path)
  (plantuml-download-jar))
