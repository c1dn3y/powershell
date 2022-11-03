clear-Host
write-host "`t`t`tWorking with Windows Operations`t`t`t`n" -BackgroundColor Black -ForegroundColor Green
write-host ""
write-host "Working with Windows Services" -BackgroundColor Black -ForegroundColor Yellow
$StartType = Read-host "Enter the StartType (Automatic/Manual)?"
$Displayname = Read-host "Enter the Displayname (Use * for Wildcard Search) ?"
get-service | where-object {$_.starttype -like "$StartType" -and $_.Displayname -like "$Displayname"} | format-table Status, Displayname, Machinename , StartType

write-host "Working with Windows Processes" -BackgroundColor Black -ForegroundColor Yellow
$LHandles = Read-host "Enter the Lower Limit for Handles ? "
$UHandles = Read-host "Enter the Upper Limit for Handles ? "
get-process | where-object {$_.handles -gt $LHandles -and $_.handles -lt $UHandles} | format-table Processname, Handles, StartTime

write-host "Working with Windows Hotfixes" -BackgroundColor Black -ForegroundColor Yellow
$Description = Read-host "Enter the Description (Update/Security Update) ? "
$InstalledOn = Read-host "Enter the InstalledOn Date limit (dd/mm/yyyy)?"
get-hotfix | where-object {$_.Description -eq "$Description" -and $_.installedOn -gt "$InstalledOn"} | format-table PScomputername, description, Installedon, Caption

write-host "Working with Windows EventLogs" -BackgroundColor Black -ForegroundColor Yellow
$Logname = Read-host "Enter the Log container Name ?"
$StartTime = Read-host "Enter the Start Date Time limit ?"
$Endtime = Read-host "Enter the End Date Time limit ? "
$EventType = Read-host "Enter the Event Type ?"
get-eventlog -logname $Logname | where-object {$_.TimeGenerated  -gt "$StartTime" -and $_.TimeGenerated -lt "$Endtime" -and $_.EntryType -eq "$EventType"} | format-table Time*, Source, EntryType 
Write-host "End of Script" -BackgroundColor DarkGreen


