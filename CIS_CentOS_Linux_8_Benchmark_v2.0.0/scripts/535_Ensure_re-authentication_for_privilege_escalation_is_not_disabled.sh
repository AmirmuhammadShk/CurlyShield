sed -i '/^!authenticate/ d' /etc/sudoers
echo "RequireAuth YES" | visudo -f /etc/sudoers