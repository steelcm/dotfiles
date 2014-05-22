(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;; install packages if not already done so
(defvar my-packages '(
		      evil
		      ) "A list of packages to be installed on emacs launch.")

(unless package-archive-contents
  (package-refresh-contents))
(dolist (package my-packages)
  (unless (package-installed-p package)
    (ignore-errors
      (package-install package))))

;; initialize evil
(require 'evil)
(evil-mode t)
