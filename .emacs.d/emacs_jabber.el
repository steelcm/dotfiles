;; force gpg password prompts to be in the term
(setenv "GPG_AGENT_INFO" nil)
;; load passwords
(load-file "~/.accounts/talk.google.com.gpg")
;; set-up gtalk
(setq jabber-account-list
    `(("csteel@gmail.com"
	(:network-server . "talk.google.com")
	(:connection-type . ssl)
	(:password . ,gmail-jabber-password))))
;; jabber settings
(custom-set-variables
    `(jabber-auto-reconnect t)
    `(jabber-avatar-verbose nil)
    `(jabber-vcard-avatars-retrieve nil)
    `(jabber-chat-buffer-format "*-jabber-%n-*")
    `(jabber-history-enabled t)
    `(jabber-mode-line-mode t)
    `(jabber-show-offline-contacts nil)
)
