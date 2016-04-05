define strongswan::connection(
  $auto              = undef,
  $authby            = undef,
  $esp               = undef,
  $ike               = undef,
  $ikelifetime       = undef,
  $keyexchange       = undef,
  $aggressive        = undef,
  $left              = undef,
  $leftid            = undef,
  $leftsubnet        = undef,
  $leftprotoport     = undef,
  $leftnexthop       = undef,
  $leftsourceip      = undef,
  $lifetime          = undef,
  $rekey             = undef,
  $rekeyfuzz         = undef,
  $right             = undef,
  $rightid           = undef,
  $rightprotoport    = undef,
  $rightsubnet       = undef,
  $rightsubnetwithin = undef,
  $rightsourceip     = undef,
  $forceencaps       = undef,
  $auth              = undef,
  $type              = undef,
  $opts              = undef,
  $psk               = undef,
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  $conf_basedir = $strongswan::params::conf_basedir
  file { "${conf_basedir}/ipsec.d/connections/${name}.conf":
    ensure  => file,
    content => template('strongswan/connection.conf.erb'),
    notify  => Class['strongswan::service'],
  }

  if $leftid and $rightid and $psk {
    strongswan::shared_secret { $name:
      hosts => "${leftid} ${rightid}",
      psk   => $psk,
    }
  }
}
