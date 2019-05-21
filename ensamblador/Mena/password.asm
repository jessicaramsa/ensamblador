debug
eds:500 "Introduce el password: "
eds:520 "123456"
eds:530 "000000"
eds:540 "¿Qué operación deseas realizar? "
eds:560 "Password incorrecto"
eds:580	"1: Suma"
eds:590	"2: Resta"
eds:5a0	"3: Multiplicación"
a
mov cl,17
mov si,500
mov di,530
mov ah,02
mov dl,[si]	;salto 1
int 21
inc si
loop 10a	;salto 1
;lea si,[520]
mov cl,6
mov ah,0	;salto 2
int 16
mov [di],al
mov ah,02
mov dl,2a
int 21
inc di
loop 113	;salto 2
cld
mov cl,6
lea di,[530]
lea si,[520]
repe cmpsb
cmp cl,0
jne 144	;password incorrecto
mov cl, 20
mov si,540
mov ah,02
mov dl,[si]	;salto 3
int 21
inc si
loop 13b	;salto 3
jmp 154
mov cl, 13	;password incorrecto
mov si,560
mov ah,02
mov dl,[si]	;salto 4
int 21
inc si
loop 14b	;salto 4
jmp 182
mov ah,02
mov dl,0d
int 21
mov dl,0a
int 21
mov si,580	;Suma
mov cl,7
mov dl,[si]	;salto 5
int 21
inc si
loop 163	;salto 5
mov ah,02
mov dl,0d
int 21
mov dl,0a
int 21
mov si,590	;Resta
mov cl,8
mov dl,[si]	;salto 6
int 21
inc si
loop 16f	;salto 6
mov ah,02
mov dl,0d
int 21
mov dl,0a
int 21
mov si,5a0	;Multiplicación
mov cl,11
mov dl,[si]	;salto 7
int 21
inc si
loop 17b	;salto 7
int 20	;fin

g
