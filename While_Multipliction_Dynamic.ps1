cls
write-host "Multiplication Table using WHILE" -BackgroundColor DarkBlue
[int] $TableNumber = Read-host "Enter the Table Number ?   "
[int] $Startingpoint = Read-host "Enter the Starting point ?"
[int] $Endingpoint = Read-host "Enter the Ending point ? "

if ($Startingpoint -le $Endingpoint)
{
$i = $Startingpoint
While ($i -le $Endingpoint)
{
    $Result = $i * $TableNumber
    write-host "$TableNumber X $i = $Result "
    $i++
}
}
else 
{
    write-host "The Starting point should be lesser than the Ending point" -BackgroundColor DarkRed
}


# Enter the Table Number ?   8
# Enter the Starting point ? 20
# Enter the Ending point ? 10
# Evaluate whether the Starting point is lesser than the Ending point ?