cls
$Value = Read-host "Enter the value ?"  ## 3
switch ($Value)
    {
        1 {"It is one."}       ## if ($value -eq 1){"This is ONE"}
        2 {"It is two."}       ## Elseif ($value -eq 2){"This is TWO"}
        3 {"It is three."}     ## Elseif ($value -eq 3){"This is THREE"}
        4 {"It is four."}      ## Elseif ($value -eq 4){"This is FOUR"}
        default {"Invalid Input"} ## ELse {"Invalid Input"}
    }