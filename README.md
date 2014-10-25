DrupalCI jenkins
================

### Overview

Provides Jenknins master/slave configuration for DrupalCI testbots.

### Installation

#### Bundler

Install the required gems with bundler (http://bundler.io/v1.6/bundle_install.html) via:

```
$ bundle install --path vendor/bundle
```

The above will give you Capistrano for deployment, otherwise bundle install is also run on the vagrant host during provision.

#### Vagrant (1.6.3)

Vagrant can be downloaded and installed from:

http://www.vagrantup.com/downloads.html

Install the required plugins for Vagrant via the following command:

```
$ vagrant plugin install vagrant-vbguest
$ vagrant plugin install vagrant-auto_network
$ vagrant plugin install vagrant-hostsupdater
```

#### Local development.

A local environment can be setup with Vagrant using the following command:

```
$ vagrant up
```

Note: Go get a coffee, this might take a little while.

Go to the following URL:

```
http://master.local
```

#### Deploy.

To show change and then deploy to the DEV environment run the following commands:

```
$ bundle exec cap dev puppet:noop
$ bundle exec cap dev puppet:apply
```

##### Manual method

If you wish to run some manual steps please see for a example of the commands you can run:
* puppet/provision/base.sh
* puppet/provision/puppet.sh

### Packer

Packer is an amazing tool for building prepackaged images. Currently we are only building an AWS image.

#### Installation

http://www.packer.io/docs/installation.html

#### Usage

Images can be built via the following commands:

```
$ export AWS_ACCESS_KEY='Super secret access key'
$ export AWS_SECRET_KEY='Super secret secret key'
$ packer build packer/ubuntu/amazon.json
```
