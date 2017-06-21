#Configure spamassassin
class spamassassin::files (

  $sa_path          = $::spamassassin::sa_path,

  ){

  file { "${sa_path}/init.pre":
    ensure => file,
    source  => 'puppet:///modules/spamassassin/init.pre',
    notify  => Service[ $sa_service ],
  }

  file { "${sa_path}/local.cf":
    ensure => file,
    content => template('spamassassin/local.cf.erb'),
    notify  => Service[ $sa_service ],
  }

  file { "${sa_path}/v310.pre":
    ensure => file,
    source  => 'puppet:///modules/spamassassin/v310.pre',
    notify  => Service[ $sa_service ],
  }

  file { "${sa_path}/v312.pre":
    ensure => file,
    source  => 'puppet:///modules/spamassassin/v312.pre',
    notify  => Service[ $sa_service ],
  }

  file { "${sa_path}/v320.pre":
    ensure => file,
    source  => 'puppet:///modules/spamassassin/v320.pre',
    notify  => Service[ $sa_service ],
  }

  file { "${sa_path}/v330.pre":
    ensure => file,
    source  => 'puppet:///modules/spamassassin/v330.pre',
    notify  => Service[ $sa_service ],
  }

  file { "${sa_path}/local.cf":
    ensure => file,
    source  => epp('spamassassin/local.cf.epp'),
    notify  => Service[ $sa_service ],
  }

}
