# Born2beroot

## Introduction

The Born2beroot project aims to introduce users to the fundamentals of virtualization. The goal is to create a virtual machine using VirtualBox (or UTM if VirtualBox is not available) and configure it according to specific guidelines. This project helps users set up their own operating system while adhering to strict rules.

## General Guidelines

- Using VirtualBox (or UTM) for virtualization is mandatory.
- The only file required for submission is `signature.txt`, which contains the signature of your virtual machine's disk.

## Project Requirements

### Operating System

- Choose between the latest stable versions of Debian or Rocky.
- Debian is recommended for those new to system administration.
- For Rocky, SELinux must be active at startup, but KDump setup is not required. For Debian, AppArmor must be active at startup.

### Partitioning

- Create at least two encrypted partitions using LVM.

### SSH Configuration

- SSH service must run on port 4242 only.
- Root login via SSH is prohibited.
- Configure the firewall to allow only port 4242.

### Hostname and Users

- The hostname must end with "42" (e.g., `user42`).
- Implement a strong password policy.
- Configure sudo with specific rules.
- Create a user with your login name and add it to the `user42` and `sudo` groups.

### Password Policy

- Passwords expire every 30 days.
- Minimum of 2 days between password changes.
- Warning issued 7 days before password expiry.
- Passwords must be at least 10 characters long, include uppercase and lowercase letters, a number, and not contain more than 3 consecutive identical characters or the username.

### Sudo Configuration

- Limit sudo authentication attempts to 3.
- Display a custom message on incorrect password attempts.
- Log all sudo actions to `/var/log/sudo/`.
- Enable TTY mode.
- Restrict sudo paths for security.

### Monitoring Script

Create a `monitoring.sh` script that displays the following information every 10 minutes on all terminals:

- OS architecture and kernel version
- Number of physical and virtual processors
- Available RAM and memory usage
- CPU utilization rate
- Last reboot date and time
- LVM status
- Number of active connections
- Number of logged-in users
- IPv4 address and MAC address
- Number of sudo commands executed
