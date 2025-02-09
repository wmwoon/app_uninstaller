#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <AppName>"
    exit 1
fi

APP_NAME="$1"
APP_PATH="/Applications/$APP_NAME.app"

if [ ! -d "$APP_PATH" ]; then
    echo "Application $APP_NAME not found in /Applications."
    exit 1
fi

echo "Force quitting $APP_NAME and related processes..."
pkill -f "$APP_NAME"
sleep 2
echo "Uninstalling $APP_NAME..."

# Move app to trash
osascript -e "tell application \"Finder\" to delete POSIX file \"$APP_PATH\""

# Remove associated files and directories
FILES=(
    "~/Library/Application Support/$APP_NAME"
    "~/Library/Caches/$APP_NAME"
    "~/Library/Preferences/com.$APP_NAME.*"
    "~/Library/Logs/$APP_NAME"
    "~/Library/Containers/$APP_NAME"
    "~/Library/Cookies/com.$APP_NAME.*"
    "/Library/Application Support/$APP_NAME"
    "/Library/Preferences/com.$APP_NAME.*"
    "/Library/Caches/$APP_NAME"
    "/Library/Logs/$APP_NAME"
    "/Library/LaunchAgents/com.$APP_NAME.*"
    "/Library/LaunchDaemons/com.$APP_NAME.*"
    "/Library/Extensions/$APP_NAME.kext"
    "/Library/PrivilegedHelperTools/com.$APP_NAME.*"
)

for FILE in "${FILES[@]}"; do
    EXPANDED_PATH=$(eval echo "$FILE")
    if [ -e "$EXPANDED_PATH" ]; then
        echo "Removing $EXPANDED_PATH"
        sudo rm -rf "$EXPANDED_PATH"
    fi
done

echo "$APP_NAME has been uninstalled."
exit 0
