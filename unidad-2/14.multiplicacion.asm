;-------- marzo 26 2019
;------------------- MULTIPLICACI�N () ---------------
;exclusiva del registro acumulador
;me regresa el resultado en ah en c�digo bcd descompactado
;se debe dejar como bcd descompactado antes de multiplicar
;ah cociente, al residuo


debug
a
mov al,4
mov cl,5
mul cl
aam		;ajusta ascii de multiplicaci�n

a
mov al,7
mul cl		;me indica el tama�o de la multiplicaci�n
aam

a
mov ax,0300
mov cx,0500
mul ch
aam

a
mov al,ff
mov cx,00
mov cx,0002
mul cl
aam

a
mov ax,ffff
mul cx

;----------------------------------------------------
;primero le tengo que quitar los 3

debug
a
mov al,38
mov cl,32
mul cl
aam

;-----------------------------------------------------

debug
eds:200 "7436"
eds:210 "3"
eds:220 "00000"
a
mov cl,4
mov dh,00
mov si,203		;bajar PRIMER OPERANDO
mov di,210		;bajar SEGUNDO OPERANDO
mov bx,224		;bajar RESULTADO
mov al,[si]		;s1
and al,0f		;quitar los 3
add al,dh		;sumar las decenas
aaa
mov dl,[di]
and dl,0f		;quitar el 3
mul dl
aam
mov [bx],al
mov dh,ah		;guardar las decenas
dec si
dec bx
loop 10b		;ve a s1
mov [bx],ah
mov cl,5
mov si,220
mov ah,02
mov dl,[si]		;s2
or dl,30
inc si
int 21
loop 12e		;ve a s2
int 20

dds:220




;Multiplicando:  6987	;20-14
;Multiplicador:  98	;12-b
;Primera mult:  055896	;15-f,6
;Segunda mult:  062883	;15-f,6
;Resultado:  0684726	;12-b,7

eds:200 "Multiplicando:  "
eds:210 "6987"
eds:220 "Multiplicador:  "
eds:230 "98"
eds:240 "Primera mult:  "
eds:250 "000000"
eds:260 "Segunda mult:  "
eds:270 "000000"
eds:280 "Resultado:  "
eds:290 "0000000"