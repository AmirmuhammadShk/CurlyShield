yum remove cups
Please note that removing a package from YUM can potentially cause other packages to become outdated or broken, so it's recommended to be cautious when doing this. It would be better to check the package dependencies and remove them as well if necessary.
If you want to remove the entire CUPS package with all its dependencies, you can use the following command:
yum distro-sync
yum clean all
yum groupremove --all-enabled cups