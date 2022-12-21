del .\Build\P+SE\NETPLAY.txt /Q
del .\Build\P+SE\NETBOOST.txt /Q
del .\Build\P+SE\pf\menu3\dnet.cmnu /Q
rmdir .\Build\P+SE\pf\movie /s /q
rmdir .\Build\P+SE\pf\sound\netplaylist /s /q
rmdir .\Build\P+SE\Source\Netplay /s /q
powershell.exe .\RenameFilesForWiiBuild.ps1
".\Build\P+SE\GCTRealMate.exe" -q ".\Build\P+SE\RSBE01.txt"
".\Build\P+SE\GCTRealMate.exe" -q ".\Build\P+SE\BOOST.txt"
powershell.exe .\ZipWiiFiles.ps1
