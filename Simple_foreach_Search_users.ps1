cls
write-host "Search for users from US using FOREACH" -BackgroundColor DarkCyan
$collection = import-csv C:\users\Administrator.ADATUM\Desktop\Oct05\Book1.csv
Foreach ($item in $collection)
{
    if ($item.Country -eq "US")
    {
        #write-host "$item.Sno $item.Fname $item.Lname $item.country"
        #write-host "$($item.sno) $($item.Fname) $($item.Lname) $($item.country)"

        # $item | select Sno, FName, LName, Country
        $item | ft Sno, FName, LName, Country

    }

}