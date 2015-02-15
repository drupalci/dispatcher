Packaging
======

## Packer

Packer is an amazing tool for building prepackaged images. Currently we are only building an AWS image.

#### Installation

http://www.packer.io/docs/installation.html

#### Usage

Images can be built via the following commands:

**Master**

```
# AWS credentials.
$ export AWS_ACCESS_KEY='Super secret access key'
$ export AWS_SECRET_KEY='Super secret secret key'

$ packer build packer/master/packer.json
```

**Slave**

```
# This Packer image requires some sensitive user account information to be
# set prior to running the build. This can be done with the following command:
$ export JENKINS_USER=admin:admin

# AWS credentials.
$ export AWS_ACCESS_KEY='Super secret access key'
$ export AWS_SECRET_KEY='Super secret secret key'

$ packer build packer/slave/packer.json
```

## Docker

Coming soon...

## Vagrant

Coming soon...
