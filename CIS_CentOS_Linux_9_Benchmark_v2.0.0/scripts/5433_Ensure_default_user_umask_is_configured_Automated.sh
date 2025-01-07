if grep -Psiq -- '^\h*umask\h+(0?[0-7][2-7]7|u(=[rwx]{0,3}),g=([rx]{0,2}),o=)(\h*#.*)?$' /etc/profile; then
echo " - umask is set correctly in /etc/profile"
elif grep -Psiq -- '^\h*umask\h+(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b|[0-7][0-7][0-6]\b)|(u=[rwx]{1,3},)?(((g=[rx]?[rx]?w[rx]?[rx]?\b)(,o=[rwx]{1,3})?)|((g=[wrx]{1,3},)?o=[wrx]{1,3}\b)))' /etc/profile; then
echo " - /etc/profile"
fi
if grep -Psiq -- '^\h*session\h+[^#\n\r]+\h+pam_umask\.so\h+([^#\n\r]+\h+)?umask=(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b))' /etc/login.defs; then
echo " - /etc/login.defs"
fi
if grep -Psiq -- '^\h*session\h+[^#\n\r]+\h+pam_umask\.so\h+([^#\n\r]+\h+)?umask=(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b))' /etc/default/login; then
echo " - /etc/default/login"
fi
if [ -z "$output" ]; then
echo -e " - No files contain a UMASK that is not restrictive enough\n   \
No UMASK updates required to existing files"
else
echo -e "\n - UMASK is not restrictive enough in the following file(s):$output\n\
\
- Remediation Procedure:\n   - Update these files and comment out the UMASK line\
or update umask to be \"0027\" or more restrictive"
fi
if [ -n "$output" ]; then
echo -e "$output"
else
echo -e " - Configure UMASK in a file in the \"/etc/profile.d/\" directory ending in \".sh\"\n\
Example Command (Hash to represent being run at a root prompt):\n\
\n# printf '%s\\n' \"umask 027\" > /etc/profile.d/50-systemwide_umask.sh"
fi