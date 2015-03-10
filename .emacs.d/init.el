;; remove menu bar
(progn (menu-bar-mode 0))
;; general purpose defaults
(line-number-mode t) ;; show line numbers in the status bar
(load "~/.emacs.d/emacs_linum.el") ;; set's linum to not display on certain modes and *starred buffers
(setq linum-format "%4d \u2502 ") ;; set space and bar seperator for margin line numbers
(global-linum-mode t) ;; show line numbers
(setq auto-save-default nil) ;; disable auto save
(tool-bar-mode -1) ;; disable toolbar

;; set-up and load packages
(load "~/.emacs.d/emacs_packagemanagement.el")
;; initialize evil
(require 'evil)
(evil-mode t)

(require 'restclient)

;; set-up and load jabber
;;(load "~/.emacs.d/emacs_jabber.el")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
