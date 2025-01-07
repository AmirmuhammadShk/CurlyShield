for user in $(getent passwd | cut -d: -f1); do
chage --inactive 30 $user
done
INACTIVE=-1