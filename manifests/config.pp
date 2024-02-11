# == Class snmpd::config
#
# private class, do not use directly
# takes care about snmpd.conf file
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
class snmpd::config (
  String $listen_addr,
  String $system_contact,
  String $system_description,
  String $system_location,
  String $seclevel,
  String $ro_community,
  String $rw_community,
  Boolean $rw_disabled,
) {
  file { '/etc/snmpd.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0600',
    content => template('snmpd/snmpd.conf.erb'),
  }
}
