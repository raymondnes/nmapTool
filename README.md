# NMAP Utility Tool

An all-in-one Bash script designed to leverage the power of **Nmap**, a powerful network scanning tool, to perform a variety of network reconnaissance and analysis tasks. This script simplifies complex Nmap operations, providing users with predefined options for different types of scans, making it user-friendly and efficient for beginners and experts alike.

## Features
This script allows you to:

1. **Scan Top 1000 Ports with Verbosity Levels**:
   - Quickly identify active services and open ports.

2. **Aggressive Ping Sweep**:
   - Detect live hosts on a network.

3. **Comprehensive Scan (OS Detection, Version Detection, Script Scanning, and Traceroute)**:
   - Gather detailed information about the target(s) from a file input.

4. **Custom Port Range Scan**:
   - Perform targeted scans on specific ports (e.g., `1-65535`).

5. **Service and Version Detection**:
   - Identify the specific services running on the open ports.

6. **Default and Safe NSE Script Scan**:
   - Utilize Nmap's safe scripts to detect vulnerabilities and gather data.

7. **Web Server Detection (HTTP NSE Scripts)**:
   - Identify web servers running on standard ports 80 and 443.

8. **Evade IDS/IPS Detection**:
   - Perform stealth scans using decoys, fragmented packets, and randomized data.

---

## Prerequisites
Before using the script, ensure you have the following installed on your system:

1. **Nmap**:
   - Install Nmap using your package manager:
     ```bash
     sudo apt install nmap        # For Debian/Ubuntu
     sudo yum install nmap        # For CentOS/RHEL
     sudo pacman -S nmap          # For Arch Linux
     ```

2. **Bash**:
   - This script is designed for Bash, which is pre-installed on most Linux distributions.

---

## Installation
Follow these steps to download and run the script:

1. Clone or download the repository:
   ```bash
   git clone https://github.com/your-username/nmap-utility-tool.git
   cd nmap-utility-tool
   ```

2. Make the script executable:
   ```bash
   chmod +x nmaptool.sh
   ```

3. Run the script:
   ```bash
   ./nmaptool.sh
   ```

---

## Usage Guide
When you run the script, it will display a list of available scan options. Simply select the desired scan by entering the corresponding number and provide the required input (e.g., domain, IP address, or file path).

### Example Workflow
1. Run the script:
   ```bash
   ./nmapTool.sh 
   ```
   ## OR
   
   ```bash
   bash nmapTool.sh
   ```

2. Choose an option:
   ```
   Available Scan Options:

   01. Scan Top 1000 Ports with Verbosity Levels
   02. Aggressive Ping Sweep
   03. Enable OS Detection, Version Detection, Script Scanning, and Traceroute (from a file)
   04. Scan Specific Ports (e.g., 1-65535)
   05. Service and Version Detection of Top 1000 Ports
   06. Scan Using Default and Safe NSE Scripts
   07. Scan for Web Servers (Port 80 and 443) Using HTTP NSE Scripts
   08. Evade IDS/IPS (Slow Scan, Decoy, Fragmentation, Random Data)

   Choose an option (1-8): 1
   ```

3. Enter the target:
   ```
   Enter the target domain, host, or IP address: example.com
   ```

4. View results:
   - The script will perform the scan and display the output in real-time.

---

## Features Explained

### 1. **Scan Top 1000 Ports with Verbosity Levels**
   - Use this to quickly identify open ports and running services.
   - Command used: `nmap -v1 <target>`

### 2. **Aggressive Ping Sweep**
   - Find live hosts in a network.
   - Command used: `nmap -sn <target>`

### 3. **OS Detection, Version Detection, Script Scanning, and Traceroute (from a file)**
   - Perform a comprehensive scan on multiple targets.
   - Command used: `nmap -A -iL <file>`

### 4. **Custom Port Range Scan**
   - Scan specific ports or a range of ports (e.g., `1-65535`).
   - Command used: `nmap -p <ports> <target>`

### 5. **Service and Version Detection**
   - Identify detailed service information on open ports.
   - Command used: `nmap -sV <target>`

### 6. **Default and Safe NSE Script Scan**
   - Utilize Nmap’s safe scripts to analyze the target.
   - Command used: `nmap --script=safe <target>`

### 7. **Web Server Detection (HTTP NSE Scripts)**
   - Scan for HTTP vulnerabilities and gather information about web servers.
   - Command used: `nmap -p 80,443 --script=http* <target>`

### 8. **Evade IDS/IPS Detection**
   - Use stealthy techniques to bypass detection mechanisms.
   - Command used: `nmap -sS -T2 -D RND:10 -f -data-length 64 <target>`

---

## Tips for Harnessing the Script’s Power
1. **Start Small**:
   - If you're new to Nmap, start with option 1 to understand basic port scanning.

2. **File Scans**:
   - Use option 3 to scan multiple hosts by providing a file containing a list of IPs/domains.

3. **Evade Detection**:
   - Option 8 can be particularly useful for penetration testers working in environments with strict monitoring systems.

4. **Combine with Other Tools**:
   - Use the script output with tools like Wireshark for advanced network analysis.

---

## Troubleshooting
- **Error: Command not found**:
   - Ensure Nmap is installed. Run:
     ```bash
     sudo apt install nmap
     ```

- **File Not Found (Option 3)**:
   - Make sure the input file exists and provide the correct path.

- **Permission Denied**:
   - Ensure the script is executable:
     ```bash
     chmod +x nmapTool.sh
     ```

---

## Disclaimer
This tool is intended for ethical use only. Ensure you have permission before scanning any target. Unauthorized scanning may violate laws and regulations.

---

## Contribution
Feel free to contribute to this project by submitting a pull request on [GitHub](https://github.com/raymondnes/nmapTool).

---

Happy Scanning!


