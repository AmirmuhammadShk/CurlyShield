apt purge ufw -o Distro=Debian || true
ufw disable && systemctl stop ufw.service && systemctl mask ufw.service