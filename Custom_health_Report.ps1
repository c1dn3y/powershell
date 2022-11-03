# CUSTOM HEALTH REPORT
# ComputerName OSName OSVersion ProcessorModel C Drive Freespace% RunningServicesCount HotfixesCount
# LON-CL1      Win10  10.0.2.3  Intel Xeon Gold     70                      100              8

cls
write-host "CUSTOM HEALTH REPORT USING WMI" -BackgroundColor DarkGreen

$WMI = get-WMIobject -class Win32_operatingsystem 
#$WMI.pscomputername $WMI.Caption $WMI.Version 

$Processor = Get-wmiobject -class win32_Processor
#processor.Name 

$Disk = get-wmiobject -class win32_logicalDisk | ? {$_.DeviceID -eq "C:"}
$percent = ($Disk.Freespace/$Disk.Size) * 100
#[int]$percent

$RunningServices = (get-service | ?{$_.Status -eq "Running"}).count 
$HFCount = (Get-hotfix).count 

$Value = New-object PSobject 
$Value | Add-member -MemberType NoteProperty -name ComputerName -Value $WMI.PSComputerName
$Value | Add-member -MemberType NoteProperty -name OSName -Value $WMI.Caption
$Value | Add-member -MemberType NoteProperty -name OSVersion -Value $WMI.Version
$Value | Add-member -MemberType NoteProperty -name ProcessorModel -Value $Processor.Name 
$Value | Add-member -MemberType NoteProperty -name "C Drive Freespace%" -Value $percent
$Value | Add-member -MemberType NoteProperty -name RunningServicescount -Value $RunningServices
$Value | Add-member -MemberType NoteProperty -name HotfixCount -Value $HFCount

$Value 