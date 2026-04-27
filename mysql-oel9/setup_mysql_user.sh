#!/bin/bash

# Ensure the script is run as root                                                                                                                                                           
if [ "$EUID" -ne 0 ]; then                                                                                                                                                                   
	echo "Please run as root or using sudo."                                                                                                                                                   
	exit 1                                                                                                                                                                                    
fi 

# Configuration 
USERNAME="mysql_admin"                                                                                                                                                                             
USER_HOME="/data/mysql"                                                                                                                                                                      
SUDOERS_CONF="/etc/sudoers.d/$USERNAME"                                                                                                                                                      
echo "Step 1: Creating directory and user..."                                                                                                                                                
# Create the parent directory if it doesn't exist                                                                                                                                            
mkdir -p /data                                                                                                                                                                               
# Create the user with the specified home directory                                                                                                                                          
# -d: path to home                                                                                                                                                                           
# -m: create the home directory                                                                                                                                                              
# -s: set default shell                                                                                                                                                                      
if id "$USERNAME" &>/dev/null; then                                                                                                                                                          
     echo "User '$USERNAME' already exists. Updating home directory..."                                                                                                                       
     usermod -d "$USER_HOME" -m "$USERNAME"                                                                                                                                                   
else                                                                                                                                                                                         
     useradd -d "$USER_HOME" -m -s /bin/bash "$USERNAME"                                                                                                                                      
     echo "User '$USERNAME' created."                                                                                                                                                         
fi                                                                                                                                                                                           
# Ensure correct ownership                                                                                                                                                                   
chown "$USERNAME":"$USERNAME" "$USER_HOME"                                                                                                                                                   
echo "Step 2: Granting sudo access..."                                                                                                                                                       
# Create the sudoers.d file                                                                                                                                                                  
# This grants full sudo access without a password.                                                                                                                                           
# Change 'NOPASSWD:ALL' to 'ALL' if you want to require a password.                                                                                                                          
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "$SUDOERS_CONF"                                                                                                                                    
# Set strictly required permissions for sudoers files                                                                                                                                        
chmod 0440 "$SUDOERS_CONF"                                                                                                                                                                   
echo "Success: User '$USERNAME' setup at '$USER_HOME' with sudo access."                                                                                                                     
