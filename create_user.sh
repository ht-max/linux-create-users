#!/usr/bin/env bash
root@pony:~# cat /root/create_user.sh
useradd $1 -m -s /bin/bash
echo "$2\n$2\n" | passwd $1
mysql -u root -p2471_eZq -e "CREATE USER '$1'@'localhost' IDENTIFIED BY '$3';GRANT USAGE ON *.* TO '$1'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;GRANT ALL PRIVILEGES ON \`$1_%\`.* TO $1@localhost;"
    echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$1.conf
    echo "  ServerName codevery.com" >> /etc/apache2/sites-available/$1.conf
    echo "  ServerAlias $1.*.codevery.com" >> /etc/apache2/sites-available/$1.conf
    echo "# RDocumentChRoot /home/$1/ ." >> /etc/apache2/sites-available/$1.conf
    echo "  RMode config" >> /etc/apache2/sites-available/$1.conf
    echo "  RUidGid $1 $1" >> /etc/apache2/sites-available/$1.conf
    echo "  RGroups www-data" >> /etc/apache2/sites-available/$1.conf
    echo "# VirtualDocumentRoot /%2/public_html" >> /etc/apache2/sites-available/$1.conf
    echo "  VirtualDocumentRoot /home/$1/%2/public_html" >> /etc/apache2/sites-available/$1.conf
    echo "  alias /robots.txt /home/hosting_codevery/public_html/norobots.txt" >> /etc/apache2/sites-available/$1.conf
    echo "  CustomLog /home/$1/apache-access.log combined" >> /etc/apache2/sites-available/$1.conf
    echo "  ErrorLog /home/$1/apache-error.log" >> /etc/apache2/sites-available/$1.conf
    echo "</VirtualHost>" >> /etc/apache2/sites-available/$1.conf
chmod 750 /home/$1
#curl -H 'PddToken: C6OJJ6M4W525YB6BUI6AUFZHSZ4D2XT35525Z5NEQUG665O2HCHQ' -d "domain=codevery.com&login=$1&password=$4" 'https://pddimp.yandex.ru/api2/admin/email/add'
#curl -H 'PddToken: C6OJJ6M4W525YB6BUI6AUFZHSZ4D2XT35525Z5NEQUG665O2HCHQ' -d "domain=codevery.com&login=$1&iname=test&fname=test&enabled=yes&hintq=company&hinta=codevery&country=ua&birth_date=1990-01-01" 'https://pddimp.yandex.ru/api2/admin/email/edit'
#curl -X POST 'https://codevery.slack.com/api/users.admin.invite' --data "email=$1@codevery.com&token=xoxp-5096077375-5096226187-102571118967-9091f0e52057e91a3b52a373257b09fc&set_active=true" --compressed
a2ensite $1
service apache2 reload
