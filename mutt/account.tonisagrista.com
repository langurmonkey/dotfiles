# About Me
set realname            = "Toni Sagrista Selles"
set from                = "me@tonisagrista.com"
set use_from            = yes

set ssl_force_tls       = yes

set my_user             = "me@tonisagrista.com"

set smtp_url            = smtps://$my_user@smtp.mailbox.org:465
set smtp_pass           = $my_pass

set imap_user           = $my_user
set imap_pass           = $my_pass

# Folders
set folder              = "imaps://imap.mailbox.org:993/"
set spoolfile           = +INBOX
set record              = "+Sent"
mailboxes               = +INBOX +accounts +travel


# Where to put the stuff
set header_cache        = "~/.config/mutt/tonisagrista.com/cache/headers"
set message_cachedir    = "~/.config/mutt/tonisagrista.com/cache/bodies"
set certificate_file    = "~/.config/mutt/tonisagrista.com/certificates"

# Account hook
account-hook $folder "set imap_user=$my_user imap_pass=$my_pass"
