class strongswan::config(
  $charon_debug = undef,
  $nat_t,
  $virtual_private,
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  $conf_basedir = $strongswan::params::conf_basedir
  file { "${conf_basedir}/ipsec.conf":
    ensure  => file,
    content => template('strongswan/ipsec.conf.erb'),
  }
  file { "${conf_basedir}/ipsec.secrets":
    ensure => file,
    mode   => '0600',
    content => template('strongswan/ipsec.secrets.erb'),
  }
  file { "${conf_basedir}/ipsec.d":
    ensure => directory,
    mode   => '0755',
  }
  file { "${conf_basedir}/ipsec.d/connections":
    ensure => directory,
    mode   => '0755',
  }
  file { "${conf_basedir}/ipsec.d/secrets":
    ensure => directory,
    mode   => '0600',
  }
}
