; RAMÌREZ SÀNCHEZ JÈSSICA
; GRUPO 12:15
; EXAMEN 2: CALCULAR FACTORIAL DE UN NÙMERO (0-9)
;-------------------------------------------------------

debug
eds:300 "Factorial (0-9):"0d,0a
eds:320 "4"
eds:330 "=0000000"
a
mov si,320
mov bx,337
mov dh,00
mov al,[si]		;baja dato de FACT
and al,0f
mov cl,[si]		;baja RESULT
and cl,0f
dec cl
mul cl			;s3, n-1
aam			;ajuste de MULT
add al,dh
aaa
or al,30
mov [bx],al
and al,0f
mov dh,ah		;mueve DECENAS
dec bx
loop 113		;ve a s3
or ah,30
mov [bx],ah
mov ah,02		;IMPRIMIR LETRERO Y RESUL
mov cl,12
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 131		;ve a s1
mov si,320
mov dl,[si]
int 21
mov cl,8
mov si,330
mov dl,[si]		;s2
int 21
inc si
loop 144		;ve a s2
int 20






;----------------------------------------V3
debug
eds:300 "Factorial (0-9):"0d,0a
eds:320 "4"
eds:330 "=0000000"
a
mov si,320
mov bx,337
mov al,[si]		;baja dato de FACT
and al,0f
mov cl,[si]		;baja RESULT
and cl,0f
dec cl
mul cl			;s3, n-1
mov ah,0
aam			;ajuste de MULT
or al,30		;GUARDA
mov [bx],al
mov al,ah		;s4, MUL DECENAS
mul cl
aam
dec bx
loop 11b		;ve a s4, DECENAS
or ah,30
mov [bx],ah		;GUARDA
mov bx,337		;regresa a la posicion UNIDADES
loop 111		;ve a s3
mov ah,02		;IMPRIMIR LETRERO Y RESUL
mov cl,12
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 135		;ve a s1
mov si,320
mov dl,[si]
int 21
mov cl,8
mov si,330
mov dl,[si]		;s2
int 21
inc si
loop 148		;ve a s2
int 20
;----------------------------------------V2
debug
eds:300 "Factorial (0-9):"0d,0a
eds:320 "4"
eds:330 "=0000000"
a
mov si,320
mov bx,337
mov al,[si]		;baja dato de FACT
and al,0f
mov cl,[si]		;baja RESULT
and cl,0f
dec cl
mul cl			;s3, n-1
mov ah,0
aam			;ajuste de MULT
or al,30		;GUARDA
mov [bx],al
mov dh,al		;empieza MULT decenas
mov al,ah
dec bx
mul cl
aam
mov dl,al
mov dh,ah
loop 111		;ve a s3
mov ah,02		;IMPRIMIR LETRERO Y RESUL
mov cl,12
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 131		;ve a s1
mov si,320
mov dl,[si]
int 21
mov cl,8
mov si,330
mov dl,[si]		;s2
int 21
inc si
loop 144		;ve a s2
int 20
;----------------------------------------V1
debug
eds:300 "Factorial (0-9)"0d,0a
eds:320 "4"
eds:330 "=000"
a
mov si,320
mov bx,333
mov al,[si]		;baja dato de FACT
and al,0f
mov cl,[si]		;baja RESULT
and cl,0f
dec cl
mov dl,cl		;s3, n-1
mul dl			;MULT
mov ah,0
aam			;ajuste de MULT
mov dl,[bx]		;inicia SUMA DE RESULT
and dl,0f
mov dh,ah		;mueve las DEC
adc al,dl		;suma lo que hay en RESULT
mov ah,0
aaa			;ajuste de la suma
or al,30
mov [bx],al		;guarda unidades
dec bx
mov al,ah
adc al,dh		;suma decenas
aaa			;ajuste de la suma
or al,30
mov [bx],al
mov bx,333
loop 111		;ve a s3
mov ah,02		;IMPRIMIR LETRERO Y RESUL
mov cl,11
mov si,300
mov dl,[si]		;s1
int 21
inc si
loop 13f		;ve a s1
mov si,320
mov cl,1
mov dl,[si]		;s2
int 21
inc si
loop 14b		;ve a s2
mov cl,4
mov si,330
mov dl,[si]		;s3
int 21
inc si
loop 157		;ve a s3
int 20



------------------------------------------------------
;0-0
;1-1
;2-2
;3-6
;4-12
;5-120
;6-720
;7-5040
;8-40320
;9-362880





