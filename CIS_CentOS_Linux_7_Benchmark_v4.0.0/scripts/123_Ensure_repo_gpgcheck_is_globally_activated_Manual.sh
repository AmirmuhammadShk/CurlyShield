sed -i '/^#*/d' /etc/yum.conf
sed -i 's/#repo_gpgcheck=0/repo_gpgcheck=1/g' /etc/yum.conf
for repo in /etc/yum.repos.d/*; do
if [ -f "$repo" ]; then
repo_name=$(basename "$repo")
grep -q "repo_gpgcheck" "$repo"
if [ $? -eq 0 ] && [ "${repo:0:1}" != "#" ]; then
echo "$repo" | sed -i 's/[^=]*=//g'
echo "repo_gpgcheck=1" >> "$repo"
fi
fi
done
grep -q "repo_gpgcheck=1" /etc/yum.conf