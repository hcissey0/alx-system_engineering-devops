# This script is used to setup servers with puppet manifest

exec { 'update':
    provider => shell,
    command  => 'sudo apt-get -y update',
    before   => Exec['nginx'],
}

exec { 'nginx':
    provider => shell,
    command  => 'sudo apt-get install nginx -y',
    before   => Exec['header_config'],
}

exec { 'header_config':
    provider   => shell,
    enviroment => ["NAME=${hostname}"],
    command    => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/enginx\/sites-enaled\/\*;\n\tadd_header X-Served-By \"$NAME\";/" /etc/nginx/nginx.conf,
    before     => Exec['nginx_restart'],
}

exec { 'nginx_restart':
    provider => shell,
    command  => 'sudo service nginx restart',
}
