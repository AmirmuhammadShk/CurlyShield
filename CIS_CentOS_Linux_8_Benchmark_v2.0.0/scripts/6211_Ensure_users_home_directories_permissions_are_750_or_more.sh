for dir in /home; do
stat -L -c "%A" "$dir"
if [ "$(echo "$?" | cut -c6)" != "-" ] || [ "$(echo "$?" | cut -c8)" != "-" ]
|| [ "$(echo "$?" | cut -c9)" != "-" ] || [ "$(echo "$?" | cut -c10)" != "-" ]; then
chmod g-w,o-rwx "$dir"
fi
done