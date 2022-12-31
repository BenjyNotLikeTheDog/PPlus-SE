del .\Build\P+Ex\NETPLAY.txt /Q
del .\Build\P+Ex\NETBOOST.txt /Q
del .\Build\P+Ex\pf\menu3\dnet.cmnu /Q
rmdir .\Build\P+Ex\pf\movie /s /q
rmdir .\Build\P+Ex\pf\sound\netplaylist /s /q
rmdir .\Build\P+Ex\Source\Netplay /s /q
powershell.exe .\RenameFilesForWiiBuild.ps1
".\Build\P+Ex\GCTRealMate.exe" -q ".\Build\P+Ex\RSBE01.txt"
".\Build\P+Ex\GCTRealMate.exe" -q ".\Build\P+Ex\BOOST.txt"
powershell.exe .\ZipWiiFiles.ps1
