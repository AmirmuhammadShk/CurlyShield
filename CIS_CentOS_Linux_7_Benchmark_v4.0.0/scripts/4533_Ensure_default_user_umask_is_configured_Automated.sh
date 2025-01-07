while IFS= read -r l_file; do
if grep -q -- '^\h*umask\h+(0?[0-7][2-9])' "$l_file"; then
echo " - umask is set correctly in \"$l_file\""
elif grep -q -- '^\h*umask\h+([02-27][0-7]|u([rwx]{0,3}),g=([rx]{0,2}),o=)' "$l_file"; then
echo "   - \"$l_file\""
fi
done < <(find /etc/profile.d/ -type f -name '*.sh' -print0)
if grep -q -- '^\h*session\h+[^#\n\r]+\h+pam_umask\.so\h+umask=([02-27][0-7]\b)' "/etc/login.defs"; then
echo "   - /etc/login.defs"
fi
if [ -z "$output" ]; then
echo " - No files contain a UMASK that is not restrictive enough\nNo UMASK updates required to existing files"
else
output=" - UMASK is not restrictive enough in the following file(s):\n$output\n\n- Remediation Procedure:\n- Update these files and comment out the UMASK line or update umask to be \"0027\" or more restrictive"
fi
if [ -n "$output" ]; then
echo "$output"
else
echo " - Configure UMASK in a file in the \"/etc/profile.d/\" directory ending in \".sh\"\n   Example Command (Hash to represent being run at a root prompt):\n   # printf '%s\\\n' \"umask 027\" > /etc/profile.d/50-systemwide_umask.sh"
fi