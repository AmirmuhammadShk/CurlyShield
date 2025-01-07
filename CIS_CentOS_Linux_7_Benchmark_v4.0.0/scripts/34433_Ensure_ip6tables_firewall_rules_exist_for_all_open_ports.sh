for port in $(ip6tables -n -L | grep -oE '[0-9]+'); do
if ! ip6tables -n -L | grep -q -F "<protocol> $port"; then
ip6tables -A INPUT -p tcp --dport $port -m state --state NEW -j ACCEPT
ip6tables -A OUTPUT -p udp --dport $port -m state --state NEW -j ACCEPT
fi
done