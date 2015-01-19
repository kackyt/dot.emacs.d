;;; gresreg.el ---  query-replace in all buffer
;; -*- Mode: Emacs-Lisp -*-

;; $Id: gresreg.el,v 2.2 2009-10-20 12:13:33 akihisa Exp $

;; Copyright (C) 2004 Matsushita Akihisa <akihisa@mail.ne.jp>

;; Authors: Matsushita Akihisa <akihisa@mail.ne.jp>
;; Keywords: isearch

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; The latest version of this program can be downloaded from
;; http://www.bookshelf.jp/elc/gresreg.el

;;; Install:

;; Put this file into load-path'ed directory, and byte compile it if
;; desired.  And put the following expression into your ~/.emacs.
;;
;;     (require 'gresreg)

(defvar gresreg-map (make-sparse-keymap))

(define-key gresreg-map " " 'act)
(define-key gresreg-map "\d" 'skip)
(define-key gresreg-map [delete] 'skip)
(define-key gresreg-map [backspace] 'skip)
(define-key gresreg-map "y" 'act)
(define-key gresreg-map "n" 'skip)
(define-key gresreg-map "Y" 'act)
(define-key gresreg-map "N" 'skip)
(define-key gresreg-map "q" 'exit)
(define-key gresreg-map "\r" 'exit)
(define-key gresreg-map [return] 'exit)
(define-key gresreg-map "!" 'automatic)
(define-key gresreg-map "\C-h" 'help)
(define-key gresreg-map [f1] 'help)
(define-key gresreg-map [help] 'help)
(define-key gresreg-map "?" 'help)
(define-key gresreg-map "\C-g" 'exit)
(define-key gresreg-map "\C-]" 'exit)

(defun gresreg (from-string to-string delimited &optional buffers)
  (interactive (query-replace-read-args "Query replace" nil))
  (let ((bufs
         (if buffers buffers (buffer-list)))
        key def (auto nil)
        (cbuf (current-buffer)) (cp (point)))
    (while bufs
      (when (and (buffer-live-p (car bufs))
                 (buffer-file-name (car bufs)))
        (switch-to-buffer (car bufs))
        (goto-char (point-min))
        (message "Replace in %s ? (? for help)"
                 (buffer-name (car bufs)))
        (setq key (vector (read-event)))
        (setq def (lookup-key gresreg-map key))
        (cond
         ((eq def 'help)
          (with-output-to-temp-buffer "*Help*"
            (princ
             (concat "Query replacing "
                     from-string " with "
                     to-string ".\n\n"
                     "スペースか `y' を入力すると現在バッファでのみ置換を実行します．\n"
                     "Delete か `n' で置換せずに次のバッファへ移ります．\n"
                     "RET か `q' で終了します．\n"
                     "! で全バッファを確認なしで置換します．\n"
                     ))))
         ((and (not auto) (eq def 'act))
          (perform-replace from-string to-string t nil delimited))
         ((eq def 'automatic)
          (setq auto t)
          (while (re-search-forward from-string nil t)
            (replace-match to-string)))
         ((eq def 'skip)
          ())
         ((eq def 'exit)
          (setq bufs nil))))
        (if bufs
            (setq bufs (cdr bufs))))
    (switch-to-buffer cbuf)
    (goto-char cp)
    (message "置換が終了しました")
    ))

(provide 'gresreg)

