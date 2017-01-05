#!/bin/bash -ex
# Copyright 2015 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

CLONEMAP=`mktemp`
function cleanup {
    rm -f $CLONEMAP
}
trap cleanup EXIT
cat > $CLONEMAP << EOF
clonemap:
  - name: 'openstack/ansible-role-(.*)'
    dest: 'playbooks/roles/openstack.\1'
EOF

zuul-cloner -m $CLONEMAP \
  --cache-dir /opt/git \
  git://git.openstack.org \
  openstack/ansible-role-diskimage-builder \
  openstack/ansible-role-jenkins-job-builder \
  openstack/ansible-role-nodepool \
  openstack/ansible-role-shade \
  openstack/ansible-role-ssh \
  openstack/ansible-role-virtualenv \
  openstack/ansible-role-zookeeper \
  openstack/ansible-role-zuul
