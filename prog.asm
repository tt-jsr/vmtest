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
call 0 func
jump loop

; The multiply function
:func
push answer
push inc_value
mult
store answer
return

:done
call 0 printtest
halt

:printtest
push "Hello"
push "World"
push 1
push answer
call 4 Print
return


