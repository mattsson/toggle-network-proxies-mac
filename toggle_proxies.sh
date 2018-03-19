#!/bin/bash

# Script for turning web and secure web proxies on or off
# Usage bash toggle_proxies.sh {on|off}

state=$1

# Linebreak-separated string of services
network_services_string=$(networksetup -listallnetworkservices)

# Create array of services from string
IFS=$'\n' read -rd '' -a network_services <<<"$network_services_string"

for i in "${network_services[@]}"
do
	echo $i

    if [ "$state" = "on" ]; then
        # echo "Turning on proxy for $i"
        sudo networksetup -setwebproxystate "$i" on
        sudo networksetup -setsecurewebproxystate "$i" on
    else
        # echo "Turning off proxy for $i"
        sudo networksetup -setwebproxystate "$i" off
        sudo networksetup -setsecurewebproxystate "$i" off
    fi

done