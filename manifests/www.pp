class buaya::www {

 class { 'apache':
  service_enable => false,
  package_ensure => absent,

 }

 class { 'nginx':
  confd_purge => true,
  vhost_purge => true,
  server_tokens => 'Off',
 }

 nginx::resource::vhost { 'debian-fake':
  server_name => [ 'ftp.us.debian.org',
  		'ftp.sg.debian.org', 'ftp.id.debian.org',
  		'debian.klas.or.id', 'ftp.debian.org',
  		],
  ensure => 'present',
  www_root => '/srv/ftp.debian.org',
  autoindex => 'on',
  location_deny => [ '207.241.224.0/20' ],
 }

 nginx::resource::vhost { 'debian-security':
  server_name => [ 'debian-security.klas.or.id', 'security.debian.org' ],
  autoindex => 'on',
  location_deny => [ '207.241.224.0/20' ],
  www_root => '/srv/ftp.debian.org/debian-security',
 }

 nginx::resource::vhost { 'fake-ubuntu':
  ensure => 'present',
  server_name => [
   'us.archive.ubuntu.com',
   'uk.archive.ubuntu.com',
   'sg.archive.ubuntu.com',
   'archive.ubuntu.com',
   'ubuntu.klas.or.id',
   ],
  www_root => '/srv/archive.ubuntu.com',
  autoindex => 'on',
 }

 nginx::resource::vhost { 'apt.puppetlabs.klas.or.id':
  www_root => '/srv/ftp/.dm03/apt.puppetlabs.com',
  autoindex => 'on',
 }

 nginx::resource::vhost { 'yum.puppetlabs.klas.or.id':
  www_root => '/srv/ftp/.dm03/yum.puppetlabs.com',
  autoindex => 'on',
 }

 nginx::resource::vhost { 'vagrant.klas.or.id':
  www_root => '/srv/ftp/.dm03/vagrant.klas.or.id',
  autoindex => 'on',
 }


 nginx::resource::vhost { 'buaya.klas.or.id':
  server_name => [ 'buaya.klas.or.id', 'crocodile.klas.or.id', 'buaya.sby.rad.net.id' ],
  ensure => present,
  www_root => '/ftp/',
  autoindex => 'on',
  location_deny => [ '207.241.224.0/20' ],
 }

 nginx::resource::location { 'sedot-status':
  ensure => 'present',
  location => '/status',
  vhost => 'buaya.klas.or.id',
  location_alias => '/home/ftpmaster/status/data/report',
 }

 nginx::resource::location { 'sedot-status-log':
  ensure => 'present',
  location => '~ ^/status/log(/.*)$ $1 break',
  www_root => '/home/ftpmaster/log/sync/',
  raw_append => 'types { text/plain gz; }',
  vhost => 'buaya.klas.or.id',
  location_cfg_append => {
   add_header => 'Content-Encoding gzip',
  },
 }
} # end of buaya::apache::base
# vim:syntax=puppet:set ts=2 sw=2 et:
