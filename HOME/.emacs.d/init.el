(package-initialize)

;; Maximum colors
(setq font-lock-maximum-decoration t)

(setq frame-backgroundmode 'dark)


(setq-default indent-tabs-mode nil)  ;; tabs disabled 
(add-to-list 'load-path "~/.emacs.d/elisp_scripts/")
(dolist (unkey '("\C-z"
                 "\C-h"  "\C-H"
                 "\C-f"
                 "\M-c"
                 "\C-j" "\C-\M-j"
                 "\C-t" "\C-\M-T"))
  (global-unset-key unkey))

;;(global-set-key (kbd "C-h") 'delete-backward-char)
(require 'redo+)
(global-set-key "\C-z" 'undo)
(global-set-key "\C-\M-z" 'redo)
(global-set-key (kbd "C-S-F") 'redo) ; ctrl+shift+f (putty fail) ;;https://www.emacswiki.org/emacs/redo+.el

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

;NOT_ROOT_;(load-file (get-config-path "mode-customizations.el"))






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
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "royalblue")))))









;;off;;(custom-set-faces
;;off;;
;;off;; '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
;;off;; '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
;;off;; '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
;;off;; '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
;;off;; '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
;;off;; '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
;;off;; '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
;;off;; '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))
;;off;;
;;off;; '(term-default-fg-color ((t (:inherit term-color-white))))
;;off;; '(term-default-bg-color ((t (:inherit term-color-black))))
;;off;;
;;off;; '(font-lock-function-name-face ((t (:foreground "royalblue"))))
;;off;;  )
;;off;;


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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(##)))



(setq auto-mode-alist '(("\\.ad[bs]\\'"   . ada-mode)
                        ("\\.awk\\'"      . awk-mode)
                        ("\\.lex\\'"      . c-mode)
                        ("\\.[cy]\\'"     . c++-mode)
                        ("\\.h\\'"        . c++-mode)
                        ("\\.hxx\\'"      . c++-mode)
                        ("\\.[CH]\\'"     . c++-mode)
                        ("\\.java\\'"     . java-mode)
                        ("\\.cc\\'"       . c++-mode)
                        ("\\.hh\\'"       . c++-mode)
                        ("\\.cxx\\'"      . c++-mode)
                        ("\\.cpp\\'"      . c++-mode)
                        ;("\\.rc\\'"       . c++-mode) ;; resource files
                        ("\\.rcv\\'"      . c++-mode)
                        ("\\.m\\'"        . matlab-mode)
                        ("\\.p[lm]\\'"    . perl-mode)
                        ("\\.cgi\\'"      . perl-mode)
                        ("\\.f\\'"      . fortran-mode)
                        ("\\.F\\'"      . fortran-mode)
                        ("\\.f90\\'"      . f90-mode)
                        ("\\.F90\\'"      . f90-mode)
                        ("\\.el\\'"       . emacs-lisp-mode)
                        ("\\.emacs\\'"    . emacs-lisp-mode)
                        ("\\.tex\\'"      . LaTeX-mode)
                        ("\\.bib\\'"      . bibtex-mode)
                        ("[Mm]akefile\\'" . makefile-mode)
                        ("\\.mak\\'"      . makefile-mode)
                        ("\\[Mm]akefile.\\'" . makefile-mode)
                        ("\\.bat\\'"      . shell-script-mode)
                        ("\\.tar\\'"      . tar-mode)
                        ("\\.php\\'"     . php-mode)
                        ("\\.html\\'"     . html-mode)
                        ("\\.jnlp\\'"     . html-mode)
                        ("\\.xml\\'"     . html-mode)
                        ("\\.pddl\\'"     . lisp-mode)
                        ("\\.css\\'"      . css-mode)
                        ("\\.py\\'"       . python-mode)
                        ("\\.yml\\'"      . yaml-mode)
                        ("\\.lisp\\'"     . lisp-mode)
                        ("\\.rc\\'"       . conf-unix-mode)
                        ))
