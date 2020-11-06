#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    # Used and total storage in /root 
    STOUSED=$( df -h | grep '/dev/ada0p2' | awk '{print $3}')
    STOTOTAL=$( df -h | grep '/dev/ada0p2' | awk '{print $2}')

    # Used and total storage in /home 
    STOUSEDH=$( df -h | grep '/dev/ada0p3' | awk '{print $3}')
    STOTOTALH=$( df -h | grep '/dev/ada0p3' | awk '{print $2}')

    # Used and total memory
    #MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    #MEMTOT=$(free -h |awk '(NR == 2) {print $2}')
    # CPU temperature
    #CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)

    printf "%s" "$SEP1"
	printf "root %s/%s" "$STOUSED" "$STOTOTAL"
	printf "] [home %s/%s" "$STOUSEDH" "$STOTOTALH"
    printf "%s\n" "$SEP2"
}

dwm_resources
