class spamassassin::install (

	$package_list = $::spamassassin::package_list,
	$sa_service   = $::spamassassin::sa_service,
	$sa_update    = $::spamassassin::sa_update,
){

	package{ $package_list:
		ensure => present,

	}

	service { $sa_service:
	    ensure  => 'running',
	    enable  => true,
	    hasrestart => true,
	    hasstatus => true,
	    require => Package['spamassassin'],
	}

  cron { 'sa-update':
    ensure  => present,
    command => $sa_update,
    user    => 'root',
    hour    => 4,
    minute  => 10,
  }
	

}
