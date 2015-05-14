#!/bin/bash
# $1 - IP address of the node

# add stackato to sudoers so rename doesn't prompt for pw
chmod u+w /etc/sudoers
echo "stackato        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
chmod u-w /etc/sudoers

# wait for stackato to boot
sudo su -l stackato -c "/home/stackato/bin/kato process ready --block 1000 all" >> /tmp/setup.log 2>&1

# rename host to xip.io name
sudo su -l stackato -c "/home/stackato/bin/kato node rename $1.xip.io" >> /tmp/setup.log 2>&1
