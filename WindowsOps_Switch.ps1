clear-Host
do
{
write-host "`t`t`tWorking with Windows Operations`t`t`t`n" -BackgroundColor Black -ForegroundColor Green
write-host "1. Services `n2. Process `n3. Hotfixes `n4. Eventlogs `n5. EXIT"
write-host ""
$Choice = Read-host "Enter your choice (1/2/3/4)?"  ## 2,8,5
Switch ($choice)
{
1    ## if ($choice -eq 1)
{
    write-host "Working with Windows Services" -BackgroundColor Black -ForegroundColor Yellow
    $StartType = Read-host "Enter the StartType (Automatic/Manual)?"
    $Displayname = Read-host "Enter the Displayname (Use * for Wildcard Search) ?"
    $Result = get-service | where-object {$_.starttype -like "$StartType" -and $_.Displayname -like "$Displayname"} 
    $Result | format-table Status, Displayname, Machinename , StartType
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
2    ## elseif ($choice -eq 2)
{
    write-host "Working with Windows Processes" -BackgroundColor Black -ForegroundColor Yellow
    $LHandles = Read-host "Enter the Lower Limit for Handles ? "
    $UHandles = Read-host "Enter the Upper Limit for Handles ? "
    $Result = get-process | where-object {$_.handles -gt $LHandles -and $_.handles -lt $UHandles}
    $Result | format-table Processname, Handles, StartTime
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
3    ## elseif ($choice -eq 3)
{
    write-host "Working with Windows Hotfixes" -BackgroundColor Black -ForegroundColor Yellow
    $Description = Read-host "Enter the Description (Update/Security Update) ? "
    $InstalledOn = Read-host "Enter the InstalledOn Date limit (dd/mm/yyyy)?"
    $result = get-hotfix | where-object {$_.Description -eq "$Description" -and $_.installedOn -gt "$InstalledOn"} 
    $Result | format-table PScomputername, description, Installedon, Caption
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
4    ## elseif ($choice -eq 4)
{
    write-host "Working with Windows EventLogs" -BackgroundColor Black -ForegroundColor Yellow
    $Logname = Read-host "Enter the Log container Name ?"
    $StartTime = Read-host "Enter the Start Date Time limit ?"
    $Endtime = Read-host "Enter the End Date Time limit ? "
    $EventType = Read-host "Enter the Event Type ?"
    $Result = get-eventlog -logname $Logname | where-object {$_.TimeGenerated  -gt "$StartTime" -and $_.TimeGenerated -lt "$Endtime" -and $_.EntryType -eq "$EventType"} 
    $Result | format-table Time*, Source, EntryType 
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
5    ## elseif ($choice -eq 5)
{
    write-host "Thank You. Good Bye" -BackgroundColor DarkCyan
}
default #else
{
    write-host "Invalid Input" -BackgroundColor DarkRed
}
}
} While ($choice -ne 5)     ### TRUE - LOOP - 1,2,3,4,6,7,8,  /// FALSE - 5
 # Until ($choice -eq 5)     ### FALSE - LOOP - 1,2,3,4,6,7,8,  /// TRUE - 5
Write-host "End of Script" -BackgroundColor DarkGreen


