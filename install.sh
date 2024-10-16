##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################

##########################################################################################
# Instructions:
#
# 1. Place your files into system/vendor/firmware (delete the placeholder file)
# 2. Place your hid-keyboard script into the appropriate location
# 3. Fill in your module's info into module.prop
# 4. Configure and implement callbacks in this file
# 5. If you need boot scripts, put the files in default path then look into POSTFSDATA/LATESTARTSERVICE flags.
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

REPLACE=""

##########################################################################################
# Function Callbacks
##########################################################################################

print_modname() {
  ui_print "*******************************"
  ui_print "      NetErnels 2.0 modules    "
  ui_print "      ~ @neternels             "
  ui_print "*******************************"
}

on_install() {
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2 || abort "Failed to extract module files."

  # Copy firmware files to /vendor/firmware
  ui_print "- Copying firmware files to /vendor/firmware"
  mkdir -p "$MODPATH/vendor/firmware" || abort "Failed to create /vendor/firmware directory."

  if cp -r "$MODPATH/system/vendor/firmware/"* "$MODPATH/vendor/firmware/"; then
    ui_print "- Firmware files copied successfully."
  else
    abort "Failed to copy firmware files."
  fi

  # Copy hid-keyboard script to /system/bin
  ui_print "- Copying hid-keyboard script"
  if cp "$MODPATH/system/bin/hid-keyboard" "$MODPATH/system/bin/"; then
    ui_print "- hid-keyboard script copied successfully."
  else
    abort "Failed to copy hid-keyboard script."
  fi
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644

  # Set permissions for the hid-keyboard script
  set_perm $MODPATH/system/bin/hid-keyboard 0 0 0755
}

# Add any additional functions as needed
