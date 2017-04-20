#!/usr/bin/env bash
useradd $1 -m -s /bin/bash
echo "$2\n$2\n" | passwd $1
mysql -u root -p2471_eZq -e "CREATE USER '$1'@'localhost' IDENTIFIED BY '$3';GR$
    echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$1.conf
    echo "  ServerName codevery.com" >> /etc/apache2/sites-available/$1.conf
    echo "  ServerAlias $1.codevery.com" >> /etc/apache2/sites-available/$1.conf
    echo "  RMode config" >> /etc/apache2/sites-available/$1.conf
    echo "  RUidGid $1 $1" >> /etc/apache2/sites-available/$1.conf
    echo "  RGroups www-data" >> /etc/apache2/sites-available/$1.conf
    echo "  VirtualDocumentRoot /home/$1/public_html" >> /etc/apache2/sites-availab$
    echo "  alias /robots.txt /home/hosting_codevery/public_html/norobots.txt" >> /$
    echo "  CustomLog /home/$1/apache-access.log combined" >> /etc/apache2/sites-av$
    echo "  ErrorLog /home/$1/apache-error.log" >> /etc/apache2/sites-available/$1.$
    echo "</VirtualHost>" >> /etc/apache2/sites-available/$1.conf
    chmod 750 /home/$1
#curl -H 'PddToken: C6OJJ6M4W525YB6BUI6AUFZHSZ4D2XT35525Z5NEQUG665O2HCHQ' -d "d$
#curl -H 'PddToken: C6OJJ6M4W525YB6BUI6AUFZHSZ4D2XT35525Z5NEQUG665O2HCHQ' -d "d$
#curl -X POST 'https://codevery.slack.com/api/users.admin.invite' --data "email$
a2ensite $1
service apache2 reload
