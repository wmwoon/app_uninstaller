# app_uninstaller
**Uninstalls apps from macOS
**

This script:
- Takes the app name as an argument.
- Moves the main app bundle to the trash using AppleScript.
- Searches and removes various related files from the Library directories.
- Cleans up system-wide and user-specific files related to the app.

To use:

```chmod +x uninstall.sh```

```./app_uninstall.sh "AppName"```


Replace "AppName" with the actual application name.
