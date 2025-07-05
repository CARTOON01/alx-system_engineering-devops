# 100-puppet_ssh_config.pp

file { '/home/cartoon/.ssh':
  ensure => directory,
  owner  => 'cartoon',
  group  => 'cartoon',
  mode   => '0700',
}

file { '/home/cartoon/.ssh/config':
  ensure  => file,
  owner   => 'cartoon',
  group   => 'cartoon',
  mode    => '0600',
  content => '',
  require => File['/home/cartoon/.ssh'],
}

file_line { 'Set host':
  path  => '/home/cartoon/.ssh/config',
  line  => 'Host school-server',
  match => '^Host ',
}

file_line { 'Set user':
  path  => '/home/cartoon/.ssh/config',
  line  => '    User ubuntu',
  match => '^ *User',
}

file_line { 'Declare identity file':
  path  => '/home/cartoon/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^ *IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/cartoon/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^ *PasswordAuthentication',
}
