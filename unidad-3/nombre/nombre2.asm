.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

nombre db "Jessica",0dh,0ah,"Ramirez"

;-------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov cl,7		;NOMBRE
		lea si,nombre
		call print
		mov cl,7		;APELLIDO
		lea si,nombre+9
		call print
		mov ax,4c00h		;fin de programa
		int 21h

inicio endp

;------------ Inicio de procedimientos -------------------
print proc near
		mov ah,02
salto1: 	mov dl,[si]
		int 21h			;h
		inc si
		loop salto1
		ret
print endp


end inicio


;masm nombre.asm;
;link nombre;
;nombre