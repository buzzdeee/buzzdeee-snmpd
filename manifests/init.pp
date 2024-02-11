# == Class: snmpd
#
# Full description of class snmpd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'snmpd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class snmpd (
  String $listen_addr = $snmpd::params::listen_addr,
  String $system_contact = $snmpd::params::system_contact,
  String $system_description = $snmpd::params::system_description,
  String $system_location = $snmpd::params::system_location,
  String $seclevel = $snmpd::params::seclevel,
  String $ro_community = $snmpd::params::ro_community,
  String $rw_community = $snmpd::params::rw_community,
  Boolean $rw_disabled = $snmpd::params::rw_disabled,
  Enum[running, stopped, 'running', 'stopped'] $service_ensure = $snmpd::params::service_ensure,
  Boolean $service_enable = $snmpd::params::service_enable,
  Optional[String] $service_flags = undef,
) {

  class { 'snmpd::config':
    listen_addr        => $listen_addr,
    system_contact     => $system_contact,
    system_description => $system_description,
    system_location    => $system_location,
    seclevel           => $seclevel,
    ro_community       => $ro_community,
    rw_community       => $rw_community,
    rw_disabled        => $rw_disabled,
  }

  class { 'snmpd::service':
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    service_flags  => $service_flags,
  }

  Class['snmpd::config'] ~>
  Class['snmpd::service']

}
