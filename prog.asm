var instname ""

call testStrCmp
call testSubStr
call testStrCat
call testSwap
call testDup
halt


;---------------------------------------
;function testSplit
;push "one,two,three,four"
;split ","
;push 0
;elem_get 
;calllib  print
;return
;---------------------------------------
; Test dup
function testDup
push "abcdefg"
dup
test 
push "dup"
call testresult
return

;---------------------------------------
; Test swap
function testSwap
push "one"
push "two"
swap
testim "one"
push "swap"
call testresult
return

;---------------------------------------
; Test string compare
function testStrCmp
push "Hello world"
push "Hello world"
push true
calllib strcmp
testim 0
pop
push "StrCmp"
call testresult
return

;---------------------------------------
; Test substring compare
function testSubStr
push "Hello cruel world"
push 6
push 5
calllib substr
testim "cruel"
pop
push "substr"
call testresult
return

;---------------------------------------
; Test strcat
function testStrCat
push "Hello"
store s1
push " World"
store s2
push s1
push s2
calllib strcat
dup
calllib println
testim "Hello World"
pop
push "strcat"
call testresult
return

;-------------------------------------
function testresult
;tos instruction name
jumpe good
push " failed"
calllib strcat
calllib println
return

:good
push " success"
calllib strcat
calllib println
return




