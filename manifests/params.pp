class strongswan::params {
  # Charon Debug Level. Default: undef will comment out debugging. Otherwise,
  # debug levels for Charon can be set here (string: comma seperated)
  $charon_debug = undef

  # Exclude networks used on server side by adding %v4:!a.b.c.0/24
  $virtual_private = undef

  # Enable NAT Transversal (NAT-T)
  $nat_t = true

  case $::operatingsystem {
    debian,ubuntu: {
      $package_list = ['strongswan']
      $service_name = 'ipsec'
      $conf_basedir = '/etc'
    }
    redhat,centos: {
      $package_list = ['strongswan']
      $service_name = 'strongswan'
      $conf_basedir = '/etc/strongswan'
    }
    default: { fail('Unrecognized operating system') }
  }
}
