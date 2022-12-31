del "..\Build\P+Ex\NETPLAY.txt" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+Ex\NETBOOST.txt" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+Ex\pf\menu3\dnet.cmnu" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+Ex\pf\movie" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+Ex\pf\sound\netplaylist" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+Ex\Source\Netplay" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+Ex\pf\toy\seal" -Confirm:$false -Recurse -erroraction 'silentlycontinue'

#RSBE01.txt
$rsbe01Path = "..\Build\P+Ex\RSBE01.txt"
$strapcode = Select-String -Path $rsbe01Path -Pattern "046CADE8"
if ($strapcode -ne $null)
{
	(Type "..\Build\P+Ex\RSBE01.txt") -notmatch "^* 046CADE8 48000298$" | Set-Content "..\Build\P+Ex\RSBE01.txt"
}