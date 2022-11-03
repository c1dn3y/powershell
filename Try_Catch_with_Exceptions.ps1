cls
write-host "TRY - CATCH - FINALLY" -BackgroundColor DarkBlue
Trap {Write-host "Error occured. Script continuing" -BackgroundColor DarkRed}
Try
{
    #Trap {Write-host "Error occured. Script continuing" -BackgroundColor DarkRed}
    get-service -status Running
    get-service -computername LON-DC2 | select -first 5 | ft
    get-process | select -first 5 | ft 
    get-hotfixes | ft 
    get-eventlog -logname Application -Newest 5 | ft
    #Trap {Write-host "Error occured. Script continuing" -BackgroundColor DarkRed}
}
Catch [System.Management.Automation.CommandNotFoundException]
{
    write-host "Spelling mistake" -BackgroundColor DarkRed
}
Catch [System.InvalidOperationException]
{
    write-host "Unable to connect to the Server" -BackgroundColor DarkRed
}
catch [System.Management.Automation.ParameterBindingException]
{
    write-host "Parameter not found. Check Syntax" -BackgroundColor DarkRed
}
Catch 
{
    write-host "Unknown Error occured" -BackgroundColor DarkRed
}
Finally
{
    write-host "Script Completed" -BackgroundColor DarkGreen
}