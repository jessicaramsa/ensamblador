.model small
.stack 64
.data

;---------------- MENSAJES Y VARIABLES --------------

	mensaje db "Ingresa tu nombre: ", "$"
	

;---------------- INICIO DE PROGRAMA ----------------
.code

Empezar proc near
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov ax,0600h	;atributo para cambio de color
	mov bh,70h	;fondo blanco frente negro
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h

	mov ah,02
	mov bh,0
	mov dx,0c26h
	int 10h		;interrupcion
	
	lea dx,mensaje	
	mov ah,09
	int 21h

	mov cl,7
	mov ah,01
salto1:	int 21h
	loop salto1

	mov ax,4c00h
	int 21h

Empezar endp
end Empezar