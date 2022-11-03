cls
write-host "Service Monitoring on 500 Machines" -BackgroundColor DarkBlue
$Servers = import-csv C:\users\Administrator.ADATUM\Desktop\Oct05\Servercollection.csv
clear-content C:\users\Administrator.ADATUM\Desktop\Oct06\ServiceExport.csv
Foreach ($item in $Servers)  ##LON-DC1, LON-DC2
{
    write-host "Connecting to the Server" $item.ServerName -BackgroundColor Black -ForegroundColor Yellow
    invoke-command -ComputerName $item.ServerName -ScriptBlock {Restart-service W32Time}
    if ($? -eq "True")
    {
        write-host "The Service restarted successfully" -BackgroundColor DarkGreen
    }
    else
    {
        write-host "The Service restarted Failed" -BackgroundColor DarkRed
    }
}