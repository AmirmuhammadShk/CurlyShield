sed -i '/^TMOUT=/d' /etc/bash.bashrc
sed -i '/^TMOUT=/d' /etc/profile
find /etc/profile.d/ -type f -name "*.sh" | while read file; do
sed -i '/^TMOUT=/d' "$file"
done
echo "readonly TMOUT=900" > /etc/bash.bashrc
echo "export TMOUT" >> /etc/bash.bashrc