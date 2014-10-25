# A definition for Jenkins builds.
#
# Parameters.
#
#   display_name    - A human readable name.
#   description     - A human readable description about the build.
#   parameters      - Parameters that can be passed to the build.
#   build_template  - The build configruation in XML format.
#   script_template - Ability to override the build script on a per build basis.
#   jobs_dir        - Jenkins jobs directory path. Shouldn't need to override this.
#
# Example.
#
#   ci::build { 'example':
#     display_name    => 'Example',
#     description     => 'This is an example',
#     script_template => 'mymodule/script.sh.erb',
#   }
#
define ci::build (
  # Metadata.
  $display_name    = undef,
  $description     = undef,

  # Parameters.
  $parameters      = [],

  # Templates.
  $build_template  = 'ci/jobs/build.xml.erb',
  $script_template = 'ci/jobs/build.sh.erb',

  # Directories.
  $jobs_dir        = '/var/lib/jenkins/jobs',
){

  ##
  # Validation.
  ##

  validate_string($display_name)
  validate_string($description)

  ##
  # Configuration.
  ##

  # Jenkins config.
  $script = template($script_template)
  file { "${jobs_dir}/${title}":
    ensure  => 'directory',
    require => Package['jenkins'],
  }
  file { "${jobs_dir}/${title}/config.xml":
    content => template($build_template),
    require => File["${jobs_dir}/${title}"],
  }

}
