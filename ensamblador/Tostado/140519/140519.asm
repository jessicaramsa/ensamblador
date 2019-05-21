.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

numero equ 7
; igualdad a 7 caracteres
nombre db "Jessica"

;-------------------------------------------------------

;------- Inicializar còdigo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov cl,numero
		lea si,nombre
salto1:		mov ah,02
		mov dl,[si]
		int 21h
		inc si
		loop salto1

		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm nombre.asm;
;link nombre;
;nombre