class kerberos::server::config::os inherits kerberos::server::config::default {
  case $operatingsystem {
    'ubuntu','debian': {
      $packages     = [
        'krb5-admin-server',
      ]
      $services     = [
        'krb5-kdc'
      ]
      $conf_files   = [
        'present:absent:root:root:0644:server/krb5.conf:/etc/krb5.conf',
      ]
    }
    #'linux','centos','fedora': {
    #}
    default: {
      fail( "$operatingsystem is not currently supported" )
    }
  }

}
