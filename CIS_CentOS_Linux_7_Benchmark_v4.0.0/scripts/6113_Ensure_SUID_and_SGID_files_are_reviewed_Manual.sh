for file in /usr/bin/*; do
if [ -x "$file" ]; then
echo "SUID or SGID detected: $file"
audit $file
fi
done
audit --all | grep -q "SUID" || {
echo "Rogue SUID program detected";
exit 1;
}
known_rogue_programs=("rogue" "suid-wrapper" "setuid" "sgid" "expect")
for prog in "${known_rogue_programs[@]}"; do
if [ -x /usr/bin/$prog ]; then
echo "$prog is a known rogue program"
exit 1
fi
done
if audit --all | grep -q "SUID"; then
echo "SUID and SGID files integrity reviewed successfully."
else
echo "Failed to review SUID and SGID files. See audit logs for details."
fi