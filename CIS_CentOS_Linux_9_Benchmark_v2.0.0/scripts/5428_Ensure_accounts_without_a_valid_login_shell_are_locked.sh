valid_shells=$(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|')
while IFS= read -r user; do
if [ "$user" != "root" ] && [[ $user =~ $valid_shells ]]; then
system("usermod -L $user")
fi
done < /etc/passwd