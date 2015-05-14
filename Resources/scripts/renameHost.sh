#!/bin/bash
# $1 - IP address of the node

chmod u+w /etc/sudoers
echo "stackato        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

echo "**** time: `date` | user: `/usr/bin/whoami`" >> /tmp/setup.log
echo "***** ready?" >> /tmp/setup.log
sudo su -l stackato -c "/home/stackato/bin/kato process ready --block 1000 all" >> /tmp/setup.log 2>&1
echo "**** time: `date` | user: `/usr/bin/whoami`" >> /tmp/setup.log
echo "***** rename" >> /tmp/setup.log
sudo su -l stackato -c "/home/stackato/bin/kato node rename $1.xip.io" >> /tmp/setup.log 2>&1
echo "**** time: `date` | hostname: `/bin/hostname`" >> /tmp/setup.log
