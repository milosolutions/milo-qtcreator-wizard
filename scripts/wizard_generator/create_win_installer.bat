@echo OFF
echo "Installer generator"
if "%1" == "-h" (
  echo Usage: create_win_installer.bat output_installer_name qtIfwPath [doxygenPath]
  echo This will only work when invoked from root repo dir
  echo Builds all subproject documentation, cleans up build dirs, creates the 
  echo Milo DB installer
  goto :EOF
)

rem Arguments check
set argC=0
for %%x in (%*) do Set /A argC+=1
echo Argument count is %argC%
if "%argC%" LSS "2" (
  echo "Illegal number of parameters: %argC%. See -h"
  goto :EOF
)


rem Preparing temporary folder
set TEMP_DIR=".\__tempMiloWizard"
if exist %TEMP_DIR%\ rd /q /s %TEMP_DIR%
set CONTENT_DIR=%TEMP_DIR%\packages\com.milosolutions
rem creating directory for all the wizard data
mkdir %CONTENT_DIR%\data

rem copying files ...
rem MIR - copy whole directory structure (mirror)
rem rest of parameters makes it silent :P
robocopy /MIR /NFL /NDL /NJH /NJS /nc /ns /np .\scripts\wizard_generator\config %TEMP_DIR%\config
robocopy /MIR /NFL /NDL /NJH /NJS /nc /ns /np .\packages %CONTENT_DIR%\data\packages
robocopy /MIR /NFL /NDL /NJH /NJS /nc /ns /np .\scripts\wizard_generator\meta %CONTENT_DIR%\meta
copy wizard.json %CONTENT_DIR%\data\wizard.json > nul
copy .\icon.png %CONTENT_DIR%\data\icon.png > nul
rem copy reinstall script
rem reinstall method described here: 
rem https://stackoverflow.com/questions/46455360/workaround-for-qt-installer-framework-not-overwriting-existing-installation/46614107#46614107
copy .\scripts\wizard_generator\auto_uninstall.qs %CONTENT_DIR%\data\auto_uninstall.qs > nul

set OUTPUT_NAME=%1
set IFW=%2
set DOXY=%3


echo Building installer
%IFW% -v -c %TEMP_DIR%\config\config.windows.xml -p %TEMP_DIR%\packages %OUTPUT_NAME% 
rd /q /s %TEMP_DIR%
echo Done. Installer created here: %OUTPUT_NAME%.
goto :EOF



