#!/bin/bash
#
# Copyright (C) 2024 Douglas Riggins (dougriggins@gmail.com)
# Permission to copy and modify is granted under the GNU GPL v3.0
#
# awk:
#   %.2f is for floating point notation, with 2 decimal places
#   %% will add one (1) percentage character
#   printf <formatting>, <expression-list>
#   NR number of input records
#   NR==2 reads only the 2nd record (line)

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # reset text color

# Function for line break
line_break() {
    echo -e "${YELLOW}=========================================${NC}"
}

# Function for CPU usage
get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    printf "%.2f%%" "$cpu_usage"
}

# Function for memory usage
get_memory_usage() {
    free -m | awk 'NR==2{printf "%.2f%% (Used: %s MB, Free: %s MB)", $3*100/$2, $3, $4}'
}

# Function for swap usage
get_swap_usage() {
    free -m | awk 'NR==3{printf "%.2f%% (Used: %s MB, Free: %s MB)", $3*100/$2, $3, $4}'
}

# Function for disk usage
get_disk_usage() {
    df -h | awk '$NF=="/"{printf "%s (Used: %s, Free: %s)", $5, $3, $4}'
}

# Main outputs
echo -e "${CYAN}Server Stats - System Resource Monitor${NC}"
line_break

echo -e "${GREEN}CPU Usage:${NC} $(get_cpu_usage)"
echo -e "${BLUE}Memory Usage:${NC} $(get_memory_usage)"
echo -e "${MAGENTA}Swap Usage:${NC} $(get_swap_usage)"
echo -e "${CYAN}Disk Usage:${NC} $(get_disk_usage)"
echo -e "${GREEN}Uptime:${NC} $(uptime -p | sed 's/up //')"
line_break

echo -e "\n${RED}Top 5 CPU-Intensive Processes:${NC}"
echo -e "%CPU\t PID\t COMMAND"
ps aux --sort=-%cpu | head -n 6 | tail -n 5 | awk '{print $3"%\t", $2"\t", $11}'

echo -e "\n${YELLOW}Top 5 Memory-Intensive Processes:${NC}"
echo -e "%MEM\t PID\t COMMAND"
ps aux --sort=-%mem | head -n 6 | tail -n 5 | awk '{print $4"%\t", $2"\t", $11}'