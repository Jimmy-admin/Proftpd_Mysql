#Création du groupe et de l'utilisateur unix ftpuser sur lequel seront basé tout les utilisateurs ftp
groupadd -g 2001 ftpgroup
useradd -u 2001 -s /bin/false -d /bin/null -c "proftpd user" -g ftpgroup ftpuser
