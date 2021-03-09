#!/bin/bash
#Modification du fichier proftpd.conf sql.conf module.conf

proftpd="/etc/proftpd/proftpd.conf.save"
proftpdsql="/etc/proftpd/sql.conf.save"
proftpdmodule="/etc/proftpd/modules.conf.save"

sed -i -e "/UseIPv6/s/on/off/" $proftpd
sed -i "s/# DefaultRoot/DefaultRoot/" $proftpd
sed -i "s/# RequireValidShell/RequireValidShell/" $proftpd



sed -i " 26 i SQLConnectInfo Ftp@localhost jimmy Jimmy*1124!" $proftpdsql
#SQLUserInfo ftpuser userid passwd uid gid homedir shell
#SQLGroupInfo ftpgroup groupname gid members
