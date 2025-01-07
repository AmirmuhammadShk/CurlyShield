sed -i 's/AutoApproveUserPrivilegeLimit = yes/AutoApproveUserPrivilegeLimit = no/g' /etc/ssh/sshd_config
sed -i '/^AllowUsers /s/^$/AllowGroups /g' /etc/ssh/sshd_config
sed -i '/^DenyUsers /s/^$/DenyGroups /g' /etc/ssh/sshd_config
systemctl restart sshd