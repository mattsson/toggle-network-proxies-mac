#!/bin/bash

# Script for turning proxies on or off

# Usage bash toggle_proxies.sh {on|off}


state=$1

echo ${state}

# network_services=("Wi-Fi" "Apple USB Ethernet Adapter" "Shape VPN (hq.shape.dk)" "Display Ethernet" "HUAWEIMobile-")
# Linebreak-separated string of services
network_services_string=$(networksetup -listallnetworkservices)

# Create array of services from string
IFS=$'\n' read -rd '' -a network_services <<<"$network_services_string"

for i in "${network_services[@]}"
do
    echo "LOOP --------------"
	echo $i

    if [ "$state" = "on" ]; then
        echo "Turning on proxy for $i"
        sudo networksetup -setwebproxystate $i on
        sudo networksetup -setsecurewebproxystate $i on
    else
        echo "Turning off proxy for $i"
        sudo networksetup -setwebproxystate $i off
        sudo networksetup -setsecurewebproxystate $i off
    fi

done

# networksetup -listallnetworkservices
# is_off=$(networksetup -getwebproxy wi-fi | grep "No") 

# Apple USB Ethernet Adapter
# Shape VPN (hq.shape.dk)
# Display Ethernet
# iPhone USB
# Wi-Fi
# FT232R USB UART
# USB ___ Serial
# HUAWEIMobile-
# *HUAWEIMobile- 2
# Display FireWire
# Bluetooth PAN
# Thunderbolt Bridge
# Ethernet Adaptor (en1)
# Ethernet Adaptor (en2)
# Ethernet Adaptor (en7)