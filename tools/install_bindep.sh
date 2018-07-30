#!/bin/bash -ex
# Copyright 2016 Red Hat, Inc.
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

PACKAGES=$(bindep -b -f bindep.txt test || true)
if [ -z "$PACKAGES" ]; then
    exit
fi

if apt-get -v > /dev/null 2>&1 ; then
    sudo apt-get update
    sudo apt-get --assume-yes install $PACKAGES
else
    sudo dnf install -y $PACKAGES
fi
