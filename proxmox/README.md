## Creating a VM Template in Proxmox

Source: https://tcude.net/creating-a-vm-template-in-proxmox/

Source: https://www.youtube.com/watch?v=MJgIm03Jxdo

### Initial Steps

#### Create a VM 

1.  General

![Create VM - General](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-General.png)

2.  OS: select "Do not use any media". All other options can remain their default values.

![Create VM - OS](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-OS.png)

3. System: enable the "Qemu Agent" checkbox.  The guest agent provides additional functionality between the VM and Proxmox, itself.

![Create VM - System](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-System.png)

4. Disks: delete the default scsi0 disk created by Proxmox.  We will instead create our own farther along in the tutorial.

![Create VM - Disks](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-Disks.png) 

5. CPU

![Create VM - Disks](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-CPU.png) 

6. RAM

![Create VM - Disks](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-RAM.png) 

7. RAM

![Create VM - Network](https://github.com/gerabarud/devops/blob/main/proxmox/images/CreateVM-Network.png) 

8. Review settings and click "Finish"

ssh root@190.124.232.73

wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2

qm set 990 --serial0 socket --vga serial0

qemu-img resize debian-11-genericcloud-amd64.qcow2 50G

qm importdisk 990 debian-11-genericcloud-amd64.qcow2 local-lvm

ssh dgcc@190.124.232.38

sudo apt install qemu-guest-agent

sudo reboot

ssh dgcc@190.124.232.38
