# private class, do not use directly
# takes care about the default values of
# the modules parameters
class snmpd::params {
  case $facts['os']['name'] {
    'OpenBSD': {
                $listen_addr = '127.0.0.1'
                $system_contact = "Charly Root (root@${facts['networking']['domain']})"
                $system_description = 'Powered by OpenBSD'
                $system_location = 'In the datacenter'
                $seclevel = 'none'
                $ro_community = 'public'
                $rw_community = 'private'
                $rw_disabled = true
                $service_ensure = 'running'
                $service_enable = true
    }
    default: {
        fail("Your Operatingsystem ${facts['os']['name']} is not supported")
    }
  }
}
