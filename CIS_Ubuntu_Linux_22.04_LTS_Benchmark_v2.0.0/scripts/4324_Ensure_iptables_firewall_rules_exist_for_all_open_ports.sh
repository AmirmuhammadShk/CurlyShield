#!/bin/bash
for port in {1..65535}; do
protocol=$(if [[ $port =~ ^tcp ]]; then echo "tcp"; else if [[ $port =~ ^udp ]]; then echo "udp"; fi fi)
# Establish a proper rule for accepting inbound connections
iptables -A INPUT -p "$protocol" --dport "$port" -m state --state NEW -j ACCEPT
done