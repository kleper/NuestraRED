#!/bin/bash
ifconfig eth0 10.40.2.254 netmask 255.255.255.0 up
route add default gw 10.40.2.1
