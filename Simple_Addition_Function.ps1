cls
write-host "Addition Program using Functions" -BackgroundColor DarkBlue
Function Get-Addition 
{
    $Number1 = read-host "Enter Number1 ? "
    $Number2 = read-host "Enter Number2 ? "
    write-host "The Addition of $Number1 and $Number2 is" ([int] $Number1 + [int] $Number2) -BackgroundColor DarkGray
}
Get-Addition
Get-Addition
Get-Addition
Get-Addition