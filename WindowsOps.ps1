clear-Host
write-host "`t`t`tWorking with Windows Operations`t`t`t`n" -BackgroundColor Black -ForegroundColor Green
write-host ""
write-host "Working with Windows Services" -BackgroundColor Black -ForegroundColor Yellow
get-service | where-object {$_.starttype -like "Automatic" -and $_.Displayname -like "Windows*"} | format-table Status, Displayname, Machinename , StartType
write-host "Working with Windows Processes" -BackgroundColor Black -ForegroundColor Yellow
get-process | where-object {$_.handles -gt 500 -and $_.handles -lt 600} | format-table Processname, Handles, StartTime
write-host "Working with Windows Hotfixes" -BackgroundColor Black -ForegroundColor Yellow
get-hotfix | where-object {$_.Description -eq "Update" -and $_.installedOn -gt "2021/01/01"} | format-table PScomputername, description, Installedon, Caption
write-host "Working with Windows EventLogs" -BackgroundColor Black -ForegroundColor Yellow
get-eventlog -logname application | where-object {$_.TimeGenerated  -gt "12/31/2020 23:59" -and $_.TimeGenerated -lt "01/01/2022" -and $_.EntryType -eq "Error"} | format-table Time*, Source, EntryType 
Write-host "End of Script" -BackgroundColor DarkGreen

