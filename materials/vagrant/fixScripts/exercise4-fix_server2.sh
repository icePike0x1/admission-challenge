#!/bin/bash

# create an ssh map for host
echo 'Host server1
	HostName 192.168.60.10'>> /home/vagrant/.ssh/config

echo 'server1 192.168.60.10'>>/etc/hosts