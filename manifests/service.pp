# private class, do not use directly
# takes care about the snmpd service
class snmpd::service (
  $service_ensure,
  $service_enable,
  $service_flags,
) {
  service { 'snmpd':
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }
}
