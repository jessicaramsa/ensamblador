.Model small
.Stack 64
.Data


;---------------- Letreros, variables ------------------

nombre db "Jessica"

;-------------------------------------------------------

;------- Inicializar c�digo
.Code

inicio proc far
		mov ax,@data	;alineacion segmento datos
		mov es,ax
		mov ds,ax

		mov cl,7
		lea si,nombre
		mov ah,02
salto1: 	mov dl,[si]
		int 21h			;h
		inc si
		loop salto1
		mov ax,4c00h		;fin de programa
		int 21h

inicio endp
end inicio


;masm 090419.asm;
;link 090419;
;090419