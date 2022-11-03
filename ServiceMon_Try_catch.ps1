cls
write-host "Service Monitoring on 500 Machines" -BackgroundColor DarkBlue
$Servers = import-csv C:\users\Administrator.ADATUM\Desktop\Oct05\Servercollection.csv
clear-content C:\users\Administrator.ADATUM\Desktop\Oct06\ServiceExport.csv
$Success = 0 
$Failure = 0
$date = get-date -format MM_dd_yyyy_hh_mm 
$Successfilename = "Success_$date.txt"
$FailureFilename = "Failure_$date.txt"
Add-content -path C:\users\Administrator.ADATUM\Desktop\Oct06\$Successfilename -Value (get-date)
Add-content -path C:\users\Administrator.ADATUM\Desktop\Oct06\$FailureFilename -Value (get-date)
Foreach ($item in $Servers)  ##LON-DC1, LON-DC2
{
   Try
{
    write-host "Connecting to the Server" $item.ServerName -BackgroundColor Black -ForegroundColor Yellow
    $Result = get-service -computerName $item.servername | ? {$_.DisplayName -like "Remote*"}
    $result | ft Status, Displayname, MachineName
    $result | Select-object Status, Displayname, MachineName |`
     Export-csv C:\users\Administrator.ADATUM\Desktop\Oct06\ServiceExport.csv -NoTypeInformation -append
    $result = $Null
    Clear-variable Result
    $Success++
    Add-content -path C:\users\Administrator.ADATUM\Desktop\Oct06\$Successfilename -Value $item.ServerName
}
Catch 
{
    write-host "Unable to connect to the Server" $item.ServerName -BackgroundColor DarkRed
    $Failure++
    Add-content -path C:\users\Administrator.ADATUM\Desktop\Oct06\$FailureFilename -Value $item.ServerName
}
}
write-host "Success = $Success" -BackgroundColor Green
write-host "Failure = $Failure" -BackgroundColor Red
#Invoke-item C:\users\Administrator.ADATUM\Desktop\Oct06\ServiceExport.csv