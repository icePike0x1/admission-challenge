#!/bin/bash

# create an ssh map for host
echo 'Host server2
	HostName 192.168.60.11'>> /home/vagrant/.ssh/config

echo 'server2 192.168.60.11'>>/etc/hosts