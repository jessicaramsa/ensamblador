.model small
.stack 64
.data
;----------------------------------------------------------

;---------------- LETREROS, VARIABLES ---------------------

numero equ 7
nombre db "Cristofer","$"
apellido db "Tostado","$"

espacio db 2 dup (20h),"$"

;----------------------------------------------------------

;iniciar con code
.code
inicio proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov ah,09
	lea dx, nombre
	int 21h
	mov ah,09
	lea dx,espacio
	int 21h
	mov ah,09
	lea dx,apellido
	int 21h

salto2:	mov ah,0
	int 16h
	cmp al,13	;comparar si es enter para cerrar
	je fin
	jne salto2

fin:	mov ax,4c00h 	;fin del programa
	int 21h
inicio endp

;----------------- METODOS-----------------------------------

imprimir proc near
	mov ah,09
	int 21h
	ret
imprimir endp


cursor proc near
	mov ah,02
	mov bh,0
	int 10h
	ret
cursor endp

;------------------ FIN DE PROGRAMA ---------------------------
end inicio
