.model small
.stack 64
.data
;------------ LETREROS, VARIABLES --------------------------
nombre db "0000000"
ms db "introduce tu nombre: ","$"
numero equ 7
;---------- INICIO DE PROGRAMA -----------------------------

.code
empezar proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax

	mov ax,0600h	;atributo para cambio de color
	mov bh,30h	;fondo blanco frente negro
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h
	
	mov ah,09	;Introducir nombre
	lea dx,ms
	int 21h

	lea si,nombre
	mov cl,numero
dato:	mov ah,01
	int 21h
	mov [si],al
	inc si
	loop dato	;fin de introducir
	
	mov ax,0600h	;atributo para cambio de color
	mov bh,70h	;fondo blanco frente negro
	mov cx,0000h	;renglon columna inicio
	mov dx,184fh	;renglon columna final
	int 10h

	mov bl,numero	;impresion de nombre
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
	jne salto	;fin de impresion	

	mov ax,4c00h 	;fin del programa
	int 21h
empezar endp

;-------------- METODOS ------------------------------


;---------- FIN DE PROGRAMA ---------------------------

end empezar