edit_login_defs() {
local policy_value=$1
local user_name=$2
# Set PASS_MIN_DAYS to the specified value in /etc/login.defs
echo "PASS_MIN_DAYS $policy_value" >> /etc/login.defs
# Modify user parameters for all users with a password set to a minimum age greater than zero
awk -F: '($2~/^\$.+\$/) {if($4 < 1)system ("chage --mindays $policy_value " $user_name)}' /etc/shadow
}
edit_login_defs 1 "$USER"
edit_login_defs 0