class snmpd::params {
  case $::operatingsystem {
    'OpenBSD': {
                 $listen_addr = '127.0.0.1'
                 $system_contact = "Charly Root (root@${domain})"
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
               fail("Your Operatingsystem $::operatingsystem is not supported")
             }
  }
}
