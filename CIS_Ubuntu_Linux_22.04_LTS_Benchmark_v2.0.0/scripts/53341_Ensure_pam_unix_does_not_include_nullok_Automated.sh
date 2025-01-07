grep -PH -- '^\h*([^#\n\r]+\h+)?pam_unix\.so\h+([^#\n\r]+\h+)?nullok\b' /usr/share/pam-configs/* |
while IFS= read -r line; do
echo "${line//nullok/}" > temp.txt
done > edited_files.txt
pam-auth-update --enable <EDITED_PROFILE_NAME>
Note: Replace `<EDITED_PROFILE_NAME>` with the actual name of the profile being edited.
This script uses `grep` to search for lines containing "nullok" and redirects the output to a temporary file, replacing "nullok" with an empty string. It then pipes this output to a `while` loop that writes each line to a new file, effectively removing "nullok" from all matching lines. The edited files are then written to "edited_files.txt". Finally, it runs `pam-auth-update --enable <EDITED_PROFILE_NAME>` to update the pam configuration files.