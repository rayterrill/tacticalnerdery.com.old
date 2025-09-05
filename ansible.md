---
layout: page
title: Ansible
permalink: /ansible/
---

### Setting Up a Ubuntu Machine to Manage Windows Machines with WinRM, Vault
#### Install Packages
```
# install ansible, kerberos packages, and upgrade pykerberos to the latest package
sudo apt update
sudo apt install ansible python3-pip krb5-user libkrb5-dev python3-dev
sudo pip3 install --upgrade pykerberos --break-system-packages
sudo pip3 install hvac --break-system-packages
```

#### Configure krb5.conf
```
[libdefaults]
    default_realm = MYDOMAIN.COM
    dns_lookup_kdc = true
```

#### Configure Inventory (inventory.ini)
```
[windows]
mymachine.mydomain.com ansible_host=192.168.23.10

[windows:vars]
ansible_user=MyAccount@MDOMAIN.COM
ansible_connection=winrm
ansible_winrm_transport=kerberos
ansible_port=5985
ansible_winrm_message_encryption=always
```

#### Example Runbook (helloworld.yaml)
```
#hello.yaml
---
- name: Hello World!
  hosts: windows
  gather_facts: false

  tasks:
    - name: Vault
      ansible.windows.win_ping:
```

#### Testing
```
ansible-playbook helloworld.yaml -i inventory.ini
```
