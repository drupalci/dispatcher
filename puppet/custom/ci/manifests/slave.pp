# The Jenkins master.

class ci::master {

  class { 'docker':
    dns     => '8.8.8.8',
    require => Yumrepo['epel'],
  }

  class { 'jenkins::slave':
    masterurl => $jenkins_master,
    ui_user   => $jenkins_master_user,
    ui_pass   => $jenkins_master_pass,
  }

}
