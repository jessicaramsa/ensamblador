;----------------------------------------------------------------------
;Menu con opciones para suma, resta y multiplicacion
;----------------------------------------------------------------------

.model small
.stack 64
.data

;---------- LETREROS Y VARIABLES ---------------
password db "Introduce tu password: ","$"
pcorrecto db "12345"
cpassword db "00000"

incorrecto db "Password incorrecto","$"

menu db "Teclea la opcion que deseas realizar: ",0dh,0ah,0dh,0ah
	db "1.- Suma",0dh,0ah
	db "2.- Resta",0dh,0ah
	db "3.- Multiplicacion","$"

suma1 db "Suma",0dh,0ah,"$"
resta1 db "Resta",0dh,0ah,"$"
mult1 db "Multiplicacion",0dh,0ah,"$"

op1 db "000","$"
op2 db "000","$"
result db "0000","$"

op11 db "000","$"
op22 db "000","$"
result1 db "0000","$"

numero1 db "0000","$"
numero2 db "00","$"
res1 db "000000","$"
resu2 db "000000","$"
res3 db "000000","$"
res2 db "00","$"

msj1 db "Primer dato: ","$"
msj2 db "Segundo dato: ","$"
total db "Resultado: ","$"
total1 db "Resultado 1: ","$"
total2 db "Resultado 2: ","$"

espacio db 0ah,0dh, "$"


;-------- INICIO DE PROGRAMA -------------------
.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov bh,30h
	call Color
	
	mov dh,12
	mov dl,22
	call cursor

	lea dx,password
	call llamarImprimir
	
	mov cl,5
	lea si,cpassword

salto1:	call introducir
	mov [si],al
	mov dl,2ah
	call imprimir
	inc si
	loop salto1
	
	mov dl,0dh
	call imprimir
	mov dl,10
	int 21h
	mov cl,5
	lea si,pcorrecto
	lea di,cpassword
	repe cmpsb
	cmp cl,0
	je menu1	
	
	lea dx,incorrecto
	call llamarImprimir
	jmp fin

menu1:	mov dh,05
	mov dl,25
	call cursor
	call introducir

	mov bh,17h	;fondo blanco frente rojo
	call color

	mov dh,06
	mov dl,25
	call cursor
	lea dx,menu
	call llamarImprimir

	mov dl,0dh
	call imprimir

	mov dl,10
	call imprimir
	
	call introducir
	mov dl,al
	call imprimir

	cmp al,31h
	je suma
	cmp al,32h
	je resta
	cmp al,33h
	je multiplicacion
	jmp fin

suma:	mov bh,17h	;fondo blanco frente rojo
	call color
	call operacionSuma
	jmp fin

resta:  mov bh,17h	;fondo blanco frente rojo
	call color
	call operacionResta
	jmp fin

multiplicacion: mov bh,17h	;fondo blanco frente rojo
	call color
	call operacionMult
	jmp fin

fin:	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp

;------------ METODOS ------------------------
;Cambio de linea
imprimir proc near
	mov ah,02
	int 21h
	ret
imprimir endp

;------- captura
capturar proc near
	mov ah,09h
	int 21h
	mov cl,4
s1:	mov ah,0
	int 16h
	mov [si],al
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop s1
	lea dx,espacio
	mov ah,09h
	int 21h
	ret
capturar endp

capturar2 proc near
	mov ah,09h
	int 21h
	mov cl,2
s200:	mov ah,0
	int 16h
	mov [si],al
	mov ah,02
	mov dl,al
	int 21h
	inc si
	loop s200
	lea dx,espacio
	mov ah,09h
	int 21h
	ret
capturar2 endp

;------------------------------------------------
llamarImprimir proc near
	mov ah,09
	int 21h
	ret
llamarImprimir endp

;------------------------------------------------
imprimirOperacion proc near
	
	or dl,30h
	mov ah,02
	int 21h
	ret
imprimirOperacion endp

;------------------------------------------------
color proc near
	mov ax,0600h	;atributo para cambio de color
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h
	ret
color endp

;------------------------------------------------
introducir proc near
	mov ah,0
	int 16h
	ret
introducir endp

;------------------------------------------------
cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp

;---------------- SUMA -----------------
operacionSuma proc near
	mov dh,13
	mov dl,25
	call cursor
	
	lea dx,suma1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,16
	mov dl,25
	call cursor

	lea dx,msj1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,16
	mov dl,40
	call cursor
	mov cl,3
	lea si,op1
