#!/bin/bash

# Sean Teo Wei Chong (S28) CFC020823 Tushar

# Define the name of the package to install (source from chatgpt)
package_name=geoip-bin

# Check if the package is already installed
if dpkg -l | grep -q "$package_name"; then
  echo "Package '$package_name' is already installed."
else
  # Install the package
  sudo apt-get install -y $package_name

  # Check if the installation was successful
  if [ $? -eq 0 ]; then
    echo "Package '$package_name' has been successfully installed."
  else
    echo "Failed to install package '$package_name'."
  fi
fi

# Define the name of the package to install
package_name=sshpass

# Check if the package is already installed
if dpkg -l | grep -q "$package_name"; then
  echo "Package '$package_name' is already installed."
else
  # Install the package
  sudo apt-get install -y $package_name

  # Check if the installation was successful
  if [ $? -eq 0 ]; then
    echo "Package '$package_name' has been successfully installed."
  else
    echo "Failed to install package '$package_name'."
  fi
fi

# Define the name of the package to install
package_name=tor

# Check if the package is already installed
if dpkg -l | grep -q "$package_name"; then
  echo "Package '$package_name' is already installed."
else
  # Install the package
  sudo apt-get install -y $package_name

  # Check if the installation was successful
  if [ $? -eq 0 ]; then
    echo "Package '$package_name' has been successfully installed."
  else
    echo "Failed to install package '$package_name'."
  fi
fi

# Check if Tor is running
if ps aux | grep -q "[t]or"; then
  echo "Tor is already running."
else
  # Start Tor
  echo "Starting Tor..."
  tor &
  sleep 5  # Wait for Tor to start (adjust the duration as needed)
  if ps aux | grep -q "[t]or"; then
    echo "Tor is now running."
  else
    echo "Failed to start Tor."
  fi
fi


# Remote server details

USERNAME=cfc020823
PASSWORD=cfc020823!
REMOTE_SERVER=157.245.52.40

# Connect to remote server and execute commands
connect_and_execute() {
    	
	echo "Details of the remote server:"
	sshpass -p $PASSWORD ssh $USERNAME@$REMOTE_SERVER "echo 'IP:' && hostname -I; echo 'Uptime:' && uptime"
	
		
}

# Function to get spoofed country name
get_spoofed_country() {
    spoofed_country=$(geoiplookup $REMOTE_SERVER | awk '{print $5}')
    echo "Spoofed Country: $spoofed_country"
}

# Function to scan for open ports on a target address and save output
scan_for_ports() {
    target_address="$target_address"
    result=$(nmap -F $target_address -oN nmap_results.txt)
    echo "Port Scan Result saved and output to nmap_results.txt"
    
}

# Function to perform whois lookup on the target address
perform_whois() {
	
  whois $target_address > whois_data.txt
}


# Main menu
while true; do
    echo "Main Menu:"
    echo "1. Details of the remote server: "
    echo "2. Check if connection is anonymous (Spoofed Country)"
    echo "3. Scan for open ports on a target address"
    echo "4. Exit"
    read -p "Enter your choice (1/2/3/4): " choice

    case "$choice" in
        1)
			connect_and_execute
			;;
		2)
            get_spoofed_country
            ;;
        3)
            read -p "Enter the target address to scan: " target_address
            scan_for_ports "$target_address"
            ;;
        4)
         
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select 1, 2, 3 or 4."
            ;;
    esac
done

# Function to check if the network connection is anonymous
#function
n() {
#	if [[ "$(curl -s https://check.torproject.org/ | grep -o 'Congratulations' | wc -l)" -eq
#		echo "Your network connection is not anonymous. Please use Tor or a VPN."
#		exit 1
	
#fi
#}


# Check if nipe is already installed
#if [ -x "$(command -v nipe)" ]; then
#  echo "nipe is already installed."
#else
  # Install nipe
#  git clone https://github.com/htrgouvea/nipe && cd nipe
#  sudo apt install cpanminus && sudo cpanm --installdeps && sudo perl nipe.pl install

  # Check if the installation was successful
#  if [ -x "$(command -v nipe)" ]; then
#    echo "nipe has been successfully installed."
#  else
#    echo "Failed to install nipe."
#  fi
#fi

