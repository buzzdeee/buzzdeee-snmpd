# == Class: snmpd::service
#
# private class, do not use directly
# takes care about the snmpd service
#
# === Parameters
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
class snmpd::service (
  Enum[running, stopped, 'running', 'stopped'] $service_ensure,
  Boolean $service_enable,
  Optional[String] $service_flags,
) {
  service { 'snmpd':
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }
}
