cls
write-host "Testing TRY CATCH" -BackgroundColor DarkBlue
Try
{
    Write-Verbose "Testing NonTerminating ERror" -Verbose
    #get-servicessss 
    get-wmiobject -class win32_operatingsystem -ComputerName LON-DC2 -ErrorAction Stop
    write-host "Moving On" -BackgroundColor DarkBlue
}
catch
{
    write-host "Error Occured" -BackgroundColor DarkRed
}