#!/bin/sh

### Some /etc/rc.conf configuration
### Disabling sendmail and enabling time 

cat <<EOT >> /etc/rc.conf

# Disabling sendmail
sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"

# Enabling time sync
ntpd_enable="YES"
ntpd_sync_on_start="YES"
EOT

