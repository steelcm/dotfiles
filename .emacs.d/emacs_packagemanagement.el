(require 'package)
;; add melpa package source
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;; install default packages
(defvar my-packages '(
    evil
    jabber
    restclient
    json-reformat
) "A list of packages to be installed on emacs launch.")

(unless package-archive-contents (package-refresh-contents))
(dolist (package my-packages)
  (unless (package-installed-p package)
    (ignore-errors (package-install package))))
