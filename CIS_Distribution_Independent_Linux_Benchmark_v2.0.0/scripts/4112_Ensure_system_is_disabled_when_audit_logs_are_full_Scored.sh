#!/bin/bash
sed -i '/^space_left_action=/c space_left_action = email' /etc/audit/auditd.conf
sed -i '/^action_mail_acct=/c action_mail_acct = root' /etc/audit/auditd.conf
sed -i '/^admin_space_left_action=/c admin_space_left_action = halt' /etc/audit/auditd.conf
systemctl reload auditd