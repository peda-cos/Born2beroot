# Born2beroot

A system administration project focused on setting up a secure virtual machine with strict rules, implementing monitoring scripts, and understanding fundamental Linux system administration concepts.

## 📋 Table of Contents

- [Born2beroot](#born2beroot)
	- [📋 Table of Contents](#-table-of-contents)
	- [🎯 About the Project](#-about-the-project)
	- [🛠 Technology Stack](#-technology-stack)
	- [🏗 Project Architecture](#-project-architecture)
		- [System Configuration](#system-configuration)
		- [Monitoring System](#monitoring-system)
	- [🚀 Getting Started](#-getting-started)
		- [Prerequisites](#prerequisites)
		- [Installation](#installation)
	- [📁 Project Structure](#-project-structure)
	- [✨ Key Features](#-key-features)
		- [System Monitoring](#system-monitoring)
		- [Security Implementation](#security-implementation)
		- [System Administration](#system-administration)
	- [📊 Monitoring Script](#-monitoring-script)
		- [Usage](#usage)
	- [🔒 Security Configuration](#-security-configuration)
		- [Password Policy](#password-policy)
		- [Sudo Configuration](#sudo-configuration)
		- [Firewall Rules](#firewall-rules)
	- [📝 License](#-license)

## 🎯 About the Project

Born2beroot is a 42 School project that introduces students to the world of virtualization and system administration. The project involves setting up a virtual machine with a Debian-based operating system, configuring strict security policies, and implementing a monitoring system that displays critical system information.

This project teaches fundamental concepts including:
- Virtual machine creation and management
- Linux system administration
- Security policies implementation (password policies, sudo configuration, firewall setup)
- Shell scripting and system monitoring
- LVM (Logical Volume Manager) configuration

## 🛠 Technology Stack

- **Operating System**: Debian (latest stable version) or Rocky Linux
- **Virtualization**: VirtualBox or UTM
- **Shell Scripting**: Bash
- **Security Tools**:
  - UFW (Uncomplicated Firewall) / firewalld
  - SSH (Secure Shell)
  - sudo (superuser do)
- **Monitoring Tools**:
  - System commands (uname, free, df, vmstat, etc.)
  - journalctl for system logs

## 🏗 Project Architecture

The project follows a minimal architecture focused on security and monitoring:

### System Configuration
- **Partition Scheme**: Encrypted LVM partitions for enhanced security
- **Firewall**: Only essential ports are open (SSH on port 4242)
- **Authentication**: Strong password policy enforced
- **Access Control**: Strict sudo configuration with logging

### Monitoring System
- Automated monitoring script that runs every 10 minutes
- System information broadcast via wall command
- Real-time metrics collection and display

## 🚀 Getting Started

### Prerequisites

- VirtualBox or UTM installed on your machine
- Debian ISO or Rocky Linux ISO
- Minimum 8GB disk space
- Basic understanding of Linux commands

### Installation

1. **Create Virtual Machine**
   ```bash
   # Download Debian ISO from official website
   # Create a new VM in VirtualBox with recommended settings
   # Allocate at least 1GB RAM and 8GB disk space
   ```

2. **Install Operating System**
   - Select manual partitioning
   - Set up encrypted LVM partitions according to project requirements
   - Create required partitions (root, swap, home, var, srv, tmp, var/log)

3. **Configure System**
   ```bash
   # Update system
   sudo apt update && sudo apt upgrade -y

   # Install required packages
   sudo apt install ufw sudo openssh-server -y
   ```

4. **Set Up Security Policies**
   ```bash
   # Configure password policy
   sudo nano /etc/login.defs
   sudo nano /etc/pam.d/common-password

   # Configure sudo
   sudo visudo

   # Configure UFW
   sudo ufw enable
   sudo ufw allow 4242
   sudo ufw status

   # Configure SSH
   sudo nano /etc/ssh/sshd_config
   sudo systemctl restart ssh
   ```

5. **Install Monitoring Script**
   ```bash
   # Copy monitoring.sh to /usr/local/bin/
   sudo cp monitoring.sh /usr/local/bin/
   sudo chmod +x /usr/local/bin/monitoring.sh

   # Set up cron job
   sudo crontab -e
   # Add: */10 * * * * /usr/local/bin/monitoring.sh
   ```

## 📁 Project Structure

```
Born2beroot/
├── LICENSE               # MIT License
├── monitoring.sh         # System monitoring script
├── signature.txt         # VM signature for evaluation
└── README.md             # Project documentation
```

## ✨ Key Features

### System Monitoring
- **Real-time Metrics**: Displays architecture, CPU, memory, disk usage, and network information
- **Automated Reporting**: Broadcasts system status every 10 minutes to all logged-in users
- **Security Tracking**: Monitors sudo command usage and active connections

### Security Implementation
- **Strong Password Policy**: Minimum length, complexity requirements, expiration rules
- **Sudo Hardening**: Limited privileges, command logging, TTY requirement, restricted paths
- **Firewall Protection**: Only necessary ports accessible
- **SSH Security**: Root login disabled, key-based authentication, custom port

### System Administration
- **LVM Management**: Flexible disk management with encrypted partitions
- **User Management**: Proper user and group configuration
- **Service Control**: Essential services configured and monitored

## 📊 Monitoring Script

The `monitoring.sh` script displays the following information:

- **Architecture**: Operating system and kernel version
- **CPU Physical**: Number of physical processors
- **vCPU**: Number of virtual processors
- **Memory Usage**: Used/Total RAM with percentage
- **Disk Usage**: Used/Total disk space with percentage
- **CPU Load**: Current CPU utilization percentage
- **Last Boot**: System last boot date and time
- **LVM Use**: Whether LVM is active
- **TCP Connections**: Number of established TCP connections
- **User Log**: Number of logged-in users
- **Network**: IP address and MAC address
- **Sudo**: Total number of executed sudo commands

### Usage

```bash
# Manual execution
sudo /usr/local/bin/monitoring.sh

# Automated via cron (runs every 10 minutes)
# Already configured in crontab
```

## 🔒 Security Configuration

### Password Policy
- Minimum 10 characters
- Must contain uppercase, lowercase, and numbers
- Maximum 30 days validity
- Minimum 2 days before modification
- Warning 7 days before expiration

### Sudo Configuration
- Authentication limited to 3 attempts
- Custom error message for wrong password
- Log all sudo commands to `/var/log/sudo/`
- Archive all sudo I/O to `/var/log/sudo/`
- TTY mode enabled
- Restricted paths for security

### Firewall Rules
- Default: Deny all incoming traffic
- Allow: SSH on port 4242
- All outgoing traffic allowed

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Author**: Pedro Monteiro (peda-cos)
**School**: 42 São Paulo
**Project**: Born2beroot
**Last Updated**: November 2024
