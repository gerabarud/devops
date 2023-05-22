## Users & Groups in Linux

Index

1. Users
   - 
2. Groups 

## Users

### List current users

```bash
cat /etc/passwd
```

Count users:
```bash
cat /etc/passwd | wc -l
```

Print one user
```bash
cat /etc/passwd | grep test
```
Output
> test:x:1001:1001::/home/test:/bin/sh

The /etc/passwd file is a system file used in Linux and Unix-like operating systems to store user account information. Each line in the file represents a user account and consists of several fields or columns separated by colons (":"):

- Username:
- Password: In older systems, this column stored an encrypted password. However, in modern systems, an "x" or "*" is typically stored instead. The actual encrypted password is now stored in the /etc/shadow file for enhanced security.
- User ID (UID): typically represented as positive integers:
  - Regular user: IDs start from 1000 or 1001
  - System users and service accounts have lower UIDs (< 1000).
  - Root User: The root user, also known as the superuser, has a UID of 0. 
- Group ID (GID): primary group ID associated with the user
- User Information: additional information about the user, such as the `full name`, `job title`, or other descriptive details.
- Home Directory
- Login Shell: specifies the command interpreter or shell that is used when the user logs in. 
  
### List current users encrypted passwords

```bash
sudo cat /etc/shadow
```
### Create an user account

```bash
sudo useradd <USERNAME>
```

Create user with home directory

```bash
sudo useradd -m <USERNAME>
```

Create a system user: Useful for automation or background execution

```bash
sudo useradd -r <USERNAME>
```

### Delete an user account

```bash
sudo userdel <USERNAME>
```

Delete user with home directory

```bash
sudo userdel -r <USERNAME>
```

### Change password

Changing my own password
```bash
passwd
```

Changing password for another user
```bash
sudo passwd <USERNAME>
```
