;Initial creation of variables
equ inc_value 2
equ answer 1

load answer
; Main loop
:loop
call func
testim 100
contlt done
jump loop

; The multiply function
:func
load inc_value
mult
return ; Leave answer on stack

:done
halt
