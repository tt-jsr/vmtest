userfunction Print

call 0 testStrCmp
call 0 testSubStr
halt

;---------------------------------------
; Test string compare
function testStrCmp
push "strcmp"
push "Hello world"
push "Hello world"
strcmp true
call 2 testresult
break
return

;---------------------------------------
; Test substring compare
function testSubStr
push "substr"
push "Hello cruel world"
substr 6 5
testim "cruel"
;call 2 testresult
break
return

;-------------------------------------
function testresult
;tos result 
;tos-1 instruction name
testim 0
pop
jumpe good
push " failed"
strcat
call 1 Print
return

:good
push " success"
strcat
call 1 Print
return




