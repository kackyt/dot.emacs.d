;; C-hをBSに
(global-set-key (kbd "C-h") 'backward-delete-char)

;; 行番号を指定して移動する機能をM-zに割り当て
(global-set-key (kbd "M-z") 'goto-line)

;; ESC 連打で無効化
(global-set-key (kbd "M-ESC ESC") 'keyboard-quit)

;; to LARGE C-x C-u と to small C-x C-l
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; expand-region
(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)

;; multiple-cursors
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)
(smartrep-define-key
    global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                       ("C-p" . 'mc/mark-previous-like-this)
                       ("*"   . 'mc/mark-all-like-this)))

;; open-junk
(global-set-key (kbd "C-x j") 'open-junk-file)

;; recentf
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; Google Translate
(global-set-key (kbd "C-x t") 'google-translate-at-point)
(global-set-key (kbd "C-x T") 'google-translate-query-translate)

;;; C-x C-b をつぶす
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;;; window の移動
(global-set-key (kbd "C-z") 'other-window-or-split)
(global-set-key (kbd "C-S-z") 'previous-multiframe-window)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<right>") 'windmove-right)

;; dash (cocoa-emacs only)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c e") 'dash-at-point-with-docset)

;; F8 to C-x
(global-set-key (kbd "<f8>") 'Control-X-prefix)

;; F1 to grep-find
(global-set-key (kbd "<f1>") 'grep-find)

;; F2 to gresreg
(global-set-key (kbd "<f2>") 'gresreg)

(require 'redo+)

(global-set-key (kbd "C-_") 'redo)

(global-set-key (kbd "C-/") 'undo)
