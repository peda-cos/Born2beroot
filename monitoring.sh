# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: peda-cos <peda-cos@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/18 19:58:36 by peda-cos          #+#    #+#              #
#    Updated: 2024/11/18 19:59:03 by peda-cos         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

message=$(cat << EOF
#Architecture: $(uname -a)
#CPU physical: $(lscpu | grep -E '^CPU\(s\)' | awk '{print $2}')
#vCPU: $(lscpu | grep -E 'Thread' | awk '{print $4}')
#Memory Usage: $(free -m | grep Mem | awk '{printf("%d/%dMB (%.2f%%)", $3, $2, $3/$2 * 100)}')
#Disk Usage: $(df -h --total | grep total | awk '{printf("%s/%s (%s)", $3, $2, $5)}')
#CPU load: $(vmstat 1 2 | awk 'NR==4 {printf("%.1f%%", 100 -$15)}')
#Last boot: $(who -b | awk '{print $3, $4}')
#LVM use: $(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
#Connections TCP: $(ss -t | grep ESTAB | wc -l) ESTABLISHED
#User log: $(who | wc -l)
#Network: IP $(hostname -I)($(ip link | grep ether | awk '{print $2}'))
#Sudo: $(journalctl _COMM=sudo | grep COMMAND | wc -l) cmd
EOF
)

echo "$message" | wall

