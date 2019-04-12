.model small
.stack 64
.data
;----------------------------------------------------------
nombre db "00000"
ms db "introduce tu nombre: ","$"
numero equ 5
;----------------------------------------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov ax,0600h
	mov bh,10h
	mov cx,0h
	mov dx,184fh
	int 10h
	
	mov ah,09
	lea dx,ms
	int 21h

	lea si,nombre
	mov cl,numero
dato:	mov ah,01
	int 21h
	mov [si],al
	inc si
	loop dato
	
	mov ax,0600h
	mov bh,50h
	mov cx,0h
	mov dx,184fh
	int 10h

	mov bl,numero
	lea si,nombre
	mov ah,02
salto:	mov dl,[si]
	int 21h
	inc si
	mov cx,3FFFh
salto2:	mov di,9fffh
	add di,6000h
salto1:	dec di
	cmp di,0
	jne salto1

	loop salto2
	
	dec bl
	cmp bl,0
	jne salto	

	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp
end empezar