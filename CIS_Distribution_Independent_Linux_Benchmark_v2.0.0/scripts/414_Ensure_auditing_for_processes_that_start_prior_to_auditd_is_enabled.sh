if [ "$(uname -s)" == "Linux" ]; then
# For grub2 based systems
echo "audit=1" | sudo tee /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg || sudo update-grub
elif [ "$(expr substr $(uname -s) 1 5)" == "FreeBSD" ]; then
# For grub based systems ( FreeBSD )
echo "audit=1" | sudo editconfig -t groff -c /etc/default/grub
sudo grub-mkconfig
fi