echo "Setting default password inactivity period to 30 days"
useradd -D -f 30
for user in $(getent pass | cut -d: -f1); do
echo "$user"
chage --inactive 30 "$user"
done