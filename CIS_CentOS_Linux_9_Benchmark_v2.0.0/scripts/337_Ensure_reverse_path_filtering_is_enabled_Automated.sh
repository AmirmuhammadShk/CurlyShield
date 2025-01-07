{
sysctl -w net.ipv4.conf.all.rp_filter=1
sysctl -w net.ipv4.conf.default.rp_filter=1
sysctl -w net.ipv4.route.flush=1
}
Note: If these settings appear in a canonically later file, or later in the same file, these
settings will be overwritten