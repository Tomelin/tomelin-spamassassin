#Params class spamassassin
class spamassassin::params {

  String $allowedips       = '127.0.0.1'
  Boolean $allowtell       = false
  Array $blacklist_from    = []
  Boolean $createprefs     = false
  String $cron_ensure      = 'present'
  String $helperhomedir    = ''
  String $listenip         = '127.0.0.1'
  Boolean $local           = false
  Integer $maxchildren     = 5
  Integer $maxconnperchild = 200
  Integer $maxspare        = 2
  Integer $minchildren     = 1
  Integer $minspare        = 2
  Boolean $nouserconfig    = false
  String $package_ensure   = 'latest'
  Integer $report_safe     = 1
  Boolean $roundrobin      = false
  Boolean $service_enable  = true
  String $service_ensure   = 'running'
  String $syslog           = 'mail'
  String $trusted_networks = ''
  Array $whitelist_from    = []

  case $facts['os']['family'] {
		'redhat': {
  
			Array $package_list      = [
        'perl-Encode-Detect', 'perl-Geography-Countries',
        'perl-IP-Country', 'perl-Mail-DKIM',
        'perl-Mail-DomainKeys', 'perl-Mail-SPF',
        'perl-Mail-SPF-Query', 'perl-Net-Ident',
        'spamassassin',
      ]
   	String $sa_update       = '/usr/share/spamassassin/sa-update.cron 2>&1 | tee -a /var/log/sa-update.log'
   	String $sa_path         = '/etc/mail/spamassassin'
   	String $sa_service      = 'spamassassin'
	}
}
