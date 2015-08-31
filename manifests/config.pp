# private class, do not use directly
# takes care about snmpd.conf file
class snmpd::config (
  $listen_addr,
  $system_contact,
  $system_description,
  $system_location,
  $seclevel,
  $ro_community,
  $rw_community,
  $rw_disabled,
) {
  file { '/etc/snmpd.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0600',
    content => template('snmpd/snmpd.conf.erb')
  }
}
