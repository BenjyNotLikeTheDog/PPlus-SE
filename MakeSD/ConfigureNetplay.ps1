#Numbers of lines will probably need to change when edits to RSBE01.txt or BOOST.txt are made.

copy "../Build/P+Ex/RSBE01.txt" "../Build/P+Ex/NETPLAY.txt" -Force -erroraction 'silentlycontinue'
copy "../Build/P+Ex/BOOST.txt" "../Build/P+Ex/NETBOOST.txt" -Force -erroraction 'silentlycontinue'
copy "../NetplayFiles/seal" "../Build/P+Ex/pf/toy/" -Force -Recurse -erroraction 'silentlycontinue'
copy "../NetplayFiles/Netplay" "../Build/P+Ex/Source/" -Force -Recurse -erroraction 'silentlycontinue'
copy "../NetplayFiles/dnet.cmnu" "../Build/P+Ex/pf/menu3/" -Force -erroraction 'silentlycontinue'
del "../Build/P+Ex/pf/sound/netplaylist" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
Copy-Item "../Build/P+Ex/pf/sound/tracklist" -Destination "../Build/P+Ex/pf/sound/netplaylist" -Force -Recurse -erroraction 'silentlycontinue'
del "../Build/P+Ex/st/" -Confirm:$false -Recurse -erroraction 'silentlycontinue'

#NETPLAY.txt
$netplayPath = "..\Build\P+Ex\NETPLAY.txt"
(Get-Content $netplayPath).replace('Source/P+Ex/MultiGCT.asm', 'Source/Netplay/Net-MultiGCT.asm') | Set-Content $netplayPath
(Get-Content $netplayPath).replace('Source/P+Ex/CodeMenu.asm', 'Source/Netplay/Net-CodeMenu.asm') | Set-Content $netplayPath
$netplayContent = Get-Content $netplayPath
$netplayContent[15] += "`r`n`r`n# Netplay Codeset Differences:`r`n"
$netplayContent[15] += "#`r`n"
$netplayContent[15] += "# NETBOOST.GCT is loaded instead of BOOST.GCT (see bottom of codeset)`r`n"
$netplayContent[15] += '# "Source/Netplay/Net-CodeMenu.asm" is loaded instead of "Source/P+Ex/CodeMenu.asm"'
$netplayContent[15] += "`r`n#`r`n"
$netplayContent[15] += "#############################################################################"
$netplayContent | Set-Content $netplayPath

#NETBOOST.txt
$netboostPath = "..\Build\P+Ex\NETBOOST.txt"
(Get-Content $netboostPath).replace('Source/P+Ex/StageFiles.asm', 'Source/Netplay/Net-StageFiles.asm') | Set-Content $netboostPath
(Get-Content $netboostPath).replace('.include Source/Extras/Console.asm', '#.include Source/Extras/Console.asm') | Set-Content $netboostPath
(Get-Content $netboostPath).replace('#.include Source/Extras/Netplay.asm', '.include Source/Extras/Netplay.asm') | Set-Content $netboostPath

#Net-MultiGCT
(Get-Content "..\Build\P+Ex\Source\Project+\MultiGCT.asm") -replace 'BOOST.GCT', 'NETBOOST.GCT' | Out-File -encoding ASCII "..\Build\P+Ex\Source\Netplay\Net-MultiGCT.asm"

#Net-StageFiles
$stagefilesPath = "..\Build\P+Ex\Source\Netplay\Net-StageFiles.asm"
(Get-Content "..\Build\P+Ex\Source\Project+\StageFiles.asm") -replace '/sound/tracklist/', '/sound/netplaylist/' | Out-File -encoding ASCII $stagefilesPath
(Get-Content $stagefilesPath).replace('source/Project+/MyMusic.asm', 'source/Netplay/Net-MyMusic.asm') | Set-Content $stagefilesPath
$stagefilesContent = Get-Content $stagefilesPath
$stagefilesContent[0] = "#`r`n"
$stagefilesContent[0] += "# This file is nearly identical to Project+/StageFiles.asm but changes the following:`r`n"
$stagefilesContent[0] += "# -it points to Netplay/Net-MyMusic.asm instead of Project+/MyMusic.asm`r`n"
$stagefilesContent[0] += '# -string "/sound/tracklist/" -> "sound/netplaylist/"'
$stagefilesContent[0] += "`r`n#`r`n#################################"
$stagefilesContent | Set-Content $stagefilesPath

#RSBE01.txt
$rsbe01Path = "..\Build\P+Ex\RSBE01.txt"
$strapcode = Select-String -Path $rsbe01Path -Pattern "046CADE8"
if ($strapcode -eq $null)
{
	(Get-Content $rsbe01Path).replace('80078E14', "80078E14`r`n* 046CADE8 48000298") | Set-Content $rsbe01Path
}