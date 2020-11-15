#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(apm -l)
    STATUS=$(apm -a)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = 0 ]; then
            printf "🔌 %s%% %s" "$CHARGE" "unplugged"
        else
            printf "🔋 %s%% %s" "$CHARGE" "charging"
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

