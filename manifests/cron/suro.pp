class buaya::cron::suro {

  cron { 'make-report':
   environment => 'SEDOT_BASE=/home/ftpmaster/status',
   command => '$SEDOT_BASE/bin/make-report > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => 'absent',
   minute => '*/15',
   ensure => absent,
 }
  cron { 'collect mirror size':
   command => '$SEDOT_BASE/bin/collect-mirror-size > /dev/null 2>&1',
   environment => 'SEDOT_BASE=/home/ftpmaster/status',
   user => 'ftpmaster',
   hour => '3',
   minute => '0',
   ensure => absent,
 }
  cron { 'collect disk usage':
   command => '$SEDOT_BASE/bin/collect-du > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => 'absent',
   minute => '*/15',
   ensure => absent,
 }
  cron { 'plot mirror size':
   command => '$SEDOT_BASE/bin/plot-mirror-size > /dev/null 2>&1',
   environment => 'SEDOT_BASE=/home/ftpmaster/status',
   user => 'ftpmaster',
   hour => '5',
   minute => '0',
   ensure => absent,
 }
  cron { 'update ls-lRh':
   command => '$SEDOT_BASE/bin/update-ls-lRh > /dev/null 2>&1',
   environment => 'SEDOT_BASE=/home/ftpmaster/status',
   user => 'ftpmaster',
   hour => 'absent',
   minute => '*/15',
   ensure => absent,
 }
  cron { 'cleaning up lock files':
   command => '$SEDOT_BASE/bin/cleanup > /dev/null 2>&1',
   environment => 'SEDOT_BASE=/home/ftpmaster/status',
   user => 'ftpmaster',
   special => 'reboot'
 }

 file { '/ftp/.dm03/yum.puppetlabs.com/':
  ensure => 'directory',
  owner => 'ftpmaster',
  group => 'ftpmaster',
  recurse => 'true',
 }

 file { '/ftp/.dm03/apt.puppetlabs.com/':
  ensure => 'directory',
  owner => 'ftpmaster',
  group => 'ftpmaster',
  recurse => 'true',
 }
  cron { 'pkg-debian':
  command => '$HOME/bin/sedot debian > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '0',
  hour => [1, 4, 7, 10, 13, 17, 20, 23]
  }

  cron { 'pkg apt-puppetlabs':
  command => '$HOME/bin/sedot apt-puppetlabs > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '0',
  hour => '21',
  }

  cron { 'pkg yum-puppetlabs':
  command => '$HOME/bin/sedot yum-puppetlabs > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '0',
  hour => '5',
  }
  cron { 'pkg ubuntu-cdimage':
  command => '$HOME/bin/sedot ubuntu-cdimage > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '0',
  hour => '1',
  }
} # end of cronjob

# vim:syntax=puppet:set ts=2 sw=2 et:
