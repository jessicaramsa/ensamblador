******************** INTERRUPCIONES *******************
mov ah,02
mov dl,35
int 21		; interrupcion
;p - proceda a ejecutar la interrupcion

*******************************************************
imprimir nombre
-------------------------------------------------------
debug
eds:200 "Jessica"
a
mov cl,7
mov si,200 	; direccionamiento directo
mov ah,02
mov dl,[si] 	; direccionamiento indirecto
int 21
inc si
dec cl
cmp cl,0
jne 107
int 20 		; fin del programa


debug
eds:200 "Jessica"
a
mov cl,c
mov ah,02
mov dl,0d	;salto 1
int 21
mov dl,0a	;retorno de carro
int 21
dec cl
cmp cl,0
jne 104		;salto 1
mov cl,24
mov dl,20
int 21		;salto 2
dec cl
cmp cl,0
jne 117		;salto 2
mov cl,7
mov si,200 	;direccionamiento directo
mov ah,02
mov dl,[si] 	;direccionamiento indirecto, salto 3
int 21
inc si
dec cl
cmp cl,0
jne 127		;salto 3
int 20 		; fin del programa
n c:\jessica.com
rcx
:208		;caracteres a imprimir + 1
w
q

; g - corro todo el programa, si tengo fin del programa