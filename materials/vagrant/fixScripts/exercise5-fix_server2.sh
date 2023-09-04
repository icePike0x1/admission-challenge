#!/bin/bash

#Enable password authentication
#sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Disable fingerprint checking for server1
#echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config

# restart ssh services
sudo service sshd restart
	   
if [ ! -d "/home/vagrant/.ssh" ]; then
    mkdir -p '/home/vagrant/.ssh'
fi

if [ ! -f "/home/vagrant/.ssh/authorized_keys" ]; then
    touch '/home/vagrant/.ssh/authorized_keys'	
fi

# creating a private key
echo '...creating private key in /home/vagrant/.ssh...'
echo '-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----' > /home/vagrant/.ssh/id_rsa

# checking/fixing permissions on ~/.ssh dir
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh

# check/fix permissions on private key
chmod 600 /home/vagrant/.ssh/id_rsa


# creating a public key
echo '...creating public key in /home/vagrant/.ssh/authorized_keys...'
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8n9Ssp/ne/+LYi3Tuv001AAArS9EdhlUVJY2I51+ebLOPAH5AbuNjMvBwjgxlYKsEvozeKPiHHK1YmzJWMj89W56kNv6B9JahcoWL040a54u8m9fflep+q1vicwv9VVH3LyzMVkhOVx2FOYpAL0/ILhqHgUrbEJ+bJ/HeI+BK+t6ibu+1NOcHqgx4+0cQw3qNtq3UaRi6+0Z+QtdNCWNGPlzhQK/EjVob/sy/YIVTXKCLcuXY0ZXfgPwcrShbnsrFdKeo6ZwYmUBnkgbXmPJtryVSpuLba2O/uBF6YIerHgi/rFu5eSTgl2PHekDZFs6+HWaPhsIoo7+RlrtyYA8AjNpERiHhr3/HLWPIbCM+kOzUeKgCnvXn26K0IqiECRNn3U2Qt5Lag1xrmLeBEP9hM6Sr5D7b/0eSeGB9Ai2Q5BtnQms5qbJdI03BcF6CVWWzthrlcxgnF1S+eHtTaBvMAfQS0i15iDesPdmleFiKjiutH6xD9GWmBFsdN34ME40= root@server1' >> /home/vagrant/.ssh/authorized_keys
#chmod 600 /home/vagrant/.ssh/authorized_keys


# test copy script
#echo '.......COPYING SOME FILES........'
#/vagrant/fixScripts/exercise6-fix.sh /home/vagrant/.profile /home/vagrant/.bash_logout /tmp/


echo '!!!ALL DONE...!!!'
