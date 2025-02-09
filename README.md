# app_uninstaller
Uninstalls apps from macOS

This script:
	1.	Takes the app name as an argument.
	2.	Moves the main app bundle to the trash using AppleScript.
	3.	Searches and removes various related files from the Library directories.
	4.	Cleans up system-wide and user-specific files related to the app.

To use:
  chmod +x uninstall.sh
  ./app_uninstall.sh "AppName"

Replace "AppName" with the actual application name.
