(defun customizations-for-js-mode ()
  (interactive)
  (setq js-indent-level 2)
  ;;(flyspell-prog-mode)
  ;;(flycheck-mode)
  ;;(linum-mode t)
  ;;(fci-mode)
  (hs-minor-mode 1)
  ;;(auto-complete-mode)
  (subword-mode)
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  ;;(highlight-indentation-mode)
)

(add-hook 'js-mode-hook 'customizations-for-js-mode)