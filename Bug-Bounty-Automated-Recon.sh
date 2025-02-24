#!/bin/bash

# Function to check if a tool is installed and, if not, prompt to install it.
check_install() {
    tool=$1
    install_command=$2
    if ! command -v "$tool" > /dev/null 2>&1; then
        read -p "[!] $tool is not installed. Do you want to install it now? (y/n): " answer
        if [ "$answer" = "y" ]; then
            echo "[*] Installing $tool..."
            eval "$install_command"
        else
            echo "[!] $tool is required for full functionality. Exiting..."
            exit 1
        fi
    fi
}

# Ensure pip3 is installed before installing Python-based tools
check_install "pip3" "sudo apt-get install python3-pip -y"

# Ensure pipx is installed before using it
check_install "pipx" "sudo apt install pipx -y"

# Check for required tools
check_install "whatweb" "sudo apt-get install whatweb -y"
check_install "arjun" "pipx install git+https://github.com/s0md3v/Arjun.git"
check_install "nuclei" "wget https://github.com/projectdiscovery/nuclei/releases/download/v3.3.8/nuclei-linux-amd64-v3.3.8.tar.gz && tar -xvzf nuclei-linux-amd64-v3.3.8.tar.gz && sudo mv nuclei /usr/local/bin"
check_install "amass" "sudo apt-get install amass -y"
check_install "subfinder" "sudo apt-get install subfinder -y"
check_install "nmap" "sudo apt-get install nmap -y"
check_install "masscan" "sudo apt-get install masscan -y"
check_install "gau" "sudo apt-get install gau -y"
check_install "gobuster" "sudo apt-get install gobuster -y"
check_install "ffuf" "sudo apt-get install ffuf -y"
check_install "whois" "sudo apt-get install whois -y"

# Function to create a directory for storing results
create_directory() {
    target=$1
    mkdir -p "Recon_Results/$target"
    echo "[*] Results will be saved in Recon_Results/$target"
}

# Function for running a command and saving output to a file
run_and_save() {
    cmd="$1"
    file="$2"
    echo "[*] Running: $cmd"
    eval "$cmd" | tee "$file"
}

# Main Function
main() {
    target=$1
    create_directory "$target"

    echo "[*] Starting Recon on $target"

    # Prompt for wordlist (used in Gobuster and FFUF)
    read -p "[?] Enter the path to the wordlist for Gobuster & FFUF (default: /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt): " wordlist
    wordlist=${wordlist:-/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt}

    # Prompt for nuclei template directory
    read -p "[?] Enter the path to the Nuclei template directory (default: /root/nuclei-templates): " nuclei_templates
    nuclei_templates=${nuclei_templates:-/root/nuclei-templates}

    # Prompt for Arjun parameter fuzzing URL
    read -p "[?] Enter a URL for Arjun parameter fuzzing (e.g., https://example.com/page): " arjun_url

    run_and_save "whois $target" "Recon_Results/$target/whois.txt"
    run_and_save "amass enum -d $target" "Recon_Results/$target/amass.txt"
    run_and_save "subfinder -d $target" "Recon_Results/$target/subfinder.txt"
    run_and_save "nmap -sV $target" "Recon_Results/$target/nmap.txt"
    run_and_save "masscan $target -p1-65535 --rate 1000" "Recon_Results/$target/masscan.txt"
    run_and_save "gau $target" "Recon_Results/$target/gau.txt"
    run_and_save "gobuster dir -u http://$target -w $wordlist" "Recon_Results/$target/gobuster.txt"
    run_and_save "ffuf -u http://$target/FUZZ -w $wordlist" "Recon_Results/$target/ffuf.txt"
    run_and_save "arjun -u $arjun_url" "Recon_Results/$target/arjun.txt"
    run_and_save "whatweb $target" "Recon_Results/$target/whatweb.txt"
    run_and_save "nuclei -u http://$target -t $nuclei_templates" "Recon_Results/$target/nuclei.txt"

    echo "[*] Recon Completed for $target. Results saved in Recon_Results/$target"
}

# Check for target domain argument and run the main function.
if [ -z "$1" ]; then
    echo "[!] Please provide a target domain."
    echo "Usage: ./Bug-Bounty-Automated-Recon.sh <domain>"
else
    main "$1"
fi
