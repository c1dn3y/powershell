cls
write-host "Multiplication Table using FOR" -BackgroundColor DarkCyan
# for ($i = 1; $i -le 20; $i++)  ## <<----
# for ($i = 1; $i -le 20; $i+=2) ## ODD Table 
for ($i = 2; $i -le 20; $i+=2)
{
    $Result = $i * 10
    write-host "10 X $i = $Result "
}

# Enter the Table Number ?   8
# Enter the Starting point ? 20
# Enter the Ending point ? 10
# Evaluate whether the Starting point is lesser than the Ending point ?