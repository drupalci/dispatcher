# Default node definition.
#

node 'default' {

  ##
  # Hiera.
  ##

  # Base classes.
  hiera_include("classes")

  # Builds.
  $builds = hiera_hash('builds', false)
  if $builds {
    create_resources(ci::build, $builds)
  }

}