salto2:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto2

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,17
	mov dl,25
	call cursor
	
	lea dx,msj2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,17
	mov dl,40
	call cursor
	mov cl,3
	lea si,op2
salto3:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto3

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

        mov dx,0
	mov ax,0
	mov cl,3
	lea si,op1+2	;Primer operando
	lea di,op2+2	;segudo operando
	lea bx,result+3	;Reservo de memoria
salto4:	mov al,[si]	;salto 2
	mov dl,[di]
	adc al,dl
	mov ah,0
	aaa 		;Ajuste ASCII
	mov [bx],al
	dec si
	dec di
	dec bx
	loop salto4		;salto 2
	mov [bx],ah
	
	mov dh,18
	mov dl,25
	call cursor

	lea dx,total
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,18
	mov dl,39
	call cursor
	mov cl,4
        lea si,result
xx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xx

	ret
operacionSuma endp

;---------------- RESTA -----------------
operacionResta proc near
	mov dh,13
	mov dl,25
	call cursor

	lea dx,resta1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,16
	mov dl,25
	call cursor

	lea dx,msj1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,16
	mov dl,40
	call cursor
	mov cl,3
	lea si,op11
salto22:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto22

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,17
	mov dl,25
	call cursor

	lea dx,msj2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,17
	mov dl,40
	call cursor
	mov cl,3
	lea si,op22
salto33:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop salto33

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

        mov dx,0
	mov ax,0
	mov cl,3
	lea si,op11+2	;Primer operando
	lea di,op22+2	;segudo operando
	lea bx,result1+3	;Reservo de memoria
salto44:	mov al,[si]	;salto 2
	mov dl,[di]
	sbb al,dl
	mov ah,0
	aas 		;Ajuste ASCII
	mov [bx],al
	dec si
	dec di
	dec bx
	loop salto44		;salto 2
	mov [bx],ah

	mov dh,18
	mov dl,25
	call cursor

	lea dx,total
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,18
	mov dl,39
	call cursor
	mov cl,4
        lea si,result1
xxx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xxx
	ret
operacionResta endp

;---------------- MULTIPLICACION --------
operacionMult proc near
	mov dh,13
	mov dl,25
	call cursor

	lea dx,mult1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,16
	mov dl,25
	call cursor

	lea si,numero1	;captura del primer numero
	lea dx,msj1
	call capturar

	mov dh,17
	mov dl,25
	call cursor

	lea si,numero2	;captura del segundo numero
	lea dx,msj2
	call capturar2

        mov dx,0
	mov ax,0

	mov cl,4
	mov dh,00
	lea si,numero1+3
	lea di,numero2+1
	lea bx,res1+5
saltoM:	mov al,[si]	;salto 1
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,dh
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec bx
	loop saltoM
	mov [bx],ah
	mov dx,0
	mov ax,0
	dec di		;segunda multiplicacion
	mov cl,4
	mov dh,00
	lea si,numero1+3
	lea di,numero2
	lea bx,resu2+4
saltoMM:mov al,[si]	;salto 2
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,dh
	aaa
	mov [bx],al
	mov dh,ah
	dec si
	dec bx
	loop saltoMM 	;Salto 2
	mov [bx],ah

	clc		;Limpiar carry
	mov cl,6	;INICIO DE SUMA DE RESULTADOS
	lea si,[res1+5]
	lea di,[resu2+5]
	lea bx,[res3+5]
s1E5:	mov al,[si]	;AQUI VA EL SALTO 1
	mov dl,[di]
	mov ah,0
	adc al,dl
	aaa 		;ajuste de suma
	mov [bx],al
	mov dh,ah
	dec si
	dec di
	dec bx
	loop s1E5		;SALTO 1
	mov [bx],dh

	mov dh,19
	mov dl,25
	call cursor

	lea dx,total1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,19
	mov dl,38
	call cursor
	mov cl,6
        lea si,res1
saltoxx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop saltoxx

	mov dh,20
	mov dl,25
	call cursor

	lea dx,total2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov dh,20
	mov dl,38
	call cursor
	mov cl,6
        lea si,resu2
salton2:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop salton2

	mov dh,22
	mov dl,25
	call cursor

	lea dx,total
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	mov dh,22	;SOLO PARA VER QUE NUMEROS
	mov dl,38
	call cursor
	mov cl,6
        lea si,res3
salton1:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop salton1

	ret
operacionMult endp

;--------------- FIN DE PROGRAMA -----------------
end empezar