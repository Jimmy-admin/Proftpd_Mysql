date=$(date +%F_%H:%M:%S)
echo "nom de l'utilisateurs"
read users
echo "mots de passe de l'utilisateurs"
read motdepasse
mkdir /var/www/$users
chown ftpuser:www-data /var/www/$users
echo "ajout de l'utilisateurs a la BDD"
echo "mots de passe BDD"
read bdd_password
echo "utilisateur de la BDD"
read bdd_users

mysql -u $bdd_users -p$bdd_password Ftp -e " 
INSERT INTO ftpuser (id, userid, passwd, uid, gid, homedir, shell, count, accessed, modified) VALUES('0', '$users', ENCRYPT('$motdepasse'), 2001, 2001, '/var/www/$users/', '/sbin/nologin', 0, '$date', '$date');"
