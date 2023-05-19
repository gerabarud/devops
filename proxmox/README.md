ssh root@190.124.232.73

wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2

qm set 990 --serial0 socket --vga serial0

qemu-img resize debian-11-genericcloud-amd64.qcow2 50G

qm importdisk 990 debian-11-genericcloud-amd64.qcow2 local-lvm

ssh dgcc@190.124.232.38

sudo apt install qemu-guest-agent

sudo reboot

ssh dgcc@190.124.232.38
