# This puppet manifest is used to create a file in /tmp

file { '/tmp/school' :
  path    => '/tmp/school',
  mode    => '0774',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
  }
