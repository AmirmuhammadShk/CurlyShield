firewall-cmd --zone=<Zone NAME> --change-interface=<INTERFACE NAME>
firewall-cmd --list-all-zones
firewall-cmd --set-default-zone=<Default Zone Name>
Example:
firewall-cmd --zone=customezone --change-interface=eth0
firewall-cmd --list-all-zones
firewall-cmd --set-default-zone=domestic
References:
firewalld configuration