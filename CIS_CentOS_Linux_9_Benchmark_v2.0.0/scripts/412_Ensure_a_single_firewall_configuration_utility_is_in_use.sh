l_fwd_status=$(systemctl is-enabled firewalld.service):$(systemctl is-active firewalld.service)
l_nft_status=$(systemctl is-enabled nftables.service):$(systemctl is-active nftables.service)
case $l_fwutil_status in
enabled:active:masked:inactive|enabled:active:disabled:inactive)
echo -e "\n - FirewallD utility is in use, enabled and active\n - NFTables utility is
correctly disabled or masked and inactive\n - no remediation required"
;;
masked:inactive:enabled:active|disabled:inactive:enabled:active)
echo -e "\n - NFTables utility is in use, enabled and active\n - FirewallD utility is
corrected disabled or masked and inactive\n - no remediation required"
;;
enabled:active:enabled:active)
echo -e "\n - Both FirewallD and NFTables utilities are enabled and active\n - stopping
and masking NFTables utility"
systemctl stop nftables && systemctl --now mask nftables
;;
enabled:*:enabled:*)
echo -e "\n - Both FirewallD and NFTables utilities are enabled\n - remediating"
if [ "$(awk -F: '{print $2}' <<< "$l_fwutil_status")" = "active" ] && [ "$(awk -F:
'{print $4}' <<< "$l_fwutil_status")" = "inactive" ]; then
echo " - masking NFTables utility"
systemctl stop nftables && systemctl --now mask nftables
elif [ "$(awk -F: '{print $4}' <<< "$l_fwutil_status")" = "active" ] && [ "$(awk -F:
'{print $2}' <<< "$l_fwutil_status")" = "inactive" ]; then
echo " - masking FirewallD utility"
systemctl stop firewalld && systemctl --now mask firewalld
fi
;;
*:active:*:active)
echo -e "\n - Both FirewallD and NFTables utilities are active\n - remediating"
if [ "$(awk -F: '{print $1}' <<< "$l_fwutil_status")" = "enabled" ] && [ "$(awk -F:
'{print $3}' <<< "$l_fwutil_status")" != "enabled" ]; then
echo " - stopping and masking NFTables utility"
systemctl stop nftables && systemctl --now mask nftables
elif [ "$(awk -F: '{print $3}' <<< "$l_fwutil_status")" = "enabled" ] && [ "$(awk -F:
'{print $1}' <<< "$l_fwutil_status")" != "enabled" ]; then
echo " - stopping and masking FirewallD utility"
systemctl stop firewalld && systemctl --now mask firewalld
fi
;;
:enabled:active)
echo -e "\n - NFTables utility is in use, enabled, and active\n - FirewallD package is
not installed\n - no remediation required"
;;
:)
echo -e "\n - Neither FirewallD or NFTables is installed.\n - remediating\n - installing
NFTables"
echo -e "\n - Configure only ONE firewall either NFTables OR Firewalld and follow the
according subsection to complete this remediation process"
dnf -q install nftables
;;
*:*:)
echo -e "\n - NFTables package is not installed on the system\n - remediating\n - installing NFTables"
echo -e "\n - Configure only ONE firewall either NFTables OR Firewalld and follow the
according subsection to complete this remediation process"
dnf -q install nftables
;;
*)
echo -e "\n - Unable to determine firewall state"
echo -e "\n - MANUAL REMEDIATION REQUIRED: Configure only ONE firewall either NFTables
OR Firewalld"
;;
esac
if ! rpm -q firewalld > /dev/null 2>&1; then
dnf install firewalld
fi