for file in /etc/bashrc /etc/profile /etc/profile.d/*.sh; do
if [ -f "$file" ]; then
echo "Editing $file..."
# Remove existing TMOUT entries and configure new one
sed -i '/TMOUT/d' "$file"
sed -i "/^#.*$/d" "$file" || true  # remove commented lines
sed -i 's/^TMOUT=/TMOUT=900/' "$file"
sed -i 's/; export TMOUT//g' "$file"
echo "Updated $file with new TMOUT configuration."
fi
done
echo "All necessary files have been reviewed and edited."