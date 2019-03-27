;21 Marzo 2019

*************** Salto incondicional (jmp) ************
;va a saltar una direccion
;no depende de las banderas
-------------
debug
a
jmp 109

eds:102 "Jessica"
a 109
mov cl,7
mov ah,02
mov si,102
mov dl,[si]	;s1
int 21
inc si
loop 110	;ve a s1
int 20

g
n c:\jmp.com
rcx
109
w

************** 
; jb salta si eres menor
------------
debug
a
mov cl,3
cmp cl,8
jb 120		;si eres menor

; jg salta si eres mayor
debug
a
mov cl,3
cmp cl,2
jg 120		;si eres mayor