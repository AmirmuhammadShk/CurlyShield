for file in /etc/bashrc /etc/profile /etc/profile.d/*.sh; do
if grep -q "TMOUT=" "$file"; then
sed -i "s/TMOUT=.*$/TMOUT=900; readonly TMOUT; export TMOUT/" "$file"
fi
done
touch /etc/profile.d/tmout.sh
echo "readonly TMOUT=900 ; export TMOUT" > /etc/profile.d/tmout.sh
if grep -q "TMOUT=" /etc/bashrc || grep -q "TMOUT=" /etc/profile; then
echo "Error: Invalid TMOUT configuration"
exit 1
fi