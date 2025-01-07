useradd -D -f 30
for user in $(getent passwd | cut -d: -f1); do
chage --inactive 30 "$user"
done