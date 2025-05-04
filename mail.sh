
#!/bin/bash

# Update package list and install msmtp and related tools
sudo apt-get update
sudo apt-get install -y msmtp msmtp-mta ca-certificates
sudo apt-get install -y mailutils

# Create the msmtp configuration directory
mkdir -p ~/.msmtp

# Create the msmtp configuration file
cat <<EOF > ~/.msmtp
# Set default values for all accounts
defaults
auth            on
tls             on
tls_trust_file  /etc/ssl/certs/ca-certificates.crt
logfile         ~/.msmtp/msmtp.log

# Gmail account
account         gmail
host            smtp.gmail.com
port            587
from            prajnap46@gmail.com
user            prajnap46@gmail.com
password        irkmwwbomwgjfnzw

# Set the default account
account default : gmail
EOF

# Set correct permissions for the msmtp configuration file and log file
touch ~/.msmtp/msmtp.log
chmod 600 ~/.msmtp/msmtp.log

echo "msmtp configuration completed. You can now send emails using the configured Gmail account."
