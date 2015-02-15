Setup
=====

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
