REM Create a directory on the C drive to store the scripts from the repository
mkdir c:\EffzettInstall
xcopy "%~dp0*.*" "C:\EffzettInstall\" /E /H /C /R /Q /Y
REM Enable execution policy to allow running of scripts
Powershell.exe -Command "& {Start-Process Powershell.exe -ArgumentList 'set-executionpolicy remotesigned' -Verb RunAs}"
timeout 10
REM Execute the final build script
powershell.exe -ExecutionPolicy Bypass -noprofile -command "&{start-process powershell -ArgumentList '-noprofile -file "c:\EffzettInstall\EffzettInstall.ps1\"' -verb RunAs}"
pause