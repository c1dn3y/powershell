cls
write-host "------------------------"
write-host "AD User creation" -BackgroundColor DarkGreen
write-host "------------------------"
$FirstName = Read-host "Enter the FirstName?"
$LastName = Read-host "Enter the Last Name ?"
$Password = Read-host "Enter the Account Password?" -AsSecureString
$username = Read-host "Enter the UserName (FirstName.LastName)?"
$OU = read-host "Enter the OU(Employees/Engineering/IT/Sales)"
$OU = "OU=$OU,DC=Adatum,DC=com"
$Department = Read-Host "Enter the Department?"
$Title = Read-Host "Enter the Title?"

New-Aduser -Name $username -GivenName $FirstName -Surname $LastName `
-Department $Department -Title $Title -AccountPassword $Password `
-path $OU -ChangePasswordAtLogon $true -Enabled $True
Write-host "User Account $username has been created" -BackgroundColor DarkGreen
##########################################################################
write-host "------------------------"
write-host "AD Group creation" -BackgroundColor DarkGreen
write-host "------------------------"
$GName = Read-host "Enter the Group Name ?"
$GScope = Read-host "Enter the Scope of Group (DomainLocal/Global/Universal)?"
New-ADGroup -Name $GName -GroupScope $GScope
Write-host "Group $Gname has been created" -BackgroundColor DarkGreen
##########################################################################
write-host "------------------------"
write-host "Adding Member to a Group" -BackgroundColor DarkGreen
write-host "------------------------"
$Gname = Read-host "Enter the group Name ?"
$MemName = Read-host "Enter the Member Name ?"
Add-ADGroupMember $GName -Members $MemName
Write-host "User $MemName has been added to the group $GName" -BackgroundColor DarkGreen
##########################################################################
write-host "------------------------"
write-host "Removing Member to a Group" -BackgroundColor DarkGreen
write-host "------------------------"
$Gname = Read-host "Enter the group Name ?"
$MemName = Read-host "Enter the Member Name ?"
Remove-ADGroupMember -identity $GName -Members $MemName -Confirm:$false
Write-host "User $MemName has been removed to the group $GName" -BackgroundColor DarkGreen
############################################################################