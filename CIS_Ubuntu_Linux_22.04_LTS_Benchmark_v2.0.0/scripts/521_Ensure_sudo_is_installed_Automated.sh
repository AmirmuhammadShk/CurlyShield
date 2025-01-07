if [ "${BASH_VERSINFO[0]}" == "5" ]; then
# Check if LDAP functionality is required
ldap_func_required=true
case $ldap_func_required in
true)
apt install sudo-ldap
;;
false)
apt install sudo
;;
esac
fi