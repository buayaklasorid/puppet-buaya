class buaya::cron::buaya {

  cron { 'make-report':
   command => '$SEDOT_BASE/bin/make-report > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => 'absent',
   minute => '*/15',
 }
  cron { 'collect mirror size':
   command => '$SEDOT_BASE/bin/collect-mirror-size > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => '3',
   minute => '0',
 }
  cron { 'collect disk usage':
   command => '$SEDOT_BASE/bin/collect-du > /dev/null 2>&1',
   hour => 'absent',
   minute => '*/15',
 }
  cron { 'plot mirror size':
   command => '$SEDOT_BASE/bin/plot-mirror-size > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => '5',
   minute => '0',
 }
  cron { 'update ls-lRh':
   command => '$SEDOT_BASE/bin/update-ls-lRh > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => 'absent',
   minute => '*/15',
   ensure => absent,
 }
  cron { 'make json':
   command => '$SEDOT_BASE/bin/make-json > /dev/null 2>&1',
   user => 'ftpmaster',
   hour => 'absent',
   minute => '*/15',
   ensure => absent,
 }

  cron { 'make centos iso':
   command => '$SEDOT_BASE/bin/create-centos-iso.sh > /dev/null 2>&1',
   user => 'ftpmaster',
   weekday => '0',
 }
  cron { 'make fedora iso':
   command => '$SEDOT_BASE/bin/create-fedora-iso.sh > /dev/null 2>&1',
   user => 'ftpmaster',
   weekday => '0',
 }
  cron { 'make opensuse iso':
   command => '$SEDOT_BASE/bin/create-opensuse-iso.sh > /dev/null 2>&1',
   user => 'ftpmaster',
   weekday => '0',
 }
  cron { 'cleaning up lock files':
   command => '$SEDOT_BASE/bin/cleanup > /dev/null 2>&1',
   user => 'ftpmaster',
   special => 'reboot',
 }

 cron { 'pkg-debian':
  command => '$HOME/bin/sedot debian > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '0',
  hour => [1, 4, 7, 10, 13, 17, 20, 23]
 }

 cron { 'pkg-ubuntu':
  command => '$HOME/bin/sedot ubuntu > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '30',
  hour => [2, 5, 8, 11, 14, 17, 20, 23]
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

 cron { 'pkg ubuntu-releases':
  command => '$HOME/bin/sedot ubuntu-cd > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '0',
  hour => '19',
 }

 cron { 'pkg-centos':
  command => '$HOME/bin/sedot centos > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '45',
  hour => '*/6',
 }
 cron { 'pkg-epel':
  command => '$HOME/bin/sedot epel > /dev/null 2>&1',
  user => 'ftpmaster',
  minute => '5',
  hour => '*/6',
 }

} # end of cronjob

# vim:syntax=puppet:set ts=2 sw=2 et:
