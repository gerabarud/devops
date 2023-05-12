# Monitoring resources in Linux

## Top Command

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
