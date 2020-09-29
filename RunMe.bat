REM Create a directory on the C drive to store the scripts from the repository
mkdir c:\build
mkdir c:\build\PC-Build-Script-master
xcopy "%~dp0*.*" "C:\build\PC-Build-Script-master\*.*" /E /H /C /R /Q /Y
REM Enable execution policy to allow running of scripts
Powershell.exe -Command "& {Start-Process Powershell.exe -ArgumentList 'set-executionpolicy remotesigned' -Verb RunAs}"
REM The download.ps1 auto extracts the contents to c:\build. Wait 10 seconds for this to complete before executing the PCSetup.ps1 script
timeout 10
REM Execute the final build script
powershell.exe -ExecutionPolicy Bypass -noprofile -command "&{start-process powershell -ArgumentList '-noprofile -file \"c:\build\PC-Build-Script-master\PCSetup.ps1\"' -verb RunAs}"
pause