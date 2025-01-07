for l_file in /etc/motd{,.d/*}; do
if grep -Psqi -- "(\\\v|\\\r|\\\m|\\\s|\b$(grep ^ID= /etc/os-release | cut -d= -f2 | sed -e 's/"//g')\b)" "$l_file"; then
echo -e "\n - File: \"$l_file\" includes system information. Edit this file to remove these entries"
else
a_files+=("$l_file")
fi
done
if [ "${#a_files[@]}" -gt 0 ]; then
echo -e "\n-  ** Please review the following files and verify their contents follow local site policy **\n"
printf '%s\n' "${a_files[@]}"
fi