class strongswan (
  $debug_level              = $strongswan::params::debug_level,
  $nat_t                    = $strongswan::params::nat_t,
  $opportunistic_encryption = $strongswan::params::opportunistic_encryption,
  $plutoopts                = $strongswan::params::plutoopts,
  $protostack               = $strongswan::params::protostack,
  $virtual_private          = $strongswan::params::virtual_private
) inherits strongswan::params {

  include stdlib

  anchor { 'strongswan::begin': }
  -> class { 'strongswan::package': }
  -> class { 'strongswan::config':
    debug_level              => $debug_level,
    nat_t                    => $nat_t,
    opportunistic_encryption => $opportunistic_encryption,
    protostack               => $protostack,
    plutoopts                => $plutoopts,
    virtual_private          => $virtual_private,
  }
  ~> class { 'strongswan::service': }
  -> anchor { 'strongswan::end': }

  $connections = hiera_hash('strongswan::connections', {})
  create_resources('strongswan::connection', $connections)
}
