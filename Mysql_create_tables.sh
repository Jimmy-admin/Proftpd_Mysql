#!/bin/bash
echo "mysql password"
read passwords
echo "users mysql"
read users
echo "database name"
read database
echo "**Mysql connexion**"

sudo mysql -u  $users -p$passwords  -e "
CREATE DATABASE $database;
show databases;
USE $database;

#Créez la table pour la liste des groupes d’utilisateurs

CREATE TABLE ftpgroup (

groupname varchar(16) NOT NULL default '',

gid smallint(6) NOT NULL default '2001',

members varchar(16) NOT NULL default '',

KEY groupname (groupname)

) ENGINE=MyISAM COMMENT='ProFTP group table'; 

#Créez la table pour la liste des utilisateurs

CREATE TABLE ftpuser (

id int(10) unsigned NOT NULL auto_increment,

userid varchar(32) NOT NULL default '',

passwd varchar(32) NOT NULL default '',

uid smallint(6) NOT NULL default '2001',

gid smallint(6) NOT NULL default '2001',

homedir varchar(255) NOT NULL default '',

shell varchar(16) NOT NULL default '/sbin/nologin',

count int(11) NOT NULL default '0',

accessed datetime NOT NULL default '0000-00-00 00:00:00',

modified datetime NOT NULL default '0000-00-00 00:00:00',

PRIMARY KEY (id),

UNIQUE KEY userid (userid)

) ENGINE=MyISAM COMMENT='ProFTP user table';

"

