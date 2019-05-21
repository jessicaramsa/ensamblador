.model small
.stack 64
.data
;----------------------------------------------------------

;---------------- LETREROS, VARIABLES ---------------------

msj db "Tostado"

;----------------------------------------------------------

;iniciar con code
.code
inicio proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov ax,0600h	;atributo para cambio de color
	mov bh,70h	;fondo blanco frente negro
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h

	mov ah,02	;cursor
	mov bh,0
	mov dx,0c26h
	int 10h	

	mov dh,7	;capturar datos
	lea dx,msj
salto1:	mov ah,02
	mov dl,[si]
	int 21h
	mov cx,00ffh
salto3: mov bx,9fffh
salto2: dec bx
	cmp bx,0
	jne salto2
	loop salto3
	inc si
	dec dh
	cmp dh,0
	je salto1


	mov ax,4c00h 	;fin del programa
	int 21h
inicio endp
end inicio
