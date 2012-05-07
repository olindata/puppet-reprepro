# dummy define just to be able to iterate through an array..
define reprepro::repo::dummyloop($distribution) {
  file { "${reprepro::params::repo_base_dir}/${distribution}/conf/override.${name}":
    ensure => present
  }
}

define reprepro::repo($distribution, $codenames, $origin, $label, $description,
  $architectures = 'i386 amd64 source', $suites = 'stable',
  $components = 'main', $signed = false) {

  include reprepro::params

  file { "${reprepro::params::repo_base_dir}/${distribution}":
    ensure => directory
  }

  file { "${reprepro::params::repo_base_dir}/${distribution}/conf":
    ensure => directory
  }

  reprepro::repo::dummyloop { $codenames:
    distribution => $distribution
  }

  file { "${reprepro::params::repo_base_dir}/${distribution}/conf/distributions":
    ensure  => present,
    content => template('reprepro/distributions.erb')
  }

}
