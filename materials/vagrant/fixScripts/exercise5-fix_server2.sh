#!/bin/bash

#Enable password authentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Disable fingerprint checking for server1
#echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config

# restart ssh services
sudo service sshd restart
sudo service ssh restart 

# Generate SSH key pair if it doesn't exist		   
if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -N ''
fi

# Print the public key
cat /home/vagrant/.ssh/id_rsa.pub

# install sshpass util
sudo apt-get update
sudo apt-get install -y sshpass

# set permissions on .pub file
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys

# copy .pub key to user's home directory on server1
sshpass -p 'vagrant' ssh-copy-id -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.60.10 

# copy .pub key from server1 to local home directory
sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@192.168.60.10 'sh -c "sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.60.11&&sudo sed -i '\''s/PasswordAuthentication yes/PasswordAuthentication no/g'\'' /etc/ssh/sshd_config"'

# disable password authentication
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/ssh_config
sudo service sshd restart
