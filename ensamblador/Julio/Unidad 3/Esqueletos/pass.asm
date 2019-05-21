.model small
.stack 64
.data
;----------------------------------------------------------
password db "Introduce tu password: ","$"
pcorrecto db "12345"
cpassword db "00000"
incorrecto db "Password incorrecto","$"
menu db "Teclea la opcion que deceas realizar:",0dh,0ah,0dh,0ah
	db "1.- Suma",0dh,0ah
	db "2.-Resta",0dh,0ah
	db "3.- Multiplicacion",0dh,0ah
	db "4.- Division",0dh,0ah,"$"
suma1 db "suma",0dh,0ah,"$"
resta1 db "resta",0dh,0ah,"$"
mult1 db "multiplicacion",0dh,0ah,"$"
division1 db "division",0dh,0ah,"$"
op1 db "000","$"
op2 db "000","$"
result db "0000","$"
msj1 db "Primer dato: ","$"
msj2 db "Segundo dato:","$"


op11 db "000","$"
op22 db "000","$"
result1 db "0000","$"
msj11 db "Primer dato: ","$"
msj22 db "Segundo dato:","$"

op111 db "0000","$"
op222 db "00","$"
res1 db "00000","$"
res11 db "00000","$"
res111 db "00000","$"
res2 db "0","$"
msj111 db "Primer dato: ","$"
msj222 db "Segundo dato:","$"


op1111 db "0000","$"
op2222 db "0","$"
result111 db "0000","$"
msj1111 db "Primer dato: ","$"
msj2222 db "Segundo dato:","$"



;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov bh,30h
	call Color
	
	mov dh,12
	mov dl,20
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
	
	

menu1:	call introducir
	mov bh,20h
	call color
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
	cmp al,34h
	je division
	jmp fin

suma:	call operacionSuma
	jmp fin
resta: call operacionResta
	jmp fin
multiplicacion: call operacionMult
	jmp fin
division: call operacionDivision
	jmp fin	


	
fin:	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp

;------------Procedimientos-------
;Cambio de linea
imprimir proc near
	mov ah,02
	int 21h
	ret
imprimir endp

llamarImprimir proc near
	mov ah,09
	int 21h
	ret
llamarImprimir endp


imprimirOperacion proc near
	
	or dl,30h
	mov ah,02
	int 21h
	ret
imprimirOperacion endp

Color proc near
	mov ax,0600h
	mov cx,0
	mov dx,184fh
	int 10h
	ret
Color endp
introducir proc near
	mov ah,0
	int 16h
	ret
introducir endp
cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp
;----------------SUMA-----------------
operacionSuma proc near
	lea dx,suma1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	lea dx,msj1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
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

	lea dx,msj2
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
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
	
	mov cl,4
        lea si,result
xx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xx

	ret
operacionSuma endp
;----------------RESTA-----------------
operacionResta proc near
	lea dx,resta1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	lea dx,msj11
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
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

	lea dx,msj22
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
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
	
	mov cl,4
        lea si,result1
xxx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xxx
	ret
operacionResta endp

;----------------MULTIPLICACION--------
operacionMult proc near
	lea dx,mult1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	lea dx,msj111
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov cl,3
	lea si,op111
saltoDM:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop saltoDM

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	lea dx,msj222
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
	mov cl,2
	lea si,op222
saltoDDM:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop saltoDDM

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir


        mov dx,0
	mov ax,0

	mov cl,3
	lea si,op111+3
	lea di,op222+2
	lea bx,res1+4
saltoM:	mov al,[si]	;salto 1
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,res2
	aaa
	mov [bx],al
	mov res2,ah
	dec si
	dec bx
	loop saltoM
	mov [bx],ah
	mov dh,0
	mov ax,0
	mov res2,dh
	dec di		;segunda multiplicacion
	mov cl,3
	lea si,op111+3
	lea bx,res11+3
saltoMM:mov al,[si]	;salto 2
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,res2
	aaa
	mov [bx],al
	mov res2,ah
	dec si
	dec bx
	loop saltoMM 	;Salto 2
	mov res2,ah
	clc		;Limpiar carry
	mov cl,5	;SUMA
	lea si,res1+4
	lea di,res11+4
	lea bx,res111+4
saltoMMM:mov al,[si]	;salto3
	mov dl,[di]
	mov ah,0
	adc al,dl
	aaa
	mov [bx],al
	dec si
	dec di
	dec bx
	loop saltoMMM 	;salto 3
	mov [bx],ah
	mov cl,5
        lea si,result111
xxxxM:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xxxxM


	ret
operacionMult endp
;-----------------DIVISION------------
operacionDivision proc near
	lea dx,division1
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir
	
	lea dx,msj1111
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	mov cl,4
	lea si,op1111
saltoD:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop saltoD

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	lea dx,msj2222
	call llamarImprimir
	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir

	
	mov cl,1
	lea si,op2222
saltoDD:	call introducir
	mov [si],al
	mov dl,al
	call imprimir

	inc si
	loop saltoDD

	mov dl,0dh
	call imprimir
	mov dl,10
	call imprimir


        mov dx,0
	mov ax,0
	
	mov cl,4
	lea si,op1111
	lea bx,op2222
	lea di,result111
	mov dl,[bx]
	and dl,0fh
saltoDDD:lodsb		;Salto 1
	and al,0fh
	aad
	div dl
	stosb
	loop saltoDDD

	mov cl,4
        lea si,result111
xxxx:	mov dl,[si]        
	call imprimirOperacion
	inc si 
	loop xxxx
	ret
operacionDivision endp

end empezar