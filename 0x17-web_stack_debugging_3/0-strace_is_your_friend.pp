# My puppet manifest to fix apache

exec { 'fix_apache':
  command => "sed -i 's/opcache.memory_*/opcache.memory_consmption=256M/g",
  path    => ['/bin', '/usr/bin']
}
