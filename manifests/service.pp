class snmpd::service (
  $service_ensure,
  $service_enable,
) {
  service { 'snmpd':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
