# Bug-Bounty-Automated-Recon

A comprehensive, automated script for bug bounty recon that combines passive and active data collection, subdomain enumeration, service discovery, vulnerability scanning, and more. This script is designed to streamline the recon process for bug bounty hunters and penetration testers.

# Features:
- **Automated Recon**: Covers all phases of bug bounty recon, from footprinting to vulnerability scanning.
- **Modular Functions**: Individual functions handle specific recon tasks such as WHOIS lookups, subdomain enumeration, and port scanning.
- **Easy Execution**: Run a single command to perform full reconnaissance on a target domain.
- **Integration with Popular Tools**: Includes popular tools like `Amass`, `Subfinder`, `Nmap`, `gau`, `Gobuster`, `ffuf`, `Nuclei`, and more.

# How to Use:
1. Clone this repository:

   ```bash
   git clone https://github.com/Shakibul-CyberSec/Bug-Bounty-Automated-Recon.git
   cd Bug-Bounty-Automated-Recon
   ```
2. Make the script executable:

   ```bash
   chmod +x Bug-Bounty-Automated-Recon.sh
   ```
3. Run the script:
   Use the following command to run the recon script on a target domain:
   
   ```bash
   ./Bug-Bounty-Automated-Recon.sh <target_domain>
   ```
   Example:

   ```bash
   ./Bug-Bounty-Automated-Recon.sh example.com
   ```
 This script automates the reconnaissance process for a target domain by first ensuring that all necessary tools are installed. If any required tools are missing, it automatically installs them before proceeding. Once the dependencies are met, the script initiates a comprehensive recon workflow, including WHOIS lookup, subdomain enumeration, port scanning, and vulnerability scanning. By streamlining these processes, it ensures an efficient and structured approach to gathering intelligence on the target domain.
# Adding Go to PATH
If the Go command is not found on your system, you can easily add it to your PATH using echo. This is a quick way to ensure that Go is accessible from anywhere in your terminal.

Steps to add Go to your PATH:
1. Check if Go is installed: First, check  Reload the Shell Configuration:if Go is installed on your system:

  ```bash
  go version
 ```
If you get a message like command not found, Go is not installed or not in your PATH.
2. Add Go to PATH using echo: Use the following commands to add Go to your PATH depending on your shell.

 ```bash
echo 'export GOPATH=$HOME/go' >> ~/.zshrc   # If you're using zsh
# or
echo 'export GOPATH=$HOME/go' >> ~/.bashrc  # If you're using bash
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc  # or ~/.bashrc
```
3. Reload the Shell Configuration:

   ```bash
    source ~/.zshrc   # or source ~/.bashrc
   ```
   
 
# Recon Process Workflow:
1. Initial Footprinting & Passive Data Collection
   - WHOIS Lookup
2. Subdomain & Asset Enumeration
   - Amass
   - Subfinder
3. Service Discovery
   - Full Port Scan with Nmap
   - Fast Scan with MassScan
4. Content & Directory Discovery
   - gau (GetAllUrls)
   - Gobuster (Directory Bruteforce)
   - ffuf (Directory Bruteforce)
   - Arjun (Parameter Discovery)
5. Technology Fingerprinting
   - WhatWeb
6. Vulnerability Scanning
   - Nuclei

# Contributing:
Contributions are welcome! If you have any suggestions, improvements, or bug fixes, feel free to open an issue or submit a pull request.
# License:
This project is licensed under the MIT License - see the LICENSE file for details.
   

