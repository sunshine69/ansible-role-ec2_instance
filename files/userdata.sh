#!/bin/bash

# Disable automatic upgrades. This stops automatic upgrade to interfere with
# ansible apt module. And we build immutable server so we do not need automatic
# upgrades
grep -q 'APT::Periodic::Unattended-Upgrade "0";' /etc/apt/apt.conf.d/10periodic || echo 'APT::Periodic::Unattended-Upgrade "0";' >> /etc/apt/apt.conf.d/10periodic
sed -i 's/APT::Periodic::Update-Package-Lists "1";/APT::Periodic::Update-Package-Lists "0";/' /etc/apt/apt.conf.d/10periodic

rm -f /etc/apt/apt.conf.d/20auto-upgrades
