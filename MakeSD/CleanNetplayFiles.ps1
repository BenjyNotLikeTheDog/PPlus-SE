del "..\Build\P+SE\NETPLAY.txt" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+SE\NETBOOST.txt" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+SE\pf\menu3\dnet.cmnu" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+SE\pf\movie" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+SE\pf\sound\netplaylist" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+SE\Source\Netplay" -Confirm:$false -Recurse -erroraction 'silentlycontinue'
del "..\Build\P+SE\pf\toy\seal" -Confirm:$false -Recurse -erroraction 'silentlycontinue'

#RSBE01.txt
$rsbe01Path = "..\Build\P+SE\RSBE01.txt"
$strapcode = Select-String -Path $rsbe01Path -Pattern "046CADE8"
if ($strapcode -ne $null)
{
	(Type "..\Build\P+SE\RSBE01.txt") -notmatch "^* 046CADE8 48000298$" | Set-Content "..\Build\P+SE\RSBE01.txt"
}