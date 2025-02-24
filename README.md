# Bug-Bounty-Automated-Recon

A comprehensive, automated script for bug bounty recon that combines passive and active data collection, subdomain enumeration, service discovery, vulnerability scanning, and more. This script is designed to streamline the recon process for bug bounty hunters and penetration testers.

# Features:
- **Automated Recon**: Covers all phases of bug bounty recon, from footprinting to vulnerability scanning.
- **Modular Functions**: Individual functions handle specific recon tasks such as WHOIS lookups, subdomain enumeration, and port scanning.
- **Easy Execution**: Run a single command to perform full reconnaissance on a target domain.
- **Integration with Popular Tools**: Includes popular tools like `Amass`, `Subfinder`, `Nmap`, `gau`, `Gobuster`, `ffuf`, `Nuclei`, and more.

# Tools Required:
This script integrates with several external tools that need to be installed beforehand:

- [Amass](https://github.com/OWASP/Amass)
- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Altdns](https://github.com/infosec-au/altdns)
- [DNSGen](https://github.com/dwisiswant0/dnsgen)
- [Nmap](https://nmap.org/)
- [MassScan](https://github.com/robertdavidgraham/masscan)
- [Gau](https://github.com/lc/gau)
- [Gobuster](https://github.com/OJ/gobuster)
- [ffuf](https://github.com/ffuf/ffuf)
- [Arjun](https://github.com/s0md3v/Arjun)
- [Gitrob](https://github.com/michenriksen/gitrob)
- [TruffleHog](https://github.com/dxa4481/truffleHog)
- [Wappalyzer](https://github.com/AliasIO/Wappalyzer)
- [Nuclei](https://github.com/projectdiscovery/nuclei)
- [gf](https://github.com/1ndianl33t/Gf-Patterns)

# **Install Dependencies:**
Make sure to install the necessary tools by running the following commands:
# Install tools using apt-get
  ```bash
  sudo apt-get update
  sudo apt-get install nmap masscan
  ```
# Install Go-based tools

  ```bash
  go install github.com/OWASP/Amass/v3@latest
  go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
  go install github.com/tomnomnom/assetfinder@latest
  go install github.com/infosec-au/altdns@latest
  go install github.com/dwisiswant0/dnsgen@latest
  go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/OJ/gobuster/v3@latest
go install github.com/s0md3v/Arjun@latest
go install github.com/michenriksen/gitrob@latest
go install github.com/dxa4481/truffleHog@latest
go install github.com/AliasIO/Wappalyzer@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/1ndianl33t/Gf-Patterns@latest
```
Refer to each tool's GitHub page for more installation instructions.
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
This will automatically start the recon process for the target domain, performing various steps such as WHOIS lookup, subdomain enumeration, port scanning, vulnerability scanning, and more.

# Recon Process Workflow:
1. Initial Footprinting & Passive Data Collection
   - WHOIS Lookup
   - Certificate Transparency Logs
2. Subdomain & Asset Enumeration
   - Amass (Passive Mode)
   - Subfinder
   - Assetfinder
   - DNS Permutations with Altdns
   - DNS Generation with DNSGen
3. Service Discovery
   - Full Port Scan with Nmap
   - Fast Scan with MassScan
4. Content & Directory Discovery
   - gau (GetAllUrls)
   - Gobuster (Directory Bruteforce)
   - ffuf (Directory Bruteforce)
   - Arjun (Parameter Discovery)
5. Source Code & GitHub Recon
   - Gitrob (Search for Exposed Data)
   - TruffleHog (Scan for Secrets)
6. Technology Fingerprinting
   - Wappalyzer / BuiltWith
7. Vulnerability Scanning
   - Nuclei
8. Pattern Matching & Filtering
   - gf (Extract Interesting Patterns)
   

