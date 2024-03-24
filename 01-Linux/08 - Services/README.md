Table of Contents
- [Systemd](#systemd)
  - [Systemd Units](#systemd-units)
  - [`systemctl` command](#systemctl-command)
    - [Status](#status)
    - [Start](#start)
    - [Stop](#stop)
    - [Restart](#restart)
    - [Restart](#restart-1)
    - [Enable](#enable)
    - [Disable](#disable)
  - [Unit Files](#unit-files)
    - [Store directories and priorities](#store-directories-and-priorities)
    - [Service File Directives](#service-file-directives)
    - [Customizing Unit Files](#customizing-unit-files)
      - [Editing](#editing)
      - [Undo changes](#undo-changes)
      - [Full Editing](#full-editing)
      - [Appying changes](#appying-changes)

## Systemd

Systemd is a system and service manager for Linux operating systems. It's responsible for starting and managing system services, tracking processes, handling dependencies, and controlling the overall system state.

Systemd is an `init system`: the most importat process running (PID 1). 

### Systemd Units

Units in Systemd are resources that it's able to manage: services, timers, mounts, automounts, etc. **Here we will cover only service managament.**

### `systemctl` command

#### Status
```bash
systemctl status apache2
```

#### Start
```bash
sudo systemctl start apache2
```

#### Stop
```bash
sudo systemctl stop apache2
```

#### Restart
```bash
sudo systemctl restart apache2
```
#### Restart
```bash
sudo systemctl reload apache2
```

#### Enable 
the commands `systemctl enable` and `systemctl disable` are used to manage the automatic startup of system services and other units.

```bash
sudo systemctl enable apache2
```

#### Disable
```bash
sudo systemctl disable apache2
```

### Unit Files
Systemd organizes services and other system resources using unit files. Unit files describe how a service or resource should be started, stopped, and managed. The main types of unit files include service units (*.service), socket units (*.socket), target units (*.target), and many others.

#### Store directories and priorities
Priority 1. `/etc/systemd/system`

Priority 2. `/run/systemd/system`

Priority 3. `/lib/systemd/system`: Manually installed services

#### Service File Directives

Example: apache2 service file.
```ini
# cat /lib/systemd/system/apache2.service 
[Unit]
Description=The Apache HTTP Server
After=network.target remote-fs.target nss-lookup.target
Documentation=https://httpd.apache.org/docs/2.4/

[Service]
Type=forking
Environment=APACHE_STARTED_BY_SYSTEMD=true
ExecStart=/usr/sbin/apachectl start
ExecStop=/usr/sbin/apachectl graceful-stop
ExecReload=/usr/sbin/apachectl graceful
KillMode=mixed
PrivateTmp=true
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

Directives: 
1. `[Unit]` Section:
   - This section defines general unit properties and dependencies.
   - Common directives: `Description`, `Requires`, `Wants`, `After`, `Before`, `Conflicts`, `PartOf`, etc.

2. `[Service]` Section:
   - This section is used for service units, which represent a system service. Configure how the unit is treated when it start up.
   - Common directives: `ExecStart`, `ExecStop`, `Restart`, `User`, `Group`, `Environment`, `WorkingDirectory`, etc.

3. `[Socket]` Section:
   - This section defines a socket unit, used for socket activation.
   - Common directives: `ListenStream`, `ListenDatagram`, `SocketUser`, `SocketGroup`, `SocketMode`, etc.

4. `[Device]` Section:
   - This section is used for device units, representing a device managed by systemd.
   - Common directives: `Path`, `Driver`, `Permission`, `ReadOnly`, `Symlinks`, etc.

5. `[Mount]` Section:
   - This section defines a mount unit, representing a file system mount point.
   - Common directives: `What`, `Where`, `Type`, `Options`, `ReadOnly`, `TimeoutSec`, etc.

6. `[Timer]` Section:
   - This section is used for timer units, representing a timer-based activation.
   - Common directives: `OnCalendar`, `OnBootSec`, `OnUnitActiveSec`, `Persistent`, `RandomizedDelaySec`, etc.

7. `[Path]` Section:
   - This section defines a path unit, representing a file or directory path.
   - Common directives: `PathExists`, `PathChanged`, `Unit`, `MakeDirectory`, `DirectoryMode`, `DirectoryNotEmpty`, etc.

8. `[Install]` Section:
   - This section specifies installation-related instructions for the unit.
   - Common directives: `WantedBy`, `RequiredBy`, `Also`, `Alias`, `DefaultInstance`, etc.

#### Customizing Unit Files

##### Editing
```bash
sudo systemctl edit apache2
```
This command will create an override file stored in `/etc/systemd/system/apache2.service.d/override.conf`


##### Undo changes
```bash
sudo rm /etc/systemd/system/apache2.service.d/override.conf
```

##### Full Editing
```bash
sudo systemctl edit --full apache2
```
It let you edit current content of the unit file

##### Appying changes
```bash
sudo systemctl daemon-reload
```