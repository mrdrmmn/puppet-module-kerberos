define kerberos::server (
  $server_nodes  = $kerberos::server::config::server_nodes,
  $default_realm = $kerberos::server::config::default_realm,
  $port          = $kerberos::server::config::port,
  $admin_user    = $kerberos::server::config::admin_user
) {
  $packages   = $kerberos::server::config::packages
  $services   = $kerberos::server::config::services
  $conf_files = $kerberos::server::config::conf_files

  case $ensure {
    'present': {
      package{ $packages:
        ensure => $ensure,
        #before => Ldap::Toggle[ $conf_files ],
      }

      service{ $services:
        ensure => 'running',
        enable => 'true',
        #subscribe => Ldap::Toggle[ $conf_files ],
      }
    }
    'absent','purged': {
      package{ $packages:
        ensure  => $ensure,
        require => Service[ $services ],
      }
      service{ $services:
        ensure => 'stopped',
        enable => 'false',
        #before => Ldap::Toggle[ $conf_files ],
      }
    }
    default: {
      fail( "'$ensure' is not a valid value for 'ensure'" )
    }
  }
}
