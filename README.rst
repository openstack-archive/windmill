========
windmill
========

An Ansible deployment to validate ansible roles for Continuous Integration

* License: Apache License, Version 2.0
* Documentation: https://windmill.readthedocs.org
* Source: https://git.openstack.org/cgit/openstack/windmill
* Bugs: https://bugs.launchpad.net/windmill

Description
-----------

Windmill is a collection of Ansible playbooks and roles used to deploy
Continuous Integration (CI) tools. It serves to be a functional test environment
for our Ansible CI roles primarily, however it also provides an example
deployment for users.

Quickstart
----------

The following is a list of instructions to get started quickly with an
all-in-one deployment.

.. code-block:: bash

    sudo yum update -y && reboot
    sudo yum install git epel-release
    sudo yum install python-devel python-tox python-pip gcc
    pip install --user zuul
    git clone https://github.com/openstack/windmill
    cd windmill

Before running the following command, you need to remove `zuul` from the
`requirements.txt` file. This is a temporary work around for now and will
change in the future.

Additionall, modify the `playbooks/vars/nodepool.yaml` file and update
`nodepool_template_clouds_yaml_contents` variable for launching nodepool
instances in your cloud infrastructure.

* tox -edeploy
