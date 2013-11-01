define strongswan::shared_secret (
  $hosts,
  $psk,
) {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0600',
  }

  $conf_basedir = $strongswan::params::conf_basedir
  file { "${conf_basedir}/ipsec.d/secrets/${name}.secret":
    ensure  => file,
    mode    => '0600',
    content => "${hosts} : PSK \"${psk}\"\n",
    notify  => Class['strongswan::service'],
  }
}
