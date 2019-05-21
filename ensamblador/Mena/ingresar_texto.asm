debug
eds:200 "Dame tu nombre: "
a
mov cl, 10
mov si, 200
mov ah, 02
mov dl, [si]	;salto 1
int 21
inc si
loop 107	;salto 1
mov cl, 5
mov ah, 0	;salto 2
int 16
mov ah, 02
mov dl, al
int 21
loop 110	;salto 2
int 20

g
