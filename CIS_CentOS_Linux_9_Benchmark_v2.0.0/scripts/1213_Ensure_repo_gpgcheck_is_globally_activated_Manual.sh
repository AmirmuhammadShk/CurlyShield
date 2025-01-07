sed -i '/^repo_gpgcheck=/c "repo_gpgcheck=1"' /etc/dnf/dnf.conf
for file in /etc/yum.repos.d/*; do
if [ -f "$file" ]; then
grep -q 'repo_gpgcheck=' "$file"
if ! grep -q '1' "$file"; then
sed -i '/^repo_gpgcheck=/c "repo_gpgcheck=1"' "$file"
fi
fi
done