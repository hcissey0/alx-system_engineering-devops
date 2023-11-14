# This is a puppet manifest to grant ability to open as much files as possible

exec {'change-os-configuration-for-holberton-user':
  command => "echo 'holberton soft nofile 4096' >> /etc/security/limits.conf",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin']
}
