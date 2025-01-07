set_pass_min_days() {
if [ -f /etc/login.defs ]; then
echo "PASS_MIN_DAYS 7" >> /etc/login.defs
fi
for user in $(getent passwd | cut -d: -f1); do
chage --mindays 7 "$user"
done
}
set_pass_min_days