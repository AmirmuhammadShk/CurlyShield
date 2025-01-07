if ! ip6tables -L -n INPUT | grep -q '^INPUT.*-p \tcp --dport 22$'; then
# Create new rule to accept inbound SSH connections on port 22
ip6tables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
fi
if ! ip6tables -L -n INPUT | grep -q '^INPUT.*-p \tcp --dport 80$'; then
# Create new rule to accept inbound HTTP connections on port 80
ip6tables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
fi
if ! ip6tables -L -n INPUT | grep -q '^INPUT.*-p \tcp --dport 443$'; then
# Create new rule to accept inbound HTTPS connections on port 443
ip6tables -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT
fi