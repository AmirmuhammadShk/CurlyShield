for user in $(getent passwd | cut -d: -f1); do
if [ ! -r "$HOME/.netrc" ]; then
echo "User $user has read permission on their .netrc file"
fi
if [ ! -w "$HOME/.netrc" ]; then
echo "User $user has write permission on their .netrc file"
fi
if [ ! -x "$HOME/.netrc" ]; then
echo "User $user does not have execute permission on their .netrc file"
fi
chown "$user:$user" "$HOME/.netrc"
chmod 600 "$HOME/.netrc"
done