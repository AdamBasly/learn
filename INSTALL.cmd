@echo off
SET "INSTALL_DIR=C:\PainterProject"
SET "SHORTCUT_NAME=PainterProject"
SET "INDEX_FILE=%INSTALL_DIR%\index.html"
SET "SHORTCUT_DESKTOP_PATH=%USERPROFILE%\Desktop\%SHORTCUT_NAME%.lnk"
SET "SHORTCUT_STARTMENU_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\%SHORTCUT_NAME%.lnk"

REM Überprüfe, ob das Verzeichnis existiert, und erstelle es bei Bedarf
IF NOT EXIST "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

REM Wechsle in das Verzeichnis
cd /d "%INSTALL_DIR%"

REM Klone das GitHub-Repository
git clone https://github.com/AdamBasly/learn.git .

REM Überprüfe, ob die index.html existiert
IF EXIST "%INDEX_FILE%" (
    REM Erstelle das Desktop-Icon
    powershell ^
      $WScript = New-Object -ComObject WScript.Shell; ^
      $Shortcut = $WScript.CreateShortcut('%SHORTCUT_DESKTOP_PATH%'); ^
      $Shortcut.TargetPath = '%INDEX_FILE%'; ^
      $Shortcut.Save()
    
    REM Erstelle den Startmenü-Eintrag
    powershell ^
      $WScript = New-Object -ComObject WScript.Shell; ^
      $Shortcut = $WScript.CreateShortcut('%SHORTCUT_STARTMENU_PATH%'); ^
      $Shortcut.TargetPath = '%INDEX_FILE%'; ^
      $Shortcut.Save()

    echo Desktop-Icon wurde erstellt: %SHORTCUT_DESKTOP_PATH%
    echo Startmenü-Eintrag wurde erstellt: %SHORTCUT_STARTMENU_PATH%
) ELSE (
    echo index.html wurde nicht gefunden: %INDEX_FILE%
)

REM Installation abgeschlossen
echo Das Projekt wurde erfolgreich in %INSTALL_DIR% installiert.
pause
