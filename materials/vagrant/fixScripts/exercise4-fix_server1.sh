#!/bin/bash

# create an ssh map for host
echo 'Host server2
	HostName 192.168.60.11'>> /home/vagrant/.ssh/config

echo '192.168.60.11  server2'>>/etc/hosts
