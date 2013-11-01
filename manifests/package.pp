class strongswan::package {
  package { $strongswan::params::package_list:
    ensure => present,
  }
}
