## Creating a VM Template in Proxmox

Source: https://tcude.net/creating-a-vm-template-in-proxmox/
Source: https://www.youtube.com/watch?v=MJgIm03Jxdo

### Initial Steps

Create a VM 

![Create VM - General](https://github.com/gerabarud/devops/blob/main/proxmox/images/Create VM - General.png)



ssh root@190.124.232.73

wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2

qm set 990 --serial0 socket --vga serial0

qemu-img resize debian-11-genericcloud-amd64.qcow2 50G

qm importdisk 990 debian-11-genericcloud-amd64.qcow2 local-lvm

ssh dgcc@190.124.232.38

sudo apt install qemu-guest-agent

sudo reboot

ssh dgcc@190.124.232.38
