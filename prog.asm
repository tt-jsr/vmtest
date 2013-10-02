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
call 0 Multiply
jump loop

; The multiply function
function Multiply
push answer
push inc_value
mult
store answer
return

:done
call 0 printtest
halt

function printtest
push "Hello"
push "World"
push 1
push answer
call 4 Print
return

function myfunc
;break
push "myfunc is called"
call 1 Print
return

