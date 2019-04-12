.model small
.stack 64
.data
;----------------------------------------------------------
msj db "Introduce la cantidad de cigarrillos que consumes: ",0ah,0dh,"$"
msj1 db "Minutos Diarios",0dh,0ah,"$"
msj2 db "Horas Diarias",0dh,0ah,"$"
msj3 db "Anios",0dh,0ah,"$"
cant dw 00,"$"
minDiarios dw 000
min dw 60
horas dw 0,"$"
anios dw 365
resAnios dw 0000,"$"
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	;*************Imprimir msj1***************
	lea dx, msj
	mov ah,09
	int 21h
	;*************Introducir datos************
	mov cl,2
	lea si,cant
salto:	mov ah,0
	int 16h	
	mov [si],al
	mov dl,al
	call imprimir
	inc si
	loop salto
	;************Multiplicar por 9*************
	call multiplicar

	;************Salto de linea****************
	mov dl,0ah
	call imprimir
	mov dl,0dh
	call imprimir
	;************Imprimir Minutos**************
	mov cl,3
	lea dx,msj1
	mov ah,09
	int 21h
	lea si,minDiarios
	mov ah,02
salt:	mov dl,[si]
	or dl,30h
	int 21h
	inc si
	loop salt
	;*************Salto de linea****************
	mov dl,0ah
	call imprimir
	mov dl,0dh
	call imprimir

	;************Imrimir msj2****************

	lea dx,msj2
	mov ah,09
	int 21h
	;************Hacer division**************
	call divYear
	sub ax,ax
	mov ax,cx
	aam
	mov cx,ax
	mov dl,ch
	mov ah,02h
	or dl,30h
	int 21h
	mov dl,cl
	or dl,30h
	int 21h	
	;************Multiplicar por 365**********
	call multiplicarAnios

	;************Salto de linea****************
	mov dl,0ah
	call imprimir
	mov dl,0dh
	call imprimir
	;************Imprimir A�os**************
	mov cl,4
	lea dx,msj3
	mov ah,09
	int 21h
	lea si,resAnios
	mov ah,02
salts:	mov dl,[si]
	or dl,30h
	int 21h
	inc si
	loop salts

mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
;**********************PROCEDIMIENTOS******************
imprimir proc near
	mov ah,02
	int 21h
	ret
imprimir endp
imprimirOperacion proc near
	
	or dl,30h
	mov ah,02
	int 21h
	ret
imprimirOperacion endp
multiplicar proc near
	mov cl,2
	lea si,cant+1
	lea bx,minDiarios+2
	mov dh,9
	mov dl,0	
saltoM:	mov al,[si]
	and al,0fh
	and dh,0fh
	mul dh
	aam
	add al,dl
	aaa
	mov [bx],al
	mov dl,ah
	dec si
	dec bx	
	loop saltoM
	mov [bx],ah

	ret
multiplicar endp
divYear proc near
	mov ax,minDiarios
	mov bx,min
	mov cx,0
s3:	cmp ax,bx
	jb fin23
	sub ax,bx
	inc cx
	jmp s3
fin23:
	ret
divYear endp



multiplicarAnios proc near
	mov cl,3
	lea si,anios+2
	lea di,horas
	lea bx,resAnios+3
	mov ch,0
SaltoMul:mov al,[si]
	mov dl,[di]
	and al,0fh
	and dl,0fh
	mul dl
	aam
	add al,ch
	aaa
	mov [bx],al
	mov ch,ah
	dec si
	dec bx
	loop SaltoMul
	mov [bx],ah
	ret
multiplicarAnios endp

end empezar