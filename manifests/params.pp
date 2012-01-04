class reprepro::params {
  
  $repo_base_dir = $::reprepro_repo_base_dir ? {
    ''      => '/var/packages/base',
    default => $::reprepro_repo_base_dir,
  }
}