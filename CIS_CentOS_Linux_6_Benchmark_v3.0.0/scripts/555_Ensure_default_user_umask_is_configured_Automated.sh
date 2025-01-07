review_umask() {
local files_to_review=(/etc/bashrc /etc/profile /etc/profile.d/*.sh)
for file in "${files_to_review[@]}"; do
while IFS= read -r line; do
if [[ $line =~ ^umask ]]; then
echo "Removing umask entry: ${line#*=}"
line=${line#*=}
line="umask u=rwx,g=rx,o="
fi
echo "$line"
done < "$file" > "${file}.tmp"
done
mv /etc/bashrc{,.tmp} /etc/profile{,.tmp} /etc/profile.d/*.sh{,.tmp}
}
configure_umask() {
local files_to_edit=(/etc/profile.d/*.sh /etc/profile /etc/bashrc)
for file in "${files_to_edit[@]}"; do
if [[ ! ${file}.umask ]]; then
echo "Creating new umask entry: umask u=rwx,g=rx,o="
touch "$file".umask
fi
done
}
review_umask
configure_umask