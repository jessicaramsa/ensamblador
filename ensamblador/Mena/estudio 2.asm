debug
eds:200 "Dame tu nombre: "
eds:210 "00000"
eds:220 "Josue"
eds:230 "No son iguales"
eds:240 "Sí son iguales"
a
mov cl,10
mov si,200
mov ah,02	;salto 1
mov dl,[si]
int 21
inc si
loop 105	;salto 1
mov cl,5
mov si,210
mov ah,0	;salto 2
int 16
mov [si],al
mov ah,02
mov dl,[si]
int 21
inc si
loop 113	;salto 2
mov ah,02
mov dl,0d
int 21
mov dl,0a
int 21
cld
mov cl,5
lea si,[210]
lea di,[220]
repe cmpsb
cmp cl,0
jne 14e	;No son iguales
mov cl,e 	;Sí son iguales
mov si,240
mov ah,02	;salto 3
mov dl,[si]
int 21
inc si
loop 143	;salto 3
jmp 15c	;fin
mov cl,e 	;No son iguales
mov si,230
mov ah,02	;salto 4
mov dl,[si]
int 21
inc si
loop 153	;salto 4
int 20	;fin

g
