# My puppet manifest to fix apache

exec { 'fix_apache':
  command => '/etc/init.d/apache2 restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin']
}
