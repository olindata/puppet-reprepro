# init.pp - apt-repo

# This module builds a local apt repository

class reprepro {

  include reprepro::params

  package { 'reprepro':
    ensure => present
  }

  file { $reprepro::params::repo_base_dir:
    ensure => directory
  }
}
