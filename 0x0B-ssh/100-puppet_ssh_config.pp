# This is a puppet manifest to configure ssh

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => '  PasswordAuthentication no',
  match => '^#?\\s*PasswordAuthentication',
}

file_line { 'Delare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '  IdentityFile ~/.ssh/school',
  match => '^#?\\s*IdentityFile',
}
