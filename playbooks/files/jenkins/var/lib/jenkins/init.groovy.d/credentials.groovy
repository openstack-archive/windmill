// Copyright 2016 Red Hat, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
import jenkins.model.Jenkins;
import com.cloudbees.plugins.credentials.domains.Domain;
import com.cloudbees.plugins.credentials.CredentialsScope;
import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey;

domain = Domain.global()

credentials_store =
    Jenkins.instance.getExtensionList(
        'com.cloudbees.plugins.credentials.SystemCredentialsProvider'
    )[0].getStore()

creds = new BasicSSHUserPrivateKey(
    CredentialsScope.GLOBAL,
    "9292f6a1-ebc6-40e8-80da-b8940261cdce",
    "jenkins",
    new BasicSSHUserPrivateKey.UsersPrivateKeySource(),
    "",
    "Managed by Ansible"
)

credentials_store.addCredentials(domain, creds)
