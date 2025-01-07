audit2allow --all /var/log/audit/audit.log > allow_all.txt
service_name=$(grep -oP '(?<=pid=)[0-9]+' /proc/<$(ps -eo pid=)>/status)
functionality=$(getconf FHS_PATH)
echo "module my_service 1.0;" >> service_allowlist_policy.te
echo "require { type my_service_t; type system_resource_t; class file { read write execute }; class dir { read write add_name }; class tcp_socket name_connect; }" >> service_allowlist_policy.te
checkmodule -M -, -o service_allowlist_policy.mod service_allowlist_policy.te
semodule_package -o service_allowlist_policy.pp -m service_allowlist_policy.mod
semodule -i service_allowlist_policy.pp
chcon -t se service_allowlist_policy /path/to/service_binary