; 02 Abril 2019
;-------------------------------------------------------
; Laura
; L51r5
; L51r5 = 11
; a=5 (41,61)  e=4 (45,65)
; i=3 (49,69)  o=2 (4F,6F)  u=1 (55,75)
;-------------------------------------------------------
; jne si no eres igual
; je si eres igual
; jb salta si eres menor
; jg salta si eres mayor
; J4ss3c5 = 12
;-------------------------------------------------------


debug
eds:300 "a=5"0d,0a"e=4"0d,0a"i=3"0d,0a"o=2"0d,0a"u=1"0d,0a
eds:330 "Jessica"
eds:350 "=000"
a
mov ah,02
mov cl,19		;imprime VOCALES
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 107		;ve a s1
mov si,330		;inicia COMPARACION
mov dl,[si]
mov cl,7
cmp dl,41		;s8, A MAYUSCULA
je 149			;ve a s2
cmp dl,61
je 149			;ve a s2
cmp dl,45		;E
je 14d			;ve a s3
cmp dl,65
je 14d			;ve a s3
cmp dl,49		;I
je 151			;ve a s4
cmp dl,69
je 151			;ve a s4
cmp dl,4f		;O
je 155			;ve a s5
cmp dl,6f
je 155			;ve a s5
cmp dl,55		;U
je 159			;ve a s6
cmp dl,75
je 159			;ve a s6
jmp 15d			;ve a s7, donde NO CAMBIA;179
mov dl,35		;s2, soy A
jmp 15d			;ve a s11, donde SUMA
mov dl,34		;s3, soy E
jmp 15d			;ve a s11, donde SUMA
mov dl,33		;s4, soy I
jmp 15d			;ve a s11, donde SUMA
mov dl,32		;s5, soy O
jmp 15d			;ve a s11, donde SUMA
mov dl,31		;s6, soy U
jmp 15d			;ve a s11,donde SUMA
;---------------- SUMA DE VOCALES ------------------
mov dh,dl		;s11, inicia SUMA
mov cl,2
mov bx,353
mov al,[bx]		;s9
and al,0f
and dh,0f
adc al,dl
aaa
mov [bx],al
mov dl,ah
dec bx
loop 164		;ve a s9
mov [bx],ah
mov dl,dh
;---------------- CAMBIO DE VALORES ----------------
mov [si],dl		;s7, CAMBIO DE VALORES
inc si
mov dl,[si]
loop 115		;ve a s8
mov ah,02		;imprimir LETRERO
mov cl,7
mov di,330
mov dl,[di]		;s10
int 21
inc di
loop 16b		;ve a s10;187
mov cl,4
mov di,350
mov dl,[di]		;s12
int 21
inc di
loop 177		;ve a s12;192
int 20




---------
mov dh,dl		;s11, inicia SUMA
and dh,0f
mov cl,2
mov bx,353
mov al,[bx]		;s9
adc al,dh
mov ah,0
aaa
mov [bx],al
dec bx
loop 167		;ve a s9
mov [bx],ah
---------






