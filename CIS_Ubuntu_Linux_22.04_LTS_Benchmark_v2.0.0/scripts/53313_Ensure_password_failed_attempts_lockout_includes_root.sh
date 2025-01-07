edit /etc/security/faillock.conf \
-OR- \
set root_unlock_time to 60 or more
update /usr/share/pam-configs/* \
| grep '\bpam_faillock\.so\h+([^#\n\r]+\h+)?(even_deny_root|root_unlock_time)' \
-P \
| sed 's/even_deny_root//; s/root_unlock_time=//'
update /etc/security/faillock.conf