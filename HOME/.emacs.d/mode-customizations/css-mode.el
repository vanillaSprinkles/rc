(defun customizations-for-css-mode ()
  (interactive)
  ;;(flyspell-prog-mode)
  ;;(linum-mode t)
  ;;(fci-mode)
  (hs-minor-mode 1)
  ;;(auto-complete-mode)
  (subword-mode)
  (setq css-indent-offset 2)
  (setq highlight-indentation-offset 2)
  ;;(highlight-indentation-mode)
  (define-key css-mode-map (kbd "RET") 'newline-and-indent))

(add-hook 'css-mode-hook 'customizations-for-css-mode)
