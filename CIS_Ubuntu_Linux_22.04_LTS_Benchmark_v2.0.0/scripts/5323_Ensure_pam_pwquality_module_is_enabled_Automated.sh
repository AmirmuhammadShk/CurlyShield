if ! grep -P -- '\bpam_pwquality\.so\b' /usr/share/pam-configs/*; then
# If not, create a new profile for pwquality
{
arr=('Name: Pwquality password strength checking' 'Default: yes'
'Priority: 1024' 'Conflicts: cracklib' 'Password-Type: Primary' 'Password:'
'requisite                       pam_pwquality.so retry=3' 'Password-Initial:'
'requisite')
printf '%s\n' "${arr[@]}" > /usr/share/pam-configs/pwquality
}
# Enable the new profile
pam-auth-update --enable pwquality
else
# If already enabled, update the existing profile
pam-auth-update --update
fi
pam-auth-update --enable pwquality