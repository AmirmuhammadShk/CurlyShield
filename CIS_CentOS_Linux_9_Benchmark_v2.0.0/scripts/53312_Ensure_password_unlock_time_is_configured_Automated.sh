set_unlock_time() {
echo "unlock_time = 900" >> /etc/security/faillock.conf
}
clean_pam_files() {
for authselect_file in system-auth password-auth; do
authselect_file_path="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$authselect_file"
sed -ri 's/(^\s*auth\s+(requisite|required|sufficient)\s+pam_faillock\.so.*)(\s+unlock_time\s*=\s*\S+)(.*)/\1\4/' "$authselect_file_path"
done
}
apply_changes() {
authselect apply-changes
}
set_unlock_time
clean_pam_files
apply_changes