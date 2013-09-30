;Initial creation of variables
var inc_value 2
var answer 1
var count 100

; Main loop
:loop
push answer
testim count
pop
contlt done
storebp
call func
jump loop

; The multiply function
:func
push answer
push inc_value
mult
store answer
return

:done
store answer
call printtest
halt

:printtest
storebp
push "Hello"
push "World"
push 1
push pop
call  Print
break
return


