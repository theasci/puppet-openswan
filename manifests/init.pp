class strongswan (
  $charon_debug    = $strongswan::params::debug_level,
  $nat_t           = $strongswan::params::nat_t,
  $virtual_private = $strongswan::params::virtual_private,
) inherits strongswan::params {

  include stdlib

  anchor { 'strongswan::begin': }
  -> class { 'strongswan::package': }
  -> class { 'strongswan::config':
    charon_debug    => $charon_debug,
    nat_t           => $nat_t,
    virtual_private => $virtual_private,
  }
  ~> class { 'strongswan::service': }
  -> anchor { 'strongswan::end': }

  $connections = hiera_hash('strongswan::connections', {})
  create_resources('strongswan::connection', $connections)
}
