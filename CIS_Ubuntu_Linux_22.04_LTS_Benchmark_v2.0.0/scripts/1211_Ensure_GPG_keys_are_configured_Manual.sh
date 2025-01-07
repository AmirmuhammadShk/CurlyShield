apt-key update && apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys <KEY_ID>
sudo apt-get update && sudo apt-get install -y gpg
gpg --quiet --keyserver hkp://pool.sks-keyservers.net --recv-keys <KEY_ID>
echo "<KEY_ID>" | gpg --quick-show-expiration
apt-key update
echo "GPG keys are configured"
Note:
- Replace `<KEY_ID>` with your actual GPG key ID.
- Some commands (like `Update your package manager GPG keys`) don't have exact bash equivalents, so those parts were left as-is to provide the best possible rewrite.