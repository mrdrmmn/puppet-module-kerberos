class kerberos::config::default {
  $server_nodes  = [ $fqdn ]
  $default_realm = 'EXAMPLE.COM'
  $port          = '88'
  $admin_user    = 'admin'
}
