## Roadmap.sh project: Server performance stats
Write a script that will analyze and print out basic server performance statistics, such as:
- Total CPU usage
- Total memory usage (free and used)
- Total disk usage (free and used)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage
- Other interesting data

**URL to project on roadmap.sh:**
- [Server Performance Stats](https://roadmap.sh/projects/server-stats)

## How to run:
Ensure the file is executable with:

```Bash
chmod +x server-stats.sh
```

Execute/run the file from the same directory with:

```Bash
./server-stats.sh
```

## Resources
To create this script I referenced the following:
- [awk(1) man page](https://linux.die.net/man/1/awk)
- [Bash colours](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html)
- [More Bash Colors](https://gist.github.com/vratiu/9780109)
- [uptime man page](https://man7.org/linux/man-pages/man1/uptime.1.html)