#!/bin/bash
set -eu

BAT_PATH="/sys/class/power_supply/BAT0"
START_THRESHOLD=35
STOP_THRESHOLD=85

# Default thresholds to restore on stop
DEFAULT_START=0
DEFAULT_STOP=100

case "$1" in
    start)
        echo "Setting battery charge thresholds..."
        echo $START_THRESHOLD > "$BAT_PATH/charge_start_threshold"
        echo $STOP_THRESHOLD > "$BAT_PATH/charge_stop_threshold"
        echo "Battery thresholds set: start=$START_THRESHOLD%, stop=$STOP_THRESHOLD%"
        ;;
    stop)
        echo "Resetting battery charge thresholds to defaults..."
        echo $DEFAULT_START > "$BAT_PATH/charge_start_threshold"
        echo $DEFAULT_STOP > "$BAT_PATH/charge_stop_threshold"
        echo "Battery thresholds reset: start=$DEFAULT_START%, stop=$DEFAULT_STOP%"
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac

exit 0
