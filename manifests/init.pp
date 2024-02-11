# == Class: snmpd
#
# Full description of class snmpd here.
#
# === Parameters
#
# [*listen_addr*]
#   String: The IP address to listen on, default '127.0.0.1'.
#
# [*system_contact*]
#   String: The system contact, default: "Charly Root (root@%{facts.networking.domain})"
#
# [*system_location*]
#   String: The system location, default: "data center"
#
# [*system_description*]
#   String: A description of the system, default: 'Powered by OpenBSD'
#
# [*seclevel*]
#   String: The seclevel, default: 'none'
#
# [*ro_community*]
#   String: The ro_community name, default: 'public'
#
# [*rw_community*]
#   String: The rw_community name, default: 'private'
#
# [*rw_disabled*]
#   Boolean: Defines whether rw mode is enabled or not, default: true
#
# [*service_ensure*]
#   Enum[running, stopped]: Defines if the service should be running or stopped, default: running
#
# [*service_enable*]
#   Boolean: Defines if the service should be enabled or not, default: true
#
# [*service_flags*]
#   Optional String: Defines optional service flags, default: undef
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*facts['networking']['domain']*]
#   Is used to set the default domain of the system_contact.
#
# === Examples
#
#  class { 'snmpd': }
#
# === Authors
#
# Author Name <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class snmpd (
  String $listen_addr,
  String $system_contact,
  String $system_description,
  String $system_location,
  String $seclevel,
  String $ro_community,
  String $rw_community,
  Boolean $rw_disabled,
  Enum[running, stopped, 'running', 'stopped'] $service_ensure,
  Boolean $service_enable,
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

  Class['snmpd::config']
  ~> Class['snmpd::service']
}
