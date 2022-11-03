cls
write-host "Multiplication Table using FOR" -BackgroundColor DarkCyan
[int] $TableNumber = Read-host "Enter the Table Number ?   "
[int] $Startingpoint = Read-host "Enter the Starting point ?"
[int] $Endingpoint = Read-host "Enter the Ending point ? "

if ($Startingpoint -le $Endingpoint)
{
for ($i = $Startingpoint; $i -le $Endingpoint; $i++)  
{
    $Result = $i * $TableNumber
    write-host "$TableNumber X $i = $Result "
}
}
else 
{
    write-host "The Starting point should be lesser than the Ending point" -BackgroundColor DarkRed
}
