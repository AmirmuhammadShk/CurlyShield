echo "Updating KexAlgorithms in sshd_config..." >&2
sed -i '/^KexAlgorithms$/s/.*/KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256/d' /etc/ssh/sshd_config
service ssh restart