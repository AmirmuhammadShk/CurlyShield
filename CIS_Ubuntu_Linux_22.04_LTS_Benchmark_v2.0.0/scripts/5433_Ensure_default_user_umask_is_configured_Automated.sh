file_umask_chk() {
local l_file="$1"
# Check if umask is set as the default user
if grep -Psiq -- '^\h*umask\h+(0?[0-7][2-7]7|u([rwx]{0,3}),g=([rx]{0,2}),o=)(\h*#.*)?$' "$l_file"; then
echo "- umask is set correctly in $l_file"
# Check if umask is set in pam configuration
elif grep -Psiq -- '^\h*session\h+[^#\n\r]+\h+pam_umask\.so\h+([^#\n\r]+\h+)?umask=(([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b)|([0-7][01][0-7]\b))' "$l_file"; then
echo "- $l_file"
fi
}
while IFS= read -r -d $'\0' l_file; do
file_umask_chk "$l_file"
done < <(find /etc/profile.d/ -type f -name '*.sh' -print0)
if [ -z "$(echo "$output")"; then
echo " - No files contain a UMASK that is not restrictive enough"
# Provide remediation instructions
echo -e "\n - Remediation Procedure:\n"
echo "   or update umask to be \"0027\" or more restrictive"
else
echo -e "\n - UMASK is not restrictive enough in the following files:$output\n\n"
fi
umask 022