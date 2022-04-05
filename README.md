# logCollector

Collect logs is a convenient way to gather up the relevant logs (and some other details) from a machine in your ArcGIS Enterprise.  By default, it will gather logs from the last 7 days, zipping them up, and placing them in a subdirectory of the current directory named for the machine on you run it.

Basic Execution

Windows
1.	Unzip the .zip archive to a directory
2.	Open a command prompt as administrator
3.	Type collectLogs.bat
It will write messages to the screen until it completes execution with this message “*** ArcGIS Enterprise Information Getter COMPLETED! ***”

 
To be more specific, it figures out what Esri software is installed and gathers the logs from each of those software servers.  It also makes and attempt to get Event Viewer Logs and IIS logs (if IIS is present).

Linux
1.	Unzip the .zip archive to a directory
2.	Open a terminal window
3.	Type sudo ./collectLogs.sh 
It will write messages to the screen until it completes execution with this message “*** ArcGIS Enterprise Information Getter COMPLETED! ***”
 
Note that:
You only need to run with the sudo command if you wish to collect the full complement of OS logs.  The tool will still execute (and get most of the OS logs … the ones for which you don’t need elevated privileges).
If you installed the Esri server software on the command line (as opposed to with the GUI installer), environment variables pointing to the installation directories were not created.  Both the shell script wrapper and the jar file rely upon these variables to function.  To create an environment variable for ArcGIS Server, you could put the following in your /etc/environment file (substituting your installation path for the one shown here):
AGSSERVER="/opt/esri_server/arcgis/server"
You would need an AGSDATASTORE variable pointing to its install location or an AGSPORTAL variable pointing to its install location (according to what you have installed).
