Table of contents
- [ANSIBLE](#ansible)
  - [Installing Ansible](#installing-ansible)
  - [SSH Key pars](#ssh-key-pars)
    - [Using specific Ansible user](#using-specific-ansible-user)
  - [Invetory file](#invetory-file)
  - [The Ansible configuration file](#the-ansible-configuration-file)
    - [Try it](#try-it)
  - [Ad HOC tasks and Modules - Some examples](#ad-hoc-tasks-and-modules---some-examples)
    - [Gathering facts](#gathering-facts)
    - [Installing Services using APT module](#installing-services-using-apt-module)
    - [Restarting Services using Service module](#restarting-services-using-service-module)
    - [Using Ansible to reboot the webstack](#using-ansible-to-reboot-the-webstack)
  - [Playbooks](#playbooks)
    - [Basic examples](#basic-examples)
      - [Playbook for installing APACHE and PHP module](#playbook-for-installing-apache-and-php-module)
      - [Playbook for removing APACHE](#playbook-for-removing-apache)
    - [The `when` Conditional](#the-when-conditional)
      - [Checking OS distribution and release](#checking-os-distribution-and-release)
    - [Variables in Playbooks](#variables-in-playbooks)
    - [Targeting Specific Nodes](#targeting-specific-nodes)

Web UI for Ansible
https://www.youtube.com/watch?v=NyOSoLn5T5U

# ANSIBLE

**What’s this Ansible?**

Ansible is an open-source automation tool, or platform, used for IT tasks such as configuration management, application deployment, intraservice orchestration, and provisioning

## Installing Ansible

```bash
sudo apt update
sudo apt install ansible
```
 Create an ansible directory 
```bash
mkdir /srv/ansible
cd /srv/ansible
```

## SSH Key pars

Create a key directory
```bash
mkdir key
```
Create a SSH key and copy to all servers
```bash
ssh-keygen -t rsa -b 4096 -C "ansible@example" -f /srv/ansible/key/id_rsa
ssh-copy-id -i /srv/ansible/key/id_rsa.pub <USER>@<IP>
```

### Using specific Ansible user 
On the servers you want to administrate (in case that you want to use an specific user for andible)
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

## Invetory file

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
```

## The Ansible configuration file 

On your working directory, create an Ansbile Config File that will overrides some options
```bash
nano ansible.cfg
```
Content:
```ini
[defaults]
inventory = inventory/hosts.ini
private_key_file = key/id_rsa
remote_user = root
```

### Try it

Execute `hostname` command inside the remote hosts:
```bash
ansible web01 -m command -a hostname
```
Expected result:
```json
web01 | CHANGED | rc=0 >>
web01
```

A pre-defined ansible module 
```bash
ansible web01 -m ping
```
Expected result:
```json
web01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

List all the configured hosts
```bash
ansible all --list-hosts
```

## Ad HOC tasks and Modules - Some examples

### Gathering facts 
Gathering facts in Ansible refers to the process of collecting information about the target hosts. Facts are pieces of information about the host's system, such as hardware details, operating system, IP addresses, and more.

```bash
ansible web01 -m gather_facts
```

Example: Grabbing system distribution
```bash
ansible web01 -m gather_facts | grep ansible_distribution
```
Outut:
> "ansible_distribution": "Debian", <br>
> "ansible_distribution_file_parsed": true, <br>
> "ansible_distribution_file_path": "/etc/os-release", <br>
> "ansible_distribution_file_variety": "Debian", <br>
> "ansible_distribution_major_version": "11", <br>
> "ansible_distribution_release": "bullseye", <br>
> "ansible_distribution_version": "11",

### Installing Services using APT module

https://docs.ansible.com/ansible/latest/modules/apt_module.html

Updating cache
```bash
ansible all --become -m apt -a "update_cache=yes"
```
Instaling a package
``` bash
ansible webapp --become -m apt -a "name=apache2 state=present"
```
Upgrading a package
```bash
ansible db --become -m apt -a "name=mysql-server state=latest"
```
Dist upgrading
```bash
ansible all --become -m apt "upgrade=dist"
```

### Restarting Services using Service module

https://docs.ansible.com/ansible/latest/modules/service_module.html

```bash
ansible db -m service -a "name=mysql state=started"
```

```bash
ansible db --become -m service -a "name=mysql state=restarted"
```

### Using Ansible to reboot the webstack

```bash
ansible all -i hosts --become -a "reboot --reboot"
```

## Playbooks

Creating a directory for playbook files
```bash
mkdir playbook
```

### Basic examples

#### Playbook for installing APACHE and PHP module
```bash
nano playbook/install_apache.yml
```
```yml
---

- name: Playbook for installing APACHE and PHP module for apache
  hosts: all
  become: true
  tasks:
  
  - name: Ansible apt install apache2 and php module for apache
    apt:
      name: 
        - apache2
        - libapache2-mod-php
      state: present
      update_cache: yes
```
Running the playbook (-l for filtering only web hosts)
```bash
ansible-playbook playbook/install_apache.yml -l web*
```

#### Playbook for removing APACHE
```bash
nano playbook/remove_apache.yml
```
```yml
---

- name: Playbook for removing APACHE
  hosts: all
  become: true
  tasks:

      
  - name: Ansible apt remove apache2
    apt:
      name: apache2
      state: absent
```
Running the playbook (-l for filtering only web hosts)
```bash
ansible-playbook playbook/remove_apache.yml -l web*
```

### The `when` Conditional

#### Checking OS distribution and release

```yml
---

- name: Playbook for installing APACHE
  hosts: all
  become: true
  tasks:
  
  - name: Ansible apt install apache2
    apt:
      name: apache2
      state: present
      update_cache: yes

    when: ansible_distribution == 'Debian' and ansible_distribution_release == 'bullseye'
```
Cheking two distribution at the same time
```yml
---

- name: Playbook for installing APACHE
  hosts: all
  become: true
  tasks:
  
  - name: Ansible apt install apache2
    apt:
      name: apache2
      state: present
      update_cache: yes
    when: ansible_distribution in ["Debian", "Ubuntu"]
```

### Variables in Playbooks

Playbook for installing APACHE and PHP module
```bash
nano playbook/variables.yml
```
```yml
---

- name: Playbook for installing APACHE and PHP module for apache
  hosts: all
  become: true
  tasks:
  
  - name: Ansible apt install apache2 and php module for apache
    apt:
      name: 
        - "{{ apache_package }}"
        - "{{ php_package }}"
      state: present
      update_cache: yes
```
Running the playbook
```bash
ansible-playbook playbook/variables.yml -e "apache_package=apache2 php_packagelibapache2-mod-php"
```

### Targeting Specific Nodes