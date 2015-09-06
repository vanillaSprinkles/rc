(defun gker-setup-sh-mode ()
  "My own personal preferences for `sh-mode'.

This is a custom function that sets up the parameters I usually
prefer for `sh-mode'.  It is automatically added to
`sh-mode-hook', but is can also be called interactively."
  (interactive)
  (setq sh-basic-offset 8
        sh-indentation 8
        ;; Tweak the indentation level of case-related syntax elements, to avoid
        ;; excessive indentation because of the larger than default value of
        ;; `sh-basic-offset' and other indentation options.
        sh-indent-for-case-label 0
        sh-indent-for-case-alt '+)
  (add-hook 'sh-mode-hook 'gker-setup-sh-mode)
  )
