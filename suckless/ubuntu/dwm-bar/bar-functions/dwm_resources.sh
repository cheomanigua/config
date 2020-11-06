#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3
SCRIPT_PATH="test.sh"
dwm_resources () {
  # Storaged Used/Total
  STOUSED=$(df -h | grep '/dev/sda1' | awk '{print $3}')
  STOTOTAL=$(df -h | grep '/dev/sda1' | awk '{print $2}')

    # Used and total memory
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h |awk '(NR == 2) {print $2}')
    # CPU temperature
    ##CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)
    # Used and total storage in /home (rounded to 1024B)
    #STOUSED=$(df -h | grep '/home$' | awk '{print $3}')
    #STOUSED=$(df -h | grep '/home$' | awk '{print $3}')
    #STOTOT=$(df -h | grep '/home$' | awk '{print $2}')
    #STOPER=$(df -h | grep '/home$' | awk '{print $5}')

    printf "%s" "$SEP1"
        printf "MEM %s/%s" "$MEMUSED" "$MEMTOT"
        printf "] [sda1 %s/%s" "$STOUSED" "$STOTOTAL"
    printf "%s\n" "$SEP2"


}

dwm_resources
