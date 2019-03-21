debug
eds: 200 "999"
eds: 210 "999"
eds: 220 "0000"
eds: 230 "Primer operando:  "
eds: 250 "Segundo operando:  "
eds: 270 "Resultado:  "
a
mov cl,7    ;CENTRADO DE PRIMER MENSAJE
mov ah,02
mov dl,0d	;s8
int 21
mov dl,0a
int 21
loop 104		;ve a s8
mov cl,20
mov dl,20   ;s9
int 21
loop 110		;ve a s9
mov cl,12	;PRIMER MENSAJE IMPRESO
mov si,230
mov ah,02	;funcion de la interrupcion
mov dl,[si]	;s3
int 21
inc si
loop 11d	;ve a s3
mov cl,3	;Primer dato
mov si,200	
mov dl,[si]	;s4
int 21
inc si
loop 129	;ve a s4
mov dl,0a
int 21
mov dl,0d
int 21
mov cl,7    ;CENTRADO DE SEGUNDO MENSAJE
mov ah,02
mov dl,0d	;s10
int 21
mov dl,0a
int 21
loop 13c		;ve a s10
mov cl,20
mov dl,20   ;s11
int 21
loop 148		;ve a s11
mov cl,13	;SEGUNDO MENSAJE IMPRESO
mov si,250
mov dl,[si]	;s5
int 21
inc si
loop 153	;ve a s5
mov cl,3
mov si,210
mov dl,[si]	;s6
int 21
inc si
loop 15f	;ve a s6
mov cl,3	;INICIO DE SUMA
mov si,202
mov di,212
mov bx,223
mov al,[si]	;s1
mov dl,[di]
adc al,dl
mov ah,0	;resultado del primer operando
aaa
mov [bx],al	
dec si
dec di
dec bx
loop 171	;ve a s1
mov [bx],ah
mov ah,02	;cambio de linea y retorno de carro
mov dl,0a
int 21
mov dl,0d
int 21
mov cl,7    ;CENTRADO TERCER MENSAJE
mov ah,02
mov dl,0d	;s12
int 21
mov dl,0a
int 21
loop 191		;ve a s12
mov cl,20
mov dl,20   ;s13
int 21
loop 19d		;ve a s13
mov cl,c	;TERCER MENSAJE IMPRESO/MSJ DE RESULTADO
mov si,270
mov dl,[si]	;s7
int 21
inc si
loop 1a8	;ve a s7
mov cl,4	;IMPRIMIR RESULTADO DE LA SUMA
mov ah,02
mov si,220
mov dl,[si]	;s2
or dl,30
int 21
inc si
loop 1b6	;ve a s2
mov ah,0
int 16
int 20

---- Guardar programa, termina en 1c4
n c:\suma.com
rcx
280
r
w
q

