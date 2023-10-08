# this manifest install and configures a new server

exec { 'nginx-update':
  command => 'apt-get update -y',
  path    => '/usr/bin',
}

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/var/www/html/custom_404.html':
  content => 'Ceci n\'est pas une page',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  content => "server {
    listen 80;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html index.htm;
    add_header X-Served-By ${::hostname};
    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
    error_page 404 /custom_404.html;
    location /404 {
        root /var/www/html;
        internal;
    }
  }",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx-restart':
  ensure    => running,
  restart   => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}
