.model small
.stack 64
.data
;----------------------------------------------------------

;---------------- LETREROS, VARIABLES ---------------------

nombre db "Tostado"

;----------------------------------------------------------

;iniciar con code
.code
inicio proc far
	
	mov ax,@data
	mov ax,ds
	mov ax,es

	mov cl,7
	lea si,nombre
	mov ah,02
salto1:	mov dl,[si]
	int 21h
	inc si
	loop salto1

	
	mov ax,4c00h 	;fin del programa
	int 21h
inicio endp
end inicio