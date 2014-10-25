# A definition for Jenkins builds.
#
# Parameters.
#
#   display_name - A human readable name.
#   description  - A human readable description about the build.
#   auth_token   - Enables a token. This token is taken from the FACTER_token system variable.
#   parameters   - Parameters that can be passed to the build.
#   config       - The build configruation in XML format.
#   script       - Ability to override the build script on a per build basis.
#   jobs_dir     - Jenkins jobs directory path. Shouldn't need to override this.
#
# Example.
#
#   ci::build { 'example':
#     display_name => 'Example',
#     description  => 'This is an example',
#     script       => 'mymodule/script.sh.erb',
#   }
#
define ci::build (
  # Metadata.
  $display_name = undef,
  $description  = undef,
  $auth_token   = false,

  # Parameters.
  $parameters   = [],

  # Templates.
  $config       = 'ci/jobs/build.xml.erb',
  $script       = 'ci/jobs/build.sh.erb',

  # Directories.
  $jobs_dir     = '/var/lib/jenkins/jobs',
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
  $script_output = template($script)
  file { "${jobs_dir}/${title}":
    ensure  => 'directory',
    owner   => 'jenkins',
    group   => 'jenkins',
    mode    => '0644',
    require => Package['jenkins'],
  }
  file { "${jobs_dir}/${title}/config.xml":
    content => template($config),
    require => File["${jobs_dir}/${title}"],
    owner   => 'jenkins',
    group   => 'jenkins',
    mode    => '0644',
    notify  => Service['jenkins'],
  }

}
