# Class: spamassassin
# ===========================
#
# Full description of class spamassassin here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'spamassassin':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class spamassassin (

  $allowedips       = $::spamassassin::params::allowedips,
  $allowtell        = $::spamassassin::params::allowtell,
  $blacklist_from   = $::spamassassin::params::blacklist_from,
  $createprefs      = $::spamassassin::params::createprefs,
  $cron_ensure      = $::spamassassin::params::cron_ensure,
  $helperhomedir    = $::spamassassin::params::helperhomedir,
  $listenip         = $::spamassassin::params::listenip,
  $local            = $::spamassassin::params::local,
  $maxchildren      = $::spamassassin::params::maxchildren,
  $maxconnperchild  = $::spamassassin::params::maxconnperchild,
  $maxspare         = $::spamassassin::params::maxspare,
  $minchildren      = $::spamassassin::params::minchildren,
  $minspare         = $::spamassassin::params::minspare,
  $nouserconfig     = $::spamassassin::params::nouserconfig,
  $package_ensure   = $::spamassassin::params::package_ensure,
  $report_safe      = $::spamassassin::params::report_safe,
  $roundrobin       = $::spamassassin::params::roundrobin,
  $service_enable   = $::spamassassin::params::service_enable,
  $service_ensure   = $::spamassassin::params::service_ensure,
  $syslog           = $::spamassassin::params::syslog,
  $trusted_networks = $::spamassassin::params::trusted_networks,
  $whitelist_from   = $::spamassassin::params::whitelist_from,
  $package_list     = $::spamassassin::params::package_list,
  $sa_update        = $::spamassassin::params::sa_update,
  $sa_path          = $::spamassassin::params::sa_path,
  $sa_service       = $::spamassassin::params::sa_service,


)inherits spamassassin::params {

	package { 'postfix':
		ensure => present,
		name => 'postfix',
	}

}
