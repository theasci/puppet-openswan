# Overview

This is a Puppet module for installing and configuring [StrongSwan](http://strongswan.com) from within Puppet. It's based on the [OpenSwan module
by James Fryman](https://github.com/fup/puppet-openswan).

# Classes

* `strongswan`: Main class. Installs strongswan, configures it with the supplied parameters, and
  then creates `strongswan::connection` resources supplied via Hiera using `hiera_hash()`.
* `strongswan::package`: (private) Installs the strongswan package.
* `strongswan::config`: (private) Sets up directory structure for config files and writes out
  [ipsec.conf](https://wiki.strongswan.org/projects/strongswan/wiki/IpsecConf) and
  [ipsec.secrets](https://wiki.strongswan.org/projects/strongswan/wiki/IpsecSecrets).
* `strongswan::service`: (private) Service definition for strongswan daemon.
* `strongswan::params`: (private) Base class defining shared variables.

# Defines

* `strongswan::connection`: Writes config file for the specified connection. See [the StrongSwan
  wiki](https://wiki.strongswan.org/projects/strongswan/wiki/ConnSection) for what the parameters
  mean. If the connection uses a pre-shared secret, then teh appropriate `strongswan::shared_secret`
  resource is declared.
* `strongswan::shared_secret`: Writes a PSK file for use by the specified hosts.
* `strongswan::disable_redirects`: Disables ICMP redirects.

# Development

See [the "Module Development" section of puppet/README.md](https://bitbucket.org/theasci/puppet/src/master/README.md#markdown-header-module-development)
