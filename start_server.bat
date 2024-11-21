@echo off

:: Pfad zur HTML-Datei und zum Verzeichnis
set "TARGET_PATH=C:\Program Files (x86)\learningservicesrepo\PainterProject"

:: Name des Shortcuts
set "SHORTCUT_NAME=learn_server"

:: Pfad zum Startmenü
set "START_MENU_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs"
set "SHORTCUT_PATH=%START_MENU_FOLDER%\%SHORTCUT_NAME%.lnk"

:: Überprüfe, ob der Shortcut bereits existiert
if exist "%SHORTCUT_PATH%" (
    echo Shortcut "%SHORTCUT_NAME%" existiert bereits.
) else (
    :: Erstelle den Shortcut mit PowerShell
    powershell -command "$WScript = New-Object -ComObject WScript.Shell; $Shortcut = $WScript.CreateShortcut('%SHORTCUT_PATH%'); $Shortcut.TargetPath = '%SystemRoot%\System32\cmd.exe'; $Shortcut.WorkingDirectory = '%TARGET_PATH%'; $Shortcut.Arguments = '/c cd /d \"^%TARGET_PATH^%\" && python -m http.server'; $Shortcut.Save()"
    echo Shortcut "%SHORTCUT_NAME%" wurde erfolgreich zum Startmenü hinzugefügt.
)

:: Ausführung des Python HTTP Servers
cd /d "%TARGET_PATH%"
start cmd /k "python -m http.server"

pause
exit
