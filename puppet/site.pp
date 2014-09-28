# Default node definition.
#

node 'default' {

  include jenkins
  include jenkins::master

  jenkins::plugin { [
    'git',
    'multiple-scms',
    'token-macro',
    'parameterized-trigger',
    'credentials',
    'scm-api',
    'git-client',
    'promoted-builds',
    'ssh-credentials',
    'build-token-root',
    'ws-cleanup',
    'ec2',
    'node-iterator-api ',
  ]: }

}
