
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq python-indent-offset 4)
                      (setq indent-tabs-mode nil))))
