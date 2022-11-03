cls
write-host "Multiplication Table using FOR" -BackgroundColor DarkCyan
# for ($i = 1; $i -le 20; $i++)  ## <<----
# for ($i = 1; $i -le 20; $i+=2) ## ODD Table 

for ($i = 1; $i -le 20; $i++)
{
if ($i -eq 11)
{
     Continue ## Break ## Exit #
}
    $Result = $i * 10
    write-host "10 X $i = $Result "
}
write-host "Script Completed" -BackgroundColor DarkBlue
