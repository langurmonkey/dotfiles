# About Me
set realname            = "Toni Sagrista Selles"
set from                = "me@tonisagrista.com"
set use_from            = yes
set editor              = nvim


set ssl_force_tls       = yes

set my_user          = "me@tonisagrista.com"

set smtp_url            = smtps://$my_user@smtp.mailbox.org:465
set smtp_pass           = $my_pass

set imap_user           = $my_user
set imap_pass           = $my_pass

# Folders
set folder              = "imaps://imap.mailbox.org:993"
set spoolfile           = +INBOX
set record              = "+Sent"
mailboxes               = +INBOX


# Where to put the stuff
set header_cache = "~/.mutt/tonisagrista.com/cache/headers"
set message_cachedir = "~/.mutt/tonisagrista.com/cache/bodies"
set certificate_file = "~/.mutt/tonisagrista.com/certificates"
