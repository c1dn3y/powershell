cls
write-host "Uptime Calculation using CIM" -BackgroundColor DarkGreen
$CIM = Get-CIMinstance -class Win32_Operatingsystem
$uptime = $CIM.LocalDateTime - $CIM.LastBootUpTime 
$uptime | ft Days, Hours, Minutes
write-host "The Machine is up and running for the past $($uptime.days) days $($Uptime.hours) hours $($uptime.minutes) minutes " -BackgroundColor Black -ForegroundColor Yellow

write-host "Uptime Calculation using WMI" -BackgroundColor DarkGreen
$WMI = Get-WmiObject -class win32_operatingsystem 
$uptime1 = $WMI.ConvertTodatetime($WMI.Localdatetime) - $WMI.ConverttodateTime($WMI.LastBootuptime)
$uptime1 | ft Days, Hours, Minutes
write-host "The Machine is up and running for the past $($uptime1.days) days $($Uptime1.hours) hours $($uptime1.minutes) minutes " -BackgroundColor Black -ForegroundColor Yellow
