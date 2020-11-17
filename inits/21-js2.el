(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Settings in certain project
(add-hook 'js2-mode-hook
          (lambda ()
            (setq my-js-mode-indent-num 2)
            (setq js2-basic-offset my-js-mode-indent-num)
            (setq js-switch-indent-offset my-js-mode-indent-num)
            (when (string-match "/ssh:p006:.*/.*\\.js"
                                (or (buffer-file-name) ""))
              (setq tab-width 2 indent-tabs-mode t))))
