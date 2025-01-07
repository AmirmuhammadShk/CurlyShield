for port in {1..65535}; do
# Check if firewall rule exists
if ! ip6tables -n --list-rule | grep -q ":$port"; then
# Create a new rule with default policy and accept incoming traffic from all sources
ip6tables -A INPUT -p * --dport $port -m state --state NEW -j ACCEPT
# Set the default policy to ACCEPT on boot
echo "Setting default policy to ACCEPT for port $port"
fi
done
if [ "${BASH_VERSION}" == "" ]; then
# Convert bash script to a standard one-liner
printf "%s\n" "$(printf "%s\n" "$@" | sed 's/[^ ]* //g')"
else
# Run the command in Bash 4.0+ shell, for compatibility with older systems.
/bin/bash -c "${BASH_SOURCE[0]}" "$@"
fi