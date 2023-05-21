# cloud-init

https://cloud-init.io/

Cloud-init is a widely used multi-distribution package that is utilized for initializing and configuring cloud instances during their initial boot process. 

### Check if cloud-init is installed

```bash
dpkg --get-selections | grep cloud-init
```

Output
> cloud-init                                      install <br>
> cloud-initramfs-growroot                        install

If is not installed: 

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install cloud-init
```

Remove:

```bash
apt remove --purge cloud-init
```

### Configuration file

Modules reference: https://cloudinit.readthedocs.io/en/latest/reference/modules.html

```bash
cd /etc/cloud
```

