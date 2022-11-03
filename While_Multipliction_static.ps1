cls
write-host "Multiplication Table using WHILE" -BackgroundColor DarkBlue

$i = 1
While ($i -le 20)
{
    $Result = $i * 10
    write-host "10 X $i = $Result "
    $i++
}

# Enter the Table Number ?   8
# Enter the Starting point ? 20
# Enter the Ending point ? 10
# Evaluate whether the Starting point is lesser than the Ending point ?