;***********************************
debug
eds:300 "a=5"0d,0a"e=4"0d,0a"i=3"0d,0a"o=2"0d,0a"u=1"0d,0a
eds:330 "Jessica"
eds:350 "=00"0d,0a
eds:360 "7"
a
mov ah,02
mov cl,19		;imprime VOCALES
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 107		;ve a s1
--------------------------
mov si,330		;inicia COMPARACION
mov di,360
mov dl,[si]
mov bx,[di]
mov cl,bx
and cl,0f
;AQUI C YA TIENE EL NUMERO PARA EMPEZAR A CONTAR
;***********************************V1
debug
eds:300 "a=5"0d,0a"e=4"0d,0a"i=3"0d,0a"o=2"0d,0a"u=1"0d,0a
eds:330 "Jessica"
eds:340 "000"
eds:350 "7"
a
mov ah,02
mov cl,19		;imprime VOCALES
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 107		;ve a s1
--------------------------
mov si,300
mov dl,[si]
mov cl,7
cmp dl,41		;A MAYUSCULA
je 13b			;ve a s2
cmp dl,61
je 13b			;ve a s2
cmp dl,45		;E
je 140			;ve a s3
cmp dl,65
je 140			;ve a s3
cmp dl,49		;I
je 145			;ve a s4
cmp dl,69
je 145			;ve a s4
cmp dl,4f		;O
je 14a			;ve a s5
cmp dl,6f
je 14a			;ve a s5
cmp dl,55		;U
je 14f			;ve a s6
cmp dl,75
je 14f			;ve a s7
jmp 169			;ve a donde NO CAMBIA
mov dl,5		;s2, soy A
jmp 154			;ve a s7
mov dl,4		;s3, soy E
jmp 154			;ve a s7
mov dl,3		;s4, soy I
jmp 154			;ve a s7
mov dl,2		;s5, soy O
jmp 154			;ve a s7
mov dl,1		;s6, soy U
jmp 154			;ve a s7
;---------------- SUMA DE VOCALES LEIDA ----------------
mov di,322		;s7
mov bx,322
mov dl,[di]
adc al,dl		;s8
mov ah,0
aaa
mov [bx],al
dec di
dec bx
loop 15c		;ve a s8
mov [bx],ah
inc si			;s9, CONTINUA
loop 107		;ve a s10
--------------------------
mov ah,02	;imprimir LETRERO
mov cl,5
mov dl,0d	;s11
int 21
mov dl,0a
int 21
loop 16b	;ve a s11
mov cl,14
mov dl,20	;s12
int 21
loop 177	;ve a s12
mov si,300
mov dl,[si]	;s13
inc si
loop 180	;ve a s13
int 16
int 20
;**********************************V2
debug
eds:300 "a=5"0d,0a"e=4"0d,0a"i=3"0d,0a"o=2"0d,0a"u=1"0d,0a
eds:330 "Jessica"0d,0a
eds:340 "000"0d,0a
eds:350 "7"
a
mov ah,02
mov cl,19		;imprime VOCALES
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 107		;ve a s1
--------------------------
--------------------------
mov si,330
mov dl,[si]
mov cl,7
cmp dl,41		;s10, A MAYUSCULA
je 146			;ve a s2
cmp dl,61
je 146			;ve a s2
cmp dl,45		;E
je 14a			;ve a s3
cmp dl,65
je 14a			;ve a s3
cmp dl,49		;I
je 14e			;ve a s4
cmp dl,69
je 14e			;ve a s4
cmp dl,4f		;O
je 152			;ve a s5
cmp dl,6f
je 152			;ve a s5
cmp dl,55		;U
je 156			;ve a s6
cmp dl,75
je 156			;ve a s6
jmp 16f			;ve a s9, donde NO CAMBIA
mov dl,5		;s2, soy A
jmp 15a			;ve a s7
mov dl,4		;s3, soy E
jmp 15a			;ve a s7
mov dl,3		;s4, soy I
jmp 15a			;ve a s7
mov dl,2		;s5, soy O
jmp 15a			;ve a s7
mov dl,1		;s6, soy U
jmp 15a			;ve a s7
;---------------- SUMA DE VOCALES LEIDA ----------------
mov di,342		;s7
mov bx,342
mov dl,[di]
adc al,dl		;s8
mov ah,0
aaa
mov [bx],al
dec di
dec bx
loop 162		;ve a s8
mov [bx],ah
inc si			;s9, CONTINUA
loop 115		;ve a s10
--------------------------
mov ah,02	;imprimir LETRERO
mov cl,5
mov dl,0d	;s11
int 21
mov dl,0a
int 21
loop 176	;ve a s11
mov cl,14
mov dl,20	;s12
int 21
loop 182	;ve a s12
mov si,300
mov dl,[si]	;s13
inc si
loop 18b	;ve a s13
int 16
int 20




