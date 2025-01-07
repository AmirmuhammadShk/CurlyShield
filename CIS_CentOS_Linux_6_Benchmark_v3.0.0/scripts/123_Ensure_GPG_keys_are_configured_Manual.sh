update_gpg_keys() {
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-keys <GPG_KEY_ID>
}
configure_gpg_keys() {
echo "Update your package manager GPG keys in accordance with site policy."
}
sudo apt-get update