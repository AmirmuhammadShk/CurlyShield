create_faillock_profile() {
printf '%s\n' "Name: Enable pam_faillock to deny access" > /usr/share/pam-configs/faillock
printf '%s\n' "Default: yes" >> /usr/share/pam-configs/faillock
printf '%s\n' "Priority: 0" >> /usr/share/pam-configs/faillock
printf '%s\n' "Auth-Type: Primary" >> /usr/share/pam-configs/faillock
printf '%s\n' "Auth:" >> /usr/share/pam-configs/faillock
printf '%s\n' "        [default=die]                   pam_faillock.so authfail" >> /usr/share/pam-configs/faillock
}
create_faillock_notify_profile() {
printf '%s\n' "Name: Notify of failed login attempts and reset count upon success" > /usr/share/pam-configs/faillock_notify
printf '%s\n' "Default: yes" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "Priority: 1024" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "Auth-Type: Primary" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "Auth:" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "        requisite                       pam_faillock.so preauth" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "Account-Type: Primary" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "Account:" >> /usr/share/pam-configs/faillock_notify
printf '%s\n' "        required                        pam_faillock.so" >> /usr/share/pam-configs/faillock_notify
}
create_common_auth_file() {
# This is assumed to be already created or updated with the new profiles
}
create_common_account_file() {
# This is assumed to be already created or updated with the new profiles
}
create_profiles() {
create_faillock_profile
create_faillock_notify_profile
}
create_profiles
create_common_auth_file
create_common_account_file