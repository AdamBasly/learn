@echo off
SET "INSTALL_DIR=C:\PainterProject"
SET "SHORTCUT_NAME=PainterProject"
SET "INDEX_FILE=%INSTALL_DIR%\index.html"
SET "SHORTCUT_PATH=%USERPROFILE%\Desktop\%SHORTCUT_NAME%.lnk"

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
      $Shortcut = $WScript.CreateShortcut('%SHORTCUT_PATH%'); ^
      $Shortcut.TargetPath = '%INDEX_FILE%'; ^
      $Shortcut.Save()
    
    echo Desktop-Icon wurde erstellt: %SHORTCUT_PATH%
) ELSE (
    echo index.html wurde nicht gefunden: %INDEX_FILE%
)

REM Installation abgeschlossen
echo Das Projekt wurde erfolgreich in %INSTALL_DIR% installiert.
pause
