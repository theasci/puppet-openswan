define openswan::connection(
  $auto              = undef,
  $authby            = undef,
  $esp               = undef,
  $ike               = undef,
  $ikev2             = undef,
  $left              = undef,
  $leftid            = undef,
  $leftsubnet        = undef,
  $leftprotoport     = undef,
  $leftnexthop       = undef,
  $pfs               = undef,
  $rekey             = undef,
  $right             = undef,
  $rightid           = undef,
  $rightprotoport    = undef,
  $rightsubnet       = undef,
  $rightsubnetwithin = undef,
  $forceencaps       = undef,
  $auth              = undef,
  $type              = undef,
  $opts              = undef,
  $encrypted_psk     = undef,
  $encryption_key    = undef,
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/ipsec.d/connections/${name}.conf":
    ensure  => file,
    content => template('openswan/connection.conf.erb'),
    notify  => Class['openswan::service'],
  }

  if $leftid and $rightid and $encryption_key and $encrypted_psk {
    openswan::shared_secret { $name:
      hosts => "$leftid $rightid",
      psk   => decrypt($encryption_key, $encrypted_psk),
  }
}
