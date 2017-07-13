#Params class spamassassin
class spamassassin::params {

  $allowedips       = '127.0.0.1'
  $allowtell       = false
  $blacklist_from    = []
  $createprefs     = false
  $cron_ensure      = 'present'
  $helperhomedir    = ''
  $listenip         = '127.0.0.1'
  $local           = false
  $maxchildren     = 5
  $maxconnperchild = 200
  $maxspare        = 2
  $minchildren     = 1
  $minspare        = 2
  $nouserconfig    = false
  $package_ensure   = 'latest'
  $report_safe     = 1
  $roundrobin      = false
  $service_enable  = true
  $service_ensure   = 'running'
  $syslog           = 'mail'
  $trusted_networks = ''
  $whitelist_from    = []

  case $facts['os']['family'] {
    'redhat': {

      $package_list      = [
        'perl-Encode-Detect', 'perl-Geography-Countries',
        'perl-IP-Country', 'perl-Mail-DKIM',
        'perl-Mail-DomainKeys', 'perl-Mail-SPF',
        'perl-Mail-SPF-Query', 'perl-Net-Ident',
        'spamassassin',
      ]
      $sa_update       = '/usr/share/spamassassin/sa-update.cron 2>&1 | tee -a /var/log/sa-update.log'
      $sa_path         = '/etc/mail/spamassassin'
      $sa_service      = 'spamassassin'
    }
    default: { notice('Fail this system not supported') }
  }

   require perl

   $pkg_perl = ['Mail::SpamAssassin::Plugin::DCC','Mail::SpamAssassin::Plugin::Pyzor','Mail::SpamAssassin::Plugin::Rule2XSBody']

   perl::perl_modules { $pkg_perl:
     ensure => 'present',
     use_package => 'false',
     require => Package['perl-CPAN'],
   }

}
