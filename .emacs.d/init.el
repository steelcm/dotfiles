;; remove menu bar
(progn (menu-bar-mode 0))
;; general purpose defaults
(line-number-mode t) ;; show line numbers in the status bar
(setq linum-format "%4d \u2502 ") ;; set space and bar seperator for margin line numbers
(global-linum-mode t) ;; show line numbers

;; set-up and load packages
(load "~/.emacs.d/emacs_packagemanagement.el")
;; initialize evil
(require 'evil)
(evil-mode t)

;; set-up and load jabber
(load "~/.emacs.d/emacs_jabber.el")
