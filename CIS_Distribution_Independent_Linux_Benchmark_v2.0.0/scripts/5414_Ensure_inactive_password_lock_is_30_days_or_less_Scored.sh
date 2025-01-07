getent passwd | cut -d: -f5 | awk '{print $0 " 30"}' > /etc/shadow
for user in $(getent passwd | cut -d: -f1); do
chage --inactive 30 "$user"
done