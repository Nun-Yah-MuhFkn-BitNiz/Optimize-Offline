REM Answer files should ALWAYS be removed from the 'Windows\Panther' and 'Windows\System32\Sysprep' directories immediately after they've been processed.

POWERCFG -H OFF >NUL 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%WINDIR%\Setup\Scripts\Refresh-Explorer.ps1"
DEL /F /Q "%WINDIR%\Setup\Scripts\Refresh-Explorer.ps1" >NUL 2>&1
DEL /F /Q "%WINDIR%\Setup\Scripts\OOBE.cmd" >NUL 2>&1
DEL /F /Q "%WINDIR%\Setup\Scripts\RebootToRecovery_MyPC.reg" >NUL 2>&1
DEL /F /Q "%WINDIR%\Panther\unattend.xml" >NUL 2>&1
DEL /F /Q "%WINDIR%\System32\Sysprep\unattend.xml" >NUL 2>&1
DEL "%~f0"