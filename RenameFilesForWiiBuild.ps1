(Get-Content ".\Build\P+Ex\BOOST.txt") -replace '#.include Source/Extras/Console.asm', '.include Source/Extras/Console.asm' | Out-File -encoding ASCII ".\Build\P+Ex\BOOST.txt"