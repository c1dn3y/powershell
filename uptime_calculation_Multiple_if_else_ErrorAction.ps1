cls
$Servers = import-csv C:\users\Administrator.ADATUM\Desktop\Oct05\Servercollection.csv
foreach ($item in $Servers)
{
    write-host "Connecting to the Server" $item.ServerName -BackgroundColor Black -ForegroundColor Yellow
Try
{
    write-host "Uptime Calculation using CIM" -BackgroundColor DarkGreen
    $CIM = Get-CIMinstance -class Win32_Operatingsystem -ComputerName $item.ServerName
    $uptime = $CIM.LocalDateTime - $CIM.LastBootUpTime 
    $uptime | ft Days, Hours, Minutes
    write-host "The Machine is up and running for the past $($uptime.days) days $($Uptime.hours) hours $($uptime.minutes) minutes " -BackgroundColor Black -ForegroundColor Yellow

    write-host "Uptime Calculation using WMI" -BackgroundColor DarkGreen
    $WMI = Get-WmiObject -class win32_operatingsystem  -ComputerName $item.ServerName
    $uptime1 = $WMI.ConvertTodatetime($WMI.Localdatetime) - $WMI.ConverttodateTime($WMI.LastBootuptime)
    $uptime1 | ft Days, Hours, Minutes
    write-host "The Machine is up and running for the past $($uptime1.days) days $($Uptime1.hours) hours $($uptime1.minutes) minutes " -BackgroundColor Black -ForegroundColor Yellow
}
Catch 
{
    write-host "Unable to connect to the Server" $item.ServerName -BackgroundColor DarkRed
}
}
