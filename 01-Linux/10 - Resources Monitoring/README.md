# Monitoring resources in Linux

## `lscpu`

The `lscpu` command is used to display information about the CPU.

**Basic Usage:**
```bash
lscpu
```

This command will typically display output that includes:

- CPU family and model.
- Number of CPU cores.
- Number of threads per core.
- CPU clock frequency.
- CPU vendor information.
- CPU architecture (e.g., x86_64).

## `lsmem`

The `lsmem` command is used to display information about the system's physical and usable memory, including NUMA (Non-Uniform Memory Access) nodes. It provides details about the total memory, free memory, memory ranges, and memory policies.

**Basic Usage:**
```bash
lsmem
```

**Common Options:**

- `-b`, `--online`: Show only online CPUs.
- `-c`, `--offline`: Show only offline CPUs.
- `-p`, `--online-core`: Show only online CPU cores.
- `-d`, `--online-socket`: Show only online CPU sockets.
- `-e`, `--online-node`: Show only online NUMA nodes.
- `-x`, `--extended[=list]`: Show an extended readable format with additional information.

## `lsof`
The `lsof` (List Open Files) command is used to list all open files and processes currently running on a system. It provides detailed information about which processes have files or network sockets open, what files are open, and other useful details.

**Basic Usage:**
```bash
lsof
```

**Common Options and Use Cases:**

1. **List Files Opened by a Specific User:**
   ```bash
   lsof -u username
   ```

2. **List Files Opened by a Specific Process:**
   ```bash
   lsof -p PID
   ```

3. **List Files Associated with a Specific File Descriptor (FD):**
   ```bash
   lsof -p PID -d FD
   ```
4. **List Files Opened by a Specific Command or Binary:**
   ```bash
   lsof -c command_name
   ```

5. **List Network Sockets and Ports:**
   ```bash
   lsof -i
   ```
6. **List Files for a Specific Directory:**
   ```bash
   lsof /path/to/directory
   ```

7. **List Deleted Files Still in Use:**
   ```bash
   lsof -n | grep deleted
   ```

## `ps`

 Provide information about currently running processes. It displays a list of processes running on the system, along with various details such as their Process ID (PID), CPU usage, memory usage, and more.

**Basic Usage:**
```bash
ps
```

**Common Options and Use Cases:**

1. **List All Processes:**
   ```bash
   ps -e
   ```
   > Lists all processes on the system, not just those associated with the current terminal session.

2. **List Detailed Process Information:**
   ```bash
   ps aux
   ```
   
3. **List Processes for a Specific User:**
   ```bash
   ps -u username
   ```
   
4. **List Process Hierarchy (Tree View):**
   ```bash
   ps -ejH
   ```
   
5. **List Processes by Process Group:**
   ```bash
   ps -g process_group
   ```
   
6. **List Processes by Terminal (TTY):**
   ```bash
   ps -t tty
   ```
   
7. **Customize Output Format:**
   ```bash
   ps -o option
   ```
   > For example, `ps -o pid,user,%cpu,%mem,cmd` displays columns for PID, user, CPU usage, memory usage, and command.

8. **Sort Processes:**
   ```bash
   ps aux --sort=-%cpu
   ```
   
9. **Display Threads:**
   ```bash
   ps -T
   ```
   This option displays threads in addition to processes.

10. **Continuous Monitoring:**
    ```bash
    ps -e --forest --watch
    ```
    > The `--forest` option displays processes in a tree view.

11. **View Process Details by PID:**
    ```bash
    ps -p PID
    ```
12.  **View processes listing in a hierarchical tree structure**
    ```bash
    ps fax
    ```

## `top`

`top` command used to monitor system processes in real-time. It provides a dynamic, interactive view of the processes running on a Linux system, displaying information such as CPU usage, memory usage, process IDs (PIDs), and other relevant details.

### Basic usage:
```bash
top
```

> Once inside the top command: <br>
> `V` -> Process childrens visualization <br>
> `P` -> Order by **process** usage <br>
> `M` -> Order by **memory** usage <br>
> `k` -> Kill a process (requieres PID) <br>
> `d` -> Change refresh frequency (requieres seconds) <br> 
> `t` -> CPU ASCII Grafh  <br> 
> `m` -> Mem ASCII Grafh  <br> 
> `c` -> Full executed command  <br> 

### Output overview

Tasks:

- `total` shows the sum of the processes from any state.
- `running` shows how many processes are handling requests, - executing normally, and have CPU access.
- `sleeping` indicates processes awaiting resources, which is a normal state.
- `stopped` reports processes exiting and releasing resources; these send a termination message to the parent process.
- `zombie` refers to a process waiting for its parent process to release it; it may become orphaned if the parent exits first.


CPU: 

- `us`: Amount of time the CPU spends executing processes for people in “user space.”
- `sy`: Amount of time spent running system “kernel space” processes.
- `ni`: Amount of time spent executing processes with a manually set nice value.
- `id`: Amount of CPU idle time.
wa: Amount of time the CPU spends waiting for I/O to complete.
- `hi`: Amount of time spent servicing hardware interrupts.
- `si`: Amount of time spent servicing software interrupts.
- `st`: Amount of time lost due to running virtual machines (“steal time”).

## `w`

The `w` command in Linux is used to display information about currently logged-in users and what they are doing on the system. It provides details about the users, their terminal sessions, login times, and running processes. Here's how to use the `w` command:

**Basic Usage:**
```bash
w
```

Displays a information about uptime and connected users

1. **USER**: The username of the logged-in user.
2. **TTY**: The terminal type (e.g., "pts/0" for a pseudo-terminal, "tty1" for a physical terminal).
3. **FROM**: The remote hostname or IP address from which the user is logged in. If it's a local login, you'll see the IP address "0.0.0.0."
4. **LOGIN@**: The login time, showing the time the user logged in.
5. **IDLE**: The idle time, indicating how long the user has been idle.
6. **JCPU**: The total CPU time used by the user's processes (in the format hh:mm:ss).
7. **PCPU**: The CPU time used by the user's current process (in the format hh:mm:ss).
8. **WHAT**: The command or process name the user is running.

Here's an example of what the output might look like:

```plaintext
 11:05:22 up 5 days,  1:20,  3 users,  load average: 0.08, 0.07, 0.06
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
john     pts/0    192.168.1.100    10:30   5:15m  0.02s  0.02s sshd: john [priv]
jane     pts/1    192.168.1.101    09:45   0.00s  0.14s  0.02s bash
smith    pts/2    192.168.1.102    09:00   2:15   0.08s  0.08s vim file.txt
```

**Common Options:**

- `-h`: Suppress the header row, showing only the user information.
- `-s`: Display only a summary of the current users and load average without details.
- `-u`: Show extended information, including the user's process details.