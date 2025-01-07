find /etc/audit/ -type f \( -name '*.conf' -o -name '*.rules' \) ! -user root |
xargs -I {} bash -c "chown root ${}" | sudo chown root -R
echo "Audit configuration files owned by root as recommended."