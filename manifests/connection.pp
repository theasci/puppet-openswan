define openswan::connection(
  $auto,
  $authby,
  $esp,
  $ike,
  $left,
  $leftsubnet,
  $leftprotoport,
  $leftnexthop,
  $pfs,
  $rekey,
  $right,
  $rightprotoport,
  $rightsubnetwithin,
  $type
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/ipsec.d/connections/${name}.conf":
    ensure  => file,
    content => template('openswan/connection.conf.erb'),
  }
}
