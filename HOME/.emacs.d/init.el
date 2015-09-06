(package-initialize)
(setq-default indent-tabs-mode nil)  ;; tabs disabled 
(add-to-list 'load-path "~/.emacs.d/elisp_scripts/")


(dolist (unkey '("\C-z"
                 "\C-h" "\C-H"))
  (global-unset-key unkey))

;;(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key "\C-z" 'undo)

;; Map certain keypad keys into ASCII characters
;; that people usually expect.
(define-key function-key-map [backspace] [127])
(define-key function-key-map [delete] [127])

(define-key function-key-map [delete] [deletechar])



;;;; TAB FUN ;;;;

;; Set root directory of Emacs config
(setq emacs-config-dir
      (file-name-directory (or load-file-name (buffer-file-name))))

;; Determine if GUI or console settings should apply
;(setq gui-window-system
;      (if (or (getenv "EMACS_GUI_SERVER") window-system) t 'nil))

;; Helper function for config path
(defun get-config-path(path)
  "Appends argument at the end of emacs-config-dir using expand-file-name"
  (expand-file-name path emacs-config-dir))

(load-file (get-config-path "mode-customizations.el"))






;;
;;(setq tab-width 2)
;;(autoload 'how-many-region "notabs.wiki.el" nil t)
;;(autoload 'infer-indentation-style "notabs.wiki.el" nil t)

;; CC Mode http://www.emacswiki.org/emacs/CcMode
;;(setq tab-width 1) ; or any other preferred value
;;(defvaralias 'c-basic-offset 'tab-width)
;;(defvaralias 'cperl-indent-level 'tab-width)
;(autoload 'gker-setup-sh-mode "indentation" nil t)
;;(setq
; sh-basic-offset 0
; sh-indentation 0
; standard-indent 0 
; )



;(defvaralias 'sh-basic-offset 'tab-width)
;(defvaralias 'sh-indentation  'tab-width)

;; guess-style
;; https://github.com/nschum/guess-style
;;(add-to-path 'load-path "~/.emacs.d/guess-style/")
;(add-to-list 'load-path "~/.emacs.d/guess-style/")
;(autoload 'guess-style-set-variable "guess-style" nil t)
;(autoload 'guess-style-guess-variable "guess-style")
;(autoload 'guess-style-guess-all "guess-style" nil t)
;;(setq tab-width 2)




;; disable the automatic EOF generation in Shell Mode
;;;;;;;;; THIS WAS ON ;;;(eval-after-load "sh-mode" '(progn (define-key sh-mode-map (if "<" "<") (local-set-key "<" 'self-insert-command) )))
;;; bpalmer  (eval-after-load "sh-mode" '(progn (define-key sh-mode-map (if ...))))
;;; BAD FORM: bpalmer: shouldn't defvar something that's defined in a library
;(defvar sh-use-prefix nil
;  "If non-nil when loading, `$' and `<' will be  C-c $  and  C-c < .")
;(defvar sh-mode-map
;  (let ((map (make-sparse-keymap)))
;    (define-key map (if sh-use-prefix "\C-c<" "<")
;      (local-set-key "<" 'self-insert-command))
;   map)
;  "Keymap used in Shell-Script mode.")
;; end automatic EOF in Shell Mode






(custom-set-faces
;  use  C-u C-x =    see the face at cursor position
;
;   custom-set-faces was added by Custom.
;   If you edit it by hand, you could mess it up, so be careful.
;   Your init file should contain only one such instance.
;   If there is more than one, they won't work right.
;  '(default ((t (:inherit nil :stipple nil :background "lightyellow2" :foreground "gray20" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :width normal :family "liberation mono"))))

;  '(default ((t (:inherit nil :stipple nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :width normal :family "liberation mono"))))

;  '(background "blue")
;  '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "Turquoise"))))
;  '(font-lock-comment-face ((t (:foreground "MediumAquamarine"))))
;  '(font-lock-constant-face ((((class color) (background dark)) (:bold t :foreground "DarkOrchid"))))
;  '(font-lock-doc-string-face ((t (:foreground "green2"))))
;;  '(font-lock-function-name-face ((t (:foreground "SkyBlue"))))
;  '(font-lock-keyword-face ((t (:bold t :foreground "CornflowerBlue"))))
;  '(font-lock-preprocessor-face ((t (:italic nil :foreground "CornFlowerBlue"))))
;  '(font-lock-reference-face ((t (:foreground "DodgerBlue"))))
;  '(font-lock-string-face ((t (:foreground "LimeGreen"))))

  '(font-lock-function-name-face ((t (:foreground "royalblue"))))

;  '(font-lock-comment-face ((t (:foreground "firebrick"))))
;    '(font-lock-comment-delimiter-face  ((t (:foreground "firebrick"))))


)

(cua-mode 1)
;;(add-to-list 'load-path "~/.emacs.d/elisp_scripts/")
;;; NEEDS TO CHECK IF DISPLAY IS set+active or not
;(load "xclip")

;(setq x-select-enable-clipboard t)
;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;(defvar fst-mode-syntax-table
;  (let ( (fst-mode-syntax-table (make-syntax-table) ) )
;    (modify-syntax-entry  ?#   "<"   fst-mode-syntax-table)  ; start comment
;    (modify-syntax-entry  ?\n  ">"   fst-mode-syntax-table)  ; end comment
;    (modify-syntax-entry  ?\\  "_"   fst-mode-syntax-table)  ; don't escape quote
;    (modify-syntax-entry  ?%   "/"   fst-mode-syntax-table)  ; functions as escape char
;    fst-mode-syntax-table )
;  "Syntax table for fst-mode" )





;;;;;;   gnuplot
; To add the gnuplot mode in Emacs, add the content of /usr/share/emacs/site-lisp/dotemacs to your ~/.emacs file
;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode
  (global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------






;; emacs package manager ;;
;(when (>= emacs-major-version 24)
;  (require 'package)
;  (add-to-list
;   'package-archives
;   '("melpa" . "http://melpa.org/packages/")
;   t)
;  (package-initialize))



