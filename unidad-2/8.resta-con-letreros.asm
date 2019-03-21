debug
eds:200 "777"
eds:210 "999"
eds:220 "0000"
eds:230 "Primer operando:  "
eds:250 "Segundo operando:  "
eds:270 "Resultado:  "
a

mov cl,c    ;CENTRADO DE PRIMER MENSAJE
mov ah,02
mov dl,0d	;s8
int 21
mov dl,0a
int 21
loop 104		;ve a s8
mov cl,24
mov dl,20   ;s9
int 21
loop 117		;ve a s9

mov cl,12	;PRIMER MENSAJE IMPRESO
mov si,230
mov ah,02
mov dl,[si] 	;s3
int 21
inc si
loop 107 	;ve a s3
mov cl,3	;PRIMER DATO
mov si,200
mov dl,[si]	;s4
int 21
inc si
loop 113	;ve a s4
mov dl,0a	;salto de linea
int 21
mov dl,0d	;retorno de carro
int 21

mov cl,c    ;CENTRADO DE SEGUNDO MENSAJE
mov ah,02
mov dl,0d	;s10
int 21
mov dl,0a
int 21
loop 104		;ve a s10
mov cl,26
mov dl,20   ;s11
int 21
loop 117		;ve a s11

mov cl,13	;SEGUNDO MENSAJE IMPRESO
mov si,250
mov dl,[si]	;s5
int 21
inc si
loop 127	;ve a s5
mov cl,3
mov si,210
mov dl,[si]	;s6
int 21
inc si
loop 133	;ve a s6
mov cl,3	;INICIO DE RESTA
mov si,202
mov di,212
mov bx,223
mov al,[si]    ;salto 1
mov dl,[di]
sbb al,dl    ;resta con acarreo
mov ah,0    ;limpiar
aas        ;aplicar el ajuste
mov [bx],al
dec si
dec di
dec bx
loop 145    ;salto 1, dec-cmp-jne
mov [bx],ah
mov ah,02	;funcion con la interrupcion
mov dl,0a	;cambio de linea
int 21
mov dl,0d	;retorno de carro
int 21

mov cl,c    ;CENTRADO TERCER MENSAJE
mov ah,02
mov dl,0d	;s12
int 21
mov dl,0a
int 21
loop 104		;ve a s12
mov cl,29
mov dl,20   ;s13
int 21
loop 117		;ve a s13

mov cl,d	;TERCER MENSAJE/MENSAJE DE RESULTADO
mov si,270
mov dl,[si]	;s7
int 21
inc si
loop 166	;ve a salto 7
mov cl,4    	;IMPRIMIR EL RESULADO DE LA SUMA
mov ah,02    	;funci�n de la interrupcion
mov si,220
mov dl,[si]	;s2
or dl,30
int 21
inc si
loop 174    	;ve a salto 2
mov ah,0
int 16
int 20
************************ imprimir en el centro
---- Guardar programa
n c:\suma.com
rcx
280
r
w