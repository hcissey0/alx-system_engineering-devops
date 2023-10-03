# Configure a custom 404 page
class custom_404 {

  exec { 'update':
    command => 'sudo apt-get update -y',
    before  => Package['nginx'],
  }

  # Install the Nginx web server
  package { 'nginx':
    ensure => present,
  }

  # Create the custom 404 page
  file { '/var/www/html/custom_404.html':
    ensure => present,
    content => 'Ceci n\'est pas une page',
  }

  # Update the Nginx configuration
  file { '/etc/nginx/sites-available/default':
    ensure => present,
    content => "
server {
  listen 80;
  listen [::]:80 default_server;
  root /var/www/html;
  index index.html index.htm;
  add_header X-Served-By $(hostname);

  location /redirect_me {
    return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
  }

  error_page 404 /custom_404.html;

  location /404 {
    root /var/www/html;
    internal;
  }
}
"
  }

  # Restart the Nginx web server
  service { 'nginx':
    ensure => running,
    enabled => true,
  }

}

