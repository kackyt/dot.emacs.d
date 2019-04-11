(defun review-custom()
  "review-mode-hook"
  (and (set (make-local-variable 'tab-width) 4)
       (set (make-local-variable 'indent-tabs-mode) t)
       )
  )

(add-hook 'review-mode-hook
          '(lambda() (review-custom)))
