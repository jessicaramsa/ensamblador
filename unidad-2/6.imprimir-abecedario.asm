*******************************************************
Imprimir el abecedario
-------------------------------------------------------
debug
eds: 200 "abcdefghijklmnopqrstuvwxyz"
a
mov cl,1a
mov si,200
mov ah,02
mov dl,[si]	;aqui es salto 1
int 21		;ejecutar con p
dec cl
inc si
cmp cl,0
jne 107		;salto 1
int 20


debug
a
mov cl,1a
mov bl,61
mov ah,02
mov dl,bl	;aqui es salto 1
int 21
mov dl,20
int 21
inc bl
dec cl
cmp cl,0
jne 106		;salto 1
int 20