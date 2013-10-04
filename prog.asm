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
testim 0
pop
call 1 testresult
return

;---------------------------------------
; Test substring compare
function testSubStr
push "substr"
push "Hello cruel world"
substr 6 5
testim "cruel"
pop
call 1 testresult
return

;-------------------------------------
function testresult
;tos instruction name
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




