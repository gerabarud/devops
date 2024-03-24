## fdisk

Create, modify, delete, and display partitions on a hard drive or storage device. 

**Basic Usage:**
```bash
fdisk [options] device
```

- `options`: Various options that customize the behavior of `fdisk`.
- `device`: The name of the block device you want to work with, such as `/dev/sda`, `/dev/nvme0n1`, or similar.

**Common Options:**

- `-l` or `--list`: List all partitions on all devices.
- `-u` or `--units`: Display sizes in sectors by default.

**Common `fdisk` Commands:**

1. **Start `fdisk`:**
   ```bash
   sudo fdisk /dev/sdX
   ```

2. **Display Partition Information:**
   ```bash
   p
   ```

3. **Create a New Partition:**
   ```bash
   n
   ```

4. **Delete a Partition:**
   ```bash
   d
   ```

5. **Change Partition Type:**
   ```bash
   t
   ```

6. **Write Changes to Disk:**
   ```bash
   w
   ```

7. **Quit Without Saving:**
   ```bash
   q
   ```


