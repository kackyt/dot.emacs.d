;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    init-loader
    php-mode
    markdown-mode
    scss-mode
    haskell-mode
    js2-mode
    google-c-style
    yaml-mode
    flycheck
    exec-path-from-shell
    migemo
    open-junk-file
    recentf-ext
    popwin
    google-translate
    auto-complete
    foreign-regexp
    emmet-mode
    auto-highlight-symbol
    highlight-symbol
    slim-mode
    apache-mode
    zenburn-theme
    ssh-config-mode
    smarty-mode
    go-mode
    go-autocomplete
    smartrep
    expand-region
    jade-mode
    coffee-mode
    haml-mode
    dash-at-point
    enh-ruby-mode
    yard-mode
    lua-mode
    rainbow-mode
    web-beautify
    undo-tree
    elixir-mode
    alchemist
    ac-alchemist
    flycheck-elixir
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(display-time-mode t)
 '(foreign-regexp/regexp-type (quote ruby))
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en")
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(js2-basic-offset 2)
 '(markdown-command "mdown")
 '(markdown-css-path "file:///Users/catatsuy/.emacs.d/markdown.css")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (flycheck-elixir ac-alchemist alchemist elixir-mode zenburn-theme yard-mode yaml-mode web-beautify ssh-config-mode smarty-mode smartrep slim-mode scss-mode scala-mode2 redo+ recentf-ext rainbow-mode popwin php-mode open-junk-file migemo markdown-mode lua-mode js2-mode jade-mode init-loader highlight-symbol haskell-mode haml-mode google-translate google-c-style go-mode go-autocomplete foreign-regexp flycheck expand-region exec-path-from-shell enh-ruby-mode emmet-mode dropdown-list dash-at-point coffee-mode auto-highlight-symbol apache-mode)))
 '(reb-re-syntax (quote foreign-regexp))
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(vc-handled-backends nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
