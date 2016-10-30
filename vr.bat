@echo off
REM Set OSVR Path to server binary:
set osvr-dir=%ProgramFiles%\OSVR\Runtime\bin

echo OSVR HDK direct mode SteamVR helper script.
echo Please unplug power of HDK...
timeout /T 10

echo Killing Steam VR and OSVR Server...
Taskkill /IM "vrserver.exe" /F
Taskkill /IM "vrmonitor.exe" /F
Taskkill /IM "vrdashboard.exe" /F
Taskkill /IM "vrcompositor.exe" /F
Taskkill /IM "osvr_server.exe"

echo Please plug in power of HDK...
timeout /T 10

echo Disabling OSVR Direct mode...
"%osvr-dir%\DisableOSVRDirectMode.exe"
echo OSVR Direct mode disabled.
echo Starting server in another console, prepare to hold HDK in front of the camera

timeout /T 10
cd "%osvr-dir%"
@START "OSVR Server" "%osvr-dir%\osvr_server.exe"
timeout /T 15
echo Starting SteamVR...
@START "SteamVR" steam://rungameid/250820
echo SteamVR is starting, this window closes in 10s
timeout /T 10