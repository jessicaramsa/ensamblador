.model small
.stack 64
.data
;----------------------------------------------------------

;---------------- LETREROS, VARIABLES ---------------------

reserva label byte
restriccion db 30
reales db ?
captura db 31 dup ('')
pregunta db "Ingresa tu Nombre:","$"

;----------------------------------------------------------

;iniciar con code
.code
inicio proc far
	
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov ah,09
	lea dx,pregunta
	int 21h

	mov ah,0ah
	lea dx,reserva
	int 21h

	mov ax,0600h
	mov bh,31h
	mov cx,0000h	;x
	mov dx,184f	;y
	int 10h
	
	mov ah,09
	lea dx,captura
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