#!/bin/bash
# $1 - role
# $2 - core IP
# $3 - apiURL

su -l stackato -c "/home/stackato/bin/kato role add $1"
sleep 10
