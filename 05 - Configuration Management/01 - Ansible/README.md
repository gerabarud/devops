Table of contents
- [ANSIBLE](#ansible)
  - [Installing Ansible](#installing-ansible)
    - [SSH Key pars](#ssh-key-pars)
    - [Invetory file](#invetory-file)
    - [Try it](#try-it)
  - [02 - Ad HOC tasks and Modules - Some examples](#02---ad-hoc-tasks-and-modules---some-examples)
    - [Install Services using APT module](#install-services-using-apt-module)
    - [Restart Services using Service module](#restart-services-using-service-module)
    - [Use Ansible to reboot the webstack](#use-ansible-to-reboot-the-webstack)

# ANSIBLE

**What’s this Ansible?**

Ansible is an open-source automation tool, or platform, used for IT tasks such as configuration management, application deployment, intraservice orchestration, and provisioning



 

## Installing Ansible

```bash
sudo apt-get install ansible
```

 Create an ansible directory 

```bash
mkdir /srv/ansible
cd /srv/ansible
```

### SSH Key pars
Create a key directory
```bash
mkdir key
```

Create a SSH key and copy to all servers

```bash
ssh-keygen -t rsa -b 4096 -C "ansible@example" -f /srv/ansible/key/id_rsa
```

On the servers you want to administrate
```bash
sudo adduser ansible
sudo usermod -aG sudo ansible
su ansible
```

Create authorized_keys file and add id_rsa.pub content
```bash
cd ~
mkdir .ssh
nano .ssh/authorized_keys
```

### Invetory file

On ansible host, create an inventory file, and add to it hosts you want to administrate

```bash
mkdir inventory
nano inventory/hosts.ini 
```

exmaple:

```ini
[webapp]
web01 ansible_host=web01.example.com
web02 ansible_host=web02.example.com

[db]
db01 ansible_host=web02.example.com

[stack:children]
webapp
db

[all:vars]
ansible_private_key_file=/srv/ansible/key/id_rsa
ansible_user=ansible
ansible_port=22
```

### Try it

A command inside de remote host:
```bash
ansible web01 -i hosts -m command -a hostname
```
Expected result:

```json
web01 | CHANGED | rc=0 >>
web01
```

A pre-defined ansible module 
```bash
ansible web01 -i hosts -m ping
```
Expected result:
```json
web01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

## 02 - Ad HOC tasks and Modules - Some examples

### Install Services using APT module

https://docs.ansible.com/ansible/latest/modules/apt_module.html

```bash
ansible all -i hosts --become -m apt -a "update_cache=yes"
```
``` bash
ansible webapp -i hosts --become -m apt -a "name=apache2 state=present"
```
```bash
ansible db -i hosts --become -m apt -a "name=mysql-server state=present"
```

### Restart Services using Service module

https://docs.ansible.com/ansible/latest/modules/service_module.html

```bash
ansible db -i hosts -m service -a "name=mysql state=started"
```

```bash
ansible db --become -i hosts -m service -a "name=mysql state=restarted"
```

### Use Ansible to reboot the webstack

```bash
ansible all -i hosts --become -a "reboot --reboot"
```

