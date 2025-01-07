if [ "$(uname -s)" == "Linux" ]; then
case $(lsb_release -cs) in
"rhel|centos|fedora")
yum remove openldap-clients
;;
"debian|ubuntu")
apt-get remove openldap-clients
;;
"suse")
zypper remove openldap-clients
;;
esac
fi