#!/bin/bash
for port in {1..65535}; do
if ! iptables -n | grep -q ":${port}"; then
iptables -A INPUT -p tcp --dport ${port} -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp --dport ${port} -m state --state NEW -j ACCEPT
fi
done
iptables -P INPUT DROP
iptables -P OUTPUT DROP