#!/bin/sh

#
# Remove and reload the kernel module for hid_multitouch 
#
# This script is used on a .service systemd unit.[resume@user]
# Model notebook:   DELL xps 15 9530
# Author:           francdin@gmail.com
# Date:             12/31/2014 (US format)
# Version:          0.1.0
#
/sbin/rmmod hid_multitouch && /sbin/modprobe hid_multitouch
