!define APP_NAME "learningservicesrepo"
!define INSTALL_DIR "$PROGRAMFILES\${APP_NAME}"

SetCompressor lzma

Name "${APP_NAME} Installer"
OutFile "learningservicesrepo.exe"
InstallDir ${INSTALL_DIR}

Page directory
Page instfiles

Section ""
  SetOutPath $INSTDIR
  File /r "C:\PainterProject"
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  CreateShortCut "$DESKTOP\learningservicesrepo.lnk" "$INSTDIR\index.html"
SectionEnd

Section "Uninstall"
  Delete "$DESKTOP\learningservicesrepo.lnk"
  RMDir /r "$INSTDIR"
SectionEnd
