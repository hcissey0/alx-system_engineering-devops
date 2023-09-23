# This is a puppet manifest to configure ssh

file_line { 'Delare Identity File':
  path  => '/etc/ssh/ssh_config',
  line  => '  IdentityFile ~/.ssh/school',
  match => '^#?\\s*IdentityFile',
}

file_line { 'Turn off password authentication':
  path  => '/etc/ssh/ssh_config',
  line  => '  PasswordAuthentication no',
  match => '^#?\\s*PasswordAuthentication',
}
