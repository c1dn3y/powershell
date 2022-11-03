cls
write-host "Service Monitoring on 500 Machines" -BackgroundColor DarkBlue
$Servers = import-csv C:\users\Administrator.ADATUM\Desktop\Oct05\Servercollection.csv
Foreach ($item in $Servers)
{
write-host "Connecting to the Server" $item.ServerName -BackgroundColor Black -ForegroundColor Yellow
get-service -computerName $item.servername | ? {$_.DisplayName -like "Remote*"} | ft Status, Displayname, MachineName
}