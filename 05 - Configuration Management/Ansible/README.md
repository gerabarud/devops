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
    - [Tags](#tags)
    - [Managing Files](#managing-files)
      - [`copy` module](#copy-module)
      - [`unarchive` module](#unarchive-module)
        - [`tar.gz` example](#targz-example)
        - [`zip` example: Installing Terraform from remote source](#zip-example-installing-terraform-from-remote-source)
      - [`lineinfile` module](#lineinfile-module)
        - [Adding and removing lines in a file](#adding-and-removing-lines-in-a-file)
        - [Modifying an line in a file](#modifying-an-line-in-a-file)
    - [Services](#services)
      - [Handlers](#handlers)
    - [User Managament](#user-managament)
      - [Managament examples: `create`, `modify`, `change password`, `remove`](#managament-examples-create-modify-change-password-remove)
      - [Creating a user with SSH key](#creating-a-user-with-ssh-key)
    - [Boostrap](#boostrap)
  - [Roles](#roles)
    - [Example: Role for installing PostgreSQL](#example-role-for-installing-postgresql)

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
ssh-keygen -t rsa -b 4096 -C "ansible@example" -f key/id_rsa
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
remote_user = ansible
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
Running the playbook with env as arguments
```bash
ansible-playbook playbook/variables.yml -e "apache_package=apache2 php_packagelibapache2-mod-php"
```

### Targeting Specific Nodes
```yaml
- name: Playbook for installing APACHE and PHP module for apache
  hosts: webapp
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

### Tags

```bash
nano playbook/tags.yml
```
```yaml
- name: Playbook for installing APACHE and PHP module for apache
  hosts: webapp
  become: true
  tasks:
  
  - name: Ansible apt install apache2 and php module for apache
    tags: apache,apache2,php,debian
    apt:
      name: 
        - apache2
        - libapache2-mod-php
      state: present
      update_cache: yes
      when: ansible_distribution == 'Debian'

  - name: Ansible apt install apache2 and php module for apache
    tags: apache,apache2,ubuntu
    apt:
      name: 
        - apache2
      state: present
      update_cache: yes
      when: ansible_distribution == 'Ubuntu'
```
Listing tags available
```bash
ansible-playbook --list-tags playbook/tags.yml
```
Output:
> playbook: playbook/tags.yml
>
>  play #1 (webapp): Playbook for installing APACHE and PHP module for apache	TAGS: [] <br>
>      TASK TAGS: [apache, apache2, debian, php, ubuntu]

Runnig tasks with specifics tags
```bash
ansible-playbook playbook/tags.yml --tags debian
```
```bash
ansible-playbook playbook/tags.yml --tags ubuntu
```

Skiping tasks with specific tags
```bash
ansible-playbook playbook/tags.yml --skip-tags php
```
>> Hint: The `always` tag in Ansible is a special tag that ensures a task is always executed, regardless of any other tag filtering or conditions.

### Managing Files

Create a new directory for files and create a new file
```bash
mkdir files
nano files/test.txt
```

#### `copy` module 
```yml
- name: Example playbook
  hosts: all
  tasks:
    - name: Copy file to remote host
      copy:
        src: files/test.txt
        dest: /path/on/remote/test.txt
        owner: root
        group: root
        mode: 0644
```

#### `unarchive` module
##### `tar.gz` example
```yml
- name: Example playbook
  hosts: all
  tasks:
    - name: Unarchive file on remote host
      unarchive:
        src: /path/to/archive.tar.gz
        dest: /path/on/remote/
        remote_src: yes
```
##### `zip` example: Installing Terraform from remote source
```yml
- hosts: workstations
  become: true
  tasks:

  - name: install unzip
    package:
      name: unzip

  - name: install terraform
    unarchive:
      src: https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip
      remote_src: yes
      dest: /usr/local/bin
      owner: root
      group: root
      mode: 0755
```

#### `lineinfile` module
##### Adding and removing lines in a file
```yml
- name: Example playbook
  hosts: all
  tasks:
    - name: Add a line to a file
      lineinfile:
        path: /path/to/file.txt
        line: "Some line to add"
        state: present

    - name: Remove a line from a file
      lineinfile:
        path: /path/to/file.txt
        line: "Line to remove"
        state: absent
```
##### Modifying an line in a file
```yml
- name: Example playbook
  hosts: all
  tasks:
    - name: Modify a line in a file
      lineinfile:
        path: /path/to/file.txt
        regexp: '^old_line='
        line: 'new_line=value'
```

### Services
The `service` module allows you to `start`, `stop`, `restart`, `enable`, or `disable` services on the target hosts.

```yml
- name: Example playbook
  hosts: all
  tasks:
    - name: Ensure service is started
      service:
        name: myservice
        state: started

    - name: Ensure service is stopped
      service:
        name: myservice
        state: stopped

    - name: Ensure service is restarted
      service:
        name: myservice
        state: restarted

    - name: Ensure service is enabled on boot
      service:
        name: myservice
        enabled: yes

    - name: Ensure service is disabled on boot
      service:
        name: myservice
        enabled: no
    
    - name: Ensure service is started and enabled on boot
      service:
        name: myservice
        state: started
        enabled: yes
```

#### Handlers
`handlers` are tasks that are executed in response to a notification from another task. They are typically used to perform actions such as service restarts or configuration reloads after certain changes have been made.

Example: Changing Apache admin email and restarting service
```yml
- name: Changing Apache admin email and restarting service
  hosts: all
  become: true
  tasks:
    - name: Update Apache config file
      lineinfile:
        path: /etc/apache2/apache2.conf
        regexp: '^ServerAdmin'
        line: 'ServerAdmin new_admin@example.com'
      notify: Restart Apache

  handlers:
    - name: Restart Apache
      service:
        name: apache2
        state: restarted
```

### User Managament

#### Managament examples: `create`, `modify`, `change password`, `remove`
```yml
- name: User Management
  hosts: all
  become: true
  tasks:
    - name: Create a user
      user:
        name: john
        password: "{{ 'password' | password_hash('sha512') }}"
        state: present

    - name: Modify user properties
      user:
        name: john
        shell: /bin/bash
        groups: developers
        append: yes

    - name: Change user password
      user_password:
        name: john
        password: "{{ 'newpassword' | password_hash('sha512') }}"
        update_password: always

    - name: Remove a user
      user:
        name: john
        state: absent
```

#### Creating a user with SSH key
Creating a directory where to store the password
```bash
mkdir files/ssh_keys
```

```yml
- name: Create User with SSH Key
  hosts: all
  become: true  
  tasks:
  
    - name: Create user gerardo con sudo
      user:
        name: gbarud
        comment: Gerardo Barud
        shell: /bin/bash
        create_home: yes
        home: /home/gbarud
        group: sudo

    - name: Set public key gbarud
      authorized_key:
        user: gbarud
        state: present
        key: "{{ lookup('file', 'files/ssh_keys/gbarud.pub') }}"
```

### Boostrap
Bootstrap in the context of Ansible typically refers to the initial setup and configuration of a target system or group of systems. It involves tasks such as installing the required dependencies, setting up SSH access, and preparing the system for further configuration management.

Generic example:
```bash
nano playbook/boostrap.yml
```
```yml
- name: Bootstrap
  hosts: target_hosts
  gather_facts: false
  become: true
  tasks:
    - name: Update system packages
      apt:
        update_cache: yes
        upgrade: dist

    - name: Install required dependencies
      package:
        name: ['python3', 'python3-pip']

    - name: Configure SSH access for Ansible
      authorized_key:
        user: ansible_user
        key: "{{ lookup('file', '/path/to/ansible_public_key.pub') }}"
        state: present

    - name: Perform initial system configuration
      # Add your tasks here

    - name: Run additional playbooks or roles
      # Include tasks or roles to further configure the system
```
```bash
ansible-playbook playbook/boostrap.yml
```

## Roles

**Roles in Ansible are a way to organize and encapsulate related tasks, variables, templates, and other files into reusable units.** They provide a structured approach to organizing playbooks and make it easier to manage complex configurations and deployments.

Roles follow a predefined directory structure that allows you to separate different aspects of your configuration and keep things modular. The recommended structure for a role directory is as follows:

```bash
myrole/
├── tasks/
│   ├── main.yml
│   └── other_tasks.yml
├── handlers/
│   └── main.yml
├── templates/
│   └── template.j2
├── files/
│   └── myfile.txt
├── vars/
│   └── main.yml
├── defaults/
│   └── main.yml
├── meta/
│   └── main.yml
└── README.md
```

Let's explore each directory in more detail:

- `tasks/`: Contains YAML files with the main tasks of the role. The `main.yml` file is the entry point for the role and includes all the tasks to be executed.

- `handlers/`: Contains YAML files with the handlers, which are tasks triggered by notifications from other tasks. The `main.yml` file lists all the handlers defined for the role.

- `templates/`: Contains Jinja2 templates that can be used to generate configuration files. These templates can reference variables defined in the role or passed from the playbook.

- `files/`: Stores static files that need to be transferred to the target hosts. These files are typically used by tasks in the role.

- `vars/`: Contains YAML files with variables specific to the role. These variables can be accessed and used within the role's tasks and templates.

- `defaults/`: Stores YAML files with default variable values. These values can be overridden by defining variables in the playbook or inventory.

- `meta/`: Contains metadata for the role, including its name, author, and any role dependencies.

- `README.md`: Provides documentation and instructions for using the role.

To use a role in a playbook, you can include it using the `roles` keyword:

```yaml
- name: My Playbook
  hosts: target_hosts
  roles:
    - myrole
```

### Example: Role for installing PostgreSQL

Here's an example of a role for installing PostgreSQL using Ansible:

1. Create the role directory structure:
```bash
mkdir -p playbook/roles
mkdir playbook/roles/postgresql
cd playbook/roles/postgresql
mkdir tasks handlers vars defaults templates
```

2. Create the `tasks/main.yml` file with the following content:
```yaml
- name: Install PostgreSQL packages
  apt:
    name: "{{ postgresql_package }}"
    state: present

- name: Copy PostgreSQL configuration file
  template:
    src: postgresql.conf.j2
    dest: /etc/postgresql/{{ postgresql_version }}/main/postgresql.conf
    owner: postgres
    group: postgres
    mode: '0644'

- name: Copy PostgreSQL pg_hba.conf file
  template:
    src: pg_hba.conf.j2
    dest: /etc/postgresql/{{ postgresql_version }}/main/pg_hba.conf
    owner: postgres
    group: postgres
    mode: '0644'

- name: Start PostgreSQL service
  service:
    name: postgresql
    state: started
    enabled: true
```

3. Create the `handlers/main.yml` file with the following content:
```yaml
- name: Restart PostgreSQL service
  service:
    name: postgresql
    state: restarted
```

4. Create the `vars/main.yml` file with the following content:
```yaml
postgresql_package: postgresql-12
postgresql_version: 12
```

5. Create the `defaults/main.yml` file with any default variables you want to define, such as:
```yaml
postgresql_package: postgresql-12
postgresql_version: 12
```

6. Create the template files `templates/postgresql.conf.j2` and `templates/pg_hba.conf.j2` with the appropriate configuration for PostgreSQL.

7. Update your playbook to use the `postgresql` role:
```yaml
- name: Install PostgreSQL
  hosts: target_hosts
  roles:
    - postgresql
```

In this example, the role installs the PostgreSQL packages, copies the configuration files using templates, and starts the PostgreSQL service. The role uses variables for the package name and version, allowing flexibility in the installation. It also includes a handler to restart the service when the configuration files are changed.

> Note: This example assumes the target hosts are running a Debian-based distribution. You may need to adjust the package name and package manager tasks for other distributions.
