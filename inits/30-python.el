
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq python-indent-offset 2)
                      (setq indent-tabs-mode nil))))
