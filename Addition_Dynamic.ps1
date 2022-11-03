cls
Write-host "Addition Program" -BackgroundColor DarkGreen
[decimal] $Number1 = Read-host "Enter Number1 ?"
[decimal] $Number2 = Read-host "Enter Number2 ?"
$Result = $Number1 + $Number2
write-host "The Result of Addition is $Result" -BackgroundColor DarkBlue
write-host "The Addition of $Number1 and $Number2 is $Result" -BackgroundColor DarkCyan
write-host 'The Addition of $Number1 and $Number2 is $Result' -BackgroundColor DarkGray
# [int][decimal][float][datetime][array][Hashtable]