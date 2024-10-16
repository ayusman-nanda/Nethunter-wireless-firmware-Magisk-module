#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk changes its mount point in the future.
MODDIR=${0%/*}

# This script will be executed in late_start service mode
ui_print "Starting late start service for module..."

# Uncomment the following lines to automatically insert each module after they are fed into the system.
# if [ -d "$MODDIR/system/lib/modules" ]; then
#   for module in "$MODDIR/system/lib/modules/"*.ko; do
#     if [ -f "$module" ]; then
#       insmod "$module" && ui_print "Inserted $module successfully." || ui_print "Failed to insert $module."
#     done
#   done
# else
#   ui_print "No modules directory found."
# fi
