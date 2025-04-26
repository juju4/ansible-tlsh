[![Actions Status - Main](https://github.com/juju4/ansible-tlsh/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-tlsh/actions?query=branch%3Amain)
[![Actions Status - Devel](https://github.com/juju4/ansible-tlsh/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-tlsh/actions?query=branch%3Adevel)

# TLSH ansible role

Ansible role to setup TLSH - Trend Micro Locality Sensitive Hash
https://github.com/trendmicro/tlsh

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested Ubuntu 14.04, 16.04, 18.04 and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.tlsh
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.tlsh
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.tlsh/test/vagrant
$ vagrant up
$ vagrant ssh
```


## Troubleshooting & Known issues

* `CMake Error at test/CMakeLists.txt:90 (file):\n  file does not recognize sub-command CREATE_LINK`
[Cmake 3.14 or above required](https://github.com/pthom/imgui_manual/issues/2) meaning it needs RHEL/Centos 8 or Ubuntu 20.04 minimum.

## License

BSD 2-clause
