m_name="udf"
m_type="fs"
m_path="/lib/modules/**/kernel/$m_type"
m_prefix=$(tr '-' '_' <<< "$m_name")
blacklist_file="$m_prefix.conf"
if ! grep -Pq -- "^\s*blacklist\s+\b$m_prefix\b" /etc/modprobe.d; then
echo "blacklist $m_name" >> "/etc/modprobe.d/$blacklist_file"
fi
install_file="$m_prefix.conf"
if ! grep -Pq -- "^\s*install\s+\b$m_prefix\b" /etc/modprobe.d; then
echo "install $m_name /bin/false" >> "/etc/modprobe.d/$install_file"
fi
module=$(lsmod | grep "$m_name")
if [ -n "$module" ]; then
modprobe -r "$m_name"
else
echo "Module not found."
fi