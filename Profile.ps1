Function Execute-Service 
{
    Param ([validateSet ("Automatic","Manual")]$StartType, $displayname)
    write-host "Working with Windows Services" -BackgroundColor Black -ForegroundColor Yellow
    #$StartType = Read-host "Enter the StartType (Automatic/Manual)?"
    #$Displayname = Read-host "Enter the Displayname (Use * for Wildcard Search) ?"
    $Result = get-service | where-object {$_.starttype -like "$StartType" -and $_.Displayname -like "$Displayname"} 
    $Result | format-table Status, Displayname, Machinename , StartType
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
Function Execute-Process
{
    Param ([validaterange(0,2000)]$LHandles, 
           [validateRange(0,2000)]$UHandles)
    write-host "Working with Windows Processes" -BackgroundColor Black -ForegroundColor Yellow
    #$LHandles = Read-host "Enter the Lower Limit for Handles ? "
    #$UHandles = Read-host "Enter the Upper Limit for Handles ? "
    $Result = get-process | where-object {$_.handles -gt $LHandles -and $_.handles -lt $UHandles}
    $Result | format-table Processname, Handles, StartTime
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
Function Execute-Hotfix
{
     write-host "Working with Windows Hotfixes" -BackgroundColor Black -ForegroundColor Yellow
    $Description = Read-host "Enter the Description (Update/Security Update) ? "
    $InstalledOn = Read-host "Enter the InstalledOn Date limit (dd/mm/yyyy)?"
    $result = get-hotfix | where-object {$_.Description -eq "$Description" -and $_.installedOn -gt "$InstalledOn"} 
    $Result | format-table PScomputername, description, Installedon, Caption
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
Function Execute-Eventlog 
{
    Param([Parameter(Mandatory = $True,HelpMessage = "Application/System/Security")]
    [Alias("Log")]$Logname, 
    $StartTime, $Endtime, $EventType)
    write-host "Working with Windows EventLogs" -BackgroundColor Black -ForegroundColor Yellow
    #$Logname = Read-host "Enter the Log container Name ?"
    #$StartTime = Read-host "Enter the Start Date Time limit ?"
    #$Endtime = Read-host "Enter the End Date Time limit ? "
    #$EventType = Read-host "Enter the Event Type ?"
    $Result = get-eventlog -logname $Logname | where-object {$_.TimeGenerated  -gt "$StartTime" -and $_.TimeGenerated -lt "$Endtime" -and $_.EntryType -eq "$EventType"} 
    $Result | format-table Time*, Source, EntryType 
    write-host "The count of above result is" ($Result).count -BackgroundColor DarkCyan
}
Function Get-Addition 
{
<#
.SYNOPSIS
Addition of 2 numbers

.Description
This Function adds two Numbers and provides the Result. This Function is Permanent as it is added to the profile. 

.Parameter Number1
Enter an Integer ?

.Parameter $Number2
Enter an Integer ?

.Notes
This Help is developed during the PS Training

.inputs
get-Addition -Number1 12 -Number2 12

.Link
https://docs.microsoft.com\Get-addition 
Execute-Service 
Execute-Process
Execute-Hotfix
Execute-Eventlogs

.Example
get-addition -Number1 123 -Number2 123
This Function will add 2 Numbers. The values are provided during the calling of Function. 

.Example
get-Addition 
This will prompt for the Mandatory values and then process the commad. 

#>
    Param([Parameter(Mandatory = $True)][decimal] $Number1,
          [Parameter(Mandatory = $True)][decimal] $Number2)
    write-host "Addition Program using Functions" -BackgroundColor DarkBlue
    # $Number1 = read-host "Enter Number1 ? "
    # $Number2 = read-host "Enter Number2 ? "
    write-host "The Addition of $Number1 and $Number2 is" ([int] $Number1 + [int] $Number2) -BackgroundColor DarkGray
}
$City = "NewYork"
$EmployeeID = 1234567
$MaximumHistoryCount = 500
$DOJ = "10/06/2022"
$Testprofile = "Global Profile"