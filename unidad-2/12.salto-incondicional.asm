;21 Marzo 2019
;*************** Salto incondicional (jmp) ************
;va a saltar una direccion
;no depende de las banderas
;------------------------------------------------------
debug
a
jmp 109

eds:102 "Jessica"
a 109
mov ah,02
mov cl,16
mov dl,0d	;s2
int 21
mov dl,0a
int 21
loop 10d	;ve a s2
mov cl,7
mov ah,02
mov si,102
mov dl,[si]	;s1
int 21
inc si
loop 11e	;ve a s1
mov ah,0
int 16
int 20

g
n c:\jmp.com
rcx
109
w