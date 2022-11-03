## DISK MANAGEMENT REPORT
## ComputerName Drive Letter C Drive Total space in GB C Drive Freespace in GB Freespace%
## LON-CL1          C               500                     250                  50%

# Get-Process notepad | Format-Table ProcessName, @{Label="TotalRunningTime"; Expression={(Get-Date) - $_.StartTime}}

cls
write-host "DISK MANAGEMENT REPORT using WMI" -BackgroundColor DarkBlue
get-wmiobject -class win32_logicaldisk | ? {$_.DeviceID -eq "c:"} | ft `
@{Label = "ComputerName" ; Expression = {$_.PScomputername}}, `
@{Label = "Drive Letter" ; Expression = {$_.DeviceID}}, `
@{Label = "C Drive Total Space in GB" ; Expression = {[math]::round(($_.Size/1GB),2)}},`
@{Label = "C Drive Freespace in GB" ; Expression ={[math]::round(($_.Freespace/1GB),2)}},`
@{Label = "Freespace%" ; Expression = {[int](($_.Freespace/$_.Size)*100)}}