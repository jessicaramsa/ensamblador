;28 Marzo 2019

;-------------------------------------------------------
;Multiplicando:  " 6987		;16-10
;Multiplicador:  " 98		;16-10
;Resultado 1: " 55896		;13-c
;Resultado 2: " 62883		;13-c
:Final:  " 984726		;8 -8
;SALTOS
;procedimiento de multiplicacion 	1 -13
;saltos de centrado de mensajes		14-19
;-------------------------------------------------------


debug
eds:300 "6987"
eds:310 "98"
eds:320 "000000"
eds:330 "000000"
eds:340 "000000"
eds:350 "Multiplicando:  "
eds:370 "Multiplicador:  "
eds:390 "Resultado 1: "
eds:410 "Resultado 2: "
eds:430 "Final:  "
a
mov ah,02	;centrar PRIMER LETRERO
mov cl,5
mov dl,0d	;s14
int 21
mov dl,0a
int 21
loop 104	;ve a s14
mov cl,14
mov dl,20	;s15
int 21
loop 110	;ve a s15
mov cl,10	;imprimir PRIMER LETRERO
mov si,350
mov ah,02
mov dl,[si]	;s1
int 21
inc si
loop 11d	;ve a s1
mov cl,4
mov si,300
mov dl,[si]	;s2
int 21
inc si
loop 129	;ve a s2
mov ah,02	;centrar SEGUNDO LETRERO
mov cl,3
mov dl,0d	;s16
int 21
mov dl,0a
int 21
loop 134	;ve a s16
mov cl,14
mov dl,20	;s17
int 21
loop 140	;ve a s17
mov cl,10	;imprimir SEGUNDO LETRERO
mov si,370
mov dl,[si]	;s3
int 21
inc si
loop 14b	;ve a s3
mov cl,2
mov si,310
mov dl,[si]	;s4
int 21
inc si
loop 157	;ve a s4
mov cl,4	;multiplicacion primer operando
mov dh,00
mov si,303
mov di,311
mov bx,325	;guardar PRIMER RESULTADO
mov al,[si]	;s5
and al,0f
mov dl,[di]
and dl,0f
mul dl
aam
add al,dh
aaa
mov [bx],al
mov dh,ah
dec si
dec bx
loop 16b	;ve a s5
mov [bx],ah
mov ah,02	;centrado PRIMER LETRERO RESULTADO
mov cl,5
mov dl,0d	;s18
int 21
mov dl,0a
int 21
loop 189	;ve a s18
mov cl,14
mov dl,20	;s19
int 21
loop 195	;ve a s19
mov cl,d	;imprimir PRIMER LETRERO RESULTADO
mov si,390
mov ah,02
mov dl,[si]	;s6
int 21
inc si
loop 1a2	;ve a s6
mov cl,5
mov si,321
mov ah,02
mov dl,[si]	;s7
or dl,30
int 21
inc si
loop 1b0	;ve a s7
mov cl,4	;multiplicacion segundo operando
mov dh,00
mov si,303
mov di,310
mov bx,334
mov al,[si]	;s8
and al,0f
mov dl,[di]
and dl,0f
mul dl
aam
add al,dh
aaa
mov [bx],al
mov dh,ah
dec si
dec bx
loop 1c7	;ve a s8
mov [bx],ah
mov ah,02	;centrado SEGUNDO LETRERO RESULTADO
mov cl,2
mov dl,0d	;s20
int 21
mov dl,0a
int 21
loop 1e5	;ve a s20
mov cl,14
mov dl,20	;s21
int 21
loop 1f1	;ve a s21
mov cl,d	;imprimir SEGUNDO LETRERO DE RESULTADO
mov si,410
mov ah,02
mov dl,[si]	;s9
int 21
inc si
loop 1fe	;ve a s9
mov cl,5
mov si,330
mov ah,02
mov dl,[si]	;s10
or dl,30
int 21
inc si
loop 20c	;ve a s10
mov cl,6	;inicio suma de resultados
mov si,325
mov di,335
mov bx,345
mov al,[si]	;s11
mov dl,[di]
adc al,dl
mov ah,0 	;Resultado del primer operando
aaa
mov [bx],al
dec si
dec di
dec bx
loop 221	;ve a s11
mov [bx],ah
mov dl,0a
mov ah,02
int 21
mov dl,0d
int 21
mov cl,20
mov dl,20	;s22
int 21
loop 23f	;ve a s22
mov cl,8	;imprimir TERCER LETRERO FINAL
mov si,430
mov dl,[si]	;s12
int 21
inc si
loop 24a	;ve a s12
mov cl,6 	;imprimir RESULTADO FINAL
mov ah,02
mov si,340
mov dl,[si]	;s13
or dl,30
int 21
inc si
loop 258	;ve a s13
mov ah,0
int 16
int 20
----
----
n c:\multp.com
rcx
438
w
q


;** termina en 266




