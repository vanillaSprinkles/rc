(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun customizations-for-coffee-mode ()
  (interactive)
  ;;(flyspell-prog-mode)
  ;;(flycheck-mode)
  ;;(linum-mode t)
  ;;(fci-mode)
  (hs-minor-mode 1)
  ;;(auto-complete-mode)
  (subword-mode)
  ;;(whitespace-mode)
  (setq whitespace-action (quote (auto-cleanup)))
  (setq tab-width 2)
  (setq highlight-indentation-offset 2)
  ;;(highlight-indentation-mode)
  (highlight-indentation-current-column-mode))

(add-hook 'coffee-mode-hook 'customizations-for-coffee-mode)