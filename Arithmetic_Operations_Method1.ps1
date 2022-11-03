cls
write-host "Arithematic Program" -BackgroundColor Green
write-host "1. Addition `n2. Subtraction `n3. Multiplication `n4. Division"
$Choice = Read-host "Enter the choice (1,2,3,4)?"
[decimal] $Number1 = Read-host "Enter 1st Number?"
[decimal] $Number2 = Read-host "Enter 2nd Number?"
If ($choice -eq 1)
{
    $Result = $number1 + $Number2
    write-host "The Addition of $Number1 and $Number2 is $Result" -BackgroundColor Black -ForegroundColor Yellow
}
elseif ($choice -eq 2)
{
    $Result = $number1 - $Number2
    write-host "The Subtraction of $Number1 and $Number2 is $Result" -BackgroundColor Black -ForegroundColor Yellow
}
elseif ($choice -eq 3)
{
    $Result = $number1 * $Number2
    write-host "The Multiplication of $Number1 and $Number2 is $Result" -BackgroundColor Black -ForegroundColor Yellow
}
Elseif ($Choice -eq 4)
{
    $Result = $number1 / $Number2
    write-host "The Division of $Number1 and $Number2 is $Result" -BackgroundColor Black -ForegroundColor Yellow
}
Else
{
    write-host "Invalid Input" -BackgroundColor DarkRed
}