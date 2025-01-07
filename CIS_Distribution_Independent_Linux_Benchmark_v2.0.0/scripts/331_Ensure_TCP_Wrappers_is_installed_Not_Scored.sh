if [ "$(uname -s)" == "Linux" ]; then
case "$(expr substr $(uname -s) 1 5)" in
Debian*) apt-get install tcpd ;;
CentOS|RedHat) yum install -y tcp_wrappers ;;
openSUSE) zypper install tcpd ;;
esac
fi
if [ "$(uname -s)" == "Linux" ]; then
case "$(expr substr $(uname -s) 1 5)" in
Debian*) systemctl enable --now tcpd ;;
CentOS|RedHat) systemctl enable --now tcpwrappers ;;
openSUSE) systemd-tmpfiles --make-defaults ;;
esac
fi
if [ "$(uname -s)" == "Linux" ]; then
case "$(expr substr $(uname -s) 1 5)" in
Debian*) ldd /usr/sbin/tcpd | grep libwrap.so ;;
CentOS|RedHat) ldd /etc/init.d/tcpcopy | grep libwrap.so ;;
openSUSE) ldd /usr/lib/systemd/system/tcpd.service | grep libwrap.so ;;
esac
fi